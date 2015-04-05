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
public  class PortletRSS extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletRSS() {}
 
 
  public PortletRSS(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletRSS(PortletRSS other) {
    super(other);
    source = other.source;
    showTitle = other.showTitle;
    showDescription = other.showDescription;
    showImage = other.showImage;
    showWebMastersEmail = other.showWebMastersEmail;
    showItemsDescription = other.showItemsDescription;
    openLinksInNewWindow = other.openLinksInNewWindow;
    trackingEnabled = other.trackingEnabled;
    refresh = other.refresh;
    maxItems = other.maxItems;
    skipFirstItems = other.skipFirstItems;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setSource(ImportUtil.parseFieldText(elt, "source"));
    setShowTitle(ImportUtil.parseFieldBoolean(elt, "showTitle"));
    setShowDescription(ImportUtil.parseFieldBoolean(elt, "showDescription"));
    setShowImage(ImportUtil.parseFieldBoolean(elt, "showImage"));
    setShowWebMastersEmail(ImportUtil.parseFieldBoolean(elt, "showWebMastersEmail"));
    setShowItemsDescription(ImportUtil.parseFieldBoolean(elt, "showItemsDescription"));
    setOpenLinksInNewWindow(ImportUtil.parseFieldBoolean(elt, "openLinksInNewWindow"));
    setTrackingEnabled(ImportUtil.parseFieldBoolean(elt, "trackingEnabled"));
    setRefresh(ImportUtil.parseFieldLong(elt, "refresh"));
    setMaxItems(ImportUtil.parseFieldInt(elt, "maxItems"));
    setSkipFirstItems(ImportUtil.parseFieldInt(elt, "skipFirstItems"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "source", getSource(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "showTitle", getShowTitle()));
    sb.append(ExportUtil.exportField(indentLevel, "showDescription", getShowDescription()));
    sb.append(ExportUtil.exportField(indentLevel, "showImage", getShowImage()));
    sb.append(ExportUtil.exportField(indentLevel, "showWebMastersEmail", getShowWebMastersEmail()));
    sb.append(ExportUtil.exportField(indentLevel, "showItemsDescription", getShowItemsDescription()));
    sb.append(ExportUtil.exportField(indentLevel, "openLinksInNewWindow", getOpenLinksInNewWindow()));
    sb.append(ExportUtil.exportField(indentLevel, "trackingEnabled", getTrackingEnabled()));
    sb.append(ExportUtil.exportField(indentLevel, "refresh", getRefresh()));
    sb.append(ExportUtil.exportField(indentLevel, "maxItems", getMaxItems()));
    sb.append(ExportUtil.exportField(indentLevel, "skipFirstItems", getSkipFirstItems()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletRSS</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletRSS.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletRSS</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletRSS</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletRSS</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletRSS.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletRSS</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletRSS</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletRSS</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletRSS.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("maxItems".equals(fieldName)) { return getMaxItems(); }
    if ("skipFirstItems".equals(fieldName)) { return getSkipFirstItems(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("maxItems".equals(fieldName)) { setMaxItems(value); return; }
    if ("skipFirstItems".equals(fieldName)) { setSkipFirstItems(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("refresh".equals(fieldName)) { return getRefresh(); }
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("refresh".equals(fieldName)) { setRefresh(value); return; }
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("showTitle".equals(fieldName)) { return getShowTitle(); }
    if ("showDescription".equals(fieldName)) { return getShowDescription(); }
    if ("showImage".equals(fieldName)) { return getShowImage(); }
    if ("showWebMastersEmail".equals(fieldName)) { return getShowWebMastersEmail(); }
    if ("showItemsDescription".equals(fieldName)) { return getShowItemsDescription(); }
    if ("openLinksInNewWindow".equals(fieldName)) { return getOpenLinksInNewWindow(); }
    if ("trackingEnabled".equals(fieldName)) { return getTrackingEnabled(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletRSS</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("showTitle".equals(fieldName)) { setShowTitle(value); return; }
    if ("showDescription".equals(fieldName)) { setShowDescription(value); return; }
    if ("showImage".equals(fieldName)) { setShowImage(value); return; }
    if ("showWebMastersEmail".equals(fieldName)) { setShowWebMastersEmail(value); return; }
    if ("showItemsDescription".equals(fieldName)) { setShowItemsDescription(value); return; }
    if ("openLinksInNewWindow".equals(fieldName)) { setOpenLinksInNewWindow(value); return; }
    if ("trackingEnabled".equals(fieldName)) { setTrackingEnabled(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletRSS</code>. <br>
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
    if ("source".equals(fieldName)) { return getSource(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletRSS</code>. <br>
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
    if ("source".equals(fieldName)) { setSource((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // source
  // ----------------------------------------------------------------------  
  protected  String source = channel.getTypeFieldEntry(PortletRSS.class, "source", true).getDefaultTextString();
  public String getSource() { return source; }
  public void setSource(String v) { source = v; }
  
  
  public String getSource(String lang) { return source; }
  public String getSource(String lang, boolean useDefault) { return source; }
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "showTitle", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowTitleReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowTitle());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showDescription
  // ----------------------------------------------------------------------  
  protected  boolean showDescription = true;
  public boolean getShowDescription() { return showDescription; }
  public void setShowDescription(boolean v) { showDescription = v; }
  
  
  public String getShowDescriptionLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showDescription", true);
    return showDescription ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowDescriptionValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowDescriptionLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "showDescription", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowDescriptionReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowDescription());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showImage
  // ----------------------------------------------------------------------  
  protected  boolean showImage = true;
  public boolean getShowImage() { return showImage; }
  public void setShowImage(boolean v) { showImage = v; }
  
  
  public String getShowImageLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showImage", true);
    return showImage ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowImageValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowImageLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "showImage", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowImageReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowImage());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showWebMastersEmail
  // ----------------------------------------------------------------------  
  protected  boolean showWebMastersEmail = false;
  public boolean getShowWebMastersEmail() { return showWebMastersEmail; }
  public void setShowWebMastersEmail(boolean v) { showWebMastersEmail = v; }
  
  
  public String getShowWebMastersEmailLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showWebMastersEmail", true);
    return showWebMastersEmail ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowWebMastersEmailValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowWebMastersEmailLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "showWebMastersEmail", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowWebMastersEmailReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowWebMastersEmail());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showItemsDescription
  // ----------------------------------------------------------------------  
  protected  boolean showItemsDescription = true;
  public boolean getShowItemsDescription() { return showItemsDescription; }
  public void setShowItemsDescription(boolean v) { showItemsDescription = v; }
  
  
  public String getShowItemsDescriptionLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showItemsDescription", true);
    return showItemsDescription ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowItemsDescriptionValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowItemsDescriptionLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "showItemsDescription", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowItemsDescriptionReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowItemsDescription());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // openLinksInNewWindow
  // ----------------------------------------------------------------------  
  protected  boolean openLinksInNewWindow = false;
  public boolean getOpenLinksInNewWindow() { return openLinksInNewWindow; }
  public void setOpenLinksInNewWindow(boolean v) { openLinksInNewWindow = v; }
  
  
  public String getOpenLinksInNewWindowLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "openLinksInNewWindow", true);
    return openLinksInNewWindow ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getOpenLinksInNewWindowValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getOpenLinksInNewWindowLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "openLinksInNewWindow", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getOpenLinksInNewWindowReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getOpenLinksInNewWindow());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // trackingEnabled
  // ----------------------------------------------------------------------  
  protected  boolean trackingEnabled = false;
  public boolean getTrackingEnabled() { return trackingEnabled; }
  public void setTrackingEnabled(boolean v) { trackingEnabled = v; }
  
  
  public String getTrackingEnabledLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "trackingEnabled", true);
    return trackingEnabled ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getTrackingEnabledValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getTrackingEnabledLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletRSS.class, "trackingEnabled", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getTrackingEnabledReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getTrackingEnabled());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // refresh
  // ----------------------------------------------------------------------  
  protected  long refresh = 86400;
  public long getRefresh() { return refresh; }
  public void setRefresh(long v) { refresh = v; }
  
  
  // ----------------------------------------------------------------------
  // maxItems
  // ----------------------------------------------------------------------  
  protected  int maxItems = 10;
  public int getMaxItems() { return maxItems; }
  public void setMaxItems(int v) { maxItems = v; }
  
  
  public static IntegerFormReport getMaxItemsReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getMaxItems();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // skipFirstItems
  // ----------------------------------------------------------------------  
  protected  int skipFirstItems = 0;
  public int getSkipFirstItems() { return skipFirstItems; }
  public void setSkipFirstItems(int v) { skipFirstItems = v; }
  
  
  public static IntegerFormReport getSkipFirstItemsReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletRSS obj = (PortletRSS)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getSkipFirstItems();
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
  public void setAbstract(String lang, String value) { setSource(value); }
  @Override
  public String getAbstract() { return source; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getSource(lang, useDefault); }
   
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
    
    if (Util.isEmpty(getFieldInMainLanguage(source, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "source"), null);
      return status;
    }
    if (maxItems < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "maxItems"), "0");
      return status;      
    }
    if (skipFirstItems < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "skipFirstItems"), "0");
      return status;      
    }
    return ControllerStatus.OK;
  }
  
  public Set getExternalLinkSet() {
    Set set = super.getExternalLinkSet();
   
    if (Util.notEmpty(source)) {
      set.add(source);
    }
    String prefixUrl = channel.getUrl();
    for(Iterator it = set.iterator(); it.hasNext();) {
      String url = (String)it.next();
      if (url.startsWith(prefixUrl)) {
        it.remove();
      }
    }
    
    return set;
  }
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    PortletRSS copy = (PortletRSS)super.prepareMergeCopy();
    PortletRSS main = (PortletRSS)mainInstance;
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// ZKvSX5072w5OEaWYvYmE1w==
