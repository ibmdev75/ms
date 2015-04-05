// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:47 CET 2015
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditSignUpHandler extends EditFormHandler {
   
  protected SignUp theContent;
  
  public Class getPublicationClass() {
    return SignUp.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpSignUp  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getAvailableAuthor();
    
    
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("name".equals(field)) {
      return getAvailableName();
    }
    
    if ("firstName".equals(field)) {
      return getAvailableFirstName();
    }
    
    if ("email".equals(field)) {
      return getAvailableEmail();
    }
    
    if ("salutation".equals(field)) {
      return getAvailableSalutation();
    }
    
    if ("jobTitle".equals(field)) {
      return getAvailableJobTitle();
    }
    
    if ("favoriteLogin".equals(field)) {
      return getAvailableFavoriteLogin();
    }
    
    if ("message".equals(field)) {
      return getAvailableMessage();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("salutation".equals(field)) {
      return SignUp.getSalutationValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("salutation".equals(field)) {
      return SignUp.getSalutationLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateSignUp  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateSignUp() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateSignUp()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateSignUp()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    SignUp obj = (SignUp)data;
    obj.setName(getAvailableName());
    obj.setFirstName(getAvailableFirstName());
    obj.setEmail(getAvailableEmail());
    obj.setSalutation(getAvailableSalutation());
    obj.setJobTitle(getAvailableJobTitle());
    obj.setFavoriteLogin(getAvailableFavoriteLogin());
    obj.setMessage(getAvailableMessage());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof SignUp) {
      super.setId(v);
      theContent = (SignUp)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------  
  protected String name = channel.getTypeFieldEntry(SignUp.class, "name", true).getDefaultTextString();
  public void setName(String[]  v) {
    name = getMainLangValue(v, true, true);
  }
  public String getAvailableName() {
    if (theContent != null && isFieldMissing("name")) {
      return theContent.getName();
    }
    return name;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // firstName
  // ----------------------------------------------------------------------  
  protected String firstName = channel.getTypeFieldEntry(SignUp.class, "firstName", true).getDefaultTextString();
  public void setFirstName(String[]  v) {
    firstName = getMainLangValue(v, true, true);
  }
  public String getAvailableFirstName() {
    if (theContent != null && isFieldMissing("firstName")) {
      return theContent.getFirstName();
    }
    return firstName;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------  
  protected String email = channel.getTypeFieldEntry(SignUp.class, "email", true).getDefaultTextString();
  public void setEmail(String[]  v) {
    email = getMainLangValue(v, true, true);
  }
  public String getAvailableEmail() {
    if (theContent != null && isFieldMissing("email")) {
      return theContent.getEmail();
    }
    return email;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // salutation
  // ----------------------------------------------------------------------  
  protected String salutation = channel.getTypeFieldEntry(SignUp.class, "salutation", true).getDefaultTextString();
  public void setSalutation(String[]  v) {
    salutation = getMainLangValue(v, true, true);
  }
  public String getAvailableSalutation() {
    if (theContent != null && isFieldMissing("salutation")) {
      return theContent.getSalutation();
    }
    return salutation;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // jobTitle
  // ----------------------------------------------------------------------  
  protected String jobTitle = channel.getTypeFieldEntry(SignUp.class, "jobTitle", true).getDefaultTextString();
  public void setJobTitle(String[]  v) {
    jobTitle = getMainLangValue(v, true, true);
  }
  public String getAvailableJobTitle() {
    if (theContent != null && isFieldMissing("jobTitle")) {
      return theContent.getJobTitle();
    }
    return jobTitle;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // favoriteLogin
  // ----------------------------------------------------------------------  
  protected String favoriteLogin = channel.getTypeFieldEntry(SignUp.class, "favoriteLogin", true).getDefaultTextString();
  public void setFavoriteLogin(String[]  v) {
    favoriteLogin = getMainLangValue(v, true, true);
  }
  public String getAvailableFavoriteLogin() {
    if (theContent != null && isFieldMissing("favoriteLogin")) {
      return theContent.getFavoriteLogin();
    }
    return favoriteLogin;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // message
  // ----------------------------------------------------------------------  
  protected String message = channel.getTypeFieldEntry(SignUp.class, "message", true).getDefaultTextString();
  public void setMessage(String[]  v) {
    message = getMainLangValue(v, false, true);
  }
  public String getAvailableMessage() {
    if (theContent != null && isFieldMissing("message")) {
      return theContent.getMessage();
    }
    return message;
  }
  
    
  
 
    
   
  public boolean isNotifySubmit() {
    return true;
  }
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// PtcJV0jnwnjiXBnABw9sCA==
