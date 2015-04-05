// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:06 CET 2015
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
public class EditDBMailMessageHandler extends EditPublicationHandler {
   
  protected DBMailMessage theContent;
  
  public Class getPublicationClass() {
    return DBMailMessage.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpDBMailMessage  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("fromMember", __fromMemberStr, Member.class);
      if (data != null) { 
        fromMember = (Member)data;
      } else {
        isFromMemberValidated = Util.isEmpty(__fromMemberStr);
      }
    }
    {
      List list = processDataIds("toMember",__toMemberStr,Member.class);
      this.toMember = (Member[])list.toArray(new Member[0]);
    }
    {
      List list = processDataIds("ccMember",__ccMemberStr,Member.class);
      this.ccMember = (Member[])list.toArray(new Member[0]);
    }
    {
      List list = processDataIds("bccMember",__bccMemberStr,Member.class);
      this.bccMember = (Member[])list.toArray(new Member[0]);
    }
    {
      Data data = processDataId("replyToMember", __replyToMemberStr, Member.class);
      if (data != null) { 
        replyToMember = (Member)data;
      } else {
        isReplyToMemberValidated = Util.isEmpty(__replyToMemberStr);
      }
    }
    {
      List list = processDataIds("attachements",__attachementsStr,com.jalios.jcms.FileDocument.class);
      this.attachements = (com.jalios.jcms.FileDocument[])list.toArray(new com.jalios.jcms.FileDocument[0]);
    }
    if (!validateUploadedFileDocument(getAvailableAttachements(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableAttachements(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("from".equals(field)) {
      return getAvailableFrom();
    }
    
    if ("to".equals(field)) {
      return getAvailableTo();
    }
    
    if ("cc".equals(field)) {
      return getAvailableCc();
    }
    
    if ("bcc".equals(field)) {
      return getAvailableBcc();
    }
    
    if ("replyTo".equals(field)) {
      return getAvailableReplyTo();
    }
    
    if ("fromMember".equals(field)) {
      return getAvailableFromMember();
    }
    
    if ("toMember".equals(field)) {
      return getAvailableToMember();
    }
    
    if ("ccMember".equals(field)) {
      return getAvailableCcMember();
    }
    
    if ("bccMember".equals(field)) {
      return getAvailableBccMember();
    }
    
    if ("replyToMember".equals(field)) {
      return getAvailableReplyToMember();
    }
    
    if ("contentText".equals(field)) {
      return getAvailableContentText();
    }
    
    if ("contentHtml".equals(field)) {
      return getAvailableContentHtml();
    }
    
    if ("attachements".equals(field)) {
      return getAvailableAttachements();
    }
    
    if ("sentDate".equals(field)) {
      return getAvailableSentDate();
    }
    
    if ("receivedDate".equals(field)) {
      return getAvailableReceivedDate();
    }
    
    if ("priority".equals(field)) {
      return getAvailablePriority();
    }
    
    if ("account".equals(field)) {
      return getAvailableAccount();
    }
    
    if ("inReplyTo".equals(field)) {
      return getAvailableInReplyTo();
    }
    
    if ("references".equals(field)) {
      return getAvailableReferences();
    }
    
    if ("messageId".equals(field)) {
      return getAvailableMessageId();
    }
    
    if ("thread".equals(field)) {
      return getAvailableThread();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateDBMailMessage  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateDBMailMessage() {
    if (!isFromMemberValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "fromMember", userLang)));
      return false;
    }
    if (!isReplyToMemberValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "replyToMember", userLang)));
      return false;
    }
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
      return false;
    }
    if (!isPriorityValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "priority", userLang)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateDBMailMessage()) {
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
    
    if (!validateCommonCreateUpdateDBMailMessage()) {
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
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
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
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
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
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    DBMailMessage obj = (DBMailMessage)data;
    obj.setFrom(getAvailableFrom());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getTo(), Util.getHashSet(getAvailableTo()))) {
      obj.setTo(Util.getHashSet(getAvailableTo()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getCc(), Util.getHashSet(getAvailableCc()))) {
      obj.setCc(Util.getHashSet(getAvailableCc()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getBcc(), Util.getHashSet(getAvailableBcc()))) {
      obj.setBcc(Util.getHashSet(getAvailableBcc()));
    }
    obj.setReplyTo(getAvailableReplyTo());
    obj.setFromMember(getAvailableFromMember());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getToMember(), Util.getHashSet(getAvailableToMember()))) {
      obj.setToMember(Util.getHashSet(getAvailableToMember()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getCcMember(), Util.getHashSet(getAvailableCcMember()))) {
      obj.setCcMember(Util.getHashSet(getAvailableCcMember()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getBccMember(), Util.getHashSet(getAvailableBccMember()))) {
      obj.setBccMember(Util.getHashSet(getAvailableBccMember()));
    }
    obj.setReplyToMember(getAvailableReplyToMember());
    obj.setContentText(getAvailableContentText());
    obj.setContentHtml(getAvailableContentHtml());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getAttachements(), Util.getHashSet(getAvailableAttachements()))) {
      obj.setAttachements(Util.getHashSet(getAvailableAttachements()));
    }
    obj.setSentDate(getAvailableSentDate());
    obj.setReceivedDate(getAvailableReceivedDate());
    obj.setPriority(getAvailablePriority());
    obj.setAccount(getAvailableAccount());
    obj.setInReplyTo(getAvailableInReplyTo());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getReferences(), Util.getHashSet(getAvailableReferences()))) {
      obj.setReferences(Util.getHashSet(getAvailableReferences()));
    }
    obj.setMessageId(getAvailableMessageId());
    obj.setThread(getAvailableThread());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof DBMailMessage) {
      super.setId(v);
      theContent = (DBMailMessage)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // from
  // ----------------------------------------------------------------------  
  protected String from = channel.getTypeFieldEntry(DBMailMessage.class, "from", true).getDefaultTextString();
  public void setFrom(String[]  v) {
    from = getMainLangValue(v, true, true);
  }
  public String getAvailableFrom() {
    if (theContent != null && isFieldMissing("from")) {
      return theContent.getFrom();
    }
    return from;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // to
  // ----------------------------------------------------------------------  
  protected String[] to;
  public void setTo(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.to = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableTo() {
    if (theContent != null && isFieldMissing("to")) {
      if (theContent.getTo() == null) {
        return to;
      }
      return theContent.getTo().toArray(new String[0]);
    }
    return to;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cc
  // ----------------------------------------------------------------------  
  protected String[] cc;
  public void setCc(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.cc = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableCc() {
    if (theContent != null && isFieldMissing("cc")) {
      if (theContent.getCc() == null) {
        return cc;
      }
      return theContent.getCc().toArray(new String[0]);
    }
    return cc;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // bcc
  // ----------------------------------------------------------------------  
  protected String[] bcc;
  public void setBcc(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.bcc = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableBcc() {
    if (theContent != null && isFieldMissing("bcc")) {
      if (theContent.getBcc() == null) {
        return bcc;
      }
      return theContent.getBcc().toArray(new String[0]);
    }
    return bcc;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // replyTo
  // ----------------------------------------------------------------------  
  protected String replyTo = channel.getTypeFieldEntry(DBMailMessage.class, "replyTo", true).getDefaultTextString();
  public void setReplyTo(String[]  v) {
    replyTo = getMainLangValue(v, true, true);
  }
  public String getAvailableReplyTo() {
    if (theContent != null && isFieldMissing("replyTo")) {
      return theContent.getReplyTo();
    }
    return replyTo;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // fromMember
  // ----------------------------------------------------------------------  
  protected boolean isFromMemberValidated = true;
  protected Member fromMember;
  String __fromMemberStr = null;
  public void setFromMember(String v) {
    __fromMemberStr = v;
  }
  public Member getAvailableFromMember() {
    if (theContent != null && isFieldMissing("fromMember")) {
      return theContent.getFromMember();
    }
    return fromMember;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // toMember
  // ----------------------------------------------------------------------  
  protected Member[] toMember = new Member[0];
  protected int toMemberAddCount = 0;
  String[] __toMemberStr = null;
  public void setToMember(String[]  v) {
    __toMemberStr = v;
  }
  public Member[] getAvailableToMember() {
    if (theContent != null && isFieldMissing("toMember")) {
      if (theContent.getToMember() == null) {
        return toMember;
      }
      return theContent.getToMember().toArray(new Member[0]);
    }
    return toMember;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // ccMember
  // ----------------------------------------------------------------------  
  protected Member[] ccMember = new Member[0];
  protected int ccMemberAddCount = 0;
  String[] __ccMemberStr = null;
  public void setCcMember(String[]  v) {
    __ccMemberStr = v;
  }
  public Member[] getAvailableCcMember() {
    if (theContent != null && isFieldMissing("ccMember")) {
      if (theContent.getCcMember() == null) {
        return ccMember;
      }
      return theContent.getCcMember().toArray(new Member[0]);
    }
    return ccMember;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // bccMember
  // ----------------------------------------------------------------------  
  protected Member[] bccMember = new Member[0];
  protected int bccMemberAddCount = 0;
  String[] __bccMemberStr = null;
  public void setBccMember(String[]  v) {
    __bccMemberStr = v;
  }
  public Member[] getAvailableBccMember() {
    if (theContent != null && isFieldMissing("bccMember")) {
      if (theContent.getBccMember() == null) {
        return bccMember;
      }
      return theContent.getBccMember().toArray(new Member[0]);
    }
    return bccMember;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // replyToMember
  // ----------------------------------------------------------------------  
  protected boolean isReplyToMemberValidated = true;
  protected Member replyToMember;
  String __replyToMemberStr = null;
  public void setReplyToMember(String v) {
    __replyToMemberStr = v;
  }
  public Member getAvailableReplyToMember() {
    if (theContent != null && isFieldMissing("replyToMember")) {
      return theContent.getReplyToMember();
    }
    return replyToMember;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // contentText
  // ----------------------------------------------------------------------  
  protected String contentText = channel.getTypeFieldEntry(DBMailMessage.class, "contentText", true).getDefaultTextString();
  public void setContentText(String[]  v) {
    contentText = getMainLangValue(v, false, true);
  }
  public String getAvailableContentText() {
    if (theContent != null && isFieldMissing("contentText")) {
      return theContent.getContentText();
    }
    return contentText;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // contentHtml
  // ----------------------------------------------------------------------  
  protected String contentHtml = channel.getTypeFieldEntry(DBMailMessage.class, "contentHtml", true).getDefaultTextString();
  public void setContentHtml(String[]  v) {
    contentHtml = getMainLangValue(v, false, false);
  }
  public String getAvailableContentHtml() {
    if (theContent != null && isFieldMissing("contentHtml")) {
      return theContent.getContentHtml();
    }
    return contentHtml;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // attachements
  // ----------------------------------------------------------------------  
  protected com.jalios.jcms.FileDocument[] attachements = new com.jalios.jcms.FileDocument[0];
  protected int attachementsAddCount = 0;
  String[] __attachementsStr = null;
  public void setAttachements(String[]  v) {
    __attachementsStr = v;
  }
  public com.jalios.jcms.FileDocument[] getAvailableAttachements() {
    if (theContent != null && isFieldMissing("attachements")) {
      if (theContent.getAttachements() == null) {
        return attachements;
      }
      return theContent.getAttachements().toArray(new com.jalios.jcms.FileDocument[0]);
    }
    return attachements;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // sentDate
  // ----------------------------------------------------------------------  
  protected String __sentDateStr = "";
  protected boolean isSentDateValidated = true;
  protected Date sentDate;
  public void setSentDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __sentDateStr = v.trim();      
      sentDate = dateFormatter.parse(__sentDateStr);
    } catch(java.text.ParseException ex) {
      isSentDateValidated = false;
    }
  }
  public java.util.Date getAvailableSentDate() {
    if (theContent != null && isFieldMissing("sentDate")) {
      return theContent.getSentDate();
    }
    return sentDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // receivedDate
  // ----------------------------------------------------------------------  
  protected String __receivedDateStr = "";
  protected boolean isReceivedDateValidated = true;
  protected Date receivedDate;
  public void setReceivedDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __receivedDateStr = v.trim();      
      receivedDate = dateFormatter.parse(__receivedDateStr);
    } catch(java.text.ParseException ex) {
      isReceivedDateValidated = false;
    }
  }
  public java.util.Date getAvailableReceivedDate() {
    if (theContent != null && isFieldMissing("receivedDate")) {
      return theContent.getReceivedDate();
    }
    return receivedDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // priority
  // ----------------------------------------------------------------------  
  protected boolean isPriorityValidated = true;
  protected int priority = 0;
  public void setPriority(String v) {
    try {
      priority = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isPriorityValidated = false;
    }
  }
  public int getAvailablePriority() {
    if (theContent != null && isFieldMissing("priority")) {
      return theContent.getPriority();
    }
    return priority;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // account
  // ----------------------------------------------------------------------  
  protected String account = channel.getTypeFieldEntry(DBMailMessage.class, "account", true).getDefaultTextString();
  public void setAccount(String[]  v) {
    account = getMainLangValue(v, true, true);
  }
  public String getAvailableAccount() {
    if (theContent != null && isFieldMissing("account")) {
      return theContent.getAccount();
    }
    return account;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // inReplyTo
  // ----------------------------------------------------------------------  
  protected String inReplyTo = channel.getTypeFieldEntry(DBMailMessage.class, "inReplyTo", true).getDefaultTextString();
  public void setInReplyTo(String[]  v) {
    inReplyTo = getMainLangValue(v, true, true);
  }
  public String getAvailableInReplyTo() {
    if (theContent != null && isFieldMissing("inReplyTo")) {
      return theContent.getInReplyTo();
    }
    return inReplyTo;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // references
  // ----------------------------------------------------------------------  
  protected String[] references;
  public void setReferences(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.references = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableReferences() {
    if (theContent != null && isFieldMissing("references")) {
      if (theContent.getReferences() == null) {
        return references;
      }
      return theContent.getReferences().toArray(new String[0]);
    }
    return references;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // messageId
  // ----------------------------------------------------------------------  
  protected String messageId = channel.getTypeFieldEntry(DBMailMessage.class, "messageId", true).getDefaultTextString();
  public void setMessageId(String[]  v) {
    messageId = getMainLangValue(v, true, true);
  }
  public String getAvailableMessageId() {
    if (theContent != null && isFieldMissing("messageId")) {
      return theContent.getMessageId();
    }
    return messageId;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // thread
  // ----------------------------------------------------------------------  
  protected String thread = channel.getTypeFieldEntry(DBMailMessage.class, "thread", true).getDefaultTextString();
  public void setThread(String[]  v) {
    thread = getMainLangValue(v, true, true);
  }
  public String getAvailableThread() {
    if (theContent != null && isFieldMissing("thread")) {
      return theContent.getThread();
    }
    return thread;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// G/a1JV6+aiOdTX9p0AuX6A==
