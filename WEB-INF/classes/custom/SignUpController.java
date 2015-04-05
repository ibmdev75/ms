package custom; 
 
import generated.SignUp;

import java.util.Map;

import org.apache.log4j.Logger;

import com.jalios.jcms.BasicDataController;
import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.Form;
import com.jalios.jcms.Group;
import com.jalios.jcms.Member;
import com.jalios.jcms.dbmember.DBMember;
import com.jalios.util.Util;

public class SignUpController extends BasicDataController {

  private static final Logger logger = Logger.getLogger(SignUpController.class);
  
  /**
   * Check if the given login already exists
   * 
   * @see com.jalios.jcms.DataController#checkWrite(com.jalios.jcms.Data, int, com.jalios.jcms.Member, boolean, java.util.Map)
   */
  @Override
  public ControllerStatus checkWrite(Data data, int op, Member mbr, boolean checkIntegrity, Map context) {
    
    if (op != OP_CREATE) {
      return super.checkWrite(data, op, mbr, checkIntegrity, context);
    }
    
    SignUp  form    = (SignUp)data;
    String  login   = form.getFavoriteLogin();
    Channel channel = Channel.getChannel();

    if (!checkLogin(login)) {
      ControllerStatus status = new ControllerStatus();
      status.setProp("msg.member-editor.login-used", login);
      return status;
    }
    
    if (Util.isEmpty(form.getEmail())) {
      ControllerStatus status = new ControllerStatus();
      status.setProp("msg.member-editor.empty-email");
      return status;
    }
    
    if (channel.getMemberFromEmail(form.getEmail()) != null) {
      ControllerStatus status = new ControllerStatus();
      status.setProp("msg.member-editor.email-used");
      return status;
    }
    
    // Modify the title to something more "user friendly"
    String title = form.getTitle() + " : " + form.getFirstName() + " " + form.getName() + " &lt;" + form.getEmail() + ">";
    form.setTitle(title);
    
    return super.checkWrite(data, op, mbr, checkIntegrity, context);
  }
  
  /**
   * Check if sign-up property is enabled
   * 
   * @see com.jalios.jcms.DataController#afterWrite(Data, int, Member, Map)
   */
  @Override
  public void afterWrite(Data data, int op, Member mbr, Map context) {
    
    Channel channel = Channel.getChannel();
    SignUp  form    = (SignUp)data;
    
    // Check sign-up property is enabled
    if (!channel.getBooleanProperty("channel.sign-up",false)) {
      return;
    }

    Member targetMember = channel.getMemberFromLogin(form.getFavoriteLogin());
    // Create the member
    if (op == OP_CREATE) {
      targetMember = createMember((SignUp) data);
    }
    
    // Send a mail to the member
    if(((Form)data).isInVisibleState() && targetMember != null && targetMember.isDisabled()){
      boolean signupValidationRequired = channel.getBooleanProperty("channel.sign-up-validation-required",false);
      String  password = Util.generatePronounceablePassword(8);
      targetMember.alertSignup(password,signupValidationRequired,true);
      
      if (!signupValidationRequired){
        Member cloneMember = (Member) targetMember.getUpdateInstance();
        cloneMember.setPassword(channel.crypt(password));
        cloneMember.performUpdate(channel.getDefaultAdmin());
    }
  }
  }

  
  // ---------------------------------------------------
  // SPECIFIC METHODS
  // ---------------------------------------------------
  
  /**
   * Check the login asked by the member is valid
   * 
   * @param login the login to be checked
   * @return boolean true if the login doesn't already exists 
   */
  protected boolean checkLogin(String login) {
    return Channel.getChannel().getMemberFromLogin(login) == null;
  }
  
  /**
   * Create a Member for the given SignUp form
   * @param form the SignUp form
   */
  protected Member createMember(SignUp form) {
    
    Channel channel = Channel.getChannel();
    Member opAuthor = channel.getDefaultAdmin();

    // Create Member or DBMember
    boolean createDBMember = channel.getBooleanProperty("channel.sign-up-create-dbmember", true);
    
    // Create a disabled member account from the form data
    Member mbr = createDBMember ? new DBMember() : new Member();
    mbr.setLogin(form.getFavoriteLogin());
    mbr.setName(form.getName());
    mbr.setFirstName(form.getFirstName());
    mbr.setEmail(form.getEmail());
    mbr.setSalutation(form.getSalutation());
    mbr.setJobTitle(Util.getString(form.getJobTitle(), ""));
    mbr.setDeclaredGroups(new Group[] { channel.getDefaultGroup() });
    mbr.setAuthor(opAuthor);
    mbr.disable();


    // Check this member
    ControllerStatus status = mbr.checkCreate(opAuthor);
    if (status.hasFailed()) {
      logger.warn("Cannot create member: " + status.getMessage("en"));
      return null;
    }
    
    // Create the member
    mbr.performCreate(opAuthor);
    
    return mbr;
  }
}
