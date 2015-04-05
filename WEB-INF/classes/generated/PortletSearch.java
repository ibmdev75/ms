// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:56 CET 2015
   
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
public  class PortletSearch extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletSearch() {}
 
 
  public PortletSearch(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletSearch(PortletSearch other) {
    super(other);
    titleText = other.titleText;
    titleTextML = other.titleTextML;
    searchWith = other.searchWith;
    searchIn = other.searchIn;
    instantSearch = other.instantSearch;
    query = other.query;
    refineQueries = other.refineQueries;
    queryPortlet = other.queryPortlet;
    displayPortal = other.displayPortal;
    advancedSearchPortlet = other.advancedSearchPortlet;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setTitleText(ImportUtil.parseFieldText(elt, "titleText"));
    setTitleTextML(ImportUtil.parseFieldTextML(elt, "titleTextML"));
    setSearchWith(ImportUtil.parseFieldText(elt, "searchWith"));
    setSearchIn(ImportUtil.parseFieldTextArray(elt, "searchIn"));
    setInstantSearch(ImportUtil.parseFieldBoolean(elt, "instantSearch"));
    setQuery(ImportUtil.parseFieldText(elt, "query"));
    setRefineQueries(ImportUtil.parseFieldText(elt, "refineQueries"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setQueryPortlet(ImportUtil.parseSelfFieldData(elt, "queryPortlet", generated.PortletQueryForeach.class));
      setDisplayPortal(ImportUtil.parseSelfFieldData(elt, "displayPortal", generated.PortletPortal.class));
      setAdvancedSearchPortlet(ImportUtil.parseSelfFieldData(elt, "advancedSearchPortlet", generated.PortletSearch.class));
    } else {
    
    setQueryPortlet((generated.PortletQueryForeach)ImportUtil.parseFieldData(elt, "queryPortlet"));
    setDisplayPortal((generated.PortletPortal)ImportUtil.parseFieldData(elt, "displayPortal"));
    setAdvancedSearchPortlet((generated.PortletSearch)ImportUtil.parseFieldData(elt, "advancedSearchPortlet"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "titleText", getTitleText(), "titleTextML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "titleTextML", getTitleTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "searchWith", getSearchWith(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "searchIn", getSearchIn(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "instantSearch", getInstantSearch()));
    sb.append(ExportUtil.exportField(indentLevel, "query", getQuery(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "refineQueries", getRefineQueries(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "queryPortlet", getQueryPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "displayPortal", getDisplayPortal()));
    sb.append(ExportUtil.exportField(indentLevel, "advancedSearchPortlet", getAdvancedSearchPortlet()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletSearch</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletSearch.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletSearch</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletSearch</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletSearch</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletSearch.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletSearch</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletSearch</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletSearch</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletSearch.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("instantSearch".equals(fieldName)) { return getInstantSearch(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("instantSearch".equals(fieldName)) { setInstantSearch(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletSearch</code>. <br>
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
    if ("titleText".equals(fieldName)) { return getTitleText(lang, useDefault); }
    if ("searchWith".equals(fieldName)) { return getSearchWith(); }
    if ("searchIn".equals(fieldName)) { return getSearchIn(); }
    if ("query".equals(fieldName)) { return getQuery(); }
    if ("refineQueries".equals(fieldName)) { return getRefineQueries(); }
    if ("queryPortlet".equals(fieldName)) { return getQueryPortlet(); }
    if ("displayPortal".equals(fieldName)) { return getDisplayPortal(); }
    if ("advancedSearchPortlet".equals(fieldName)) { return getAdvancedSearchPortlet(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletSearch</code>. <br>
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
    if ("titleText".equals(fieldName)) { setTitleText(lang,(String)value); return; }
    if ("searchWith".equals(fieldName)) { setSearchWith((String)value); return; }
    if ("searchIn".equals(fieldName)) { setSearchIn((String[])value); return; }
    if ("query".equals(fieldName)) { setQuery((String)value); return; }
    if ("refineQueries".equals(fieldName)) { setRefineQueries((String)value); return; }
    if ("queryPortlet".equals(fieldName)) { setQueryPortlet((generated.PortletQueryForeach)value); return; }
    if ("displayPortal".equals(fieldName)) { setDisplayPortal((generated.PortletPortal)value); return; }
    if ("advancedSearchPortlet".equals(fieldName)) { setAdvancedSearchPortlet((generated.PortletSearch)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // titleText
  // ----------------------------------------------------------------------  
  protected  String titleText = channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextString();
  public String getTitleText() { return titleText; }
  public void setTitleText(String v) { titleText = v; }
  
  
  protected HashMap titleTextML = channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextMap();
  public String getTitleText(String lang) { return (String)channel.getLangValue(lang, true, titleText, titleTextML, getMainLanguage()); }
  public String getTitleText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, titleText, titleTextML, getMainLanguage()); }
  public HashMap getTitleTextML() { return titleTextML; }
  public void setTitleTextML(HashMap v) { titleTextML = v; }
  /**
   * Convenient method to set the value of the TitleText field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setTitleText(String)} or {@link #setTitleTextML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setTitleText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      titleText = value;
      return;
    }
    if (titleTextML == null) {
      titleTextML = new HashMap();
    } else if (this != channel.getData(id)) {
      titleTextML = new HashMap<String,String>(titleTextML);
    }
    titleTextML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // searchWith
  // ----------------------------------------------------------------------  
  protected  String searchWith = channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getDefaultTextString();
  public String getSearchWith() { return searchWith; }
  public void setSearchWith(String v) { searchWith = v; }
  
  
  public String getSearchWith(String lang) { return searchWith; }
  public String getSearchWith(String lang, boolean useDefault) { return searchWith; }
  public static String[] searchWithValues = channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getEnumerateValues();  
  public static String[] searchWithLabels = channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getEnumerateLabels();
  public static HashMap<String, String[]> searchWithLabelMap = channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getEnumerateLabelsMap();
  
  public static String[] getSearchWithValues() {
    return searchWithValues;
  }
  public static String[] getSearchWithLabels(String userLang) {
    String[] labels = (String[])searchWithLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])searchWithLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSearchWithLabel(String value, String userLang) {
    String[] labels = getSearchWithLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("all")) {
      i = 0;
    }
    else if (value.equals("any")) {
      i = 1;
    }
    else if (value.equals("exact")) {
      i = 2;
    }
    else if (value.equals("advanced")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])searchWithLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getSearchWithLabel(String value) {    
    if (false) {
    }
    else if (value.equals("all")) {
      return searchWithLabels[0];
    }
    else if (value.equals("any")) {
      return searchWithLabels[1];
    }
    else if (value.equals("exact")) {
      return searchWithLabels[2];
    }
    else if (value.equals("advanced")) {
      return searchWithLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getSearchWithReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletSearch obj = (PortletSearch)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getSearchWith());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // searchIn
  // ----------------------------------------------------------------------  
  protected  String[] searchIn;
  public String[] getSearchIn() { return searchIn; }
  public void setSearchIn(String[] v) { searchIn = v; }
  
  
  public String[] getSearchIn(String lang) { return searchIn; }
  public String[] getSearchIn(String lang, boolean useDefault) { return searchIn; }
  public static String[] searchInValues = channel.getTypeFieldEntry(PortletSearch.class, "searchIn", true).getEnumerateValues();  
  public static String[] searchInLabels = channel.getTypeFieldEntry(PortletSearch.class, "searchIn", true).getEnumerateLabels();
  public static HashMap<String, String[]> searchInLabelMap = channel.getTypeFieldEntry(PortletSearch.class, "searchIn", true).getEnumerateLabelsMap();
  
  public static String[] getSearchInValues() {
    return searchInValues;
  }
  public static String[] getSearchInLabels(String userLang) {
    String[] labels = (String[])searchInLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])searchInLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSearchInLabel(String value, String userLang) {
    String[] labels = getSearchInLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("catName")) {
      i = 0;
    }
    else if (value.equals("searchInFiles")) {
      i = 1;
    }
    else if (value.equals("searchInMembers")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])searchInLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getSearchInLabel(String value) {    
    if (false) {
    }
    else if (value.equals("catName")) {
      return searchInLabels[0];
    }
    else if (value.equals("searchInFiles")) {
      return searchInLabels[1];
    }
    else if (value.equals("searchInMembers")) {
      return searchInLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getSearchInReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletSearch obj = (PortletSearch)it.next();
      if (obj == null || obj.getSearchIn() == null) {
        continue;
      }
      for(int i = 0; i < obj.getSearchIn().length; i++) {
        if (obj.getSearchIn()[i] != null) {
          map.inc(obj.getSearchIn()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // instantSearch
  // ----------------------------------------------------------------------  
  protected  boolean instantSearch = true;
  public boolean getInstantSearch() { return instantSearch; }
  public void setInstantSearch(boolean v) { instantSearch = v; }
  
  
  public String getInstantSearchLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "instantSearch", true);
    return instantSearch ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getInstantSearchValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getInstantSearchLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletSearch.class, "instantSearch", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getInstantSearchReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletSearch obj = (PortletSearch)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getInstantSearch());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // query
  // ----------------------------------------------------------------------  
  protected  String query = channel.getTypeFieldEntry(PortletSearch.class, "query", true).getDefaultTextString();
  public String getQuery() { return query; }
  public void setQuery(String v) { query = v; }
  
  
  public String getQuery(String lang) { return query; }
  public String getQuery(String lang, boolean useDefault) { return query; }
  // ----------------------------------------------------------------------
  // refineQueries
  // ----------------------------------------------------------------------  
  protected  String refineQueries = channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getDefaultTextString();
  public String getRefineQueries() { return refineQueries; }
  public void setRefineQueries(String v) { refineQueries = v; }
  
  
  public String getRefineQueries(String lang) { return refineQueries; }
  public String getRefineQueries(String lang, boolean useDefault) { return refineQueries; }
  public static String[] refineQueriesValues = channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getEnumerateValues();  
  public static String[] refineQueriesLabels = channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getEnumerateLabels();
  public static HashMap<String, String[]> refineQueriesLabelMap = channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getEnumerateLabelsMap();
  
  public static String[] getRefineQueriesValues() {
    return refineQueriesValues;
  }
  public static String[] getRefineQueriesLabels(String userLang) {
    String[] labels = (String[])refineQueriesLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])refineQueriesLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRefineQueriesLabel(String value, String userLang) {
    String[] labels = getRefineQueriesLabels(userLang);
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
    else if (value.equals("CurrentWS")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])refineQueriesLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getRefineQueriesLabel(String value) {    
    if (false) {
    }
    else if (value.equals("None")) {
      return refineQueriesLabels[0];
    }
    else if (value.equals("Portal")) {
      return refineQueriesLabels[1];
    }
    else if (value.equals("Current")) {
      return refineQueriesLabels[2];
    }
    else if (value.equals("CurrentWS")) {
      return refineQueriesLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineQueriesReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletSearch obj = (PortletSearch)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineQueries());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // queryPortlet
  // ----------------------------------------------------------------------  
  protected  generated.PortletQueryForeach queryPortlet;
  public generated.PortletQueryForeach getQueryPortlet() { return queryPortlet; }
  public void setQueryPortlet(generated.PortletQueryForeach v) { queryPortlet = v; }
  
  
  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------  
  protected  generated.PortletPortal displayPortal;
  public generated.PortletPortal getDisplayPortal() { return displayPortal; }
  public void setDisplayPortal(generated.PortletPortal v) { displayPortal = v; }
  
  
  // ----------------------------------------------------------------------
  // advancedSearchPortlet
  // ----------------------------------------------------------------------  
  protected  generated.PortletSearch advancedSearchPortlet;
  public generated.PortletSearch getAdvancedSearchPortlet() { return advancedSearchPortlet; }
  public void setAdvancedSearchPortlet(generated.PortletSearch v) { advancedSearchPortlet = v; }
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setRefineQueries(value); }
  @Override
  public String getAbstract() { return refineQueries; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getRefineQueries(lang, useDefault); }
   
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
    JcmsUtil.addData(set, clazz, getAdvancedSearchPortlet());
    JcmsUtil.addData(set, clazz, getDisplayPortal());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    JcmsUtil.addData(set, clazz, getQueryPortlet());
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
    PortletSearch copy = (PortletSearch)super.prepareMergeCopy();
    PortletSearch main = (PortletSearch)mainInstance;
    JcmsUtil.mergeMLMap(copy.getTitleTextML(), main.getTitleTextML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// QVYpnCd6D/Om7tZzCb/BpA==
