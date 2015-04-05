// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:05 CET 2015
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
public class EditPortletPortalRedirectHandler extends com.jalios.jcms.portlet.EditPortalRedirectHandler {
   
  protected PortletPortalRedirect theContent;
  
  public Class getPublicationClass() {
    return PortletPortalRedirect.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletPortalRedirect  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("content", __contentStr, com.jalios.jcms.Content.class);
      if (data != null) { 
        content = (com.jalios.jcms.Content)data;
      } else {
        isContentValidated = Util.isEmpty(__contentStr);
      }
    }
    {
      Data data = processDataId("redirectPortlet", __redirectPortletStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        redirectPortlet = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isRedirectPortletValidated = Util.isEmpty(__redirectPortletStr);
      }
    }
    {
      Data data = processDataId("dispPortal", __dispPortalStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        dispPortal = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isDispPortalValidated = Util.isEmpty(__dispPortalStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableContent(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailableRedirectPortlet(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailableDispPortal(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableContent(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableRedirectPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableDispPortal(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("status".equals(field)) {
      return getAvailableStatus();
    }
    
    if ("content".equals(field)) {
      return getAvailableContent();
    }
    
    if ("redirectForm".equals(field)) {
      return getAvailableRedirectForm();
    }
    
    if ("url".equals(field)) {
      return getAvailableUrl();
    }
    
    if ("redirectPortlet".equals(field)) {
      return getAvailableRedirectPortlet();
    }
    
    if ("category".equals(field)) {
      return getAvailableCategory();
    }
    
    if ("dispPortal".equals(field)) {
      return getAvailableDispPortal();
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
    
    if ("navCategories".equals(field)) {
      return getNavCategoriesCatSet();
    }
    
    if ("exactCategory".equals(field)) {
      return getAvailableExactCategory();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("redirectForm".equals(field)) {
      return PortletPortalRedirect.getRedirectFormValues();
    }
    if ("cacheType".equals(field)) {
      return PortletPortalRedirect.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return PortletPortalRedirect.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return PortletPortalRedirect.getInvalidClassValues();
    }
    if ("behaviorCopy".equals(field)) {
      return PortletPortalRedirect.getBehaviorCopyValues();
    }
    if ("exactCategory".equals(field)) {
      return PortletPortalRedirect.getExactCategoryValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("redirectForm".equals(field)) {
      return PortletPortalRedirect.getRedirectFormLabels(userLang);
    }
    if ("cacheType".equals(field)) {
      return PortletPortalRedirect.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return PortletPortalRedirect.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return PortletPortalRedirect.getInvalidClassLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return PortletPortalRedirect.getBehaviorCopyLabels(userLang);
    }
    if ("exactCategory".equals(field)) {
      return PortletPortalRedirect.getExactCategoryLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletPortalRedirect  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletPortalRedirect() {
    if (!isContentValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "content", userLang)));
      return false;
    }
    if (!isRedirectPortletValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "redirectPortlet", userLang)));
      return false;
    }
    if (!isDispPortalValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "dispPortal", userLang)));
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
    if (!validateCommonCreateUpdatePortletPortalRedirect()) {
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
    
    if (!validateCommonCreateUpdatePortletPortalRedirect()) {
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
    PortletPortalRedirect obj = (PortletPortalRedirect)data;
    obj.setStatus(getAvailableStatus());
    obj.setContent(getAvailableContent());
    obj.setRedirectForm(getAvailableRedirectForm());
    obj.setUrl(getAvailableUrl());
    obj.setRedirectPortlet(getAvailableRedirectPortlet());
    obj.setCategory(getAvailableCategory());
    obj.setDispPortal(getAvailableDispPortal());
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
    if (channel.getData(v) instanceof PortletPortalRedirect) {
      super.setId(v);
      theContent = (PortletPortalRedirect)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // status
  // ----------------------------------------------------------------------  
  protected String status = channel.getTypeFieldEntry(PortletPortalRedirect.class, "status", true).getDefaultTextString();
  public void setStatus(String[]  v) {
    status = getMainLangValue(v, true, true);
  }
  public String getAvailableStatus() {
    if (theContent != null && isFieldMissing("status")) {
      return theContent.getStatus();
    }
    return status;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  protected boolean isContentValidated = true;
  protected com.jalios.jcms.Content content;
  String __contentStr = null;
  public void setContent(String v) {
    __contentStr = v;
  }
  public com.jalios.jcms.Content getAvailableContent() {
    if (theContent != null && isFieldMissing("content")) {
      return theContent.getContent();
    }
    return content;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // redirectForm
  // ----------------------------------------------------------------------  
  protected String redirectForm = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getDefaultTextString();
  public void setRedirectForm(String[]  v) {
    redirectForm = getMainLangValue(v, true, true);
  }
  public String getAvailableRedirectForm() {
    if (theContent != null && isFieldMissing("redirectForm")) {
      return theContent.getRedirectForm();
    }
    return redirectForm;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------  
  protected String url = channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true).getDefaultTextString();
  public void setUrl(String[]  v) {
    url = getMainLangValue(v, true, true);
  }
  public String getAvailableUrl() {
    if (theContent != null && isFieldMissing("url")) {
      return theContent.getUrl();
    }
    return url;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // redirectPortlet
  // ----------------------------------------------------------------------  
  protected boolean isRedirectPortletValidated = true;
  protected com.jalios.jcms.portlet.PortalElement redirectPortlet;
  String __redirectPortletStr = null;
  public void setRedirectPortlet(String v) {
    __redirectPortletStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableRedirectPortlet() {
    if (theContent != null && isFieldMissing("redirectPortlet")) {
      return theContent.getRedirectPortlet();
    }
    return redirectPortlet;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // category
  // ----------------------------------------------------------------------  
  protected String category = channel.getTypeFieldEntry(PortletPortalRedirect.class, "category", true).getDefaultTextString();
  public void setCategory(String[]  v) {
    category = getMainLangValue(v, true, true);
  }
  public String getAvailableCategory() {
    if (theContent != null && isFieldMissing("category")) {
      return theContent.getCategory();
    }
    return category;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // dispPortal
  // ----------------------------------------------------------------------  
  protected boolean isDispPortalValidated = true;
  protected com.jalios.jcms.portlet.PortalElement dispPortal;
  String __dispPortalStr = null;
  public void setDispPortal(String v) {
    __dispPortalStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableDispPortal() {
    if (theContent != null && isFieldMissing("dispPortal")) {
      return theContent.getDispPortal();
    }
    return dispPortal;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected String description = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextString();
  protected HashMap descriptionML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextMap();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextString())) {
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
  protected String portletImage = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextString();
  protected HashMap portletImageML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextMap();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextString())) {
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
  protected String cacheType = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getDefaultTextString();
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
  protected String cacheSensibility = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getDefaultTextString();
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
  protected String behaviorCopy = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getDefaultTextString();
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
  protected String cssId = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssId", true).getDefaultTextString();
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
  protected String cssClasses = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssClasses", true).getDefaultTextString();
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
  protected boolean exactCategory = true;
  public void setExactCategory(boolean  v) {
    this.exactCategory = v;
  }
  
  public boolean getAvailableExactCategory() {
    if (theContent != null && isFieldMissing("exactCategory")) {
      return theContent.getExactCategory();
    }
    return exactCategory;
  }
  
    
  
  public Category getNavCategoriesRoot() {
    return channel.getCategory("j_3");
  }  
    
  public Set getNavCategoriesCatSet() {
    Category rootCat = getNavCategoriesRoot();
    if (rootCat == null) {
      return Util.EMPTY_TREESET;
    }
    Set set = new HashSet(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// SgA/fbm6Ec7/iHlcZZkTJQ==
