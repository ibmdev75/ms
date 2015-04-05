// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:52 CET 2015
   
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
public abstract class AbstractPortal extends com.jalios.jcms.portlet.Portal 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public AbstractPortal() {}
 
 
 
  
  
  
  public AbstractPortal(AbstractPortal other) {
    super(other);
    pageTitle = other.pageTitle;
    pageTitleML = other.pageTitleML;
    child = other.child;
    cssFile = other.cssFile;
    description = other.description;
    descriptionML = other.descriptionML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    behaviorCopy = other.behaviorCopy;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
    exactCategory = other.exactCategory;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setPageTitle(ImportUtil.parseFieldText(elt, "pageTitle"));
    setPageTitleML(ImportUtil.parseFieldTextML(elt, "pageTitleML"));
    setCssFile(ImportUtil.parseFieldText(elt, "cssFile"));
    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
    setExactCategory(ImportUtil.parseFieldBoolean(elt, "exactCategory"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setChild(ImportUtil.parseSelfFieldData(elt, "child", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
    } else {
    
    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "pageTitle", getPageTitle(), "pageTitleML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pageTitleML", getPageTitleML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "child", getChild()));
    sb.append(ExportUtil.exportField(indentLevel, "cssFile", getCssFile(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "exactCategory", getExactCategory()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>AbstractPortal</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(AbstractPortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractPortal</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractPortal</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractPortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(AbstractPortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractPortal</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractPortal</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractPortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(AbstractPortal.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>AbstractPortal</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { return getExactCategory(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { setExactCategory(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>AbstractPortal</code>. <br>
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
    if ("pageTitle".equals(fieldName)) { return getPageTitle(lang, useDefault); }
    if ("child".equals(fieldName)) { return getChild(); }
    if ("cssFile".equals(fieldName)) { return getCssFile(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>AbstractPortal</code>. <br>
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
    if ("pageTitle".equals(fieldName)) { setPageTitle(lang,(String)value); return; }
    if ("child".equals(fieldName)) { setChild((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("cssFile".equals(fieldName)) { setCssFile((String)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------  
  protected  String pageTitle = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextString();
  public String getPageTitle() { return pageTitle; }
  public void setPageTitle(String v) { pageTitle = v; }
  
  
  protected HashMap pageTitleML = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextMap();
  public String getPageTitle(String lang) { return (String)channel.getLangValue(lang, true, pageTitle, pageTitleML, getMainLanguage()); }
  public String getPageTitle(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, pageTitle, pageTitleML, getMainLanguage()); }
  public HashMap getPageTitleML() { return pageTitleML; }
  public void setPageTitleML(HashMap v) { pageTitleML = v; }
  /**
   * Convenient method to set the value of the PageTitle field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setPageTitle(String)} or {@link #setPageTitleML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setPageTitle(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      pageTitle = value;
      return;
    }
    if (pageTitleML == null) {
      pageTitleML = new HashMap();
    } else if (this != channel.getData(id)) {
      pageTitleML = new HashMap<String,String>(pageTitleML);
    }
    pageTitleML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // child
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.portlet.PortalElement child;
  public com.jalios.jcms.portlet.PortalElement getChild() { return child; }
  public void setChild(com.jalios.jcms.portlet.PortalElement v) { child = v; }
  
  
  // ----------------------------------------------------------------------
  // cssFile
  // ----------------------------------------------------------------------  
  protected  String cssFile = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getDefaultTextString();
  public String getCssFile() { return cssFile; }
  public void setCssFile(String v) { cssFile = v; }
  
  
  public String getCssFile(String lang) { return cssFile; }
  public String getCssFile(String lang, boolean useDefault) { return cssFile; }
  public static String[] cssFileValues = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getEnumerateValues();  
  public static String[] cssFileLabels = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getEnumerateLabels();
  public static HashMap<String, String[]> cssFileLabelMap = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getEnumerateLabelsMap();
  
  public static String[] getCssFileValues() {
    return cssFileValues;
  }
  public static String[] getCssFileLabels(String userLang) {
    String[] labels = (String[])cssFileLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])cssFileLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCssFileLabel(String value, String userLang) {
    String[] labels = getCssFileLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Default")) {
      i = 0;
    }
    else if (value.equals("Custom")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])cssFileLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getCssFileLabel(String value) {    
    if (false) {
    }
    else if (value.equals("Default")) {
      return cssFileLabels[0];
    }
    else if (value.equals("Custom")) {
      return cssFileLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getCssFileReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortal obj = (AbstractPortal)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getCssFile());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected  String description = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextString();
  public String getDescription() { return description; }
  public void setDescription(String v) { description = v; }
  
  
  protected HashMap descriptionML = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextMap();
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
  protected  String portletImage = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextString();
  public String getPortletImage() { return portletImage; }
  public void setPortletImage(String v) { portletImage = v; }
  
  
  protected HashMap portletImageML = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextMap();
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
  protected  String cacheType = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getDefaultTextString();
  public String getCacheType() { return cacheType; }
  public void setCacheType(String v) { cacheType = v; }
  
  
  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  public static String[] cacheTypeValues = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getEnumerateValues();  
  public static String[] cacheTypeLabels = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getEnumerateLabels();
  public static HashMap<String, String[]> cacheTypeLabelMap = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getEnumerateLabelsMap();
  
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
      AbstractPortal obj = (AbstractPortal)it.next();
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
  protected  String cacheSensibility = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getDefaultTextString();
  public String getCacheSensibility() { return cacheSensibility; }
  public void setCacheSensibility(String v) { cacheSensibility = v; }
  
  
  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  public static String[] cacheSensibilityValues = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getEnumerateValues();  
  public static String[] cacheSensibilityLabels = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getEnumerateLabels();
  public static HashMap<String, String[]> cacheSensibilityLabelMap = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getEnumerateLabelsMap();
  
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
      AbstractPortal obj = (AbstractPortal)it.next();
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
  public static String[] invalidClassValues = channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true).getEnumerateValues();  
  public static String[] invalidClassLabels = channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true).getEnumerateLabels();
  public static HashMap<String, String[]> invalidClassLabelMap = channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true).getEnumerateLabelsMap();
  
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
      AbstractPortal obj = (AbstractPortal)it.next();
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
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected  String behaviorCopy = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getDefaultTextString();
  public String getBehaviorCopy() { return behaviorCopy; }
  public void setBehaviorCopy(String v) { behaviorCopy = v; }
  
  
  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  public static String[] behaviorCopyValues = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getEnumerateValues();  
  public static String[] behaviorCopyLabels = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getEnumerateLabels();
  public static HashMap<String, String[]> behaviorCopyLabelMap = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getEnumerateLabelsMap();
  
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
      AbstractPortal obj = (AbstractPortal)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getBehaviorCopy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------  
  protected  String cssId = channel.getTypeFieldEntry(AbstractPortal.class, "cssId", true).getDefaultTextString();
  public String getCssId() { return cssId; }
  public void setCssId(String v) { cssId = v; }
  
  
  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------  
  protected  String cssClasses = channel.getTypeFieldEntry(AbstractPortal.class, "cssClasses", true).getDefaultTextString();
  public String getCssClasses() { return cssClasses; }
  public void setCssClasses(String v) { cssClasses = v; }
  
  
  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------  
  protected  boolean exactCategory = false;
  public boolean getExactCategory() { return exactCategory; }
  public void setExactCategory(boolean v) { exactCategory = v; }
  
  
  public String getExactCategoryLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "exactCategory", true);
    return exactCategory ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getExactCategoryValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getExactCategoryLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(AbstractPortal.class, "exactCategory", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getExactCategoryReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortal obj = (AbstractPortal)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getExactCategory());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
   
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
    sb.ensureCapacity(500 * (0 + 4 + 0 + 0) );
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
    if (pageTitle != null) {
      sb.append(pageTitle); sb.append(' '); 
    }
    if (pageTitleML != null) {
      for(Iterator it = pageTitleML.values().iterator(); it.hasNext();) {
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
    JcmsUtil.addData(set, clazz, getChild());
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
    AbstractPortal copy = (AbstractPortal)super.prepareMergeCopy();
    AbstractPortal main = (AbstractPortal)mainInstance;
    JcmsUtil.mergeMLMap(copy.getPageTitleML(), main.getPageTitleML());
    JcmsUtil.mergeMLMap(copy.getDescriptionML(), main.getDescriptionML());
    JcmsUtil.mergeMLMap(copy.getPortletImageML(), main.getPortletImageML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// EagxK2Jjt+b5keoLthaY1A==
