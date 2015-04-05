// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:59 CET 2015
   
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
public  class PortletStatMetrics extends generated.AbstractPortletStat 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletStatMetrics() {}
 
 
  public PortletStatMetrics(AbstractPortletSkinable other) {
    super(other);
  }
  public PortletStatMetrics(AbstractPortletStat other) {
    super(other);
  }
 
  
  
  
  public PortletStatMetrics(PortletStatMetrics other) {
    super(other);
    statListener = other.statListener;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setStatListener(ImportUtil.parseFieldText(elt, "statListener"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "statListener", getStatListener(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletStatMetrics</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletStatMetrics.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletStatMetrics</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletStatMetrics</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletStatMetrics</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletStatMetrics.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletStatMetrics</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletStatMetrics</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletStatMetrics</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletStatMetrics.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletStatMetrics</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletStatMetrics</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletStatMetrics</code>. <br>
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
    if ("statListener".equals(fieldName)) { return getStatListener(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletStatMetrics</code>. <br>
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
    if ("statListener".equals(fieldName)) { setStatListener((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // statListener
  // ----------------------------------------------------------------------  
  protected  String statListener = channel.getTypeFieldEntry(PortletStatMetrics.class, "statListener", true).getDefaultTextString();
  public String getStatListener() { return statListener; }
  public void setStatListener(String v) { statListener = v; }
  
  
  public String getStatListener(String lang) { return statListener; }
  public String getStatListener(String lang, boolean useDefault) { return statListener; }
  public static String[] statListenerValues = channel.getTypeFieldEntry(PortletStatMetrics.class, "statListener", true).getEnumerateValues();  
  public static String[] statListenerLabels = channel.getTypeFieldEntry(PortletStatMetrics.class, "statListener", true).getEnumerateLabels();
  public static HashMap<String, String[]> statListenerLabelMap = channel.getTypeFieldEntry(PortletStatMetrics.class, "statListener", true).getEnumerateLabelsMap();
  
  public static String[] getStatListenerValues() {
    return statListenerValues;
  }
  public static String[] getStatListenerLabels(String userLang) {
    String[] labels = (String[])statListenerLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])statListenerLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getStatListenerLabel(String value, String userLang) {
    String[] labels = getStatListenerLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("custom.stat.LanguageListener")) {
      i = 0;
    }
    else if (value.equals("custom.stat.CountryListener")) {
      i = 1;
    }
    else if (value.equals("custom.stat.OSListener")) {
      i = 2;
    }
    else if (value.equals("custom.stat.BrowserListener")) {
      i = 3;
    }
    else if (value.equals("custom.stat.BotListener")) {
      i = 4;
    }
    else if (value.equals("custom.stat.ContentListener")) {
      i = 5;
    }
    else if (value.equals("custom.stat.SyndicateListener")) {
      i = 6;
    }
    else if (value.equals("custom.stat.DownloadListener")) {
      i = 7;
    }
    else if (value.equals("custom.stat.MailFriendListener")) {
      i = 8;
    }
    else if (value.equals("custom.stat.PrintViewListener")) {
      i = 9;
    }
    else if (value.equals("custom.stat.NavigateListener")) {
      i = 10;
    }
    else if (value.equals("custom.stat.PortalListener")) {
      i = 11;
    }
    else if (value.equals("custom.stat.PortalVisitorListener")) {
      i = 12;
    }
    else if (value.equals("custom.stat.PortalRedirectListener")) {
      i = 13;
    }
    else if (value.equals("custom.stat.RefererListener")) {
      i = 14;
    }
    else if (value.equals("custom.stat.RefererInternalListener")) {
      i = 15;
    }
    else if (value.equals("custom.stat.UrlListener")) {
      i = 16;
    }
    else if (value.equals("custom.stat.NameListener")) {
      i = 17;
    }
    else if (value.equals("custom.stat.FirstInternalNameListener")) {
      i = 18;
    }
    else if (value.equals("custom.stat.AreaListener")) {
      i = 19;
    }
    else if (value.equals("custom.stat.SingleAreaListener")) {
      i = 20;
    }
    else if (value.equals("custom.stat.VisitorListener")) {
      i = 21;
    }
    else if (value.equals("custom.stat.MemberListener")) {
      i = 22;
    }
    else if (value.equals("custom.stat.GroupListener")) {
      i = 23;
    }
    else if (value.equals("custom.stat.SummaryListener")) {
      i = 24;
    }
    else if (value.equals("custom.stat.SearchListener")) {
      i = 25;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])statListenerLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getStatListenerLabel(String value) {    
    if (false) {
    }
    else if (value.equals("custom.stat.LanguageListener")) {
      return statListenerLabels[0];
    }
    else if (value.equals("custom.stat.CountryListener")) {
      return statListenerLabels[1];
    }
    else if (value.equals("custom.stat.OSListener")) {
      return statListenerLabels[2];
    }
    else if (value.equals("custom.stat.BrowserListener")) {
      return statListenerLabels[3];
    }
    else if (value.equals("custom.stat.BotListener")) {
      return statListenerLabels[4];
    }
    else if (value.equals("custom.stat.ContentListener")) {
      return statListenerLabels[5];
    }
    else if (value.equals("custom.stat.SyndicateListener")) {
      return statListenerLabels[6];
    }
    else if (value.equals("custom.stat.DownloadListener")) {
      return statListenerLabels[7];
    }
    else if (value.equals("custom.stat.MailFriendListener")) {
      return statListenerLabels[8];
    }
    else if (value.equals("custom.stat.PrintViewListener")) {
      return statListenerLabels[9];
    }
    else if (value.equals("custom.stat.NavigateListener")) {
      return statListenerLabels[10];
    }
    else if (value.equals("custom.stat.PortalListener")) {
      return statListenerLabels[11];
    }
    else if (value.equals("custom.stat.PortalVisitorListener")) {
      return statListenerLabels[12];
    }
    else if (value.equals("custom.stat.PortalRedirectListener")) {
      return statListenerLabels[13];
    }
    else if (value.equals("custom.stat.RefererListener")) {
      return statListenerLabels[14];
    }
    else if (value.equals("custom.stat.RefererInternalListener")) {
      return statListenerLabels[15];
    }
    else if (value.equals("custom.stat.UrlListener")) {
      return statListenerLabels[16];
    }
    else if (value.equals("custom.stat.NameListener")) {
      return statListenerLabels[17];
    }
    else if (value.equals("custom.stat.FirstInternalNameListener")) {
      return statListenerLabels[18];
    }
    else if (value.equals("custom.stat.AreaListener")) {
      return statListenerLabels[19];
    }
    else if (value.equals("custom.stat.SingleAreaListener")) {
      return statListenerLabels[20];
    }
    else if (value.equals("custom.stat.VisitorListener")) {
      return statListenerLabels[21];
    }
    else if (value.equals("custom.stat.MemberListener")) {
      return statListenerLabels[22];
    }
    else if (value.equals("custom.stat.GroupListener")) {
      return statListenerLabels[23];
    }
    else if (value.equals("custom.stat.SummaryListener")) {
      return statListenerLabels[24];
    }
    else if (value.equals("custom.stat.SearchListener")) {
      return statListenerLabels[25];
    }
    return "???";
  }
  public static EnumerateFormReport getStatListenerReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletStatMetrics obj = (PortletStatMetrics)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getStatListener());
      
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
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletStatMetrics copy = (PortletStatMetrics)super.prepareMergeCopy();
    PortletStatMetrics main = (PortletStatMetrics)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// QccLaoCp+4DkyipadmJ+Bw==
