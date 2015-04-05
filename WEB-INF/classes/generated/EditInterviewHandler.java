// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:42 CET 2015
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditInterviewHandler extends EditPublicationHandler {
   
  protected Interview theContent;
  
  public Class getPublicationClass() {
    return Interview.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpInterview  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("summary".equals(field)) {
      return getAllAvailableSummaryML();
    }
    
    if ("intro".equals(field)) {
      return getAllAvailableIntroML();
    }
    
    if ("bio".equals(field)) {
      return getAllAvailableBioML();
    }
    
    if ("questions".equals(field)) {
      return getAllAvailableQuestionsML();
    }
    
    if ("answers".equals(field)) {
      return getAvailableAnswers();
    }
    
    if ("questionPrefix".equals(field)) {
      return getAvailableQuestionPrefix();
    }
    
    if ("answerPrefix".equals(field)) {
      return getAvailableAnswerPrefix();
    }
    
    if ("photo".equals(field)) {
      return getAvailablePhoto();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateInterview  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateInterview() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateInterview()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateInterview()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    Interview obj = (Interview)data;
    obj.setSummary(getAvailableSummary());
    obj.setSummaryML(getAvailableSummaryML());
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setBio(getAvailableBio());
    obj.setBioML(getAvailableBioML());
    obj.setQuestions(getAvailableQuestions());
    obj.setQuestionsML(getAvailableQuestionsML());
    obj.setAnswers(getAvailableAnswers());
    obj.setQuestionPrefix(getAvailableQuestionPrefix());
    obj.setAnswerPrefix(getAvailableAnswerPrefix());
    obj.setPhoto(getAvailablePhoto());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Interview) {
      super.setId(v);
      theContent = (Interview)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  protected String summary = channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextString();
  protected HashMap summaryML = channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextMap();
  public void setSummary(String[]  v) {
    summary = getMainLangValue(v, false, true);
    summaryML = getMLMap(v, false, true);
  }
  public String getAvailableSummary() {
    if (theContent != null && isFieldMissing("summary")) {
      return theContent.getSummary();
    }
    return summary;
  }
  
    
  public HashMap getAllAvailableSummaryML() {
    HashMap map = Util.getHashMap(getAvailableSummaryML());
    map.put(channel.getLanguage(),getAvailableSummary(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableSummaryML() {
    if (theContent != null && isFieldMissing("summary")) {
      return theContent.getSummaryML();
    }
    return summaryML;
  }
  public String getAvailableSummary(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(summary, channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextString())) {
          return summary;
      	}
      } else {
      	if (summaryML != null && Util.notEmpty((String)summaryML.get(lang))) {
      	  return (String)summaryML.get(lang);
      	}
      }
      return Util.getString(theContent.getSummary(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return summary;
    }
    return summaryML == null ? "" : Util.getString((String)summaryML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  protected String intro = channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextString();
  protected HashMap introML = channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextMap();
  public void setIntro(String[]  v) {
    intro = getMainLangValue(v, false, true);
    introML = getMLMap(v, false, true);
  }
  public String getAvailableIntro() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntro();
    }
    return intro;
  }
  
    
  public HashMap getAllAvailableIntroML() {
    HashMap map = Util.getHashMap(getAvailableIntroML());
    map.put(channel.getLanguage(),getAvailableIntro(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableIntroML() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntroML();
    }
    return introML;
  }
  public String getAvailableIntro(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextString())) {
          return intro;
      	}
      } else {
      	if (introML != null && Util.notEmpty((String)introML.get(lang))) {
      	  return (String)introML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntro(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return intro;
    }
    return introML == null ? "" : Util.getString((String)introML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // bio
  // ----------------------------------------------------------------------  
  protected String bio = channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextString();
  protected HashMap bioML = channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextMap();
  public void setBio(String[]  v) {
    bio = getMainLangValue(v, false, true);
    bioML = getMLMap(v, false, true);
  }
  public String getAvailableBio() {
    if (theContent != null && isFieldMissing("bio")) {
      return theContent.getBio();
    }
    return bio;
  }
  
    
  public HashMap getAllAvailableBioML() {
    HashMap map = Util.getHashMap(getAvailableBioML());
    map.put(channel.getLanguage(),getAvailableBio(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableBioML() {
    if (theContent != null && isFieldMissing("bio")) {
      return theContent.getBioML();
    }
    return bioML;
  }
  public String getAvailableBio(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(bio, channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextString())) {
          return bio;
      	}
      } else {
      	if (bioML != null && Util.notEmpty((String)bioML.get(lang))) {
      	  return (String)bioML.get(lang);
      	}
      }
      return Util.getString(theContent.getBio(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return bio;
    }
    return bioML == null ? "" : Util.getString((String)bioML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // questions
  // ----------------------------------------------------------------------  
  protected String[] questions = new String[0];
  protected int questionsAddCount = 0;
  HashMap questionsML;
  public void setQuestions(String[]  v) {  
   questions = getMainLangValueArray(v, false, true);
   questionsML = getMLMapArray(v, false, true);    
  }
  public String[] getAvailableQuestions() {
    if (theContent != null && isFieldMissing("questions")) {
      if (theContent.getQuestions() == null) {
        return questions;
      }
      return theContent.getQuestions();
    }
    return questions;
  }
  
    
  public HashMap getAllAvailableQuestionsML() {
    HashMap map = Util.getHashMap(getAvailableQuestionsML());
    map.put(channel.getLanguage(),getAvailableQuestions(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableQuestionsML() {
    if (theContent != null && isFieldMissing("questions")) {
      return theContent.getQuestionsML();
    }
    return questionsML;
  }
  public String[] getAvailableQuestions(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (Util.notEmpty(questions)) {
          return questions;
      	}
      } else {
      	if (questionsML != null && Util.notEmpty((String[])questionsML.get(lang))) {
      	  return (String[])questionsML.get(lang);
      	}
      }
      return theContent.getQuestions(lang, false);
    }
    if (lang.equals(channel.getLanguage())) {
      return questions;
    }
    return questionsML == null ? null : (String[])questionsML.get(lang);
  }
  
  public void setQuestionsAddCount(int  v) {
    questionsAddCount = v;
  }
  
  public int getQuestionsCount() {
    int arraySize = Util.getSize(getAvailableQuestions());
    if (channel.isMultilingual()) {
      for(Iterator it = channel.getOtherLanguageList().iterator(); it.hasNext();) {
        String[] array = getAvailableQuestions((String)it.next());
        if (array != null && array.length > arraySize) {
          arraySize = array.length;
        }
      }
    }
    int res = 3 + arraySize + questionsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // answers
  // ----------------------------------------------------------------------  
  protected String[] answers = new String[0];
  protected int answersAddCount = 0;
  public void setAnswers(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i];   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.answers = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableAnswers() {
    if (theContent != null && isFieldMissing("answers")) {
      if (theContent.getAnswers() == null) {
        return answers;
      }
      return theContent.getAnswers();
    }
    return answers;
  }
  
    
  
  public void setAnswersAddCount(int  v) {
    answersAddCount = v;
  }
  
  public int getAnswersCount() {
    int arraySize = Util.getSize(getAvailableAnswers());
    int res = 3 + arraySize + answersAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // questionPrefix
  // ----------------------------------------------------------------------  
  protected String questionPrefix = channel.getTypeFieldEntry(Interview.class, "questionPrefix", true).getDefaultTextString();
  public void setQuestionPrefix(String[]  v) {
    questionPrefix = getMainLangValue(v, true, true);
  }
  public String getAvailableQuestionPrefix() {
    if (theContent != null && isFieldMissing("questionPrefix")) {
      return theContent.getQuestionPrefix();
    }
    return questionPrefix;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // answerPrefix
  // ----------------------------------------------------------------------  
  protected String answerPrefix = channel.getTypeFieldEntry(Interview.class, "answerPrefix", true).getDefaultTextString();
  public void setAnswerPrefix(String[]  v) {
    answerPrefix = getMainLangValue(v, true, true);
  }
  public String getAvailableAnswerPrefix() {
    if (theContent != null && isFieldMissing("answerPrefix")) {
      return theContent.getAnswerPrefix();
    }
    return answerPrefix;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // photo
  // ----------------------------------------------------------------------  
  protected String photo = channel.getTypeFieldEntry(Interview.class, "photo", true).getDefaultTextString();
  public void setPhoto(String[]  v) {
    photo = getMainLangValue(v, true, true);
  }
  public String getAvailablePhoto() {
    if (theContent != null && isFieldMissing("photo")) {
      return theContent.getPhoto();
    }
    return photo;
  }
  
    
  
	public int getAvailableitemCount() {
    int max = 0;
    
	  
	    
	    
	    for (String lang : channel.getLanguageList()) {
	      int count = Util.getSize(getAvailableQuestions(lang));
	      max = count > max ? count : max;
	    }
	    
	 
	    
	    
	    {
	      int count = Util.getSize(getAvailableAnswers());
	      max = count > max ? count : max;
	    }
	    
	 
	  return max;
	}
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// emT+JWGtHi4NZXcyFKXKSQ==
