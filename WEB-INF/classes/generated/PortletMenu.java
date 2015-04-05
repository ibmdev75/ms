// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:58 CET 2015
   
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
public  class PortletMenu extends generated.AbstractPortlet 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletMenu() {}
 
 
  public PortletMenu(AbstractPortlet other) {
    super(other);
  }
 
  
  
  
  public PortletMenu(PortletMenu other) {
    super(other);
    items = other.items;
    itemSeparaor = other.itemSeparaor;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setItems(ImportUtil.parseFieldTextArray(elt, "items"));
    setItemSeparaor(ImportUtil.parseFieldText(elt, "itemSeparaor"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "items", getItems(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "itemSeparaor", getItemSeparaor(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, itemSeparaor);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletMenu</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletMenu.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletMenu</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletMenu</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletMenu</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletMenu.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletMenu</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletMenu</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletMenu</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletMenu.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletMenu</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletMenu</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletMenu</code>. <br>
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
    if ("items".equals(fieldName)) { return getItems(); }
    if ("itemSeparaor".equals(fieldName)) { return getItemSeparaor(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletMenu</code>. <br>
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
    if ("items".equals(fieldName)) { setItems((String[])value); return; }
    if ("itemSeparaor".equals(fieldName)) { setItemSeparaor((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // items
  // ----------------------------------------------------------------------  
  protected  String[] items;
  public String[] getItems() { return items; }
  public void setItems(String[] v) { items = v; }
  
  
  public String[] getItems(String lang) { return items; }
  public String[] getItems(String lang, boolean useDefault) { return items; }
  public static String[] itemsValues = channel.getTypeFieldEntry(PortletMenu.class, "items", true).getEnumerateValues();  
  public static String[] itemsLabels = channel.getTypeFieldEntry(PortletMenu.class, "items", true).getEnumerateLabels();
  public static HashMap<String, String[]> itemsLabelMap = channel.getTypeFieldEntry(PortletMenu.class, "items", true).getEnumerateLabelsMap();
  
  public static String[] getItemsValues() {
    return itemsValues;
  }
  public static String[] getItemsLabels(String userLang) {
    String[] labels = (String[])itemsLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])itemsLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getItemsLabel(String value, String userLang) {
    String[] labels = getItemsLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Flag")) {
      i = 0;
    }
    else if (value.equals("FlagList")) {
      i = 1;
    }
    else if (value.equals("FlagMenu")) {
      i = 2;
    }
    else if (value.equals("LoggedMember")) {
      i = 3;
    }
    else if (value.equals("Date")) {
      i = 4;
    }
    else if (value.equals("Time")) {
      i = 5;
    }
    else if (value.equals("Space")) {
      i = 6;
    }
    else if (value.equals("Separator")) {
      i = 7;
    }
    else if (value.equals("Work")) {
      i = 8;
    }
    else if (value.equals("Admin")) {
      i = 9;
    }
    else if (value.equals("Home")) {
      i = 10;
    }
    else if (value.equals("SiteMap")) {
      i = 11;
    }
    else if (value.equals("Caddy")) {
      i = 12;
    }
    else if (value.equals("Login")) {
      i = 13;
    }
    else if (value.equals("Portal")) {
      i = 14;
    }
    else if (value.equals("Preview")) {
      i = 15;
    }
    else if (value.equals("UserManual")) {
      i = 16;
    }
    else if (value.equals("SwitchContext")) {
      i = 17;
    }
    else if (value.equals("Plugins")) {
      i = 18;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])itemsLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getItemsLabel(String value) {    
    if (false) {
    }
    else if (value.equals("Flag")) {
      return itemsLabels[0];
    }
    else if (value.equals("FlagList")) {
      return itemsLabels[1];
    }
    else if (value.equals("FlagMenu")) {
      return itemsLabels[2];
    }
    else if (value.equals("LoggedMember")) {
      return itemsLabels[3];
    }
    else if (value.equals("Date")) {
      return itemsLabels[4];
    }
    else if (value.equals("Time")) {
      return itemsLabels[5];
    }
    else if (value.equals("Space")) {
      return itemsLabels[6];
    }
    else if (value.equals("Separator")) {
      return itemsLabels[7];
    }
    else if (value.equals("Work")) {
      return itemsLabels[8];
    }
    else if (value.equals("Admin")) {
      return itemsLabels[9];
    }
    else if (value.equals("Home")) {
      return itemsLabels[10];
    }
    else if (value.equals("SiteMap")) {
      return itemsLabels[11];
    }
    else if (value.equals("Caddy")) {
      return itemsLabels[12];
    }
    else if (value.equals("Login")) {
      return itemsLabels[13];
    }
    else if (value.equals("Portal")) {
      return itemsLabels[14];
    }
    else if (value.equals("Preview")) {
      return itemsLabels[15];
    }
    else if (value.equals("UserManual")) {
      return itemsLabels[16];
    }
    else if (value.equals("SwitchContext")) {
      return itemsLabels[17];
    }
    else if (value.equals("Plugins")) {
      return itemsLabels[18];
    }
    return "???";
  }
  public static EnumerateFormReport getItemsReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletMenu obj = (PortletMenu)it.next();
      if (obj == null || obj.getItems() == null) {
        continue;
      }
      for(int i = 0; i < obj.getItems().length; i++) {
        if (obj.getItems()[i] != null) {
          map.inc(obj.getItems()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // itemSeparaor
  // ----------------------------------------------------------------------  
  protected  String itemSeparaor = channel.getTypeFieldEntry(PortletMenu.class, "itemSeparaor", true).getDefaultTextString();
  public String getItemSeparaor() { return itemSeparaor; }
  public void setItemSeparaor(String v) { itemSeparaor = v; }
  
  
  public String getItemSeparaor(String lang) { return itemSeparaor; }
  public String getItemSeparaor(String lang, boolean useDefault) { return itemSeparaor; }
   
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
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletMenu copy = (PortletMenu)super.prepareMergeCopy();
    PortletMenu main = (PortletMenu)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// oqb4iiauEUdbMvYJOsKfew==
