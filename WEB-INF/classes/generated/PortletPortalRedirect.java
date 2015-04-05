// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:05 CET 2015
   
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
public  class PortletPortalRedirect extends com.jalios.jcms.portlet.PortalRedirect 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletPortalRedirect() {}
 
 
 
  
  
  
  public PortletPortalRedirect(PortletPortalRedirect other) {
    super(other);
    status = other.status;
    content = other.content;
    contentDBID = other.contentDBID;
    redirectForm = other.redirectForm;
    url = other.url;
    redirectPortlet = other.redirectPortlet;
    category = other.category;
    dispPortal = other.dispPortal;
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
    
    setStatus(ImportUtil.parseFieldText(elt, "status"));
    setRedirectForm(ImportUtil.parseFieldText(elt, "redirectForm"));
    setUrl(ImportUtil.parseFieldText(elt, "url"));
    setCategory(ImportUtil.parseFieldText(elt, "category"));
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
      setContent(ImportUtil.parseSelfFieldData(elt, "content", com.jalios.jcms.Content.class));
      setRedirectPortlet(ImportUtil.parseSelfFieldData(elt, "redirectPortlet", com.jalios.jcms.portlet.PortalElement.class));
      setDispPortal(ImportUtil.parseSelfFieldData(elt, "dispPortal", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
    } else {
    
    setContent((com.jalios.jcms.Content)ImportUtil.parseFieldData(elt, "content"));
    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "status", getStatus(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "content", getContent()));
    sb.append(ExportUtil.exportField(indentLevel, "redirectForm", getRedirectForm(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "url", getUrl(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "redirectPortlet", getRedirectPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "category", getCategory(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "dispPortal", getDispPortal()));
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
   * Returns the TypeEntry bound to <code>PortletPortalRedirect</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletPortalRedirect.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPortalRedirect</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPortalRedirect</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPortalRedirect</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletPortalRedirect.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPortalRedirect</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPortalRedirect</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPortalRedirect</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletPortalRedirect.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletPortalRedirect</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { return getExactCategory(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletPortalRedirect</code>.
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
    if ("navCategories".equals(fieldName)) { return getNavCategories(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletPortalRedirect</code>. <br>
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
    if ("status".equals(fieldName)) { return getStatus(); }
    if ("content".equals(fieldName)) { return getContent(); }
    if ("redirectForm".equals(fieldName)) { return getRedirectForm(); }
    if ("url".equals(fieldName)) { return getUrl(); }
    if ("redirectPortlet".equals(fieldName)) { return getRedirectPortlet(); }
    if ("category".equals(fieldName)) { return getCategory(); }
    if ("dispPortal".equals(fieldName)) { return getDispPortal(); }
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
   * Sets the <code>Object</code> value of the given field name for this <code>PortletPortalRedirect</code>. <br>
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
    if ("status".equals(fieldName)) { setStatus((String)value); return; }
    if ("content".equals(fieldName)) { setContent((com.jalios.jcms.Content)value); return; }
    if ("redirectForm".equals(fieldName)) { setRedirectForm((String)value); return; }
    if ("url".equals(fieldName)) { setUrl((String)value); return; }
    if ("redirectPortlet".equals(fieldName)) { setRedirectPortlet((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("category".equals(fieldName)) { setCategory((String)value); return; }
    if ("dispPortal".equals(fieldName)) { setDispPortal((com.jalios.jcms.portlet.PortalElement)value); return; }
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
  // status
  // ----------------------------------------------------------------------  
  protected  String status = channel.getTypeFieldEntry(PortletPortalRedirect.class, "status", true).getDefaultTextString();
  public String getStatus() { return status; }
  public void setStatus(String v) { status = v; }
  
  
  public String getStatus(String lang) { return status; }
  public String getStatus(String lang, boolean useDefault) { return status; }
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.Content content;
  public com.jalios.jcms.Content getContent() { 
    return getContent(true);
  }
  public com.jalios.jcms.Content getContent(boolean queryDB) { 
   if (content != null) {
      return content;
    }
    if (queryDB && Util.notEmpty(contentDBID)) {
      return channel.getData(com.jalios.jcms.Content.class, contentDBID);
    }
    return null;
  }
  protected String contentDBID;
  public String getContentDBID() { return contentDBID; }
  public void setContent(com.jalios.jcms.Content v) {
    if (v == null) {
      content = null;
      contentDBID =null;
      return;
    }  
  
    if (v instanceof DBData) {
      setContentDBID(v.getId());
    } else {
      content = v;
    }
  }
  public void setContentDBID(String v) { 
    contentDBID = v;
    if (Util.notEmpty(contentDBID)) { 
      content = null;
    };    
  }  
  
  
  // ----------------------------------------------------------------------
  // redirectForm
  // ----------------------------------------------------------------------  
  protected  String redirectForm = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getDefaultTextString();
  public String getRedirectForm() { return redirectForm; }
  public void setRedirectForm(String v) { redirectForm = v; }
  
  
  public String getRedirectForm(String lang) { return redirectForm; }
  public String getRedirectForm(String lang, boolean useDefault) { return redirectForm; }
  public static String[] redirectFormValues = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getEnumerateValues();  
  public static String[] redirectFormLabels = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getEnumerateLabels();
  public static HashMap<String, String[]> redirectFormLabelMap = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getEnumerateLabelsMap();
  
  public static String[] getRedirectFormValues() {
    return redirectFormValues;
  }
  public static String[] getRedirectFormLabels(String userLang) {
    String[] labels = (String[])redirectFormLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])redirectFormLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRedirectFormLabel(String value, String userLang) {
    String[] labels = getRedirectFormLabels(userLang);
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
    return ((String[])redirectFormLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getRedirectFormLabel(String value) {    
    if (false) {
    }
    else if (value.equals("value1")) {
      return redirectFormLabels[0];
    }
    else if (value.equals("value2")) {
      return redirectFormLabels[1];
    }
    else if (value.equals("value3")) {
      return redirectFormLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getRedirectFormReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletPortalRedirect obj = (PortletPortalRedirect)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRedirectForm());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------  
  protected  String url = channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true).getDefaultTextString();
  public String getUrl() { return url; }
  public void setUrl(String v) { url = v; }
  
  
  public String getUrl(String lang) { return url; }
  public String getUrl(String lang, boolean useDefault) { return url; }
  // ----------------------------------------------------------------------
  // redirectPortlet
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.portlet.PortalElement redirectPortlet;
  public com.jalios.jcms.portlet.PortalElement getRedirectPortlet() { return redirectPortlet; }
  public void setRedirectPortlet(com.jalios.jcms.portlet.PortalElement v) { redirectPortlet = v; }
  
  
  // ----------------------------------------------------------------------
  // category
  // ----------------------------------------------------------------------  
  protected  String category = channel.getTypeFieldEntry(PortletPortalRedirect.class, "category", true).getDefaultTextString();
  public String getCategory() { return category; }
  public void setCategory(String v) { category = v; }
  
  
  public String getCategory(String lang) { return category; }
  public String getCategory(String lang, boolean useDefault) { return category; }
  // ----------------------------------------------------------------------
  // dispPortal
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.portlet.PortalElement dispPortal;
  public com.jalios.jcms.portlet.PortalElement getDispPortal() { return dispPortal; }
  public void setDispPortal(com.jalios.jcms.portlet.PortalElement v) { dispPortal = v; }
  
  
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected  String description = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextString();
  public String getDescription() { return description; }
  public void setDescription(String v) { description = v; }
  
  
  protected HashMap descriptionML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextMap();
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
  protected  String portletImage = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextString();
  public String getPortletImage() { return portletImage; }
  public void setPortletImage(String v) { portletImage = v; }
  
  
  protected HashMap portletImageML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextMap();
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
  protected  String cacheType = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getDefaultTextString();
  public String getCacheType() { return cacheType; }
  public void setCacheType(String v) { cacheType = v; }
  
  
  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  public static String[] cacheTypeValues = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getEnumerateValues();  
  public static String[] cacheTypeLabels = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getEnumerateLabels();
  public static HashMap<String, String[]> cacheTypeLabelMap = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getEnumerateLabelsMap();
  
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
      PortletPortalRedirect obj = (PortletPortalRedirect)it.next();
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
  protected  String cacheSensibility = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getDefaultTextString();
  public String getCacheSensibility() { return cacheSensibility; }
  public void setCacheSensibility(String v) { cacheSensibility = v; }
  
  
  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  public static String[] cacheSensibilityValues = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getEnumerateValues();  
  public static String[] cacheSensibilityLabels = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getEnumerateLabels();
  public static HashMap<String, String[]> cacheSensibilityLabelMap = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getEnumerateLabelsMap();
  
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
      PortletPortalRedirect obj = (PortletPortalRedirect)it.next();
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
  public static String[] invalidClassValues = channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true).getEnumerateValues();  
  public static String[] invalidClassLabels = channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true).getEnumerateLabels();
  public static HashMap<String, String[]> invalidClassLabelMap = channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true).getEnumerateLabelsMap();
  
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
      PortletPortalRedirect obj = (PortletPortalRedirect)it.next();
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
  protected  String behaviorCopy = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getDefaultTextString();
  public String getBehaviorCopy() { return behaviorCopy; }
  public void setBehaviorCopy(String v) { behaviorCopy = v; }
  
  
  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  public static String[] behaviorCopyValues = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getEnumerateValues();  
  public static String[] behaviorCopyLabels = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getEnumerateLabels();
  public static HashMap<String, String[]> behaviorCopyLabelMap = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getEnumerateLabelsMap();
  
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
      PortletPortalRedirect obj = (PortletPortalRedirect)it.next();
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
  protected  String cssId = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssId", true).getDefaultTextString();
  public String getCssId() { return cssId; }
  public void setCssId(String v) { cssId = v; }
  
  
  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------  
  protected  String cssClasses = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssClasses", true).getDefaultTextString();
  public String getCssClasses() { return cssClasses; }
  public void setCssClasses(String v) { cssClasses = v; }
  
  
  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------  
  protected  boolean exactCategory = true;
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletPortalRedirect.class, "exactCategory", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getExactCategoryReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletPortalRedirect obj = (PortletPortalRedirect)it.next();
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
  
  public TreeSet getNavCategories(Member member) {
    return getDescendantCategorySet(channel.getCategory("j_3"), false, member);
  }
  public Category getFirstNavCategories(Member member) {
    return getFirstDescendantCategory(channel.getCategory("j_3"), false, member);
  }
  public TreeSet getLinkDataSet(Class clazz) {
    if (clazz == null) {
      return Util.EMPTY_TREESET;
    }
    TreeSet set = new TreeSet();
    JcmsUtil.addData(set, clazz, getContent());
    JcmsUtil.addData(set, clazz, getDispPortal());
    JcmsUtil.addData(set, clazz, getRedirectPortlet());
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
    
    if (Util.isEmpty(getFieldInMainLanguage(status, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "status"), null);
      return status;
    }
    {
      Category fieldRootCat = channel.getCategory("j_3");
      fieldRootCat = fieldRootCat != null ? fieldRootCat : channel.getRootCategory();
      Set catSet = fieldRootCat.getDescendantSet();
      if (Util.interSet(getCategorySet(), catSet).isEmpty()) {
        status = new ControllerStatus();
        status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "navCategories"));
        return status;
      }
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletPortalRedirect copy = (PortletPortalRedirect)super.prepareMergeCopy();
    PortletPortalRedirect main = (PortletPortalRedirect)mainInstance;
    JcmsUtil.mergeMLMap(copy.getDescriptionML(), main.getDescriptionML());
    JcmsUtil.mergeMLMap(copy.getPortletImageML(), main.getPortletImageML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// a6AfykAP5hXQh0exj0fssA==
