// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:57 CET 2015
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
public class EditPortletSignUpHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletSignUp theContent;
  
  public Class getPublicationClass() {
    return PortletSignUp.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletSignUp  
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
  
    if ("intro".equals(field)) {
      return getAllAvailableIntroML();
    }
    
    if ("label".equals(field)) {
      return getAllAvailableLabelML();
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
  // validateCommonCreateUpdatePortletSignUp  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletSignUp() {
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
    if (!validateCommonCreateUpdatePortletSignUp()) {
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
    
    if (!validateCommonCreateUpdatePortletSignUp()) {
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
    PortletSignUp obj = (PortletSignUp)data;
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setLabel(getAvailableLabel());
    obj.setLabelML(getAvailableLabelML());
    obj.setDisplayPortal(getAvailableDisplayPortal());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletSignUp) {
      super.setId(v);
      theContent = (PortletSignUp)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  protected String intro = channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextString();
  protected HashMap introML = channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextMap();
  public void setIntro(String[]  v) {
    intro = getMainLangValue(v, true, true);
    introML = getMLMap(v, true, true);
  }
  public String getAvailableIntro() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntro();
    }
    return intro;
  }
  
    
  public HashMap getAllAvailableIntroML() {
    HashMap map = Util.getHashMap(getAvailableIntroML());
    map.put(channel.getLanguage(),getAvailableIntro(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableIntroML() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntroML();
    }
    return introML;
  }
  public String getAvailableIntro(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextString())) {
          return intro;
      	}
      } else {
      	if (introML != null && Util.notEmpty((String)introML.get(lang))) {
      	  return (String)introML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntro(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return intro;
    }
    return introML == null ? "" : Util.getString((String)introML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // label
  // ----------------------------------------------------------------------  
  protected String label = channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextString();
  protected HashMap labelML = channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextMap();
  public void setLabel(String[]  v) {
    label = getMainLangValue(v, true, true);
    labelML = getMLMap(v, true, true);
  }
  public String getAvailableLabel() {
    if (theContent != null && isFieldMissing("label")) {
      return theContent.getLabel();
    }
    return label;
  }
  
    
  public HashMap getAllAvailableLabelML() {
    HashMap map = Util.getHashMap(getAvailableLabelML());
    map.put(channel.getLanguage(),getAvailableLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableLabelML() {
    if (theContent != null && isFieldMissing("label")) {
      return theContent.getLabelML();
    }
    return labelML;
  }
  public String getAvailableLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(label, channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextString())) {
          return label;
      	}
      } else {
      	if (labelML != null && Util.notEmpty((String)labelML.get(lang))) {
      	  return (String)labelML.get(lang);
      	}
      }
      return Util.getString(theContent.getLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return label;
    }
    return labelML == null ? "" : Util.getString((String)labelML.get(lang), "");
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
// 8FVOmpWWW6jhEgXaZwDOFA==
