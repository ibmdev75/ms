// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:54 CET 2015
   
package generated;
import java.util.*;
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.hibernate.Hibernate;
import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.util.*;
@SuppressWarnings({"unchecked", "unused"})
public  class PortletLogin extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletLogin() {}
 
 
  public PortletLogin(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletLogin(PortletLogin other) {
    super(other);
    introduction = other.introduction;
    introductionML = other.introductionML;
    loginText = other.loginText;
    loginTextML = other.loginTextML;
    passwordText = other.passwordText;
    passwordTextML = other.passwordTextML;
    buttonText = other.buttonText;
    buttonTextML = other.buttonTextML;
    displayPortal = other.displayPortal;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setIntroduction(ImportUtil.parseFieldText(elt, "introduction"));
    setIntroductionML(ImportUtil.parseFieldTextML(elt, "introductionML"));
    setLoginText(ImportUtil.parseFieldText(elt, "loginText"));
    setLoginTextML(ImportUtil.parseFieldTextML(elt, "loginTextML"));
    setPasswordText(ImportUtil.parseFieldText(elt, "passwordText"));
    setPasswordTextML(ImportUtil.parseFieldTextML(elt, "passwordTextML"));
    setButtonText(ImportUtil.parseFieldText(elt, "buttonText"));
    setButtonTextML(ImportUtil.parseFieldTextML(elt, "buttonTextML"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setDisplayPortal(ImportUtil.parseSelfFieldData(elt, "displayPortal", generated.PortletPortal.class));
    } else {
    
    setDisplayPortal((generated.PortletPortal)ImportUtil.parseFieldData(elt, "displayPortal"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "introduction", getIntroduction(), "introductionML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "introductionML", getIntroductionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "loginText", getLoginText(), "loginTextML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "loginTextML", getLoginTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "passwordText", getPasswordText(), "passwordTextML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "passwordTextML", getPasswordTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "buttonText", getButtonText(), "buttonTextML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "buttonTextML", getButtonTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "displayPortal", getDisplayPortal()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletLogin</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletLogin.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletLogin</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletLogin</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletLogin</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletLogin.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletLogin</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletLogin</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletLogin</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletLogin.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletLogin</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    super.setBooleanFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param mbr the member used to check rigth access to categories.
   * @return a <code>TreeSet</code> of <code>Category</code>
   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.
   */
  public TreeSet getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletLogin</code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value 
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
    if ("introduction".equals(fieldName)) { return getIntroduction(lang, useDefault); }
    if ("loginText".equals(fieldName)) { return getLoginText(lang, useDefault); }
    if ("passwordText".equals(fieldName)) { return getPasswordText(lang, useDefault); }
    if ("buttonText".equals(fieldName)) { return getButtonText(lang, useDefault); }
    if ("displayPortal".equals(fieldName)) { return getDisplayPortal(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletLogin</code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * 
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0 
   */
  public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
    if ("introduction".equals(fieldName)) { setIntroduction(lang,(String)value); return; }
    if ("loginText".equals(fieldName)) { setLoginText(lang,(String)value); return; }
    if ("passwordText".equals(fieldName)) { setPasswordText(lang,(String)value); return; }
    if ("buttonText".equals(fieldName)) { setButtonText(lang,(String)value); return; }
    if ("displayPortal".equals(fieldName)) { setDisplayPortal((generated.PortletPortal)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // introduction
  // ----------------------------------------------------------------------  
  protected  String introduction = channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextString();
  public String getIntroduction() { return introduction; }
  public void setIntroduction(String v) { introduction = v; }
  
  
  protected HashMap introductionML = channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextMap();
  public String getIntroduction(String lang) { return (String)channel.getLangValue(lang, true, introduction, introductionML, getMainLanguage()); }
  public String getIntroduction(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, introduction, introductionML, getMainLanguage()); }
  public HashMap getIntroductionML() { return introductionML; }
  public void setIntroductionML(HashMap v) { introductionML = v; }
  /**
   * Convenient method to set the value of the Introduction field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setIntroduction(String)} or {@link #setIntroductionML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setIntroduction(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      introduction = value;
      return;
    }
    if (introductionML == null) {
      introductionML = new HashMap();
    } else if (this != channel.getData(id)) {
      introductionML = new HashMap<String,String>(introductionML);
    }
    introductionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // loginText
  // ----------------------------------------------------------------------  
  protected  String loginText = channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextString();
  public String getLoginText() { return loginText; }
  public void setLoginText(String v) { loginText = v; }
  
  
  protected HashMap loginTextML = channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextMap();
  public String getLoginText(String lang) { return (String)channel.getLangValue(lang, true, loginText, loginTextML, getMainLanguage()); }
  public String getLoginText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, loginText, loginTextML, getMainLanguage()); }
  public HashMap getLoginTextML() { return loginTextML; }
  public void setLoginTextML(HashMap v) { loginTextML = v; }
  /**
   * Convenient method to set the value of the LoginText field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setLoginText(String)} or {@link #setLoginTextML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setLoginText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      loginText = value;
      return;
    }
    if (loginTextML == null) {
      loginTextML = new HashMap();
    } else if (this != channel.getData(id)) {
      loginTextML = new HashMap<String,String>(loginTextML);
    }
    loginTextML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // passwordText
  // ----------------------------------------------------------------------  
  protected  String passwordText = channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextString();
  public String getPasswordText() { return passwordText; }
  public void setPasswordText(String v) { passwordText = v; }
  
  
  protected HashMap passwordTextML = channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextMap();
  public String getPasswordText(String lang) { return (String)channel.getLangValue(lang, true, passwordText, passwordTextML, getMainLanguage()); }
  public String getPasswordText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, passwordText, passwordTextML, getMainLanguage()); }
  public HashMap getPasswordTextML() { return passwordTextML; }
  public void setPasswordTextML(HashMap v) { passwordTextML = v; }
  /**
   * Convenient method to set the value of the PasswordText field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setPasswordText(String)} or {@link #setPasswordTextML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setPasswordText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      passwordText = value;
      return;
    }
    if (passwordTextML == null) {
      passwordTextML = new HashMap();
    } else if (this != channel.getData(id)) {
      passwordTextML = new HashMap<String,String>(passwordTextML);
    }
    passwordTextML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // buttonText
  // ----------------------------------------------------------------------  
  protected  String buttonText = channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextString();
  public String getButtonText() { return buttonText; }
  public void setButtonText(String v) { buttonText = v; }
  
  
  protected HashMap buttonTextML = channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextMap();
  public String getButtonText(String lang) { return (String)channel.getLangValue(lang, true, buttonText, buttonTextML, getMainLanguage()); }
  public String getButtonText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, buttonText, buttonTextML, getMainLanguage()); }
  public HashMap getButtonTextML() { return buttonTextML; }
  public void setButtonTextML(HashMap v) { buttonTextML = v; }
  /**
   * Convenient method to set the value of the ButtonText field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setButtonText(String)} or {@link #setButtonTextML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setButtonText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      buttonText = value;
      return;
    }
    if (buttonTextML == null) {
      buttonTextML = new HashMap();
    } else if (this != channel.getData(id)) {
      buttonTextML = new HashMap<String,String>(buttonTextML);
    }
    buttonTextML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------  
  protected  generated.PortletPortal displayPortal;
  public generated.PortletPortal getDisplayPortal() { return displayPortal; }
  public void setDisplayPortal(generated.PortletPortal v) { displayPortal = v; }
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setLoginText(lang, value); }
  @Override
  public String getAbstract() { return loginText; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getLoginText(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getLoginTextML(); }
   
  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------  
  @Override
  public String getDataImage() {
    return portletImage;
  
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    return getPortletImage(lang, useDefault);
  
  }
  
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0) );
    if (title != null) {
      sb.append(title); sb.append(' '); 
    }
    if (titleML != null) {
      for(Iterator it = titleML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    return new String[] {sb.toString()};
  }
  
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  public TreeSet getLinkDataSet(Class clazz) {
    if (clazz == null) {
      return Util.EMPTY_TREESET;
    }
    TreeSet set = new TreeSet();
    JcmsUtil.addData(set, clazz, getDisplayPortal());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletLogin copy = (PortletLogin)super.prepareMergeCopy();
    PortletLogin main = (PortletLogin)mainInstance;
    JcmsUtil.mergeMLMap(copy.getIntroductionML(), main.getIntroductionML());
    JcmsUtil.mergeMLMap(copy.getLoginTextML(), main.getLoginTextML());
    JcmsUtil.mergeMLMap(copy.getPasswordTextML(), main.getPasswordTextML());
    JcmsUtil.mergeMLMap(copy.getButtonTextML(), main.getButtonTextML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// g3KKnP5IRfZwhRrMqLmBuw==
