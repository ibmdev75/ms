// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:38 CET 2015
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
public class EditAbstractPortletHandler extends com.jalios.jcms.portlet.EditPortletHandler {
   
  protected AbstractPortlet theContent;
  
  public Class getPublicationClass() {
    return AbstractPortlet.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractPortlet  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("originalPortlet", __originalPortletStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        originalPortlet = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isOriginalPortletValidated = Util.isEmpty(__originalPortletStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableOriginalPortlet(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableOriginalPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
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
    
    if ("displayCSS".equals(field)) {
      return getAvailableDisplayCSS();
    }
    
    if ("width".equals(field)) {
      return getAvailableWidth();
    }
    
    if ("insetLeft".equals(field)) {
      return getAvailableInsetLeft();
    }
    
    if ("insetRight".equals(field)) {
      return getAvailableInsetRight();
    }
    
    if ("insetTop".equals(field)) {
      return getAvailableInsetTop();
    }
    
    if ("insetBottom".equals(field)) {
      return getAvailableInsetBottom();
    }
    
    if ("cellPadding".equals(field)) {
      return getAvailableCellPadding();
    }
    
    if ("alignH".equals(field)) {
      return getAvailableAlignH();
    }
    
    if ("alignV".equals(field)) {
      return getAvailableAlignV();
    }
    
    if ("alignTable".equals(field)) {
      return getAvailableAlignTable();
    }
    
    if ("border".equals(field)) {
      return getAvailableBorder();
    }
    
    if ("borderColor".equals(field)) {
      return getAvailableBorderColor();
    }
    
    if ("backColor".equals(field)) {
      return getAvailableBackColor();
    }
    
    if ("backImage".equals(field)) {
      return getAvailableBackImage();
    }
    
    if ("behaviorCopy".equals(field)) {
      return getAvailableBehaviorCopy();
    }
    
    if ("originalPortlet".equals(field)) {
      return getAvailableOriginalPortlet();
    }
    
    if ("condition".equals(field)) {
      return getAvailableCondition();
    }
    
    if ("cssId".equals(field)) {
      return getAvailableCssId();
    }
    
    if ("cssClasses".equals(field)) {
      return getAvailableCssClasses();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("cacheType".equals(field)) {
      return AbstractPortlet.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortlet.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortlet.getInvalidClassValues();
    }
    if ("displayCSS".equals(field)) {
      return AbstractPortlet.getDisplayCSSValues();
    }
    if ("alignH".equals(field)) {
      return AbstractPortlet.getAlignHValues();
    }
    if ("alignV".equals(field)) {
      return AbstractPortlet.getAlignVValues();
    }
    if ("alignTable".equals(field)) {
      return AbstractPortlet.getAlignTableValues();
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortlet.getBehaviorCopyValues();
    }
    if ("condition".equals(field)) {
      return AbstractPortlet.getConditionValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("cacheType".equals(field)) {
      return AbstractPortlet.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortlet.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortlet.getInvalidClassLabels(userLang);
    }
    if ("displayCSS".equals(field)) {
      return AbstractPortlet.getDisplayCSSLabels(userLang);
    }
    if ("alignH".equals(field)) {
      return AbstractPortlet.getAlignHLabels(userLang);
    }
    if ("alignV".equals(field)) {
      return AbstractPortlet.getAlignVLabels(userLang);
    }
    if ("alignTable".equals(field)) {
      return AbstractPortlet.getAlignTableLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortlet.getBehaviorCopyLabels(userLang);
    }
    if ("condition".equals(field)) {
      return AbstractPortlet.getConditionLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractPortlet  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractPortlet() {
    if (!isInvalidTimeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "invalidTime", userLang)));
      return false;
    }
    if (!isInsetLeftValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetLeft", userLang)));
      return false;
    }
    if (!isInsetRightValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetRight", userLang)));
      return false;
    }
    if (!isInsetTopValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetTop", userLang)));
      return false;
    }
    if (!isInsetBottomValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetBottom", userLang)));
      return false;
    }
    if (!isCellPaddingValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "cellPadding", userLang)));
      return false;
    }
    if (!isBorderValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "border", userLang)));
      return false;
    }
    if (!isOriginalPortletValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "originalPortlet", userLang)));
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
    if (!validateCommonCreateUpdateAbstractPortlet()) {
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
    
    if (!validateCommonCreateUpdateAbstractPortlet()) {
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
    AbstractPortlet obj = (AbstractPortlet)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setPortletImage(getAvailablePortletImage());
    obj.setPortletImageML(getAvailablePortletImageML());
    obj.setCacheType(getAvailableCacheType());
    obj.setCacheSensibility(getAvailableCacheSensibility());
    obj.setInvalidClass(getAvailableInvalidClass());
    obj.setInvalidTime(getAvailableInvalidTime());
    obj.setDisplayCSS(getAvailableDisplayCSS());
    obj.setWidth(getAvailableWidth());
    obj.setInsetLeft(getAvailableInsetLeft());
    obj.setInsetRight(getAvailableInsetRight());
    obj.setInsetTop(getAvailableInsetTop());
    obj.setInsetBottom(getAvailableInsetBottom());
    obj.setCellPadding(getAvailableCellPadding());
    obj.setAlignH(getAvailableAlignH());
    obj.setAlignV(getAvailableAlignV());
    obj.setAlignTable(getAvailableAlignTable());
    obj.setBorder(getAvailableBorder());
    obj.setBorderColor(getAvailableBorderColor());
    obj.setBackColor(getAvailableBackColor());
    obj.setBackImage(getAvailableBackImage());
    obj.setBehaviorCopy(getAvailableBehaviorCopy());
    obj.setOriginalPortlet(getAvailableOriginalPortlet());
    obj.setCondition(getAvailableCondition());
    obj.setCssId(getAvailableCssId());
    obj.setCssClasses(getAvailableCssClasses());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractPortlet) {
      super.setId(v);
      theContent = (AbstractPortlet)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected String description = channel.getTypeFieldEntry(AbstractPortlet.class, "description", true).getDefaultTextString();
  protected HashMap descriptionML = channel.getTypeFieldEntry(AbstractPortlet.class, "description", true).getDefaultTextMap();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(AbstractPortlet.class, "description", true).getDefaultTextString())) {
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
  protected String portletImage = channel.getTypeFieldEntry(AbstractPortlet.class, "portletImage", true).getDefaultTextString();
  protected HashMap portletImageML = channel.getTypeFieldEntry(AbstractPortlet.class, "portletImage", true).getDefaultTextMap();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(AbstractPortlet.class, "portletImage", true).getDefaultTextString())) {
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
  protected String cacheType = channel.getTypeFieldEntry(AbstractPortlet.class, "cacheType", true).getDefaultTextString();
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
  protected String cacheSensibility = channel.getTypeFieldEntry(AbstractPortlet.class, "cacheSensibility", true).getDefaultTextString();
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
  // displayCSS
  // ----------------------------------------------------------------------  
  protected String displayCSS = channel.getTypeFieldEntry(AbstractPortlet.class, "displayCSS", true).getDefaultTextString();
  public void setDisplayCSS(String[]  v) {
    displayCSS = getMainLangValue(v, true, true);
  }
  public String getAvailableDisplayCSS() {
    if (theContent != null && isFieldMissing("displayCSS")) {
      return theContent.getDisplayCSS();
    }
    return displayCSS;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // width
  // ----------------------------------------------------------------------  
  protected String width = channel.getTypeFieldEntry(AbstractPortlet.class, "width", true).getDefaultTextString();
  public void setWidth(String[]  v) {
    width = getMainLangValue(v, true, true);
  }
  public String getAvailableWidth() {
    if (theContent != null && isFieldMissing("width")) {
      return theContent.getWidth();
    }
    return width;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetLeft
  // ----------------------------------------------------------------------  
  protected boolean isInsetLeftValidated = true;
  protected int insetLeft = 0;
  public void setInsetLeft(String v) {
    try {
      insetLeft = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetLeftValidated = false;
    }
  }
  public int getAvailableInsetLeft() {
    if (theContent != null && isFieldMissing("insetLeft")) {
      return theContent.getInsetLeft();
    }
    return insetLeft;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetRight
  // ----------------------------------------------------------------------  
  protected boolean isInsetRightValidated = true;
  protected int insetRight = 0;
  public void setInsetRight(String v) {
    try {
      insetRight = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetRightValidated = false;
    }
  }
  public int getAvailableInsetRight() {
    if (theContent != null && isFieldMissing("insetRight")) {
      return theContent.getInsetRight();
    }
    return insetRight;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetTop
  // ----------------------------------------------------------------------  
  protected boolean isInsetTopValidated = true;
  protected int insetTop = 0;
  public void setInsetTop(String v) {
    try {
      insetTop = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetTopValidated = false;
    }
  }
  public int getAvailableInsetTop() {
    if (theContent != null && isFieldMissing("insetTop")) {
      return theContent.getInsetTop();
    }
    return insetTop;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetBottom
  // ----------------------------------------------------------------------  
  protected boolean isInsetBottomValidated = true;
  protected int insetBottom = 0;
  public void setInsetBottom(String v) {
    try {
      insetBottom = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetBottomValidated = false;
    }
  }
  public int getAvailableInsetBottom() {
    if (theContent != null && isFieldMissing("insetBottom")) {
      return theContent.getInsetBottom();
    }
    return insetBottom;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cellPadding
  // ----------------------------------------------------------------------  
  protected boolean isCellPaddingValidated = true;
  protected int cellPadding = 0;
  public void setCellPadding(String v) {
    try {
      cellPadding = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isCellPaddingValidated = false;
    }
  }
  public int getAvailableCellPadding() {
    if (theContent != null && isFieldMissing("cellPadding")) {
      return theContent.getCellPadding();
    }
    return cellPadding;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // alignH
  // ----------------------------------------------------------------------  
  protected String alignH = channel.getTypeFieldEntry(AbstractPortlet.class, "alignH", true).getDefaultTextString();
  public void setAlignH(String[]  v) {
    alignH = getMainLangValue(v, true, true);
  }
  public String getAvailableAlignH() {
    if (theContent != null && isFieldMissing("alignH")) {
      return theContent.getAlignH();
    }
    return alignH;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // alignV
  // ----------------------------------------------------------------------  
  protected String alignV = channel.getTypeFieldEntry(AbstractPortlet.class, "alignV", true).getDefaultTextString();
  public void setAlignV(String[]  v) {
    alignV = getMainLangValue(v, true, true);
  }
  public String getAvailableAlignV() {
    if (theContent != null && isFieldMissing("alignV")) {
      return theContent.getAlignV();
    }
    return alignV;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // alignTable
  // ----------------------------------------------------------------------  
  protected String alignTable = channel.getTypeFieldEntry(AbstractPortlet.class, "alignTable", true).getDefaultTextString();
  public void setAlignTable(String[]  v) {
    alignTable = getMainLangValue(v, true, true);
  }
  public String getAvailableAlignTable() {
    if (theContent != null && isFieldMissing("alignTable")) {
      return theContent.getAlignTable();
    }
    return alignTable;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // border
  // ----------------------------------------------------------------------  
  protected boolean isBorderValidated = true;
  protected int border = 0;
  public void setBorder(String v) {
    try {
      border = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isBorderValidated = false;
    }
  }
  public int getAvailableBorder() {
    if (theContent != null && isFieldMissing("border")) {
      return theContent.getBorder();
    }
    return border;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // borderColor
  // ----------------------------------------------------------------------  
  protected String borderColor = channel.getTypeFieldEntry(AbstractPortlet.class, "borderColor", true).getDefaultTextString();
  public void setBorderColor(String[]  v) {
    borderColor = getMainLangValue(v, true, true);
  }
  public String getAvailableBorderColor() {
    if (theContent != null && isFieldMissing("borderColor")) {
      return theContent.getBorderColor();
    }
    return borderColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // backColor
  // ----------------------------------------------------------------------  
  protected String backColor = channel.getTypeFieldEntry(AbstractPortlet.class, "backColor", true).getDefaultTextString();
  public void setBackColor(String[]  v) {
    backColor = getMainLangValue(v, true, true);
  }
  public String getAvailableBackColor() {
    if (theContent != null && isFieldMissing("backColor")) {
      return theContent.getBackColor();
    }
    return backColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // backImage
  // ----------------------------------------------------------------------  
  protected String backImage = channel.getTypeFieldEntry(AbstractPortlet.class, "backImage", true).getDefaultTextString();
  public void setBackImage(String[]  v) {
    backImage = getMainLangValue(v, true, true);
  }
  public String getAvailableBackImage() {
    if (theContent != null && isFieldMissing("backImage")) {
      return theContent.getBackImage();
    }
    return backImage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected String behaviorCopy = channel.getTypeFieldEntry(AbstractPortlet.class, "behaviorCopy", true).getDefaultTextString();
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
  // originalPortlet
  // ----------------------------------------------------------------------  
  protected boolean isOriginalPortletValidated = true;
  protected com.jalios.jcms.portlet.PortalElement originalPortlet;
  String __originalPortletStr = null;
  public void setOriginalPortlet(String v) {
    __originalPortletStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableOriginalPortlet() {
    if (theContent != null && isFieldMissing("originalPortlet")) {
      return theContent.getOriginalPortlet();
    }
    return originalPortlet;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // condition
  // ----------------------------------------------------------------------  
  protected String[] condition = new String[0];
  protected int conditionAddCount = 0;
  public void setCondition(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.condition = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableCondition() {
    if (theContent != null && isFieldMissing("condition")) {
      if (theContent.getCondition() == null) {
        return condition;
      }
      return theContent.getCondition();
    }
    return condition;
  }
  
    
  
  public void setConditionAddCount(int  v) {
    conditionAddCount = v;
  }
  
  public int getConditionCount() {
    int arraySize = Util.getSize(getAvailableCondition());
    int res = 3 + arraySize + conditionAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------  
  protected String cssId = channel.getTypeFieldEntry(AbstractPortlet.class, "cssId", true).getDefaultTextString();
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
  protected String cssClasses = channel.getTypeFieldEntry(AbstractPortlet.class, "cssClasses", true).getDefaultTextString();
  public void setCssClasses(String[]  v) {
    cssClasses = getMainLangValue(v, true, true);
  }
  public String getAvailableCssClasses() {
    if (theContent != null && isFieldMissing("cssClasses")) {
      return theContent.getCssClasses();
    }
    return cssClasses;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// ghrXNdMSOHlQBk5xOFxlfg==
