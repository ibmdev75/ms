// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:50 CET 2015
   
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
public  class PortletQueryForeachDetail extends generated.PortletQueryForeach 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletQueryForeachDetail() {}
 
 
  public PortletQueryForeachDetail(AbstractPortletSkinable other) {
    super(other);
  }
  public PortletQueryForeachDetail(PortletQueryForeach other) {
    super(other);
  }
 
  
  
  
  public PortletQueryForeachDetail(PortletQueryForeachDetail other) {
    super(other);
    showTitle = other.showTitle;
    showAbstract = other.showAbstract;
    showAuthor = other.showAuthor;
    showCategories = other.showCategories;
    showDate = other.showDate;
    showStatus = other.showStatus;
    showType = other.showType;
    showRights = other.showRights;
    showId = other.showId;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setShowTitle(ImportUtil.parseFieldBoolean(elt, "showTitle"));
    setShowAbstract(ImportUtil.parseFieldBoolean(elt, "showAbstract"));
    setShowAuthor(ImportUtil.parseFieldBoolean(elt, "showAuthor"));
    setShowCategories(ImportUtil.parseFieldBoolean(elt, "showCategories"));
    setShowDate(ImportUtil.parseFieldText(elt, "showDate"));
    setShowStatus(ImportUtil.parseFieldBoolean(elt, "showStatus"));
    setShowType(ImportUtil.parseFieldBoolean(elt, "showType"));
    setShowRights(ImportUtil.parseFieldBoolean(elt, "showRights"));
    setShowId(ImportUtil.parseFieldBoolean(elt, "showId"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "showTitle", getShowTitle()));
    sb.append(ExportUtil.exportField(indentLevel, "showAbstract", getShowAbstract()));
    sb.append(ExportUtil.exportField(indentLevel, "showAuthor", getShowAuthor()));
    sb.append(ExportUtil.exportField(indentLevel, "showCategories", getShowCategories()));
    sb.append(ExportUtil.exportField(indentLevel, "showDate", getShowDate(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "showStatus", getShowStatus()));
    sb.append(ExportUtil.exportField(indentLevel, "showType", getShowType()));
    sb.append(ExportUtil.exportField(indentLevel, "showRights", getShowRights()));
    sb.append(ExportUtil.exportField(indentLevel, "showId", getShowId()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletQueryForeachDetail</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletQueryForeachDetail.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeachDetail</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeachDetail</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeachDetail</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletQueryForeachDetail.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeachDetail</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeachDetail</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeachDetail</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletQueryForeachDetail.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("showTitle".equals(fieldName)) { return getShowTitle(); }
    if ("showAbstract".equals(fieldName)) { return getShowAbstract(); }
    if ("showAuthor".equals(fieldName)) { return getShowAuthor(); }
    if ("showCategories".equals(fieldName)) { return getShowCategories(); }
    if ("showStatus".equals(fieldName)) { return getShowStatus(); }
    if ("showType".equals(fieldName)) { return getShowType(); }
    if ("showRights".equals(fieldName)) { return getShowRights(); }
    if ("showId".equals(fieldName)) { return getShowId(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeachDetail</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("showTitle".equals(fieldName)) { setShowTitle(value); return; }
    if ("showAbstract".equals(fieldName)) { setShowAbstract(value); return; }
    if ("showAuthor".equals(fieldName)) { setShowAuthor(value); return; }
    if ("showCategories".equals(fieldName)) { setShowCategories(value); return; }
    if ("showStatus".equals(fieldName)) { setShowStatus(value); return; }
    if ("showType".equals(fieldName)) { setShowType(value); return; }
    if ("showRights".equals(fieldName)) { setShowRights(value); return; }
    if ("showId".equals(fieldName)) { setShowId(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletQueryForeachDetail</code>. <br>
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
    if ("showDate".equals(fieldName)) { return getShowDate(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletQueryForeachDetail</code>. <br>
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
    if ("showDate".equals(fieldName)) { setShowDate((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // showTitle
  // ----------------------------------------------------------------------  
  protected  boolean showTitle = true;
  public boolean getShowTitle() { return showTitle; }
  public void setShowTitle(boolean v) { showTitle = v; }
  
  
  public String getShowTitleLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showTitle", true);
    return showTitle ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowTitleValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowTitleLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showTitle", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowTitleReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowTitle());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showAbstract
  // ----------------------------------------------------------------------  
  protected  boolean showAbstract = false;
  public boolean getShowAbstract() { return showAbstract; }
  public void setShowAbstract(boolean v) { showAbstract = v; }
  
  
  public String getShowAbstractLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showAbstract", true);
    return showAbstract ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowAbstractValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowAbstractLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showAbstract", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowAbstractReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowAbstract());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showAuthor
  // ----------------------------------------------------------------------  
  protected  boolean showAuthor = false;
  public boolean getShowAuthor() { return showAuthor; }
  public void setShowAuthor(boolean v) { showAuthor = v; }
  
  
  public String getShowAuthorLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showAuthor", true);
    return showAuthor ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowAuthorValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowAuthorLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showAuthor", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowAuthorReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowAuthor());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showCategories
  // ----------------------------------------------------------------------  
  protected  boolean showCategories = false;
  public boolean getShowCategories() { return showCategories; }
  public void setShowCategories(boolean v) { showCategories = v; }
  
  
  public String getShowCategoriesLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showCategories", true);
    return showCategories ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowCategoriesValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowCategoriesLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showCategories", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowCategoriesReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowCategories());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showDate
  // ----------------------------------------------------------------------  
  protected  String showDate = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showDate", true).getDefaultTextString();
  public String getShowDate() { return showDate; }
  public void setShowDate(String v) { showDate = v; }
  
  
  public String getShowDate(String lang) { return showDate; }
  public String getShowDate(String lang, boolean useDefault) { return showDate; }
  public static String[] showDateValues = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showDate", true).getEnumerateValues();  
  public static String[] showDateLabels = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showDate", true).getEnumerateLabels();
  public static HashMap<String, String[]> showDateLabelMap = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showDate", true).getEnumerateLabelsMap();
  
  public static String[] getShowDateValues() {
    return showDateValues;
  }
  public static String[] getShowDateLabels(String userLang) {
    String[] labels = (String[])showDateLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])showDateLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getShowDateLabel(String value, String userLang) {
    String[] labels = getShowDateLabels(userLang);
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
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])showDateLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getShowDateLabel(String value) {    
    if (false) {
    }
    else if (value.equals("cdate")) {
      return showDateLabels[0];
    }
    else if (value.equals("udate")) {
      return showDateLabels[1];
    }
    else if (value.equals("mdate")) {
      return showDateLabels[2];
    }
    else if (value.equals("pdate")) {
      return showDateLabels[3];
    }
    else if (value.equals("edate")) {
      return showDateLabels[4];
    }
    return "???";
  }
  public static EnumerateFormReport getShowDateReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowDate());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showStatus
  // ----------------------------------------------------------------------  
  protected  boolean showStatus = false;
  public boolean getShowStatus() { return showStatus; }
  public void setShowStatus(boolean v) { showStatus = v; }
  
  
  public String getShowStatusLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showStatus", true);
    return showStatus ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowStatusValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowStatusLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showStatus", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowStatusReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowStatus());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showType
  // ----------------------------------------------------------------------  
  protected  boolean showType = false;
  public boolean getShowType() { return showType; }
  public void setShowType(boolean v) { showType = v; }
  
  
  public String getShowTypeLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showType", true);
    return showType ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowTypeValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowTypeLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showType", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowTypeReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowType());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showRights
  // ----------------------------------------------------------------------  
  protected  boolean showRights = false;
  public boolean getShowRights() { return showRights; }
  public void setShowRights(boolean v) { showRights = v; }
  
  
  public String getShowRightsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showRights", true);
    return showRights ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowRightsValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowRightsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showRights", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowRightsReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowRights());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showId
  // ----------------------------------------------------------------------  
  protected  boolean showId = false;
  public boolean getShowId() { return showId; }
  public void setShowId(boolean v) { showId = v; }
  
  
  public String getShowIdLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showId", true);
    return showId ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowIdValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowIdLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showId", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowIdReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletQueryForeachDetail obj = (PortletQueryForeachDetail)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowId());
      
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
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletQueryForeachDetail copy = (PortletQueryForeachDetail)super.prepareMergeCopy();
    PortletQueryForeachDetail main = (PortletQueryForeachDetail)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// mIoEGVw+SbYXe7V4yVIRfQ==
