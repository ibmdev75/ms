// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:53 CET 2015
   
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
public  class Article extends com.jalios.jcms.Content 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public Article() {}
 
 
 
  
  
  
  public Article(Article other) {
    super(other);
    summary = other.summary;
    summaryML = other.summaryML;
    intro = other.intro;
    introML = other.introML;
    picture = other.picture;
    pictureML = other.pictureML;
    content = other.content;
    contentML = other.contentML;
    relatedContents = other.relatedContents;
    relatedContentsDBID = other.relatedContentsDBID;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setPicture(ImportUtil.parseFieldText(elt, "picture"));
    setPictureML(ImportUtil.parseFieldTextML(elt, "pictureML"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setSummary(ImportUtil.parseFieldText(elt, "summary"));
      setSummaryML(ImportUtil.parseFieldTextML(elt, "summaryML"));
      setIntro(ImportUtil.parseFieldText(elt, "intro"));
      setIntroML(ImportUtil.parseFieldTextML(elt, "introML"));
      setContent(ImportUtil.parseFieldText(elt, "content"));
      setContentML(ImportUtil.parseFieldTextML(elt, "contentML"));
      setRelatedContents(ImportUtil.parseSelfFieldDataArray(elt, "relatedContents", com.jalios.jcms.Content.class));
    } else {
    
    setSummaryML(ImportUtil.parseFieldWikiML(elt, "summaryML"));
    setSummary(ImportUtil.parseFieldWiki(elt, "summary"));
    setIntroML(ImportUtil.parseFieldWikiML(elt, "introML"));
    setIntro(ImportUtil.parseFieldWiki(elt, "intro"));
    setContentML(ImportUtil.parseFieldWysiwygML(elt, "contentML"));
    setContent(ImportUtil.parseFieldWysiwyg(elt, "content"));
    setRelatedContents((com.jalios.jcms.Content[])ImportUtil.parseFieldDataArray(elt, "relatedContents", com.jalios.jcms.Content.class));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "summary", getSummary(), "summaryML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "summaryML", getSummaryML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "intro", getIntro(), "introML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "introML", getIntroML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "picture", getPicture(), "pictureML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pictureML", getPictureML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "content", getContent(), "contentML", false, false));
    sb.append(ExportUtil.exportField(indentLevel, "contentML", getContentML(), false));
    sb.append(ExportUtil.exportField(indentLevel, "relatedContents", getRelatedContents()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, picture, pictureML);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>Article</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(Article.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Article</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>Article</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Article</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(Article.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Article</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>Article</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Article</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(Article.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>Article</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>Article</code>. <br>
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
    if ("summary".equals(fieldName)) { return getSummary(lang, useDefault); }
    if ("intro".equals(fieldName)) { return getIntro(lang, useDefault); }
    if ("picture".equals(fieldName)) { return getPicture(lang, useDefault); }
    if ("content".equals(fieldName)) { return getContent(lang, useDefault); }
    if ("relatedContents".equals(fieldName)) { return getRelatedContents(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>Article</code>. <br>
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
    if ("summary".equals(fieldName)) { setSummary(lang,(String)value); return; }
    if ("intro".equals(fieldName)) { setIntro(lang,(String)value); return; }
    if ("picture".equals(fieldName)) { setPicture(lang,(String)value); return; }
    if ("content".equals(fieldName)) { setContent(lang,(String)value); return; }
    if ("relatedContents".equals(fieldName)) { setRelatedContents((com.jalios.jcms.Content[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  protected  String summary = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextString();
  public String getSummary() { return summary; }
  public void setSummary(String v) { summary = v; }
  
  
  protected HashMap summaryML = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextMap();
  public String getSummary(String lang) { return (String)channel.getLangValue(lang, true, summary, summaryML, getMainLanguage()); }
  public String getSummary(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, summary, summaryML, getMainLanguage()); }
  public HashMap getSummaryML() { return summaryML; }
  public void setSummaryML(HashMap v) { summaryML = v; }
  /**
   * Convenient method to set the value of the Summary field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setSummary(String)} or {@link #setSummaryML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setSummary(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      summary = value;
      return;
    }
    if (summaryML == null) {
      summaryML = new HashMap();
    } else if (this != channel.getData(id)) {
      summaryML = new HashMap<String,String>(summaryML);
    }
    summaryML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  protected  String intro = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextString();
  public String getIntro() { return intro; }
  public void setIntro(String v) { intro = v; }
  
  
  protected HashMap introML = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextMap();
  public String getIntro(String lang) { return (String)channel.getLangValue(lang, true, intro, introML, getMainLanguage()); }
  public String getIntro(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, intro, introML, getMainLanguage()); }
  public HashMap getIntroML() { return introML; }
  public void setIntroML(HashMap v) { introML = v; }
  /**
   * Convenient method to set the value of the Intro field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setIntro(String)} or {@link #setIntroML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setIntro(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      intro = value;
      return;
    }
    if (introML == null) {
      introML = new HashMap();
    } else if (this != channel.getData(id)) {
      introML = new HashMap<String,String>(introML);
    }
    introML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // picture
  // ----------------------------------------------------------------------  
  protected  String picture = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextString();
  public String getPicture() { return picture; }
  public void setPicture(String v) { picture = v; }
  
  
  protected HashMap pictureML = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextMap();
  public String getPicture(String lang) { return (String)channel.getLangValue(lang, true, picture, pictureML, getMainLanguage()); }
  public String getPicture(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, picture, pictureML, getMainLanguage()); }
  public HashMap getPictureML() { return pictureML; }
  public void setPictureML(HashMap v) { pictureML = v; }
  /**
   * Convenient method to set the value of the Picture field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setPicture(String)} or {@link #setPictureML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setPicture(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      picture = value;
      return;
    }
    if (pictureML == null) {
      pictureML = new HashMap();
    } else if (this != channel.getData(id)) {
      pictureML = new HashMap<String,String>(pictureML);
    }
    pictureML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  protected  String content = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextString();
  public String getContent() { return content; }
  public void setContent(String v) { content = v; }
  
  
  protected HashMap contentML = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextMap();
  public String getContent(String lang) { return (String)channel.getLangValue(lang, true, content, contentML, getMainLanguage()); }
  public String getContent(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, content, contentML, getMainLanguage()); }
  public HashMap getContentML() { return contentML; }
  public void setContentML(HashMap v) { contentML = v; }
  /**
   * Convenient method to set the value of the Content field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setContent(String)} or {@link #setContentML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setContent(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      content = value;
      return;
    }
    if (contentML == null) {
      contentML = new HashMap();
    } else if (this != channel.getData(id)) {
      contentML = new HashMap<String,String>(contentML);
    }
    contentML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // relatedContents
  // ----------------------------------------------------------------------  
  protected  com.jalios.jcms.Content[] relatedContents;
  public com.jalios.jcms.Content[] getRelatedContents() {
    return getRelatedContents(true);
  }
  public com.jalios.jcms.Content[] getRelatedContents(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(relatedContentsDBID)) {
      return relatedContents;
    }
    return mergeHybridLink(com.jalios.jcms.Content.class, relatedContents, relatedContentsDBID);
  }
  protected String[] relatedContentsDBID;
  public String[] getRelatedContentsDBID() {
    return relatedContentsDBID;
  }
  public void setRelatedContents(com.jalios.jcms.Content[] v) { 
    relatedContents = v == null ? null : v.clone(); 
    relatedContentsDBID = computeDBIDArray(relatedContents);
  }
  
  public void setRelatedContentsDBID(String[] v) { 
    relatedContentsDBID = v; 
  }
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setSummary(lang, value); }
  @Override
  public String getAbstract() { return summary; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getSummary(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getSummaryML(); }
   
  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------  
  @Override
  public String getDataImage() {
    return picture;
  
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    return getPicture(lang, useDefault);
  
  }
  
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 4 + 0 + 0) );
    if (content != null) {
      sb.append(content); sb.append(' '); 
    }
    if (contentML != null) {
      for(Iterator it = contentML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    if (intro != null) {
      sb.append(intro); sb.append(' '); 
    }
    if (introML != null) {
      for(Iterator it = introML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    if (summary != null) {
      sb.append(summary); sb.append(' '); 
    }
    if (summaryML != null) {
      for(Iterator it = summaryML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
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
    sb.ensureCapacity(500 * (0 + 2 + 0 + 0) );
    if (intro != null) {
      sb.append(intro); sb.append(' '); 
    }
    if (introML != null) {
      for(Iterator it = introML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    if (summary != null) {
      sb.append(summary); sb.append(' '); 
    }
    if (summaryML != null) {
      for(Iterator it = summaryML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }
  
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0) );
    if (content != null) {
      sb.append(content); sb.append(' '); 
    }
    if (contentML != null) {
      for(Iterator it = contentML.values().iterator(); it.hasNext();) {
        Object obj = it.next();
        if (obj != null) {
          sb.append(obj); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }
  
  public TreeSet getLinkDataSet(Class clazz) {
    if (clazz == null) {
      return Util.EMPTY_TREESET;
    }
    TreeSet set = new TreeSet();
    JcmsUtil.addData(set, clazz, getRelatedContents());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkHtmlContent() {
    ControllerStatus status = JcmsUtil.checkHtml(content, channel.getTypeFieldLabel(this, "content"));
    if (status.hasFailed()) {
      return status;
    }
    status = JcmsUtil.checkHtml(contentML, channel.getTypeFieldLabel(this, "content"));
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }
  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (Util.isEmpty(getFieldInMainLanguage(summary, summaryML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "summary"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (Util.isEmpty(getFieldInMainLanguage(content, contentML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "content"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    status = checkHtmlContent();
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    Article copy = (Article)super.prepareMergeCopy();
    Article main = (Article)mainInstance;
    JcmsUtil.mergeMLMap(copy.getSummaryML(), main.getSummaryML());
    JcmsUtil.mergeMLMap(copy.getIntroML(), main.getIntroML());
    JcmsUtil.mergeMLMap(copy.getPictureML(), main.getPictureML());
    JcmsUtil.mergeMLMap(copy.getContentML(), main.getContentML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 53HegtjdsDcI9WfIh8d0vw==
