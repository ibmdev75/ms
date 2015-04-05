// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:52 CET 2015
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
public class EditAbstractPortalHandler extends com.jalios.jcms.portlet.EditPortalHandler {
   
  protected AbstractPortal theContent;
  
  public Class getPublicationClass() {
    return AbstractPortal.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractPortal  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("child", __childStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        child = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isChildValidated = Util.isEmpty(__childStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableChild(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableChild(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("pageTitle".equals(field)) {
      return getAllAvailablePageTitleML();
    }
    
    if ("child".equals(field)) {
      return getAvailableChild();
    }
    
    if ("cssFile".equals(field)) {
      return getAvailableCssFile();
    }
    
    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }
    
    if ("portletImage".equals(field)) {
      return getAllAvailablePortletImageML();
    }
    
    if ("cacheType".equals(field)) {
      return getAvailableCacheType();
    }
    
    if ("cacheSensibility".equals(field)) {
      return getAvailableCacheSensibility();
    }
    
    if ("invalidClass".equals(field)) {
      return getAvailableInvalidClass();
    }
    
    if ("invalidTime".equals(field)) {
      return getAvailableInvalidTime();
    }
    
    if ("behaviorCopy".equals(field)) {
      return getAvailableBehaviorCopy();
    }
    
    if ("cssId".equals(field)) {
      return getAvailableCssId();
    }
    
    if ("cssClasses".equals(field)) {
      return getAvailableCssClasses();
    }
    
    if ("exactCategory".equals(field)) {
      return getAvailableExactCategory();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("cssFile".equals(field)) {
      return AbstractPortal.getCssFileValues();
    }
    if ("cacheType".equals(field)) {
      return AbstractPortal.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortal.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortal.getInvalidClassValues();
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortal.getBehaviorCopyValues();
    }
    if ("exactCategory".equals(field)) {
      return AbstractPortal.getExactCategoryValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("cssFile".equals(field)) {
      return AbstractPortal.getCssFileLabels(userLang);
    }
    if ("cacheType".equals(field)) {
      return AbstractPortal.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortal.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortal.getInvalidClassLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortal.getBehaviorCopyLabels(userLang);
    }
    if ("exactCategory".equals(field)) {
      return AbstractPortal.getExactCategoryLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractPortal  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractPortal() {
    if (!isChildValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "child", userLang)));
      return false;
    }
    if (!isInvalidTimeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "invalidTime", userLang)));
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
    if (!validateCommonCreateUpdateAbstractPortal()) {
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
    
    if (!validateCommonCreateUpdateAbstractPortal()) {
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
    AbstractPortal obj = (AbstractPortal)data;
    obj.setPageTitle(getAvailablePageTitle());
    obj.setPageTitleML(getAvailablePageTitleML());
    obj.setChild(getAvailableChild());
    obj.setCssFile(getAvailableCssFile());
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setPortletImage(getAvailablePortletImage());
    obj.setPortletImageML(getAvailablePortletImageML());
    obj.setCacheType(getAvailableCacheType());
    obj.setCacheSensibility(getAvailableCacheSensibility());
    obj.setInvalidClass(getAvailableInvalidClass());
    obj.setInvalidTime(getAvailableInvalidTime());
    obj.setBehaviorCopy(getAvailableBehaviorCopy());
    obj.setCssId(getAvailableCssId());
    obj.setCssClasses(getAvailableCssClasses());
    obj.setExactCategory(getAvailableExactCategory());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractPortal) {
      super.setId(v);
      theContent = (AbstractPortal)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------  
  protected String pageTitle = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextString();
  protected HashMap pageTitleML = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextMap();
  public void setPageTitle(String[]  v) {
    pageTitle = getMainLangValue(v, true, true);
    pageTitleML = getMLMap(v, true, true);
  }
  public String getAvailablePageTitle() {
    if (theContent != null && isFieldMissing("pageTitle")) {
      return theContent.getPageTitle();
    }
    return pageTitle;
  }
  
    
  public HashMap getAllAvailablePageTitleML() {
    HashMap map = Util.getHashMap(getAvailablePageTitleML());
    map.put(channel.getLanguage(),getAvailablePageTitle(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailablePageTitleML() {
    if (theContent != null && isFieldMissing("pageTitle")) {
      return theContent.getPageTitleML();
    }
    return pageTitleML;
  }
  public String getAvailablePageTitle(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pageTitle, channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextString())) {
          return pageTitle;
      	}
      } else {
      	if (pageTitleML != null && Util.notEmpty((String)pageTitleML.get(lang))) {
      	  return (String)pageTitleML.get(lang);
      	}
      }
      return Util.getString(theContent.getPageTitle(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return pageTitle;
    }
    return pageTitleML == null ? "" : Util.getString((String)pageTitleML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // child
  // ----------------------------------------------------------------------  
  protected boolean isChildValidated = true;
  protected com.jalios.jcms.portlet.PortalElement child;
  String __childStr = null;
  public void setChild(String v) {
    __childStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableChild() {
    if (theContent != null && isFieldMissing("child")) {
      return theContent.getChild();
    }
    return child;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cssFile
  // ----------------------------------------------------------------------  
  protected String cssFile = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getDefaultTextString();
  public void setCssFile(String[]  v) {
    cssFile = getMainLangValue(v, true, true);
  }
  public String getAvailableCssFile() {
    if (theContent != null && isFieldMissing("cssFile")) {
      return theContent.getCssFile();
    }
    return cssFile;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected String description = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextString();
  protected HashMap descriptionML = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextMap();
  public void setDescription(String[]  v) {
    description = getMainLangValue(v, false, true);
    descriptionML = getMLMap(v, false, true);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescription();
    }
    return description;
  }
  
    
  public HashMap getAllAvailableDescriptionML() {
    HashMap map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextString())) {
          return description;
      	}
      } else {
      	if (descriptionML != null && Util.notEmpty((String)descriptionML.get(lang))) {
      	  return (String)descriptionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDescription(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return description;
    }
    return descriptionML == null ? "" : Util.getString((String)descriptionML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // portletImage
  // ----------------------------------------------------------------------  
  protected String portletImage = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextString();
  protected HashMap portletImageML = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextMap();
  public void setPortletImage(String[]  v) {
    portletImage = getMainLangValue(v, true, true);
    portletImageML = getMLMap(v, true, true);
  }
  public String getAvailablePortletImage() {
    if (theContent != null && isFieldMissing("portletImage")) {
      return theContent.getPortletImage();
    }
    return portletImage;
  }
  
    
  public HashMap getAllAvailablePortletImageML() {
    HashMap map = Util.getHashMap(getAvailablePortletImageML());
    map.put(channel.getLanguage(),getAvailablePortletImage(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailablePortletImageML() {
    if (theContent != null && isFieldMissing("portletImage")) {
      return theContent.getPortletImageML();
    }
    return portletImageML;
  }
  public String getAvailablePortletImage(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextString())) {
          return portletImage;
      	}
      } else {
      	if (portletImageML != null && Util.notEmpty((String)portletImageML.get(lang))) {
      	  return (String)portletImageML.get(lang);
      	}
      }
      return Util.getString(theContent.getPortletImage(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return portletImage;
    }
    return portletImageML == null ? "" : Util.getString((String)portletImageML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------  
  protected String cacheType = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getDefaultTextString();
  public void setCacheType(String[]  v) {
    cacheType = getMainLangValue(v, true, true);
  }
  public String getAvailableCacheType() {
    if (theContent != null && isFieldMissing("cacheType")) {
      return theContent.getCacheType();
    }
    return cacheType;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cacheSensibility
  // ----------------------------------------------------------------------  
  protected String cacheSensibility = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getDefaultTextString();
  public void setCacheSensibility(String[]  v) {
    cacheSensibility = getMainLangValue(v, true, true);
  }
  public String getAvailableCacheSensibility() {
    if (theContent != null && isFieldMissing("cacheSensibility")) {
      return theContent.getCacheSensibility();
    }
    return cacheSensibility;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // invalidClass
  // ----------------------------------------------------------------------  
  protected String[] invalidClass = new String[0];
  protected int invalidClassAddCount = 0;
  public void setInvalidClass(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.invalidClass = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableInvalidClass() {
    if (theContent != null && isFieldMissing("invalidClass")) {
      if (theContent.getInvalidClass() == null) {
        return invalidClass;
      }
      return theContent.getInvalidClass();
    }
    return invalidClass;
  }
  
    
  
  public void setInvalidClassAddCount(int  v) {
    invalidClassAddCount = v;
  }
  
  public int getInvalidClassCount() {
    int arraySize = Util.getSize(getAvailableInvalidClass());
    int res = 3 + arraySize + invalidClassAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------  
  protected boolean isInvalidTimeValidated = true;
  protected long invalidTime = 60;
  public void setInvalidTime(String v) {
    try {
      invalidTime = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      isInvalidTimeValidated = false;
    }
  }
  
  public long getAvailableInvalidTime() {
    if (theContent != null && isFieldMissing("invalidTime")) {
      return theContent.getInvalidTime();
    }
    return invalidTime;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected String behaviorCopy = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getDefaultTextString();
  public void setBehaviorCopy(String[]  v) {
    behaviorCopy = getMainLangValue(v, true, true);
  }
  public String getAvailableBehaviorCopy() {
    if (theContent != null && isFieldMissing("behaviorCopy")) {
      return theContent.getBehaviorCopy();
    }
    return behaviorCopy;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------  
  protected String cssId = channel.getTypeFieldEntry(AbstractPortal.class, "cssId", true).getDefaultTextString();
  public void setCssId(String[]  v) {
    cssId = getMainLangValue(v, true, true);
  }
  public String getAvailableCssId() {
    if (theContent != null && isFieldMissing("cssId")) {
      return theContent.getCssId();
    }
    return cssId;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------  
  protected String cssClasses = channel.getTypeFieldEntry(AbstractPortal.class, "cssClasses", true).getDefaultTextString();
  public void setCssClasses(String[]  v) {
    cssClasses = getMainLangValue(v, true, true);
  }
  public String getAvailableCssClasses() {
    if (theContent != null && isFieldMissing("cssClasses")) {
      return theContent.getCssClasses();
    }
    return cssClasses;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------  
  protected boolean exactCategory = false;
  public void setExactCategory(boolean  v) {
    this.exactCategory = v;
  }
  
  public boolean getAvailableExactCategory() {
    if (theContent != null && isFieldMissing("exactCategory")) {
      return theContent.getExactCategory();
    }
    return exactCategory;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// /dj0Epf+opIq2/4gDIlBqQ==
