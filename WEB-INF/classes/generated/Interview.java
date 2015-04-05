// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:42 CET 2015
   
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
public  class Interview extends com.jalios.jcms.Content 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public Interview() {}
 
 
 
  
  
  
  public Interview(Interview other) {
    super(other);
    summary = other.summary;
    summaryML = other.summaryML;
    intro = other.intro;
    introML = other.introML;
    bio = other.bio;
    bioML = other.bioML;
    questions = other.questions;
    questionsML = other.questionsML;
    answers = other.answers;
    questionPrefix = other.questionPrefix;
    answerPrefix = other.answerPrefix;
    photo = other.photo;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setQuestionPrefix(ImportUtil.parseFieldText(elt, "questionPrefix"));
    setAnswerPrefix(ImportUtil.parseFieldText(elt, "answerPrefix"));
    setPhoto(ImportUtil.parseFieldText(elt, "photo"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setSummary(ImportUtil.parseFieldText(elt, "summary"));
      setSummaryML(ImportUtil.parseFieldTextML(elt, "summaryML"));
      setIntro(ImportUtil.parseFieldText(elt, "intro"));
      setIntroML(ImportUtil.parseFieldTextML(elt, "introML"));
      setBio(ImportUtil.parseFieldText(elt, "bio"));
      setBioML(ImportUtil.parseFieldTextML(elt, "bioML"));
      setQuestions(ImportUtil.parseFieldTextArray(elt, "questions"));
      setQuestionsML(ImportUtil.parseFieldTextArrayML(elt, "questionsML"));
      setAnswers(ImportUtil.parseFieldTextArray(elt, "answers"));
    } else {
    
    setSummaryML(ImportUtil.parseFieldWikiML(elt, "summaryML"));
    setSummary(ImportUtil.parseFieldWiki(elt, "summary"));
    setIntroML(ImportUtil.parseFieldWikiML(elt, "introML"));
    setIntro(ImportUtil.parseFieldWiki(elt, "intro"));
    setBioML(ImportUtil.parseFieldWikiML(elt, "bioML"));
    setBio(ImportUtil.parseFieldWiki(elt, "bio"));
    setQuestionsML(ImportUtil.parseFieldWikiArrayML(elt, "questionsML"));
    setQuestions(ImportUtil.parseFieldWikiArray(elt, "questions"));
    setAnswers(ImportUtil.parseFieldWikiArray(elt, "answers"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "summary", getSummary(), "summaryML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "summaryML", getSummaryML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "intro", getIntro(), "introML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "introML", getIntroML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "bio", getBio(), "bioML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "bioML", getBioML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "questions", getQuestions(), "questionsML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "questionsML", getQuestionsML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "answers", getAnswers(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "questionPrefix", getQuestionPrefix(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "answerPrefix", getAnswerPrefix(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "photo", getPhoto(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, photo);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>Interview</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(Interview.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Interview</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>Interview</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Interview</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(Interview.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Interview</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>Interview</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Interview</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(Interview.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>Interview</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>Interview</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>Interview</code>. <br>
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
    if ("bio".equals(fieldName)) { return getBio(lang, useDefault); }
    if ("questions".equals(fieldName)) { return getQuestions(lang, useDefault); }
    if ("answers".equals(fieldName)) { return getAnswers(); }
    if ("questionPrefix".equals(fieldName)) { return getQuestionPrefix(); }
    if ("answerPrefix".equals(fieldName)) { return getAnswerPrefix(); }
    if ("photo".equals(fieldName)) { return getPhoto(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>Interview</code>. <br>
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
    if ("bio".equals(fieldName)) { setBio(lang,(String)value); return; }
    if ("questions".equals(fieldName)) { setQuestions(lang,(String[])value); return; }
    if ("answers".equals(fieldName)) { setAnswers((String[])value); return; }
    if ("questionPrefix".equals(fieldName)) { setQuestionPrefix((String)value); return; }
    if ("answerPrefix".equals(fieldName)) { setAnswerPrefix((String)value); return; }
    if ("photo".equals(fieldName)) { setPhoto((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  protected  String summary = channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextString();
  public String getSummary() { return summary; }
  public void setSummary(String v) { summary = v; }
  
  
  protected HashMap summaryML = channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextMap();
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
  protected  String intro = channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextString();
  public String getIntro() { return intro; }
  public void setIntro(String v) { intro = v; }
  
  
  protected HashMap introML = channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextMap();
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
  // bio
  // ----------------------------------------------------------------------  
  protected  String bio = channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextString();
  public String getBio() { return bio; }
  public void setBio(String v) { bio = v; }
  
  
  protected HashMap bioML = channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextMap();
  public String getBio(String lang) { return (String)channel.getLangValue(lang, true, bio, bioML, getMainLanguage()); }
  public String getBio(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, bio, bioML, getMainLanguage()); }
  public HashMap getBioML() { return bioML; }
  public void setBioML(HashMap v) { bioML = v; }
  /**
   * Convenient method to set the value of the Bio field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setBio(String)} or {@link #setBioML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setBio(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      bio = value;
      return;
    }
    if (bioML == null) {
      bioML = new HashMap();
    } else if (this != channel.getData(id)) {
      bioML = new HashMap<String,String>(bioML);
    }
    bioML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // questions
  // ----------------------------------------------------------------------  
  protected  String[] questions;
  public String[] getQuestions() { return questions; }
  public void setQuestions(String[] v) { questions = v; }
  
  
  protected HashMap questionsML = channel.getTypeFieldEntry(Interview.class, "questions", true).getDefaultTextMap();
  public String[] getQuestions(String lang) { return (String[])channel.getLangValue(lang, true, questions, questionsML, getMainLanguage()); }
  public String[] getQuestions(String lang, boolean useDefault) { return (String[])channel.getLangValue(lang, useDefault, questions, questionsML, getMainLanguage()); }
  public HashMap getQuestionsML() { return questionsML; }
  public void setQuestionsML(HashMap v) { questionsML = v; }
  /**
   * Convenient method to set the value of the Questions field
   * in any language (default site language or any other).<br>
   * This method will set the proper field value
   * ({@link #setQuestions(String[])} or {@link #setQuestionsML(HashMap)})
   * depending on the specified language.
   * 
   * @param lang the language (ISO 639 code) in which to set the value
   * @param value the value to set.
   * @since jcms-5.7
   */
  public void setQuestions(String lang, String[] value) {
    if (channel.getLanguage().equals(lang)) {
      questions = value;
      return;
    }
    if (questionsML == null) {
      questionsML = new HashMap();
    } else if (this != channel.getData(id)) {
      questionsML = new HashMap<String,String>(questionsML);
    }
    questionsML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // answers
  // ----------------------------------------------------------------------  
  protected  String[] answers;
  public String[] getAnswers() { return answers; }
  public void setAnswers(String[] v) { answers = v; }
  
  
  public String[] getAnswers(String lang) { return answers; }
  public String[] getAnswers(String lang, boolean useDefault) { return answers; }
  // ----------------------------------------------------------------------
  // questionPrefix
  // ----------------------------------------------------------------------  
  protected  String questionPrefix = channel.getTypeFieldEntry(Interview.class, "questionPrefix", true).getDefaultTextString();
  public String getQuestionPrefix() { return questionPrefix; }
  public void setQuestionPrefix(String v) { questionPrefix = v; }
  
  
  public String getQuestionPrefix(String lang) { return questionPrefix; }
  public String getQuestionPrefix(String lang, boolean useDefault) { return questionPrefix; }
  // ----------------------------------------------------------------------
  // answerPrefix
  // ----------------------------------------------------------------------  
  protected  String answerPrefix = channel.getTypeFieldEntry(Interview.class, "answerPrefix", true).getDefaultTextString();
  public String getAnswerPrefix() { return answerPrefix; }
  public void setAnswerPrefix(String v) { answerPrefix = v; }
  
  
  public String getAnswerPrefix(String lang) { return answerPrefix; }
  public String getAnswerPrefix(String lang, boolean useDefault) { return answerPrefix; }
  // ----------------------------------------------------------------------
  // photo
  // ----------------------------------------------------------------------  
  protected  String photo = channel.getTypeFieldEntry(Interview.class, "photo", true).getDefaultTextString();
  public String getPhoto() { return photo; }
  public void setPhoto(String v) { photo = v; }
  
  
  public String getPhoto(String lang) { return photo; }
  public String getPhoto(String lang, boolean useDefault) { return photo; }
   
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
    return photo;
  
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    return getPhoto(lang, useDefault);
  
  }
  
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 4 + 1 + 1) );
    if (bio != null) {
      sb.append(bio); sb.append(' '); 
    }
    if (bioML != null) {
      for(Iterator it = bioML.values().iterator(); it.hasNext();) {
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
    for(int i=0; answers != null && i < answers.length; i++) {
      if (answers[i] != null) {
        sb.append(answers[i]); sb.append(' ');
      }
    }
    for(int i=0; questions != null && i < questions.length; i++) {
      if (questions[i] != null) {
        sb.append(questions[i]); sb.append(' ');
      }
    }
    if (questionsML != null) {
      for(Iterator it = questionsML.values().iterator(); it.hasNext();) {
        String[] strArray = (String[])it.next();
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null) {
           sb.append( strArray[i]); sb.append(' ');
          }
        }
      }
    }
    return new String[] {sb.toString()};
  }
  
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 3 + 1 + 1) );
    if (bio != null) {
      sb.append(bio); sb.append(' '); 
    }
    if (bioML != null) {
      for(Iterator it = bioML.values().iterator(); it.hasNext();) {
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
    for(int i=0; answers != null && i < answers.length; i++) {
      if (answers[i] != null) {
        sb.append(answers[i]); sb.append(' ');
      }
    }
    for(int i=0; questions != null && i < questions.length; i++) {
      if (questions[i] != null) {
        sb.append(questions[i]); sb.append(' ');
      }
    }
    if (questionsML != null) {
      for(Iterator it = questionsML.values().iterator(); it.hasNext();) {
        String[] strArray = (String[])it.next();
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null) {
           sb.append( strArray[i]); sb.append(' ');
          }
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
    
    if (Util.isEmpty(getFieldInMainLanguage(summary, summaryML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "summary"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (Util.isEmpty(getFieldInMainLanguage(questionPrefix, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "questionPrefix"), null);
      return status;
    }
    if (Util.isEmpty(getFieldInMainLanguage(answerPrefix, null))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "answerPrefix"), null);
      return status;
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected Publication prepareMergeCopy() {
    Interview copy = (Interview)super.prepareMergeCopy();
    Interview main = (Interview)mainInstance;
    JcmsUtil.mergeMLMap(copy.getSummaryML(), main.getSummaryML());
    JcmsUtil.mergeMLMap(copy.getIntroML(), main.getIntroML());
    JcmsUtil.mergeMLMap(copy.getBioML(), main.getBioML());
    JcmsUtil.mergeMLMap(copy.getQuestionsML(), main.getQuestionsML());
    return copy;
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// GF0zDAG9HciOqfbDm+8D/w==
