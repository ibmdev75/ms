// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:02 CET 2015
   
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
public abstract class AbstractPortletStat extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jcms.stat.PortletStat
               , com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public AbstractPortletStat() {}
 
 
  public AbstractPortletStat(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public AbstractPortletStat(AbstractPortletStat other) {
    super(other);
    tabGroup = other.tabGroup;
    tabGroupML = other.tabGroupML;
    displayTimeChart = other.displayTimeChart;
    displayWeekChart = other.displayWeekChart;
    displayAverage = other.displayAverage;
    regExpFilter = other.regExpFilter;
    topTen = other.topTen;
    filteredArea = other.filteredArea;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setTabGroup(ImportUtil.parseFieldText(elt, "tabGroup"));
    setTabGroupML(ImportUtil.parseFieldTextML(elt, "tabGroupML"));
    setDisplayTimeChart(ImportUtil.parseFieldBoolean(elt, "displayTimeChart"));
    setDisplayWeekChart(ImportUtil.parseFieldBoolean(elt, "displayWeekChart"));
    setDisplayAverage(ImportUtil.parseFieldBoolean(elt, "displayAverage"));
    setRegExpFilter(ImportUtil.parseFieldBoolean(elt, "regExpFilter"));
    setTopTen(ImportUtil.parseFieldInt(elt, "topTen"));
    setFilteredArea(ImportUtil.parseFieldText(elt, "filteredArea"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "tabGroup", getTabGroup(), "tabGroupML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "tabGroupML", getTabGroupML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "displayTimeChart", getDisplayTimeChart()));
    sb.append(ExportUtil.exportField(indentLevel, "displayWeekChart", getDisplayWeekChart()));
    sb.append(ExportUtil.exportField(indentLevel, "displayAverage", getDisplayAverage()));
    sb.append(ExportUtil.exportField(indentLevel, "regExpFilter", getRegExpFilter()));
    sb.append(ExportUtil.exportField(indentLevel, "topTen", getTopTen()));
    sb.append(ExportUtil.exportField(indentLevel, "filteredArea", getFilteredArea(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>AbstractPortletStat</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(AbstractPortletStat.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractPortletStat</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractPortletStat</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractPortletStat</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(AbstractPortletStat.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractPortletStat</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractPortletStat</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractPortletStat</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(AbstractPortletStat.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("topTen".equals(fieldName)) { return getTopTen(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("topTen".equals(fieldName)) { setTopTen(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("displayTimeChart".equals(fieldName)) { return getDisplayTimeChart(); }
    if ("displayWeekChart".equals(fieldName)) { return getDisplayWeekChart(); }
    if ("displayAverage".equals(fieldName)) { return getDisplayAverage(); }
    if ("regExpFilter".equals(fieldName)) { return getRegExpFilter(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>AbstractPortletStat</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("displayTimeChart".equals(fieldName)) { setDisplayTimeChart(value); return; }
    if ("displayWeekChart".equals(fieldName)) { setDisplayWeekChart(value); return; }
    if ("displayAverage".equals(fieldName)) { setDisplayAverage(value); return; }
    if ("regExpFilter".equals(fieldName)) { setRegExpFilter(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>AbstractPortletStat</code>. <br>
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
    if ("tabGroup".equals(fieldName)) { return getTabGroup(lang, useDefault); }
    if ("filteredArea".equals(fieldName)) { return getFilteredArea(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>AbstractPortletStat</code>. <br>
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
    if ("tabGroup".equals(fieldName)) { setTabGroup(lang,(String)value); return; }
    if ("filteredArea".equals(fieldName)) { setFilteredArea((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // tabGroup
  // ----------------------------------------------------------------------  
  protected  String tabGroup = channel.getTypeFieldEntry(AbstractPortletStat.class, "tabGroup", true).getDefaultTextString();
  public String getTabGroup() { return tabGroup; }
  public void setTabGroup(String v) { tabGroup = v; }
  
  
  protected HashMap tabGroupML = channel.getTypeFieldEntry(AbstractPortletStat.class, "tabGroup", true).getDefaultTextMap();
  public String getTabGroup(String lang) { return (String)channel.getLangValue(lang, true, tabGroup, tabGroupML, getMainLanguage()); }
  public String getTabGroup(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, tabGroup, tabGroupML, getMainLanguage()); }
  public HashMap getTabGroupML() { return tabGroupML; }
  public void setTabGroupML(HashMap v) { tabGroupML = v; }
  /**
   * Convenient method to set the value of the TabGroup field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setTabGroup(String)} or {@link #setTabGroupML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setTabGroup(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      tabGroup = value;
      return;
    }
    if (tabGroupML == null) {
      tabGroupML = new HashMap();
    } else if (this != channel.getData(id)) {
      tabGroupML = new HashMap<String,String>(tabGroupML);
    }
    tabGroupML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // displayTimeChart
  // ----------------------------------------------------------------------  
  protected  boolean displayTimeChart = true;
  public boolean getDisplayTimeChart() { return displayTimeChart; }
  public void setDisplayTimeChart(boolean v) { displayTimeChart = v; }
  
  
  public String getDisplayTimeChartLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayTimeChart", true);
    return displayTimeChart ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayTimeChartValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayTimeChartLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(AbstractPortletStat.class, "displayTimeChart", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayTimeChartReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortletStat obj = (AbstractPortletStat)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayTimeChart());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayWeekChart
  // ----------------------------------------------------------------------  
  protected  boolean displayWeekChart = true;
  public boolean getDisplayWeekChart() { return displayWeekChart; }
  public void setDisplayWeekChart(boolean v) { displayWeekChart = v; }
  
  
  public String getDisplayWeekChartLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayWeekChart", true);
    return displayWeekChart ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayWeekChartValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayWeekChartLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(AbstractPortletStat.class, "displayWeekChart", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayWeekChartReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortletStat obj = (AbstractPortletStat)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayWeekChart());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayAverage
  // ----------------------------------------------------------------------  
  protected  boolean displayAverage = true;
  public boolean getDisplayAverage() { return displayAverage; }
  public void setDisplayAverage(boolean v) { displayAverage = v; }
  
  
  public String getDisplayAverageLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayAverage", true);
    return displayAverage ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayAverageValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayAverageLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(AbstractPortletStat.class, "displayAverage", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayAverageReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortletStat obj = (AbstractPortletStat)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayAverage());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // regExpFilter
  // ----------------------------------------------------------------------  
  protected  boolean regExpFilter = true;
  public boolean getRegExpFilter() { return regExpFilter; }
  public void setRegExpFilter(boolean v) { regExpFilter = v; }
  
  
  public String getRegExpFilterLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "regExpFilter", true);
    return regExpFilter ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getRegExpFilterValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getRegExpFilterLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(AbstractPortletStat.class, "regExpFilter", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getRegExpFilterReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortletStat obj = (AbstractPortletStat)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRegExpFilter());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // topTen
  // ----------------------------------------------------------------------  
  protected  int topTen = 10;
  public int getTopTen() { return topTen; }
  public void setTopTen(int v) { topTen = v; }
  
  
  public static IntegerFormReport getTopTenReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortletStat obj = (AbstractPortletStat)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getTopTen();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // filteredArea
  // ----------------------------------------------------------------------  
  protected  String filteredArea = channel.getTypeFieldEntry(AbstractPortletStat.class, "filteredArea", true).getDefaultTextString();
  public String getFilteredArea() { return filteredArea; }
  public void setFilteredArea(String v) { filteredArea = v; }
  
  
  public String getFilteredArea(String lang) { return filteredArea; }
  public String getFilteredArea(String lang, boolean useDefault) { return filteredArea; }
  public static String[] filteredAreaValues = channel.getTypeFieldEntry(AbstractPortletStat.class, "filteredArea", true).getEnumerateValues();  
  public static String[] filteredAreaLabels = channel.getTypeFieldEntry(AbstractPortletStat.class, "filteredArea", true).getEnumerateLabels();
  public static HashMap<String, String[]> filteredAreaLabelMap = channel.getTypeFieldEntry(AbstractPortletStat.class, "filteredArea", true).getEnumerateLabelsMap();
  
  public static String[] getFilteredAreaValues() {
    return filteredAreaValues;
  }
  public static String[] getFilteredAreaLabels(String userLang) {
    String[] labels = (String[])filteredAreaLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])filteredAreaLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getFilteredAreaLabel(String value, String userLang) {
    String[] labels = getFilteredAreaLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("Public")) {
      i = 1;
    }
    else if (value.equals("AdminArea")) {
      i = 2;
    }
    else if (value.equals("WorkArea")) {
      i = 3;
    }
    else if (value.equals("FeedArea")) {
      i = 4;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])filteredAreaLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getFilteredAreaLabel(String value) {    
    if (false) {
    }
    else if (value.equals("")) {
      return filteredAreaLabels[0];
    }
    else if (value.equals("Public")) {
      return filteredAreaLabels[1];
    }
    else if (value.equals("AdminArea")) {
      return filteredAreaLabels[2];
    }
    else if (value.equals("WorkArea")) {
      return filteredAreaLabels[3];
    }
    else if (value.equals("FeedArea")) {
      return filteredAreaLabels[4];
    }
    return "???";
  }
  public static EnumerateFormReport getFilteredAreaReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      AbstractPortletStat obj = (AbstractPortletStat)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getFilteredArea());
      
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
    
    if (topTen < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "topTen"), "0");
      return status;      
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    AbstractPortletStat copy = (AbstractPortletStat)super.prepareMergeCopy();
    AbstractPortletStat main = (AbstractPortletStat)mainInstance;
    JcmsUtil.mergeMLMap(copy.getTabGroupML(), main.getTabGroupML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// kmhdwpk7aMp7dQEh2L5fGg==
