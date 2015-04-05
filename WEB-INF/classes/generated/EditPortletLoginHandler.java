// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:54 CET 2015
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
public class EditPortletLoginHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletLogin theContent;
  
  public Class getPublicationClass() {
    return PortletLogin.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletLogin  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("displayPortal", __displayPortalStr, generated.PortletPortal.class);
      if (data != null) { 
        displayPortal = (generated.PortletPortal)data;
      } else {
        isDisplayPortalValidated = Util.isEmpty(__displayPortalStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableDisplayPortal(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableDisplayPortal(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("introduction".equals(field)) {
      return getAllAvailableIntroductionML();
    }
    
    if ("loginText".equals(field)) {
      return getAllAvailableLoginTextML();
    }
    
    if ("passwordText".equals(field)) {
      return getAllAvailablePasswordTextML();
    }
    
    if ("buttonText".equals(field)) {
      return getAllAvailableButtonTextML();
    }
    
    if ("displayPortal".equals(field)) {
      return getAvailableDisplayPortal();
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
  // validateCommonCreateUpdatePortletLogin  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletLogin() {
    if (!isDisplayPortalValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "displayPortal", userLang)));
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
    if (!validateCommonCreateUpdatePortletLogin()) {
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
    
    if (!validateCommonCreateUpdatePortletLogin()) {
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
    PortletLogin obj = (PortletLogin)data;
    obj.setIntroduction(getAvailableIntroduction());
    obj.setIntroductionML(getAvailableIntroductionML());
    obj.setLoginText(getAvailableLoginText());
    obj.setLoginTextML(getAvailableLoginTextML());
    obj.setPasswordText(getAvailablePasswordText());
    obj.setPasswordTextML(getAvailablePasswordTextML());
    obj.setButtonText(getAvailableButtonText());
    obj.setButtonTextML(getAvailableButtonTextML());
    obj.setDisplayPortal(getAvailableDisplayPortal());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletLogin) {
      super.setId(v);
      theContent = (PortletLogin)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // introduction
  // ----------------------------------------------------------------------  
  protected String introduction = channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextString();
  protected HashMap introductionML = channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextMap();
  public void setIntroduction(String[]  v) {
    introduction = getMainLangValue(v, true, true);
    introductionML = getMLMap(v, true, true);
  }
  public String getAvailableIntroduction() {
    if (theContent != null && isFieldMissing("introduction")) {
      return theContent.getIntroduction();
    }
    return introduction;
  }
  
    
  public HashMap getAllAvailableIntroductionML() {
    HashMap map = Util.getHashMap(getAvailableIntroductionML());
    map.put(channel.getLanguage(),getAvailableIntroduction(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableIntroductionML() {
    if (theContent != null && isFieldMissing("introduction")) {
      return theContent.getIntroductionML();
    }
    return introductionML;
  }
  public String getAvailableIntroduction(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(introduction, channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextString())) {
          return introduction;
      	}
      } else {
      	if (introductionML != null && Util.notEmpty((String)introductionML.get(lang))) {
      	  return (String)introductionML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntroduction(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return introduction;
    }
    return introductionML == null ? "" : Util.getString((String)introductionML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // loginText
  // ----------------------------------------------------------------------  
  protected String loginText = channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextString();
  protected HashMap loginTextML = channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextMap();
  public void setLoginText(String[]  v) {
    loginText = getMainLangValue(v, true, true);
    loginTextML = getMLMap(v, true, true);
  }
  public String getAvailableLoginText() {
    if (theContent != null && isFieldMissing("loginText")) {
      return theContent.getLoginText();
    }
    return loginText;
  }
  
    
  public HashMap getAllAvailableLoginTextML() {
    HashMap map = Util.getHashMap(getAvailableLoginTextML());
    map.put(channel.getLanguage(),getAvailableLoginText(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableLoginTextML() {
    if (theContent != null && isFieldMissing("loginText")) {
      return theContent.getLoginTextML();
    }
    return loginTextML;
  }
  public String getAvailableLoginText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(loginText, channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextString())) {
          return loginText;
      	}
      } else {
      	if (loginTextML != null && Util.notEmpty((String)loginTextML.get(lang))) {
      	  return (String)loginTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getLoginText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return loginText;
    }
    return loginTextML == null ? "" : Util.getString((String)loginTextML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // passwordText
  // ----------------------------------------------------------------------  
  protected String passwordText = channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextString();
  protected HashMap passwordTextML = channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextMap();
  public void setPasswordText(String[]  v) {
    passwordText = getMainLangValue(v, true, true);
    passwordTextML = getMLMap(v, true, true);
  }
  public String getAvailablePasswordText() {
    if (theContent != null && isFieldMissing("passwordText")) {
      return theContent.getPasswordText();
    }
    return passwordText;
  }
  
    
  public HashMap getAllAvailablePasswordTextML() {
    HashMap map = Util.getHashMap(getAvailablePasswordTextML());
    map.put(channel.getLanguage(),getAvailablePasswordText(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailablePasswordTextML() {
    if (theContent != null && isFieldMissing("passwordText")) {
      return theContent.getPasswordTextML();
    }
    return passwordTextML;
  }
  public String getAvailablePasswordText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(passwordText, channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextString())) {
          return passwordText;
      	}
      } else {
      	if (passwordTextML != null && Util.notEmpty((String)passwordTextML.get(lang))) {
      	  return (String)passwordTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getPasswordText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return passwordText;
    }
    return passwordTextML == null ? "" : Util.getString((String)passwordTextML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // buttonText
  // ----------------------------------------------------------------------  
  protected String buttonText = channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextString();
  protected HashMap buttonTextML = channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextMap();
  public void setButtonText(String[]  v) {
    buttonText = getMainLangValue(v, true, true);
    buttonTextML = getMLMap(v, true, true);
  }
  public String getAvailableButtonText() {
    if (theContent != null && isFieldMissing("buttonText")) {
      return theContent.getButtonText();
    }
    return buttonText;
  }
  
    
  public HashMap getAllAvailableButtonTextML() {
    HashMap map = Util.getHashMap(getAvailableButtonTextML());
    map.put(channel.getLanguage(),getAvailableButtonText(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableButtonTextML() {
    if (theContent != null && isFieldMissing("buttonText")) {
      return theContent.getButtonTextML();
    }
    return buttonTextML;
  }
  public String getAvailableButtonText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(buttonText, channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextString())) {
          return buttonText;
      	}
      } else {
      	if (buttonTextML != null && Util.notEmpty((String)buttonTextML.get(lang))) {
      	  return (String)buttonTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getButtonText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return buttonText;
    }
    return buttonTextML == null ? "" : Util.getString((String)buttonTextML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------  
  protected boolean isDisplayPortalValidated = true;
  protected generated.PortletPortal displayPortal;
  String __displayPortalStr = null;
  public void setDisplayPortal(String v) {
    __displayPortalStr = v;
  }
  public generated.PortletPortal getAvailableDisplayPortal() {
    if (theContent != null && isFieldMissing("displayPortal")) {
      return theContent.getDisplayPortal();
    }
    return displayPortal;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// uTKFW+e9GN/On4oplhkLpw==
