// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:08 CET 2015
   
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
public  class PortletImage extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletImage() {}
 
 
  public PortletImage(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletImage(PortletImage other) {
    super(other);
    image = other.image;
    imageML = other.imageML;
    link = other.link;
    linkML = other.linkML;
    alt = other.alt;
    altML = other.altML;
    targetWindow = other.targetWindow;
    imgWidth = other.imgWidth;
    imgHeight = other.imgHeight;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setImage(ImportUtil.parseFieldText(elt, "image"));
    setImageML(ImportUtil.parseFieldTextML(elt, "imageML"));
    setLink(ImportUtil.parseFieldText(elt, "link"));
    setLinkML(ImportUtil.parseFieldTextML(elt, "linkML"));
    setAlt(ImportUtil.parseFieldText(elt, "alt"));
    setAltML(ImportUtil.parseFieldTextML(elt, "altML"));
    setTargetWindow(ImportUtil.parseFieldText(elt, "targetWindow"));
    setImgWidth(ImportUtil.parseFieldInt(elt, "imgWidth"));
    setImgHeight(ImportUtil.parseFieldInt(elt, "imgHeight"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "image", getImage(), "imageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "imageML", getImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "link", getLink(), "linkML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "linkML", getLinkML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "alt", getAlt(), "altML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "altML", getAltML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "targetWindow", getTargetWindow(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "imgWidth", getImgWidth()));
    sb.append(ExportUtil.exportField(indentLevel, "imgHeight", getImgHeight()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, image, imageML);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletImage</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletImage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletImage</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletImage</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletImage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletImage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletImage</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletImage</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletImage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletImage.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("imgWidth".equals(fieldName)) { return getImgWidth(); }
    if ("imgHeight".equals(fieldName)) { return getImgHeight(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("imgWidth".equals(fieldName)) { setImgWidth(value); return; }
    if ("imgHeight".equals(fieldName)) { setImgHeight(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletImage</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletImage</code>. <br>
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
    if ("image".equals(fieldName)) { return getImage(lang, useDefault); }
    if ("link".equals(fieldName)) { return getLink(lang, useDefault); }
    if ("alt".equals(fieldName)) { return getAlt(lang, useDefault); }
    if ("targetWindow".equals(fieldName)) { return getTargetWindow(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletImage</code>. <br>
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
    if ("image".equals(fieldName)) { setImage(lang,(String)value); return; }
    if ("link".equals(fieldName)) { setLink(lang,(String)value); return; }
    if ("alt".equals(fieldName)) { setAlt(lang,(String)value); return; }
    if ("targetWindow".equals(fieldName)) { setTargetWindow((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------  
  protected  String image = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextString();
  public String getImage() { return image; }
  public void setImage(String v) { image = v; }
  
  
  protected HashMap imageML = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextMap();
  public String getImage(String lang) { return (String)channel.getLangValue(lang, true, image, imageML, getMainLanguage()); }
  public String getImage(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, image, imageML, getMainLanguage()); }
  public HashMap getImageML() { return imageML; }
  public void setImageML(HashMap v) { imageML = v; }
  /**
   * Convenient method to set the value of the Image field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setImage(String)} or {@link #setImageML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setImage(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      image = value;
      return;
    }
    if (imageML == null) {
      imageML = new HashMap();
    } else if (this != channel.getData(id)) {
      imageML = new HashMap<String,String>(imageML);
    }
    imageML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // link
  // ----------------------------------------------------------------------  
  protected  String link = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextString();
  public String getLink() { return link; }
  public void setLink(String v) { link = v; }
  
  
  protected HashMap linkML = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextMap();
  public String getLink(String lang) { return (String)channel.getLangValue(lang, true, link, linkML, getMainLanguage()); }
  public String getLink(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, link, linkML, getMainLanguage()); }
  public HashMap getLinkML() { return linkML; }
  public void setLinkML(HashMap v) { linkML = v; }
  /**
   * Convenient method to set the value of the Link field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setLink(String)} or {@link #setLinkML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setLink(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      link = value;
      return;
    }
    if (linkML == null) {
      linkML = new HashMap();
    } else if (this != channel.getData(id)) {
      linkML = new HashMap<String,String>(linkML);
    }
    linkML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // alt
  // ----------------------------------------------------------------------  
  protected  String alt = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextString();
  public String getAlt() { return alt; }
  public void setAlt(String v) { alt = v; }
  
  
  protected HashMap altML = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextMap();
  public String getAlt(String lang) { return (String)channel.getLangValue(lang, true, alt, altML, getMainLanguage()); }
  public String getAlt(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, alt, altML, getMainLanguage()); }
  public HashMap getAltML() { return altML; }
  public void setAltML(HashMap v) { altML = v; }
  /**
   * Convenient method to set the value of the Alt field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setAlt(String)} or {@link #setAltML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setAlt(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      alt = value;
      return;
    }
    if (altML == null) {
      altML = new HashMap();
    } else if (this != channel.getData(id)) {
      altML = new HashMap<String,String>(altML);
    }
    altML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // targetWindow
  // ----------------------------------------------------------------------  
  protected  String targetWindow = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getDefaultTextString();
  public String getTargetWindow() { return targetWindow; }
  public void setTargetWindow(String v) { targetWindow = v; }
  
  
  public String getTargetWindow(String lang) { return targetWindow; }
  public String getTargetWindow(String lang, boolean useDefault) { return targetWindow; }
  public static String[] targetWindowValues = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getEnumerateValues();  
  public static String[] targetWindowLabels = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getEnumerateLabels();
  public static HashMap<String, String[]> targetWindowLabelMap = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getEnumerateLabelsMap();
  
  public static String[] getTargetWindowValues() {
    return targetWindowValues;
  }
  public static String[] getTargetWindowLabels(String userLang) {
    String[] labels = (String[])targetWindowLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])targetWindowLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getTargetWindowLabel(String value, String userLang) {
    String[] labels = getTargetWindowLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("_blank")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return ((String[])targetWindowLabelMap.get(channel.getLanguage()))[i];
  }
  
  public static String getTargetWindowLabel(String value) {    
    if (false) {
    }
    else if (value.equals("")) {
      return targetWindowLabels[0];
    }
    else if (value.equals("_blank")) {
      return targetWindowLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getTargetWindowReport(SortedSet set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletImage obj = (PortletImage)it.next();
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getTargetWindow());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // imgWidth
  // ----------------------------------------------------------------------  
  protected  int imgWidth = 0;
  public int getImgWidth() { return imgWidth; }
  public void setImgWidth(int v) { imgWidth = v; }
  
  
  public static IntegerFormReport getImgWidthReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletImage obj = (PortletImage)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getImgWidth();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // imgHeight
  // ----------------------------------------------------------------------  
  protected  int imgHeight = 0;
  public int getImgHeight() { return imgHeight; }
  public void setImgHeight(int v) { imgHeight = v; }
  
  
  public static IntegerFormReport getImgHeightReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      PortletImage obj = (PortletImage)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getImgHeight();
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
  public void setAbstract(String lang, String value) { setAlt(lang, value); }
  @Override
  public String getAbstract() { return alt; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getAlt(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getAltML(); }
   
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
  static Pattern _altPattern;
  static {
    try {
      _altPattern = (new Perl5Compiler()).compile("[^\"]*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }
  
  public boolean checkPatternAlt() {
    if (Util.notEmpty(alt) && !(new Perl5Matcher()).matches(alt, _altPattern)) {
      return false; 
    }
    if (Util.notEmpty(altML)) {
      for (String str : ((Map<String,String>)altML).values()) {
        if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _altPattern)) {
          return false; 
        }
      }
    }
    return true;
  }
  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (Util.isEmpty(getFieldInMainLanguage(image, imageML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "image"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (!checkPatternAlt()) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-field-format", channel.getTypeFieldLabel(this, "alt"), "[^\"]*");
      return status;
    }
    if (imgWidth < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "imgWidth"), "0");
      return status;      
    }
    if (imgWidth > 10000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "imgWidth"), "10000");
      return status;      
    }
    if (imgHeight < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "imgHeight"), "0");
      return status;      
    }
    if (imgHeight > 10000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "imgHeight"), "10000");
      return status;      
    }
    return ControllerStatus.OK;
  }
  
  public Set getExternalLinkSet() {
    Set set = super.getExternalLinkSet();
   
    if (Util.notEmpty(link)) {
      set.add(link);
    }
    if (linkML != null) {
      set.addAll(Util.collectionToCleanSet(linkML.values()));
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
    PortletImage copy = (PortletImage)super.prepareMergeCopy();
    PortletImage main = (PortletImage)mainInstance;
    JcmsUtil.mergeMLMap(copy.getImageML(), main.getImageML());
    JcmsUtil.mergeMLMap(copy.getLinkML(), main.getLinkML());
    JcmsUtil.mergeMLMap(copy.getAltML(), main.getAltML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// HM7ypaqr6RKf6W/KxOURuw==
