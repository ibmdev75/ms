// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:16 CET 2015
   
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
public abstract class AbstractCollection extends com.jalios.jcms.portlet.PortletCollection 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public AbstractCollection() {}
 
 
 
  
  
  
  public AbstractCollection(AbstractCollection other) {
    super(other);
    children = other.children;
    childrenBindings = other.childrenBindings;
    description = other.description;
    descriptionML = other.descriptionML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    displayCSS = other.displayCSS;
    width = other.width;
    insetLeft = other.insetLeft;
    insetRight = other.insetRight;
    insetTop = other.insetTop;
    insetBottom = other.insetBottom;
    cellPadding = other.cellPadding;
    alignH = other.alignH;
    alignV = other.alignV;
    alignTable = other.alignTable;
    border = other.border;
    borderColor = other.borderColor;
    backColor = other.backColor;
    backImage = other.backImage;
    behaviorCopy = other.behaviorCopy;
    originalPortlet = other.originalPortlet;
    condition = other.condition;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setChildrenBindings(ImportUtil.parseFieldTextArray(elt, "childrenBindings"));
    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setDisplayCSS(ImportUtil.parseFieldText(elt, "displayCSS"));
    setWidth(ImportUtil.parseFieldText(elt, "width"));
    setInsetLeft(ImportUtil.parseFieldInt(elt, "insetLeft"));
    setInsetRight(ImportUtil.parseFieldInt(elt, "insetRight"));
    setInsetTop(ImportUtil.parseFieldInt(elt, "insetTop"));
    setInsetBottom(ImportUtil.parseFieldInt(elt, "insetBottom"));
    setCellPadding(ImportUtil.parseFieldInt(elt, "cellPadding"));
    setAlignH(ImportUtil.parseFieldText(elt, "alignH"));
    setAlignV(ImportUtil.parseFieldText(elt, "alignV"));
    setAlignTable(ImportUtil.parseFieldText(elt, "alignTable"));
    setBorder(ImportUtil.parseFieldInt(elt, "border"));
    setBorderColor(ImportUtil.parseFieldText(elt, "borderColor"));
    setBackColor(ImportUtil.parseFieldText(elt, "backColor"));
    setBackImage(ImportUtil.parseFieldText(elt, "backImage"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCondition(ImportUtil.parseFieldTextArray(elt, "condition"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setChildren(ImportUtil.parseSelfFieldDataArray(elt, "children", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
      setOriginalPortlet(ImportUtil.parseSelfFieldData(elt, "originalPortlet", com.jalios.jcms.portlet.PortalElement.class));
    } else {
    
    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "children", getChildren()));
    sb.append(ExportUtil.exportField(indentLevel, "childrenBindings", getChildrenBindings(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "displayCSS", getDisplayCSS(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "width", getWidth(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "insetLeft", getInsetLeft()));
    sb.append(ExportUtil.exportField(indentLevel, "insetRight", getInsetRight()));
    sb.append(ExportUtil.exportField(indentLevel, "insetTop", getInsetTop()));
    sb.append(ExportUtil.exportField(indentLevel, "insetBottom", getInsetBottom()));
    sb.append(ExportUtil.exportField(indentLevel, "cellPadding", getCellPadding()));
    sb.append(ExportUtil.exportField(indentLevel, "alignH", getAlignH(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignV", getAlignV(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignTable", getAlignTable(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "border", getBorder()));
    sb.append(ExportUtil.exportField(indentLevel, "borderColor", getBorderColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backColor", getBackColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backImage", getBackImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "originalPortlet", getOriginalPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "condition", getCondition(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    JcmsUtil.addFileDocument(docSet, backImage);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>AbstractCollection</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(AbstractCollection.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractCollection</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractCollection</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractCollection</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(AbstractCollection.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractCollection</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractCollection</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractCollection</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(AbstractCollection.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("insetLeft".equals(fieldName)) { return getInsetLeft(); }
    if ("insetRight".equals(fieldName)) { return getInsetRight(); }
    if ("insetTop".equals(fieldName)) { return getInsetTop(); }
    if ("insetBottom".equals(fieldName)) { return getInsetBottom(); }
    if ("cellPadding".equals(fieldName)) { return getCellPadding(); }
    if ("border".equals(fieldName)) { return getBorder(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("insetLeft".equals(fieldName)) { setInsetLeft(value); return; }
    if ("insetRight".equals(fieldName)) { setInsetRight(value); return; }
    if ("insetTop".equals(fieldName)) { setInsetTop(value); return; }
    if ("insetBottom".equals(fieldName)) { setInsetBottom(value); return; }
    if ("cellPadding".equals(fieldName)) { setCellPadding(value); return; }
    if ("border".equals(fieldName)) { setBorder(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { setInvalidTime(value); return; }
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>AbstractCollection</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>AbstractCollection</code>. <br>
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
    if ("children".equals(fieldName)) { return getChildren(); }
    if ("childrenBindings".equals(fieldName)) { return getChildrenBindings(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("displayCSS".equals(fieldName)) { return getDisplayCSS(); }
    if ("width".equals(fieldName)) { return getWidth(); }
    if ("alignH".equals(fieldName)) { return getAlignH(); }
    if ("alignV".equals(fieldName)) { return getAlignV(); }
    if ("alignTable".equals(fieldName)) { return getAlignTable(); }
    if ("borderColor".equals(fieldName)) { return getBorderColor(); }
    if ("backColor".equals(fieldName)) { return getBackColor(); }
    if ("backImage".equals(fieldName)) { return getBackImage(); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("originalPortlet".equals(fieldName)) { return getOriginalPortlet(); }
    if ("condition".equals(fieldName)) { return getCondition(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>AbstractCollection</code>. <br>
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
    if ("children".equals(fieldName)) { setChildren((com.jalios.jcms.portlet.PortalElement[])value); return; }
    if ("childrenBindings".equals(fieldName)) { setChildrenBindings((String[])value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("displayCSS".equals(fieldName)) { setDisplayCSS((String)value); return; }
    if ("width".equals(fieldName)) { setWidth((String)value); return; }
    if ("alignH".equals(fieldName)) { setAlignH((String)value); return; }
    if ("alignV".equals(fieldName)) { setAlignV((String)value); return; }
    if ("alignTable".equals(fieldName)) { setAlignTable((String)value); return; }
    if ("borderColor".equals(fieldName)) { setBorderColor((String)value); return; }
    if ("backColor".equals(fieldName)) { setBackColor((String)value); return; }
    if ("backImage".equals(fieldName)) { setBackImage((String)value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("originalPortlet".equals(fieldName)) { setOriginalPortlet((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("condition".equals(fieldName)) { setCondition((String[])value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // children
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.portlet.PortalElement[] children;
  public com.jalios.jcms.portlet.PortalElement[] getChildren() { return children; }
  public void setChildren(com.jalios.jcms.portlet.PortalElement[] v) { children = v; }
  
  
  // ----------------------------------------------------------------------
  // childrenBindings
  // ----------------------------------------------------------------------  
  protected  String[] childrenBindings;
  public String[] getChildrenBindings() { return childrenBindings; }
  public void setChildrenBindings(String[] v) { childrenBindings = v; }
  
  
  public String[] getChildrenBindings(String lang) { return childrenBindings; }
  public String[] getChildrenBindings(String lang, boolean useDefault) { return childrenBindings; }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected  String description = channel.getTypeFieldEntry(AbstractCollection.class, "description", true).getDefaultTextString();
  public String getDescription() { return description; }
  public void setDescription(String v) { description = v; }
  
  
  protected HashMap descriptionML = channel.getTypeFieldEntry(AbstractCollection.class, "description", true).getDefaultTextMap();
  public String getDescription(String lang) { return (String)channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  public String getDescription(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  public HashMap getDescriptionML() { return descriptionML; }
  public void setDescriptionML(HashMap v) { descriptionML = v; }
  /**
   * Convenient method to set the value of the Description field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setDescription(String)} or {@link #setDescriptionML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setDescription(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      description = value;
      return;
    }
    if (descriptionML == null) {
      descriptionML = new HashMap();
    } else if (this != channel.getData(id)) {
      descriptionML = new HashMap<String,String>(descriptionML);
    }
    descriptionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // portletImage
  // ----------------------------------------------------------------------  
  protected  String portletImage = channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true).getDefaultTextString();
  public String getPortletImage() { return portletImage; }
  public void setPortletImage(String v) { portletImage = v; }
  
  
  protected HashMap portletImageML = channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true).getDefaultTextMap();
  public String getPortletImage(String lang) { return (String)channel.getLangValue(lang, true, portletImage, portletImageML, getMainLanguage()); }
  public String getPortletImage(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, portletImage, portletImageML, getMainLanguage()); }
  public HashMap getPortletImageML() { return portletImageML; }
  public void setPortletImageML(HashMap v) { portletImageML = v; }
  /**
   * Convenient method to set the value of the PortletImage field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setPortletImage(String)} or {@link #setPortletImageML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setPortletImage(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      portletImage = value;
      return;
    }
    if (portletImageML == null) {
      portletImageML = new HashMap();
    } else if (this != channel.getData(id)) {
      portletImageML = new HashMap<String,String>(portletImageML);
    }
    portletImageML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------  
  protected  String cacheType = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getDefaultTextString();
  public String getCacheType() { return cacheType; }
  public void setCacheType(String v) { cacheType = v; }
  
  
  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  public static String[] cacheTypeValues = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getEnumerateValues();  
  public static String[] cacheTypeLabels = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getEnumerateLabels();
  public static HashMap<String, String[]> cacheTypeLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getEnumerateLabelsMap();
  
  public static String[] getCacheTypeValues() {
    return cacheTypeValues;
  }
  public static String[] getCacheTypeLabels(String userLang) {
    String[] labels = (String[])cacheTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])cacheTypeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheTypeLabel(String value, String userLang) {
    String[] labels = getCacheTypeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Server")) {
      i = 1;
    }
    else if (value.equals("Groups")) {
      i = 2;
    }
    else if (value.equals("Members")) {
      i = 3;
    }
    else if (value.equals("Session")) {
      i = 4;
    }
    else if (value.equals("SessionAndVisitors")) {
      i = 5;
    }
    else if (value.equals("VisitorsOnly")) {
      i = 6;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])cacheTypeLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getCacheTypeLabel(String value) {    
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheTypeLabels[0];
    }
    else if (value.equals("Server")) {
      return cacheTypeLabels[1];
    }
    else if (value.equals("Groups")) {
      return cacheTypeLabels[2];
    }
    else if (value.equals("Members")) {
      return cacheTypeLabels[3];
    }
    else if (value.equals("Session")) {
      return cacheTypeLabels[4];
    }
    else if (value.equals("SessionAndVisitors")) {
      return cacheTypeLabels[5];
    }
    else if (value.equals("VisitorsOnly")) {
      return cacheTypeLabels[6];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheTypeReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getCacheType());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // cacheSensibility
  // ----------------------------------------------------------------------  
  protected  String cacheSensibility = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getDefaultTextString();
  public String getCacheSensibility() { return cacheSensibility; }
  public void setCacheSensibility(String v) { cacheSensibility = v; }
  
  
  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  public static String[] cacheSensibilityValues = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getEnumerateValues();  
  public static String[] cacheSensibilityLabels = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getEnumerateLabels();
  public static HashMap<String, String[]> cacheSensibilityLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getEnumerateLabelsMap();
  
  public static String[] getCacheSensibilityValues() {
    return cacheSensibilityValues;
  }
  public static String[] getCacheSensibilityLabels(String userLang) {
    String[] labels = (String[])cacheSensibilityLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])cacheSensibilityLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheSensibilityLabel(String value, String userLang) {
    String[] labels = getCacheSensibilityLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Portal")) {
      i = 1;
    }
    else if (value.equals("Current")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])cacheSensibilityLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getCacheSensibilityLabel(String value) {    
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheSensibilityLabels[0];
    }
    else if (value.equals("Portal")) {
      return cacheSensibilityLabels[1];
    }
    else if (value.equals("Current")) {
      return cacheSensibilityLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheSensibilityReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getCacheSensibility());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // invalidClass
  // ----------------------------------------------------------------------  
  protected  String[] invalidClass;
  public String[] getInvalidClass() { return invalidClass; }
  public void setInvalidClass(String[] v) { invalidClass = v; }
  
  
  public String[] getInvalidClass(String lang) { return invalidClass; }
  public String[] getInvalidClass(String lang, boolean useDefault) { return invalidClass; }
  public static String[] invalidClassValues = channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true).getEnumerateValues();  
  public static String[] invalidClassLabels = channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true).getEnumerateLabels();
  public static HashMap<String, String[]> invalidClassLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true).getEnumerateLabelsMap();
  
  public static String[] getInvalidClassValues() {
    return invalidClassValues;
  }
  public static String[] getInvalidClassLabels(String userLang) {
    String[] labels = (String[])invalidClassLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])invalidClassLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getInvalidClassLabel(String value, String userLang) {
    String[] labels = getInvalidClassLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Data")) {
      i = 0;
    }
    else if (value.equals("Publication")) {
      i = 1;
    }
    else if (value.equals("Content")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])invalidClassLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getInvalidClassLabel(String value) {    
    if (false) {
    }
    else if (value.equals("Data")) {
      return invalidClassLabels[0];
    }
    else if (value.equals("Publication")) {
      return invalidClassLabels[1];
    }
    else if (value.equals("Content")) {
      return invalidClassLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getInvalidClassReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null || obj.getInvalidClass() == null) {
        continue;
      }
      for(int i = 0; i < obj.getInvalidClass().length; i++) {
        if (obj.getInvalidClass()[i] != null) {
          map.inc(obj.getInvalidClass()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------  
  protected  long invalidTime = 60;
  public long getInvalidTime() { return invalidTime; }
  public void setInvalidTime(long v) { invalidTime = v; }
  
  
  // ----------------------------------------------------------------------
  // displayCSS
  // ----------------------------------------------------------------------  
  protected  String displayCSS = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getDefaultTextString();
  public String getDisplayCSS() { return displayCSS; }
  public void setDisplayCSS(String v) { displayCSS = v; }
  
  
  public String getDisplayCSS(String lang) { return displayCSS; }
  public String getDisplayCSS(String lang, boolean useDefault) { return displayCSS; }
  public static String[] displayCSSValues = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getEnumerateValues();  
  public static String[] displayCSSLabels = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getEnumerateLabels();
  public static HashMap<String, String[]> displayCSSLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getEnumerateLabelsMap();
  
  public static String[] getDisplayCSSValues() {
    return displayCSSValues;
  }
  public static String[] getDisplayCSSLabels(String userLang) {
    String[] labels = (String[])displayCSSLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])displayCSSLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getDisplayCSSLabel(String value, String userLang) {
    String[] labels = getDisplayCSSLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("value1")) {
      i = 0;
    }
    else if (value.equals("value2")) {
      i = 1;
    }
    else if (value.equals("value3")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])displayCSSLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getDisplayCSSLabel(String value) {    
    if (false) {
    }
    else if (value.equals("value1")) {
      return displayCSSLabels[0];
    }
    else if (value.equals("value2")) {
      return displayCSSLabels[1];
    }
    else if (value.equals("value3")) {
      return displayCSSLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getDisplayCSSReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayCSS());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // width
  // ----------------------------------------------------------------------  
  protected  String width = channel.getTypeFieldEntry(AbstractCollection.class, "width", true).getDefaultTextString();
  public String getWidth() { return width; }
  public void setWidth(String v) { width = v; }
  
  
  public String getWidth(String lang) { return width; }
  public String getWidth(String lang, boolean useDefault) { return width; }
  // ----------------------------------------------------------------------
  // insetLeft
  // ----------------------------------------------------------------------  
  protected  int insetLeft = 0;
  public int getInsetLeft() { return insetLeft; }
  public void setInsetLeft(int v) { insetLeft = v; }
  
  
  public static IntegerFormReport getInsetLeftReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetLeft();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // insetRight
  // ----------------------------------------------------------------------  
  protected  int insetRight = 0;
  public int getInsetRight() { return insetRight; }
  public void setInsetRight(int v) { insetRight = v; }
  
  
  public static IntegerFormReport getInsetRightReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetRight();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // insetTop
  // ----------------------------------------------------------------------  
  protected  int insetTop = 0;
  public int getInsetTop() { return insetTop; }
  public void setInsetTop(int v) { insetTop = v; }
  
  
  public static IntegerFormReport getInsetTopReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetTop();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // insetBottom
  // ----------------------------------------------------------------------  
  protected  int insetBottom = 0;
  public int getInsetBottom() { return insetBottom; }
  public void setInsetBottom(int v) { insetBottom = v; }
  
  
  public static IntegerFormReport getInsetBottomReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetBottom();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // cellPadding
  // ----------------------------------------------------------------------  
  protected  int cellPadding = 0;
  public int getCellPadding() { return cellPadding; }
  public void setCellPadding(int v) { cellPadding = v; }
  
  
  public static IntegerFormReport getCellPaddingReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getCellPadding();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // alignH
  // ----------------------------------------------------------------------  
  protected  String alignH = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getDefaultTextString();
  public String getAlignH() { return alignH; }
  public void setAlignH(String v) { alignH = v; }
  
  
  public String getAlignH(String lang) { return alignH; }
  public String getAlignH(String lang, boolean useDefault) { return alignH; }
  public static String[] alignHValues = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getEnumerateValues();  
  public static String[] alignHLabels = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getEnumerateLabels();
  public static HashMap<String, String[]> alignHLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getEnumerateLabelsMap();
  
  public static String[] getAlignHValues() {
    return alignHValues;
  }
  public static String[] getAlignHLabels(String userLang) {
    String[] labels = (String[])alignHLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])alignHLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignHLabel(String value, String userLang) {
    String[] labels = getAlignHLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("center")) {
      i = 0;
    }
    else if (value.equals("left")) {
      i = 1;
    }
    else if (value.equals("right")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])alignHLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getAlignHLabel(String value) {    
    if (false) {
    }
    else if (value.equals("center")) {
      return alignHLabels[0];
    }
    else if (value.equals("left")) {
      return alignHLabels[1];
    }
    else if (value.equals("right")) {
      return alignHLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignHReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getAlignH());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // alignV
  // ----------------------------------------------------------------------  
  protected  String alignV = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getDefaultTextString();
  public String getAlignV() { return alignV; }
  public void setAlignV(String v) { alignV = v; }
  
  
  public String getAlignV(String lang) { return alignV; }
  public String getAlignV(String lang, boolean useDefault) { return alignV; }
  public static String[] alignVValues = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getEnumerateValues();  
  public static String[] alignVLabels = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getEnumerateLabels();
  public static HashMap<String, String[]> alignVLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getEnumerateLabelsMap();
  
  public static String[] getAlignVValues() {
    return alignVValues;
  }
  public static String[] getAlignVLabels(String userLang) {
    String[] labels = (String[])alignVLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])alignVLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignVLabel(String value, String userLang) {
    String[] labels = getAlignVLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("middle")) {
      i = 0;
    }
    else if (value.equals("top")) {
      i = 1;
    }
    else if (value.equals("bottom")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])alignVLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getAlignVLabel(String value) {    
    if (false) {
    }
    else if (value.equals("middle")) {
      return alignVLabels[0];
    }
    else if (value.equals("top")) {
      return alignVLabels[1];
    }
    else if (value.equals("bottom")) {
      return alignVLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignVReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getAlignV());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // alignTable
  // ----------------------------------------------------------------------  
  protected  String alignTable = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getDefaultTextString();
  public String getAlignTable() { return alignTable; }
  public void setAlignTable(String v) { alignTable = v; }
  
  
  public String getAlignTable(String lang) { return alignTable; }
  public String getAlignTable(String lang, boolean useDefault) { return alignTable; }
  public static String[] alignTableValues = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getEnumerateValues();  
  public static String[] alignTableLabels = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getEnumerateLabels();
  public static HashMap<String, String[]> alignTableLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getEnumerateLabelsMap();
  
  public static String[] getAlignTableValues() {
    return alignTableValues;
  }
  public static String[] getAlignTableLabels(String userLang) {
    String[] labels = (String[])alignTableLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])alignTableLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignTableLabel(String value, String userLang) {
    String[] labels = getAlignTableLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("center")) {
      i = 1;
    }
    else if (value.equals("left")) {
      i = 2;
    }
    else if (value.equals("right")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])alignTableLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getAlignTableLabel(String value) {    
    if (false) {
    }
    else if (value.equals("")) {
      return alignTableLabels[0];
    }
    else if (value.equals("center")) {
      return alignTableLabels[1];
    }
    else if (value.equals("left")) {
      return alignTableLabels[2];
    }
    else if (value.equals("right")) {
      return alignTableLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignTableReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getAlignTable());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // border
  // ----------------------------------------------------------------------  
  protected  int border = 0;
  public int getBorder() { return border; }
  public void setBorder(int v) { border = v; }
  
  
  public static IntegerFormReport getBorderReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getBorder();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // borderColor
  // ----------------------------------------------------------------------  
  protected  String borderColor = channel.getTypeFieldEntry(AbstractCollection.class, "borderColor", true).getDefaultTextString();
  public String getBorderColor() { return borderColor; }
  public void setBorderColor(String v) { borderColor = v; }
  
  
  public String getBorderColor(String lang) { return borderColor; }
  public String getBorderColor(String lang, boolean useDefault) { return borderColor; }
  // ----------------------------------------------------------------------
  // backColor
  // ----------------------------------------------------------------------  
  protected  String backColor = channel.getTypeFieldEntry(AbstractCollection.class, "backColor", true).getDefaultTextString();
  public String getBackColor() { return backColor; }
  public void setBackColor(String v) { backColor = v; }
  
  
  public String getBackColor(String lang) { return backColor; }
  public String getBackColor(String lang, boolean useDefault) { return backColor; }
  // ----------------------------------------------------------------------
  // backImage
  // ----------------------------------------------------------------------  
  protected  String backImage = channel.getTypeFieldEntry(AbstractCollection.class, "backImage", true).getDefaultTextString();
  public String getBackImage() { return backImage; }
  public void setBackImage(String v) { backImage = v; }
  
  
  public String getBackImage(String lang) { return backImage; }
  public String getBackImage(String lang, boolean useDefault) { return backImage; }
  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected  String behaviorCopy = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getDefaultTextString();
  public String getBehaviorCopy() { return behaviorCopy; }
  public void setBehaviorCopy(String v) { behaviorCopy = v; }
  
  
  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  public static String[] behaviorCopyValues = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getEnumerateValues();  
  public static String[] behaviorCopyLabels = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getEnumerateLabels();
  public static HashMap<String, String[]> behaviorCopyLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getEnumerateLabelsMap();
  
  public static String[] getBehaviorCopyValues() {
    return behaviorCopyValues;
  }
  public static String[] getBehaviorCopyLabels(String userLang) {
    String[] labels = (String[])behaviorCopyLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])behaviorCopyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getBehaviorCopyLabel(String value, String userLang) {
    String[] labels = getBehaviorCopyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("true")) {
      i = 0;
    }
    else if (value.equals("false")) {
      i = 1;
    }
    else if (value.equals("ws")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])behaviorCopyLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getBehaviorCopyLabel(String value) {    
    if (false) {
    }
    else if (value.equals("true")) {
      return behaviorCopyLabels[0];
    }
    else if (value.equals("false")) {
      return behaviorCopyLabels[1];
    }
    else if (value.equals("ws")) {
      return behaviorCopyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getBehaviorCopyReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getBehaviorCopy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // originalPortlet
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.portlet.PortalElement originalPortlet;
  public com.jalios.jcms.portlet.PortalElement getOriginalPortlet() { return originalPortlet; }
  public void setOriginalPortlet(com.jalios.jcms.portlet.PortalElement v) { originalPortlet = v; }
  
  
  // ----------------------------------------------------------------------
  // condition
  // ----------------------------------------------------------------------  
  protected  String[] condition;
  public String[] getCondition() { return condition; }
  public void setCondition(String[] v) { condition = v; }
  
  
  public String[] getCondition(String lang) { return condition; }
  public String[] getCondition(String lang, boolean useDefault) { return condition; }
  public static String[] conditionValues = channel.getTypeFieldEntry(AbstractCollection.class, "condition", true).getEnumerateValues();  
  public static String[] conditionLabels = channel.getTypeFieldEntry(AbstractCollection.class, "condition", true).getEnumerateLabels();
  public static HashMap<String, String[]> conditionLabelMap = channel.getTypeFieldEntry(AbstractCollection.class, "condition", true).getEnumerateLabelsMap();
  
  public static String[] getConditionValues() {
    return conditionValues;
  }
  public static String[] getConditionLabels(String userLang) {
    String[] labels = (String[])conditionLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])conditionLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getConditionLabel(String value, String userLang) {
    String[] labels = getConditionLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("isLogged")) {
      i = 1;
    }
    else if (value.equals("notLogged")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])conditionLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getConditionLabel(String value) {    
    if (false) {
    }
    else if (value.equals("None")) {
      return conditionLabels[0];
    }
    else if (value.equals("isLogged")) {
      return conditionLabels[1];
    }
    else if (value.equals("notLogged")) {
      return conditionLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getConditionReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractCollection obj = (AbstractCollection)it.next();
      if (obj == null || obj.getCondition() == null) {
        continue;
      }
      for(int i = 0; i < obj.getCondition().length; i++) {
        if (obj.getCondition()[i] != null) {
          map.inc(obj.getCondition()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------  
  protected  String cssId = channel.getTypeFieldEntry(AbstractCollection.class, "cssId", true).getDefaultTextString();
  public String getCssId() { return cssId; }
  public void setCssId(String v) { cssId = v; }
  
  
  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------  
  protected  String cssClasses = channel.getTypeFieldEntry(AbstractCollection.class, "cssClasses", true).getDefaultTextString();
  public String getCssClasses() { return cssClasses; }
  public void setCssClasses(String v) { cssClasses = v; }
  
  
  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setDescription(lang, value); }
  @Override
  public String getAbstract() { return description; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDescription(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getDescriptionML(); }
   
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
    sb.ensureCapacity(500 * (0 + 3 + 0 + 0) );
    if (description != null) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for(Iterator it = descriptionML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    if (portletImage != null) {
      sb.append(portletImage); sb.append(' '); 
    }
    if (portletImageML != null) {
      for(Iterator it = portletImageML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0) );
    if (description != null) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for(Iterator it = descriptionML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
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
    JcmsUtil.addData(set, clazz, getChildren());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  static Pattern _widthPattern;
  static {
    try {
      _widthPattern = (new Perl5Compiler()).compile("[\\d]+(pt|pc|in|mm|cm|px|em|ex|%)*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }
  
  public boolean checkPatternWidth() {
    if (Util.notEmpty(width) && !(new Perl5Matcher()).matches(width, _widthPattern)) {
      return false; 
    }
    return true;
  }
  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (!checkPatternWidth()) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-field-format", channel.getTypeFieldLabel(this, "width"), "[\\d]+(pt|pc|in|mm|cm|px|em|ex|%)*");
      return status;
    }
    if (insetLeft < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetLeft"), "0");
      return status;      
    }
    if (insetLeft > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetLeft"), "1000");
      return status;      
    }
    if (insetRight < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetRight"), "0");
      return status;      
    }
    if (insetRight > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetRight"), "1000");
      return status;      
    }
    if (insetTop < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetTop"), "0");
      return status;      
    }
    if (insetTop > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetTop"), "1000");
      return status;      
    }
    if (insetBottom < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetBottom"), "0");
      return status;      
    }
    if (insetBottom > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetBottom"), "1000");
      return status;      
    }
    if (cellPadding < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "cellPadding"), "0");
      return status;      
    }
    if (cellPadding > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "cellPadding"), "1000");
      return status;      
    }
    if (border < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "border"), "0");
      return status;      
    }
    if (border > 100 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "border"), "100");
      return status;      
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    AbstractCollection copy = (AbstractCollection)super.prepareMergeCopy();
    AbstractCollection main = (AbstractCollection)mainInstance;
    JcmsUtil.mergeMLMap(copy.getDescriptionML(), main.getDescriptionML());
    JcmsUtil.mergeMLMap(copy.getPortletImageML(), main.getPortletImageML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// qIAwYSZB+qBYlwIdWFCubg==
