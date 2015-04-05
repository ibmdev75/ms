// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:10 CET 2015
   
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
public  class FaqEntry extends com.jalios.jcms.Content 
             implements 
                com.jalios.jstore.Searchable
               , TreeNode
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public FaqEntry() {}
 
 
 
  
  
  
  public FaqEntry(FaqEntry other) {
    super(other);
    answer = other.answer;
    answerML = other.answerML;
    faq = other.faq;
    order = other.order;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setOrder(ImportUtil.parseFieldInt(elt, "order"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setAnswer(ImportUtil.parseFieldText(elt, "answer"));
      setAnswerML(ImportUtil.parseFieldTextML(elt, "answerML"));
      setFaq(ImportUtil.parseSelfFieldData(elt, "faq", generated.Faq.class));
    } else {
    
    setAnswerML(ImportUtil.parseFieldWikiML(elt, "answerML"));
    setAnswer(ImportUtil.parseFieldWiki(elt, "answer"));
    setFaq((generated.Faq)ImportUtil.parseFieldData(elt, "faq"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "answer", getAnswer(), "answerML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "answerML", getAnswerML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "faq", getFaq()));
    sb.append(ExportUtil.exportField(indentLevel, "order", getOrder()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>FaqEntry</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(FaqEntry.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>FaqEntry</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>FaqEntry</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>FaqEntry</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(FaqEntry.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>FaqEntry</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>FaqEntry</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>FaqEntry</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(FaqEntry.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("order".equals(fieldName)) { return getOrder(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("order".equals(fieldName)) { setOrder(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>FaqEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>FaqEntry</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>FaqEntry</code>. <br>
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
    if ("answer".equals(fieldName)) { return getAnswer(lang, useDefault); }
    if ("faq".equals(fieldName)) { return getFaq(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>FaqEntry</code>. <br>
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
    if ("answer".equals(fieldName)) { setAnswer(lang,(String)value); return; }
    if ("faq".equals(fieldName)) { setFaq((generated.Faq)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // answer
  // ----------------------------------------------------------------------  
  protected  String answer = channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextString();
  public String getAnswer() { return answer; }
  public void setAnswer(String v) { answer = v; }
  
  
  protected HashMap answerML = channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextMap();
  public String getAnswer(String lang) { return (String)channel.getLangValue(lang, true, answer, answerML, getMainLanguage()); }
  public String getAnswer(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, answer, answerML, getMainLanguage()); }
  public HashMap getAnswerML() { return answerML; }
  public void setAnswerML(HashMap v) { answerML = v; }
  /**
   * Convenient method to set the value of the Answer field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setAnswer(String)} or {@link #setAnswerML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setAnswer(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      answer = value;
      return;
    }
    if (answerML == null) {
      answerML = new HashMap();
    } else if (this != channel.getData(id)) {
      answerML = new HashMap<String,String>(answerML);
    }
    answerML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // faq
  // ----------------------------------------------------------------------  
  protected  generated.Faq faq;
  public generated.Faq getFaq() { return faq; }
  public void setFaq(generated.Faq v) { faq = v; }
  
  
  // ----------------------------------------------------------------------
  // order
  // ----------------------------------------------------------------------  
  protected  int order = 0;
  public int getOrder() { return order; }
  public void setOrder(int v) { order = v; }
  
  
  public static IntegerFormReport getOrderReport(SortedSet set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for(Iterator it = set.iterator(); it.hasNext();) {
      FaqEntry obj = (FaqEntry)it.next();
      if (obj == null) {
        continue;
      }
      int value = obj.getOrder();
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
  public void setAbstract(String lang, String value) { setAnswer(lang, value); }
  @Override
  public String getAbstract() { return answer; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getAnswer(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getAnswerML(); }
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 2 + 0 + 0) );
    if (answer != null) {
      sb.append(answer); sb.append(' '); 
    }
    if (answerML != null) {
      for(Iterator it = answerML.values().iterator(); it.hasNext();) {
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0) );
    if (answer != null) {
      sb.append(answer); sb.append(' '); 
    }
    if (answerML != null) {
      for(Iterator it = answerML.values().iterator(); it.hasNext();) {
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
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  public TreeSet getLinkDataSet(Class clazz) {
    if (clazz == null) {
      return Util.EMPTY_TREESET;
    }
    TreeSet set = new TreeSet();
    JcmsUtil.addData(set, clazz, getFaq());
    return set;
  }
  
  // ----------------------------------------------------------------------
  // TreeNode implementation
  // ----------------------------------------------------------------------
  public Collection getTreeChildren() {
    return Util.EMPTY_TREESET;
  }
  
  public TreeNode getTreeParent() {
    return getFaq();
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
    FaqEntry copy = (FaqEntry)super.prepareMergeCopy();
    FaqEntry main = (FaqEntry)mainInstance;
    JcmsUtil.mergeMLMap(copy.getAnswerML(), main.getAnswerML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// BSlEGQqycFN2U+4luAimMA==
