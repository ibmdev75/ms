// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:51 CET 2015
   
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
public  class PortletLoggedMembers extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletLoggedMembers() {}
 
 
  public PortletLoggedMembers(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletLoggedMembers(PortletLoggedMembers other) {
    super(other);
    limitPortletAccess = other.limitPortletAccess;
    displayNumbers = other.displayNumbers;
    displayMembers = other.displayMembers;
    displayLinkToMembersProfile = other.displayLinkToMembersProfile;
    maximumMembers = other.maximumMembers;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setLimitPortletAccess(ImportUtil.parseFieldBoolean(elt, "limitPortletAccess"));
    setDisplayNumbers(ImportUtil.parseFieldBoolean(elt, "displayNumbers"));
    setDisplayMembers(ImportUtil.parseFieldText(elt, "displayMembers"));
    setDisplayLinkToMembersProfile(ImportUtil.parseFieldBoolean(elt, "displayLinkToMembersProfile"));
    setMaximumMembers(ImportUtil.parseFieldInt(elt, "maximumMembers"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "limitPortletAccess", getLimitPortletAccess()));
    sb.append(ExportUtil.exportField(indentLevel, "displayNumbers", getDisplayNumbers()));
    sb.append(ExportUtil.exportField(indentLevel, "displayMembers", getDisplayMembers(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "displayLinkToMembersProfile", getDisplayLinkToMembersProfile()));
    sb.append(ExportUtil.exportField(indentLevel, "maximumMembers", getMaximumMembers()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletLoggedMembers</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletLoggedMembers.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletLoggedMembers</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletLoggedMembers</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletLoggedMembers</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletLoggedMembers.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletLoggedMembers</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletLoggedMembers</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletLoggedMembers</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletLoggedMembers.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("maximumMembers".equals(fieldName)) { return getMaximumMembers(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("maximumMembers".equals(fieldName)) { setMaximumMembers(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("limitPortletAccess".equals(fieldName)) { return getLimitPortletAccess(); }
    if ("displayNumbers".equals(fieldName)) { return getDisplayNumbers(); }
    if ("displayLinkToMembersProfile".equals(fieldName)) { return getDisplayLinkToMembersProfile(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletLoggedMembers</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("limitPortletAccess".equals(fieldName)) { setLimitPortletAccess(value); return; }
    if ("displayNumbers".equals(fieldName)) { setDisplayNumbers(value); return; }
    if ("displayLinkToMembersProfile".equals(fieldName)) { setDisplayLinkToMembersProfile(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletLoggedMembers</code>. <br>
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
    if ("displayMembers".equals(fieldName)) { return getDisplayMembers(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletLoggedMembers</code>. <br>
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
    if ("displayMembers".equals(fieldName)) { setDisplayMembers((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // limitPortletAccess
  // ----------------------------------------------------------------------  
  protected  boolean limitPortletAccess = false;
  public boolean getLimitPortletAccess() { return limitPortletAccess; }
  public void setLimitPortletAccess(boolean v) { limitPortletAccess = v; }
  
  
  public String getLimitPortletAccessLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "limitPortletAccess", true);
    return limitPortletAccess ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getLimitPortletAccessValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getLimitPortletAccessLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletLoggedMembers.class, "limitPortletAccess", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getLimitPortletAccessReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletLoggedMembers obj = (PortletLoggedMembers)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getLimitPortletAccess());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayNumbers
  // ----------------------------------------------------------------------  
  protected  boolean displayNumbers = true;
  public boolean getDisplayNumbers() { return displayNumbers; }
  public void setDisplayNumbers(boolean v) { displayNumbers = v; }
  
  
  public String getDisplayNumbersLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayNumbers", true);
    return displayNumbers ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayNumbersValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayNumbersLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayNumbers", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayNumbersReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletLoggedMembers obj = (PortletLoggedMembers)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayNumbers());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayMembers
  // ----------------------------------------------------------------------  
  protected  String displayMembers = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayMembers", true).getDefaultTextString();
  public String getDisplayMembers() { return displayMembers; }
  public void setDisplayMembers(String v) { displayMembers = v; }
  
  
  public String getDisplayMembers(String lang) { return displayMembers; }
  public String getDisplayMembers(String lang, boolean useDefault) { return displayMembers; }
  public static String[] displayMembersValues = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayMembers", true).getEnumerateValues();  
  public static String[] displayMembersLabels = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayMembers", true).getEnumerateLabels();
  public static HashMap<String, String[]> displayMembersLabelMap = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayMembers", true).getEnumerateLabelsMap();
  
  public static String[] getDisplayMembersValues() {
    return displayMembersValues;
  }
  public static String[] getDisplayMembersLabels(String userLang) {
    String[] labels = (String[])displayMembersLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])displayMembersLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getDisplayMembersLabel(String value, String userLang) {
    String[] labels = getDisplayMembersLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("none")) {
      i = 0;
    }
    else if (value.equals("all")) {
      i = 1;
    }
    else if (value.equals("currentWorkspace")) {
      i = 2;
    }
    else if (value.equals("loggedMemberWorkspace")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])displayMembersLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getDisplayMembersLabel(String value) {    
    if (false) {
    }
    else if (value.equals("none")) {
      return displayMembersLabels[0];
    }
    else if (value.equals("all")) {
      return displayMembersLabels[1];
    }
    else if (value.equals("currentWorkspace")) {
      return displayMembersLabels[2];
    }
    else if (value.equals("loggedMemberWorkspace")) {
      return displayMembersLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getDisplayMembersReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletLoggedMembers obj = (PortletLoggedMembers)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayMembers());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayLinkToMembersProfile
  // ----------------------------------------------------------------------  
  protected  boolean displayLinkToMembersProfile = true;
  public boolean getDisplayLinkToMembersProfile() { return displayLinkToMembersProfile; }
  public void setDisplayLinkToMembersProfile(boolean v) { displayLinkToMembersProfile = v; }
  
  
  public String getDisplayLinkToMembersProfileLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayLinkToMembersProfile", true);
    return displayLinkToMembersProfile ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayLinkToMembersProfileValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayLinkToMembersProfileLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletLoggedMembers.class, "displayLinkToMembersProfile", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayLinkToMembersProfileReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletLoggedMembers obj = (PortletLoggedMembers)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayLinkToMembersProfile());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // maximumMembers
  // ----------------------------------------------------------------------  
  protected  int maximumMembers = 10;
  public int getMaximumMembers() { return maximumMembers; }
  public void setMaximumMembers(int v) { maximumMembers = v; }
  
  
  public static IntegerFormReport getMaximumMembersReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletLoggedMembers obj = (PortletLoggedMembers)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getMaximumMembers();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setDisplayMembers(value); }
  @Override
  public String getAbstract() { return displayMembers; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDisplayMembers(lang, useDefault); }
   
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
    
    if (Util.isEmpty(getFieldInMainLanguage(displayMembers, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "displayMembers"), null);
      return status;
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletLoggedMembers copy = (PortletLoggedMembers)super.prepareMergeCopy();
    PortletLoggedMembers main = (PortletLoggedMembers)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// OJ62sUV3aVK5nPAM4CrMwA==
