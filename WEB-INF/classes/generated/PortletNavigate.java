// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:44 CET 2015
   
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
public  class PortletNavigate extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletNavigate() {}
 
 
  public PortletNavigate(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletNavigate(PortletNavigate other) {
    super(other);
    refineCategory = other.refineCategory;
    levels = other.levels;
    hideWhenNoResults = other.hideWhenNoResults;
    navigatePortlet = other.navigatePortlet;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setRefineCategory(ImportUtil.parseFieldText(elt, "refineCategory"));
    setLevels(ImportUtil.parseFieldInt(elt, "levels"));
    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
    setNavigatePortlet(ImportUtil.parseFieldBoolean(elt, "navigatePortlet"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "refineCategory", getRefineCategory(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "levels", getLevels()));
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
    sb.append(ExportUtil.exportField(indentLevel, "navigatePortlet", getNavigatePortlet()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletNavigate</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletNavigate.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletNavigate</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletNavigate</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletNavigate</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletNavigate.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletNavigate</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletNavigate</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletNavigate</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletNavigate.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("levels".equals(fieldName)) { return getLevels(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("levels".equals(fieldName)) { setLevels(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    if ("navigatePortlet".equals(fieldName)) { return getNavigatePortlet(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
    if ("navigatePortlet".equals(fieldName)) { setNavigatePortlet(value); return; }
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
    if ("rootCategory".equals(fieldName)) { return getRootCategory(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletNavigate</code>. <br>
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
    if ("refineCategory".equals(fieldName)) { return getRefineCategory(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletNavigate</code>. <br>
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
    if ("refineCategory".equals(fieldName)) { setRefineCategory((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // refineCategory
  // ----------------------------------------------------------------------  
  protected  String refineCategory = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getDefaultTextString();
  public String getRefineCategory() { return refineCategory; }
  public void setRefineCategory(String v) { refineCategory = v; }
  
  
  public String getRefineCategory(String lang) { return refineCategory; }
  public String getRefineCategory(String lang, boolean useDefault) { return refineCategory; }
  public static String[] refineCategoryValues = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getEnumerateValues();  
  public static String[] refineCategoryLabels = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getEnumerateLabels();
  public static HashMap<String, String[]> refineCategoryLabelMap = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getEnumerateLabelsMap();
  
  public static String[] getRefineCategoryValues() {
    return refineCategoryValues;
  }
  public static String[] getRefineCategoryLabels(String userLang) {
    String[] labels = (String[])refineCategoryLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])refineCategoryLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRefineCategoryLabel(String value, String userLang) {
    String[] labels = getRefineCategoryLabels(userLang);
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
    else if (value.equals("WorkspaceCategories")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])refineCategoryLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getRefineCategoryLabel(String value) {    
    if (false) {
    }
    else if (value.equals("None")) {
      return refineCategoryLabels[0];
    }
    else if (value.equals("Portal")) {
      return refineCategoryLabels[1];
    }
    else if (value.equals("Current")) {
      return refineCategoryLabels[2];
    }
    else if (value.equals("WorkspaceCategories")) {
      return refineCategoryLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineCategoryReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletNavigate obj = (PortletNavigate)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineCategory());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // levels
  // ----------------------------------------------------------------------  
  protected  int levels = 1;
  public int getLevels() { return levels; }
  public void setLevels(int v) { levels = v; }
  
  
  public static IntegerFormReport getLevelsReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletNavigate obj = (PortletNavigate)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getLevels();
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletNavigate.class, "hideWhenNoResults", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletNavigate obj = (PortletNavigate)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getHideWhenNoResults());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // navigatePortlet
  // ----------------------------------------------------------------------  
  protected  boolean navigatePortlet = true;
  public boolean getNavigatePortlet() { return navigatePortlet; }
  public void setNavigatePortlet(boolean v) { navigatePortlet = v; }
  
  
  public String getNavigatePortletLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "navigatePortlet", true);
    return navigatePortlet ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getNavigatePortletValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getNavigatePortletLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletNavigate.class, "navigatePortlet", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getNavigatePortletReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletNavigate obj = (PortletNavigate)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getNavigatePortlet());
      
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
  
  public TreeSet getRootCategory(Member member) {
    return getDescendantCategorySet(channel.getCategory("j_3"), true, member);
  }
  public Category getFirstRootCategory(Member member) {
    return getFirstDescendantCategory(channel.getCategory("j_3"), true, member);
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
    
    if (levels < 1 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "levels"), "1");
      return status;      
    }
    if (levels > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "levels"), "1000");
      return status;      
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletNavigate copy = (PortletNavigate)super.prepareMergeCopy();
    PortletNavigate main = (PortletNavigate)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// Wkq55ErENypLH3qQF7Q8+g==
