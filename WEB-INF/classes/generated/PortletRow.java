// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:15 CET 2015
   
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
public  class PortletRow extends generated.AbstractCollection 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletRow() {}
 
 
  public PortletRow(AbstractCollection other) {
    super(other);
  }
 
  
  
  
  public PortletRow(PortletRow other) {
    super(other);
    rowSpacing = other.rowSpacing;
    cellWidth = other.cellWidth;
    alignHorizontal = other.alignHorizontal;
    alignVertical = other.alignVertical;
    backgroundColor = other.backgroundColor;
    backgroundImage = other.backgroundImage;
    backgroundRepeat = other.backgroundRepeat;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setRowSpacing(ImportUtil.parseFieldInt(elt, "rowSpacing"));
    setCellWidth(ImportUtil.parseFieldTextArray(elt, "cellWidth"));
    setAlignHorizontal(ImportUtil.parseFieldTextArray(elt, "alignHorizontal"));
    setAlignVertical(ImportUtil.parseFieldTextArray(elt, "alignVertical"));
    setBackgroundColor(ImportUtil.parseFieldTextArray(elt, "backgroundColor"));
    setBackgroundImage(ImportUtil.parseFieldTextArray(elt, "backgroundImage"));
    setBackgroundRepeat(ImportUtil.parseFieldTextArray(elt, "backgroundRepeat"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "rowSpacing", getRowSpacing()));
    sb.append(ExportUtil.exportField(indentLevel, "cellWidth", getCellWidth(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignHorizontal", getAlignHorizontal(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignVertical", getAlignVertical(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backgroundColor", getBackgroundColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backgroundImage", getBackgroundImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backgroundRepeat", getBackgroundRepeat(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, backgroundImage);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletRow</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletRow.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletRow</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletRow</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletRow</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletRow.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletRow</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletRow</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletRow</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletRow.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("rowSpacing".equals(fieldName)) { return getRowSpacing(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("rowSpacing".equals(fieldName)) { setRowSpacing(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletRow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletRow</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletRow</code>. <br>
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
    if ("cellWidth".equals(fieldName)) { return getCellWidth(); }
    if ("alignHorizontal".equals(fieldName)) { return getAlignHorizontal(); }
    if ("alignVertical".equals(fieldName)) { return getAlignVertical(); }
    if ("backgroundColor".equals(fieldName)) { return getBackgroundColor(); }
    if ("backgroundImage".equals(fieldName)) { return getBackgroundImage(); }
    if ("backgroundRepeat".equals(fieldName)) { return getBackgroundRepeat(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletRow</code>. <br>
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
    if ("cellWidth".equals(fieldName)) { setCellWidth((String[])value); return; }
    if ("alignHorizontal".equals(fieldName)) { setAlignHorizontal((String[])value); return; }
    if ("alignVertical".equals(fieldName)) { setAlignVertical((String[])value); return; }
    if ("backgroundColor".equals(fieldName)) { setBackgroundColor((String[])value); return; }
    if ("backgroundImage".equals(fieldName)) { setBackgroundImage((String[])value); return; }
    if ("backgroundRepeat".equals(fieldName)) { setBackgroundRepeat((String[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // rowSpacing
  // ----------------------------------------------------------------------  
  protected  int rowSpacing = 0;
  public int getRowSpacing() { return rowSpacing; }
  public void setRowSpacing(int v) { rowSpacing = v; }
  
  
  public static IntegerFormReport getRowSpacingReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRow obj = (PortletRow)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getRowSpacing();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // cellWidth
  // ----------------------------------------------------------------------  
  protected  String[] cellWidth;
  public String[] getCellWidth() { return cellWidth; }
  public void setCellWidth(String[] v) { cellWidth = v; }
  
  
  public String[] getCellWidth(String lang) { return cellWidth; }
  public String[] getCellWidth(String lang, boolean useDefault) { return cellWidth; }
  // ----------------------------------------------------------------------
  // alignHorizontal
  // ----------------------------------------------------------------------  
  protected  String[] alignHorizontal;
  public String[] getAlignHorizontal() { return alignHorizontal; }
  public void setAlignHorizontal(String[] v) { alignHorizontal = v; }
  
  
  public String[] getAlignHorizontal(String lang) { return alignHorizontal; }
  public String[] getAlignHorizontal(String lang, boolean useDefault) { return alignHorizontal; }
  public static String[] alignHorizontalValues = channel.getTypeFieldEntry(PortletRow.class, "alignHorizontal", true).getEnumerateValues();  
  public static String[] alignHorizontalLabels = channel.getTypeFieldEntry(PortletRow.class, "alignHorizontal", true).getEnumerateLabels();
  public static HashMap<String, String[]> alignHorizontalLabelMap = channel.getTypeFieldEntry(PortletRow.class, "alignHorizontal", true).getEnumerateLabelsMap();
  
  public static String[] getAlignHorizontalValues() {
    return alignHorizontalValues;
  }
  public static String[] getAlignHorizontalLabels(String userLang) {
    String[] labels = (String[])alignHorizontalLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])alignHorizontalLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignHorizontalLabel(String value, String userLang) {
    String[] labels = getAlignHorizontalLabels(userLang);
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
    return ((String[])alignHorizontalLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getAlignHorizontalLabel(String value) {    
    if (false) {
    }
    else if (value.equals("center")) {
      return alignHorizontalLabels[0];
    }
    else if (value.equals("left")) {
      return alignHorizontalLabels[1];
    }
    else if (value.equals("right")) {
      return alignHorizontalLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignHorizontalReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRow obj = (PortletRow)it.next();
      if (obj == null || obj.getAlignHorizontal() == null) {
        continue;
      }
      for(int i = 0; i < obj.getAlignHorizontal().length; i++) {
        if (obj.getAlignHorizontal()[i] != null) {
          map.inc(obj.getAlignHorizontal()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // alignVertical
  // ----------------------------------------------------------------------  
  protected  String[] alignVertical;
  public String[] getAlignVertical() { return alignVertical; }
  public void setAlignVertical(String[] v) { alignVertical = v; }
  
  
  public String[] getAlignVertical(String lang) { return alignVertical; }
  public String[] getAlignVertical(String lang, boolean useDefault) { return alignVertical; }
  public static String[] alignVerticalValues = channel.getTypeFieldEntry(PortletRow.class, "alignVertical", true).getEnumerateValues();  
  public static String[] alignVerticalLabels = channel.getTypeFieldEntry(PortletRow.class, "alignVertical", true).getEnumerateLabels();
  public static HashMap<String, String[]> alignVerticalLabelMap = channel.getTypeFieldEntry(PortletRow.class, "alignVertical", true).getEnumerateLabelsMap();
  
  public static String[] getAlignVerticalValues() {
    return alignVerticalValues;
  }
  public static String[] getAlignVerticalLabels(String userLang) {
    String[] labels = (String[])alignVerticalLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])alignVerticalLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignVerticalLabel(String value, String userLang) {
    String[] labels = getAlignVerticalLabels(userLang);
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
    else if (value.equals("baseline")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])alignVerticalLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getAlignVerticalLabel(String value) {    
    if (false) {
    }
    else if (value.equals("middle")) {
      return alignVerticalLabels[0];
    }
    else if (value.equals("top")) {
      return alignVerticalLabels[1];
    }
    else if (value.equals("bottom")) {
      return alignVerticalLabels[2];
    }
    else if (value.equals("baseline")) {
      return alignVerticalLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignVerticalReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRow obj = (PortletRow)it.next();
      if (obj == null || obj.getAlignVertical() == null) {
        continue;
      }
      for(int i = 0; i < obj.getAlignVertical().length; i++) {
        if (obj.getAlignVertical()[i] != null) {
          map.inc(obj.getAlignVertical()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // backgroundColor
  // ----------------------------------------------------------------------  
  protected  String[] backgroundColor;
  public String[] getBackgroundColor() { return backgroundColor; }
  public void setBackgroundColor(String[] v) { backgroundColor = v; }
  
  
  public String[] getBackgroundColor(String lang) { return backgroundColor; }
  public String[] getBackgroundColor(String lang, boolean useDefault) { return backgroundColor; }
  // ----------------------------------------------------------------------
  // backgroundImage
  // ----------------------------------------------------------------------  
  protected  String[] backgroundImage;
  public String[] getBackgroundImage() { return backgroundImage; }
  public void setBackgroundImage(String[] v) { backgroundImage = v; }
  
  
  public String[] getBackgroundImage(String lang) { return backgroundImage; }
  public String[] getBackgroundImage(String lang, boolean useDefault) { return backgroundImage; }
  // ----------------------------------------------------------------------
  // backgroundRepeat
  // ----------------------------------------------------------------------  
  protected  String[] backgroundRepeat;
  public String[] getBackgroundRepeat() { return backgroundRepeat; }
  public void setBackgroundRepeat(String[] v) { backgroundRepeat = v; }
  
  
  public String[] getBackgroundRepeat(String lang) { return backgroundRepeat; }
  public String[] getBackgroundRepeat(String lang, boolean useDefault) { return backgroundRepeat; }
  public static String[] backgroundRepeatValues = channel.getTypeFieldEntry(PortletRow.class, "backgroundRepeat", true).getEnumerateValues();  
  public static String[] backgroundRepeatLabels = channel.getTypeFieldEntry(PortletRow.class, "backgroundRepeat", true).getEnumerateLabels();
  public static HashMap<String, String[]> backgroundRepeatLabelMap = channel.getTypeFieldEntry(PortletRow.class, "backgroundRepeat", true).getEnumerateLabelsMap();
  
  public static String[] getBackgroundRepeatValues() {
    return backgroundRepeatValues;
  }
  public static String[] getBackgroundRepeatLabels(String userLang) {
    String[] labels = (String[])backgroundRepeatLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])backgroundRepeatLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getBackgroundRepeatLabel(String value, String userLang) {
    String[] labels = getBackgroundRepeatLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("repeat-x")) {
      i = 0;
    }
    else if (value.equals("repeat-y")) {
      i = 1;
    }
    else if (value.equals("no-repeat")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])backgroundRepeatLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getBackgroundRepeatLabel(String value) {    
    if (false) {
    }
    else if (value.equals("repeat-x")) {
      return backgroundRepeatLabels[0];
    }
    else if (value.equals("repeat-y")) {
      return backgroundRepeatLabels[1];
    }
    else if (value.equals("no-repeat")) {
      return backgroundRepeatLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getBackgroundRepeatReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRow obj = (PortletRow)it.next();
      if (obj == null || obj.getBackgroundRepeat() == null) {
        continue;
      }
      for(int i = 0; i < obj.getBackgroundRepeat().length; i++) {
        if (obj.getBackgroundRepeat()[i] != null) {
          map.inc(obj.getBackgroundRepeat()[i]);
        }
      }
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
    JcmsUtil.addData(set, clazz, getChildren());
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
    
    if (rowSpacing < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "rowSpacing"), "0");
      return status;      
    }
    if (rowSpacing > 500 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "rowSpacing"), "500");
      return status;      
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletRow copy = (PortletRow)super.prepareMergeCopy();
    PortletRow main = (PortletRow)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// KPk4aCXgFnDyknKzVjU7SQ==
