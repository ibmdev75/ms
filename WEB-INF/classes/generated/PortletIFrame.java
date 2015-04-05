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
public  class PortletIFrame extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletIFrame() {}
 
 
  public PortletIFrame(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletIFrame(PortletIFrame other) {
    super(other);
    source = other.source;
    sourceML = other.sourceML;
    frameWidth = other.frameWidth;
    frameHeight = other.frameHeight;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setSource(ImportUtil.parseFieldText(elt, "source"));
    setSourceML(ImportUtil.parseFieldTextML(elt, "sourceML"));
    setFrameWidth(ImportUtil.parseFieldText(elt, "frameWidth"));
    setFrameHeight(ImportUtil.parseFieldText(elt, "frameHeight"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "source", getSource(), "sourceML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "sourceML", getSourceML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "frameWidth", getFrameWidth(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "frameHeight", getFrameHeight(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletIFrame</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletIFrame.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletIFrame</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletIFrame</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletIFrame</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletIFrame.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletIFrame</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletIFrame</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletIFrame</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletIFrame.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletIFrame</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletIFrame</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletIFrame</code>. <br>
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
    if ("source".equals(fieldName)) { return getSource(lang, useDefault); }
    if ("frameWidth".equals(fieldName)) { return getFrameWidth(); }
    if ("frameHeight".equals(fieldName)) { return getFrameHeight(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletIFrame</code>. <br>
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
    if ("source".equals(fieldName)) { setSource(lang,(String)value); return; }
    if ("frameWidth".equals(fieldName)) { setFrameWidth((String)value); return; }
    if ("frameHeight".equals(fieldName)) { setFrameHeight((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // source
  // ----------------------------------------------------------------------  
  protected  String source = channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextString();
  public String getSource() { return source; }
  public void setSource(String v) { source = v; }
  
  
  protected HashMap sourceML = channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextMap();
  public String getSource(String lang) { return (String)channel.getLangValue(lang, true, source, sourceML, getMainLanguage()); }
  public String getSource(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, source, sourceML, getMainLanguage()); }
  public HashMap getSourceML() { return sourceML; }
  public void setSourceML(HashMap v) { sourceML = v; }
  /**
   * Convenient method to set the value of the Source field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setSource(String)} or {@link #setSourceML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setSource(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      source = value;
      return;
    }
    if (sourceML == null) {
      sourceML = new HashMap();
    } else if (this != channel.getData(id)) {
      sourceML = new HashMap<String,String>(sourceML);
    }
    sourceML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // frameWidth
  // ----------------------------------------------------------------------  
  protected  String frameWidth = channel.getTypeFieldEntry(PortletIFrame.class, "frameWidth", true).getDefaultTextString();
  public String getFrameWidth() { return frameWidth; }
  public void setFrameWidth(String v) { frameWidth = v; }
  
  
  public String getFrameWidth(String lang) { return frameWidth; }
  public String getFrameWidth(String lang, boolean useDefault) { return frameWidth; }
  // ----------------------------------------------------------------------
  // frameHeight
  // ----------------------------------------------------------------------  
  protected  String frameHeight = channel.getTypeFieldEntry(PortletIFrame.class, "frameHeight", true).getDefaultTextString();
  public String getFrameHeight() { return frameHeight; }
  public void setFrameHeight(String v) { frameHeight = v; }
  
  
  public String getFrameHeight(String lang) { return frameHeight; }
  public String getFrameHeight(String lang, boolean useDefault) { return frameHeight; }
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setSource(lang, value); }
  @Override
  public String getAbstract() { return source; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getSource(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getSourceML(); }
   
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
    
    if (Util.isEmpty(getFieldInMainLanguage(source, sourceML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "source"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (Util.isEmpty(getFieldInMainLanguage(frameWidth, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "frameWidth"), null);
      return status;
    }
    if (Util.isEmpty(getFieldInMainLanguage(frameHeight, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "frameHeight"), null);
      return status;
    }
    return ControllerStatus.OK;
  }
  
  public Set getExternalLinkSet() {
    Set set = super.getExternalLinkSet();
   
    if (Util.notEmpty(source)) {
      set.add(source);
    }
    if (sourceML != null) {
      set.addAll(Util.collectionToCleanSet(sourceML.values()));
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
    PortletIFrame copy = (PortletIFrame)super.prepareMergeCopy();
    PortletIFrame main = (PortletIFrame)mainInstance;
    JcmsUtil.mergeMLMap(copy.getSourceML(), main.getSourceML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// yoe9+8iBr87hizSK/HnBNQ==
