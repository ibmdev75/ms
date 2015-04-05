// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:45 CET 2015
   
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
public  class PortletQueryForeach extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletQueryForeach() {}
 
 
  public PortletQueryForeach(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletQueryForeach(PortletQueryForeach other) {
    super(other);
    searchInDB = other.searchInDB;
    queries = other.queries;
    refineQueries = other.refineQueries;
    refineWithContextualCategories = other.refineWithContextualCategories;
    orderBy = other.orderBy;
    reverseOrder = other.reverseOrder;
    maxResults = other.maxResults;
    skipFirstResults = other.skipFirstResults;
    showPager = other.showPager;
    pagerLabel = other.pagerLabel;
    pagerLabelML = other.pagerLabelML;
    pageSizes = other.pageSizes;
    pagerAllLimit = other.pagerAllLimit;
    hideWhenNoResults = other.hideWhenNoResults;
    firstPublications = other.firstPublications;
    firstPublicationsDBID = other.firstPublicationsDBID;
    showInCurrentPortal = other.showInCurrentPortal;
    contextCategory = other.contextCategory;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setSearchInDB(ImportUtil.parseFieldBoolean(elt, "searchInDB"));
    setQueries(ImportUtil.parseFieldTextArray(elt, "queries"));
    setRefineQueries(ImportUtil.parseFieldText(elt, "refineQueries"));
    setRefineWithContextualCategories(ImportUtil.parseFieldBoolean(elt, "refineWithContextualCategories"));
    setOrderBy(ImportUtil.parseFieldText(elt, "orderBy"));
    setReverseOrder(ImportUtil.parseFieldText(elt, "reverseOrder"));
    setMaxResults(ImportUtil.parseFieldInt(elt, "maxResults"));
    setSkipFirstResults(ImportUtil.parseFieldInt(elt, "skipFirstResults"));
    setShowPager(ImportUtil.parseFieldText(elt, "showPager"));
    setPagerLabel(ImportUtil.parseFieldText(elt, "pagerLabel"));
    setPagerLabelML(ImportUtil.parseFieldTextML(elt, "pagerLabelML"));
    setPageSizes(ImportUtil.parseFieldIntArray(elt, "pageSizes"));
    setPagerAllLimit(ImportUtil.parseFieldInt(elt, "pagerAllLimit"));
    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
    setShowInCurrentPortal(ImportUtil.parseFieldBoolean(elt, "showInCurrentPortal"));
    setContextCategory(ImportUtil.parseFieldBoolean(elt, "contextCategory"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setFirstPublications(ImportUtil.parseSelfFieldDataArray(elt, "firstPublications", com.jalios.jcms.Content.class));
    } else {
    
    setFirstPublications((com.jalios.jcms.Content[])ImportUtil.parseFieldDataArray(elt, "firstPublications", com.jalios.jcms.Content.class));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "searchInDB", getSearchInDB()));
    sb.append(ExportUtil.exportField(indentLevel, "queries", getQueries(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "refineQueries", getRefineQueries(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "refineWithContextualCategories", getRefineWithContextualCategories()));
    sb.append(ExportUtil.exportField(indentLevel, "orderBy", getOrderBy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "reverseOrder", getReverseOrder(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "maxResults", getMaxResults()));
    sb.append(ExportUtil.exportField(indentLevel, "skipFirstResults", getSkipFirstResults()));
    sb.append(ExportUtil.exportField(indentLevel, "showPager", getShowPager(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pagerLabel", getPagerLabel(), "pagerLabelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pagerLabelML", getPagerLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "pageSizes", getPageSizes()));
    sb.append(ExportUtil.exportField(indentLevel, "pagerAllLimit", getPagerAllLimit()));
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
    sb.append(ExportUtil.exportField(indentLevel, "firstPublications", getFirstPublications()));
    sb.append(ExportUtil.exportField(indentLevel, "showInCurrentPortal", getShowInCurrentPortal()));
    sb.append(ExportUtil.exportField(indentLevel, "contextCategory", getContextCategory()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletQueryForeach</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletQueryForeach.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeach</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeach</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeach</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletQueryForeach.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeach</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeach</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeach</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletQueryForeach.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("maxResults".equals(fieldName)) { return getMaxResults(); }
    if ("skipFirstResults".equals(fieldName)) { return getSkipFirstResults(); }
    if ("pagerAllLimit".equals(fieldName)) { return getPagerAllLimit(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("maxResults".equals(fieldName)) { setMaxResults(value); return; }
    if ("skipFirstResults".equals(fieldName)) { setSkipFirstResults(value); return; }
    if ("pagerAllLimit".equals(fieldName)) { setPagerAllLimit(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("searchInDB".equals(fieldName)) { return getSearchInDB(); }
    if ("refineWithContextualCategories".equals(fieldName)) { return getRefineWithContextualCategories(); }
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    if ("showInCurrentPortal".equals(fieldName)) { return getShowInCurrentPortal(); }
    if ("contextCategory".equals(fieldName)) { return getContextCategory(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("searchInDB".equals(fieldName)) { setSearchInDB(value); return; }
    if ("refineWithContextualCategories".equals(fieldName)) { setRefineWithContextualCategories(value); return; }
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
    if ("showInCurrentPortal".equals(fieldName)) { setShowInCurrentPortal(value); return; }
    if ("contextCategory".equals(fieldName)) { setContextCategory(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletQueryForeach</code>. <br>
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
    if ("queries".equals(fieldName)) { return getQueries(); }
    if ("refineQueries".equals(fieldName)) { return getRefineQueries(); }
    if ("orderBy".equals(fieldName)) { return getOrderBy(); }
    if ("reverseOrder".equals(fieldName)) { return getReverseOrder(); }
    if ("showPager".equals(fieldName)) { return getShowPager(); }
    if ("pagerLabel".equals(fieldName)) { return getPagerLabel(lang, useDefault); }
    if ("pageSizes".equals(fieldName)) { return getPageSizes(); }
    if ("firstPublications".equals(fieldName)) { return getFirstPublications(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletQueryForeach</code>. <br>
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
    if ("queries".equals(fieldName)) { setQueries((String[])value); return; }
    if ("refineQueries".equals(fieldName)) { setRefineQueries((String)value); return; }
    if ("orderBy".equals(fieldName)) { setOrderBy((String)value); return; }
    if ("reverseOrder".equals(fieldName)) { setReverseOrder((String)value); return; }
    if ("showPager".equals(fieldName)) { setShowPager((String)value); return; }
    if ("pagerLabel".equals(fieldName)) { setPagerLabel(lang,(String)value); return; }
    if ("pageSizes".equals(fieldName)) { setPageSizes((int[])value); return; }
    if ("firstPublications".equals(fieldName)) { setFirstPublications((com.jalios.jcms.Content[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // searchInDB
  // ----------------------------------------------------------------------  
  protected  boolean searchInDB = false;
  public boolean getSearchInDB() { return searchInDB; }
  public void setSearchInDB(boolean v) { searchInDB = v; }
  
  
  public String getSearchInDBLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "searchInDB", true);
    return searchInDB ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getSearchInDBValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getSearchInDBLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "searchInDB", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getSearchInDBReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getSearchInDB());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // queries
  // ----------------------------------------------------------------------  
  protected  String[] queries;
  public String[] getQueries() { return queries; }
  public void setQueries(String[] v) { queries = v; }
  
  
  public String[] getQueries(String lang) { return queries; }
  public String[] getQueries(String lang, boolean useDefault) { return queries; }
  // ----------------------------------------------------------------------
  // refineQueries
  // ----------------------------------------------------------------------  
  protected  String refineQueries = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getDefaultTextString();
  public String getRefineQueries() { return refineQueries; }
  public void setRefineQueries(String v) { refineQueries = v; }
  
  
  public String getRefineQueries(String lang) { return refineQueries; }
  public String getRefineQueries(String lang, boolean useDefault) { return refineQueries; }
  public static String[] refineQueriesValues = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getEnumerateValues();  
  public static String[] refineQueriesLabels = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getEnumerateLabels();
  public static HashMap<String, String[]> refineQueriesLabelMap = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getEnumerateLabelsMap();
  
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
    else if (value.equals("Portal")) {
      i = 0;
    }
    else if (value.equals("Current")) {
      i = 1;
    }
    else if (value.equals("PortalExact")) {
      i = 2;
    }
    else if (value.equals("CurrentExact")) {
      i = 3;
    }
    else if (value.equals("CurrentWS")) {
      i = 4;
    }
    else if (value.equals("CurrentWSCat")) {
      i = 5;
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
    else if (value.equals("Portal")) {
      return refineQueriesLabels[0];
    }
    else if (value.equals("Current")) {
      return refineQueriesLabels[1];
    }
    else if (value.equals("PortalExact")) {
      return refineQueriesLabels[2];
    }
    else if (value.equals("CurrentExact")) {
      return refineQueriesLabels[3];
    }
    else if (value.equals("CurrentWS")) {
      return refineQueriesLabels[4];
    }
    else if (value.equals("CurrentWSCat")) {
      return refineQueriesLabels[5];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineQueriesReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineQueries());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // refineWithContextualCategories
  // ----------------------------------------------------------------------  
  protected  boolean refineWithContextualCategories = false;
  public boolean getRefineWithContextualCategories() { return refineWithContextualCategories; }
  public void setRefineWithContextualCategories(boolean v) { refineWithContextualCategories = v; }
  
  
  public String getRefineWithContextualCategoriesLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "refineWithContextualCategories", true);
    return refineWithContextualCategories ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getRefineWithContextualCategoriesValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getRefineWithContextualCategoriesLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineWithContextualCategories", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getRefineWithContextualCategoriesReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineWithContextualCategories());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // orderBy
  // ----------------------------------------------------------------------  
  protected  String orderBy = channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getDefaultTextString();
  public String getOrderBy() { return orderBy; }
  public void setOrderBy(String v) { orderBy = v; }
  
  
  public String getOrderBy(String lang) { return orderBy; }
  public String getOrderBy(String lang, boolean useDefault) { return orderBy; }
  public static String[] orderByValues = channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getEnumerateValues();  
  public static String[] orderByLabels = channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getEnumerateLabels();
  public static HashMap<String, String[]> orderByLabelMap = channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getEnumerateLabelsMap();
  
  public static String[] getOrderByValues() {
    return orderByValues;
  }
  public static String[] getOrderByLabels(String userLang) {
    String[] labels = (String[])orderByLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])orderByLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getOrderByLabel(String value, String userLang) {
    String[] labels = getOrderByLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("cdate")) {
      i = 0;
    }
    else if (value.equals("udate")) {
      i = 1;
    }
    else if (value.equals("mdate")) {
      i = 2;
    }
    else if (value.equals("pdate")) {
      i = 3;
    }
    else if (value.equals("edate")) {
      i = 4;
    }
    else if (value.equals("sdate")) {
      i = 5;
    }
    else if (value.equals("title")) {
      i = 6;
    }
    else if (value.equals("random")) {
      i = 7;
    }
    else if (value.equals("reader")) {
      i = 8;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])orderByLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getOrderByLabel(String value) {    
    if (false) {
    }
    else if (value.equals("cdate")) {
      return orderByLabels[0];
    }
    else if (value.equals("udate")) {
      return orderByLabels[1];
    }
    else if (value.equals("mdate")) {
      return orderByLabels[2];
    }
    else if (value.equals("pdate")) {
      return orderByLabels[3];
    }
    else if (value.equals("edate")) {
      return orderByLabels[4];
    }
    else if (value.equals("sdate")) {
      return orderByLabels[5];
    }
    else if (value.equals("title")) {
      return orderByLabels[6];
    }
    else if (value.equals("random")) {
      return orderByLabels[7];
    }
    else if (value.equals("reader")) {
      return orderByLabels[8];
    }
    return "???";
  }
  public static EnumerateFormReport getOrderByReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getOrderBy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // reverseOrder
  // ----------------------------------------------------------------------  
  protected  String reverseOrder = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getDefaultTextString();
  public String getReverseOrder() { return reverseOrder; }
  public void setReverseOrder(String v) { reverseOrder = v; }
  
  
  public String getReverseOrder(String lang) { return reverseOrder; }
  public String getReverseOrder(String lang, boolean useDefault) { return reverseOrder; }
  public static String[] reverseOrderValues = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getEnumerateValues();  
  public static String[] reverseOrderLabels = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getEnumerateLabels();
  public static HashMap<String, String[]> reverseOrderLabelMap = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getEnumerateLabelsMap();
  
  public static String[] getReverseOrderValues() {
    return reverseOrderValues;
  }
  public static String[] getReverseOrderLabels(String userLang) {
    String[] labels = (String[])reverseOrderLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])reverseOrderLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getReverseOrderLabel(String value, String userLang) {
    String[] labels = getReverseOrderLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("results")) {
      i = 0;
    }
    else if (value.equals("request")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])reverseOrderLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getReverseOrderLabel(String value) {    
    if (false) {
    }
    else if (value.equals("results")) {
      return reverseOrderLabels[0];
    }
    else if (value.equals("request")) {
      return reverseOrderLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getReverseOrderReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getReverseOrder());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------  
  protected  int maxResults = 5;
  public int getMaxResults() { return maxResults; }
  public void setMaxResults(int v) { maxResults = v; }
  
  
  public static IntegerFormReport getMaxResultsReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getMaxResults();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // skipFirstResults
  // ----------------------------------------------------------------------  
  protected  int skipFirstResults = 0;
  public int getSkipFirstResults() { return skipFirstResults; }
  public void setSkipFirstResults(int v) { skipFirstResults = v; }
  
  
  public static IntegerFormReport getSkipFirstResultsReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getSkipFirstResults();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // showPager
  // ----------------------------------------------------------------------  
  protected  String showPager = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getDefaultTextString();
  public String getShowPager() { return showPager; }
  public void setShowPager(String v) { showPager = v; }
  
  
  public String getShowPager(String lang) { return showPager; }
  public String getShowPager(String lang, boolean useDefault) { return showPager; }
  public static String[] showPagerValues = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getEnumerateValues();  
  public static String[] showPagerLabels = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getEnumerateLabels();
  public static HashMap<String, String[]> showPagerLabelMap = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getEnumerateLabelsMap();
  
  public static String[] getShowPagerValues() {
    return showPagerValues;
  }
  public static String[] getShowPagerLabels(String userLang) {
    String[] labels = (String[])showPagerLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])showPagerLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getShowPagerLabel(String value, String userLang) {
    String[] labels = getShowPagerLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Link")) {
      i = 0;
    }
    else if (value.equals("Yes")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])showPagerLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getShowPagerLabel(String value) {    
    if (false) {
    }
    else if (value.equals("Link")) {
      return showPagerLabels[0];
    }
    else if (value.equals("Yes")) {
      return showPagerLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getShowPagerReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowPager());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // pagerLabel
  // ----------------------------------------------------------------------  
  protected  String pagerLabel = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextString();
  public String getPagerLabel() { return pagerLabel; }
  public void setPagerLabel(String v) { pagerLabel = v; }
  
  
  protected HashMap pagerLabelML = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextMap();
  public String getPagerLabel(String lang) { return (String)channel.getLangValue(lang, true, pagerLabel, pagerLabelML, getMainLanguage()); }
  public String getPagerLabel(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, pagerLabel, pagerLabelML, getMainLanguage()); }
  public HashMap getPagerLabelML() { return pagerLabelML; }
  public void setPagerLabelML(HashMap v) { pagerLabelML = v; }
  /**
   * Convenient method to set the value of the PagerLabel field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setPagerLabel(String)} or {@link #setPagerLabelML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setPagerLabel(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      pagerLabel = value;
      return;
    }
    if (pagerLabelML == null) {
      pagerLabelML = new HashMap();
    } else if (this != channel.getData(id)) {
      pagerLabelML = new HashMap<String,String>(pagerLabelML);
    }
    pagerLabelML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // pageSizes
  // ----------------------------------------------------------------------  
  protected  int[] pageSizes;
  public int[] getPageSizes() { return pageSizes; }
  public void setPageSizes(int[] v) { pageSizes = v; }
  
  
  // ----------------------------------------------------------------------
  // pagerAllLimit
  // ----------------------------------------------------------------------  
  protected  int pagerAllLimit = -1;
  public int getPagerAllLimit() { return pagerAllLimit; }
  public void setPagerAllLimit(int v) { pagerAllLimit = v; }
  
  
  public static IntegerFormReport getPagerAllLimitReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getPagerAllLimit();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------  
  protected  boolean hideWhenNoResults = false;
  public boolean getHideWhenNoResults() { return hideWhenNoResults; }
  public void setHideWhenNoResults(boolean v) { hideWhenNoResults = v; }
  
  
  public String getHideWhenNoResultsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "hideWhenNoResults", true);
    return hideWhenNoResults ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getHideWhenNoResultsValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getHideWhenNoResultsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "hideWhenNoResults", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getHideWhenNoResults());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // firstPublications
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.Content[] firstPublications;
  public com.jalios.jcms.Content[] getFirstPublications() {
    return getFirstPublications(true);
  }
  public com.jalios.jcms.Content[] getFirstPublications(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(firstPublicationsDBID)) {
      return firstPublications;
    }
    return mergeHybridLink(com.jalios.jcms.Content.class, firstPublications, firstPublicationsDBID);
  }
  protected String[] firstPublicationsDBID;
  public String[] getFirstPublicationsDBID() {
    return firstPublicationsDBID;
  }
  public void setFirstPublications(com.jalios.jcms.Content[] v) { 
    firstPublications = v == null ? null : v.clone(); 
    firstPublicationsDBID = computeDBIDArray(firstPublications);
  }
  
  public void setFirstPublicationsDBID(String[] v) { 
    firstPublicationsDBID = v; 
  }
  
  
  // ----------------------------------------------------------------------
  // showInCurrentPortal
  // ----------------------------------------------------------------------  
  protected  boolean showInCurrentPortal = false;
  public boolean getShowInCurrentPortal() { return showInCurrentPortal; }
  public void setShowInCurrentPortal(boolean v) { showInCurrentPortal = v; }
  
  
  public String getShowInCurrentPortalLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showInCurrentPortal", true);
    return showInCurrentPortal ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowInCurrentPortalValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowInCurrentPortalLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "showInCurrentPortal", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowInCurrentPortalReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowInCurrentPortal());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // contextCategory
  // ----------------------------------------------------------------------  
  protected  boolean contextCategory = false;
  public boolean getContextCategory() { return contextCategory; }
  public void setContextCategory(boolean v) { contextCategory = v; }
  
  
  public String getContextCategoryLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "contextCategory", true);
    return contextCategory ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getContextCategoryValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getContextCategoryLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "contextCategory", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getContextCategoryReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeach obj = (PortletQueryForeach)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getContextCategory());
      
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
    JcmsUtil.addData(set, clazz, getFirstPublications());
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
    
    if (maxResults < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "maxResults"), "0");
      return status;      
    }
    if (maxResults > 500 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "maxResults"), "500");
      return status;      
    }
    if (skipFirstResults < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "skipFirstResults"), "0");
      return status;      
    }
    if (skipFirstResults > 500 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "skipFirstResults"), "500");
      return status;      
    }
    if (pageSizes != null) {
      for(int i = 0; i < pageSizes.length; i++) {
        if (pageSizes[i] < 1 ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "pageSizes"), "1");
          return status;      
        }
      } 
    }
    if (pageSizes != null) {
      for(int i = 0; i < pageSizes.length; i++) {
        if (pageSizes[i] > 500 ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "pageSizes"), "500");
          return status;      
        }
      } 
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletQueryForeach copy = (PortletQueryForeach)super.prepareMergeCopy();
    PortletQueryForeach main = (PortletQueryForeach)mainInstance;
    JcmsUtil.mergeMLMap(copy.getPagerLabelML(), main.getPagerLabelML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// xF07Zz/Cd6I2oLFjQb7MNw==
