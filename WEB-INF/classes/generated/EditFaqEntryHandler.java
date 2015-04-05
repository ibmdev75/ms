// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:10 CET 2015
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
public class EditFaqEntryHandler extends EditPublicationHandler {
   
  protected FaqEntry theContent;
  
  public Class getPublicationClass() {
    return FaqEntry.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpFaqEntry  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("faq", __faqStr, generated.Faq.class);
      if (data != null) { 
        faq = (generated.Faq)data;
      } else {
        isFaqValidated = Util.isEmpty(__faqStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableFaq(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableFaq(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("answer".equals(field)) {
      return getAllAvailableAnswerML();
    }
    
    if ("faq".equals(field)) {
      return getAvailableFaq();
    }
    
    if ("order".equals(field)) {
      return getAvailableOrder();
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
  // validateCommonCreateUpdateFaqEntry  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateFaqEntry() {
    if (!isFaqValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "faq", userLang)));
      return false;
    }
    if (!isOrderValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "order", userLang)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateFaqEntry()) {
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
    
    if (!validateCommonCreateUpdateFaqEntry()) {
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
    FaqEntry obj = (FaqEntry)data;
    obj.setAnswer(getAvailableAnswer());
    obj.setAnswerML(getAvailableAnswerML());
    obj.setFaq(getAvailableFaq());
    obj.setOrder(getAvailableOrder());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof FaqEntry) {
      super.setId(v);
      theContent = (FaqEntry)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // answer
  // ----------------------------------------------------------------------  
  protected String answer = channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextString();
  protected HashMap answerML = channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextMap();
  public void setAnswer(String[]  v) {
    answer = getMainLangValue(v, false, true);
    answerML = getMLMap(v, false, true);
  }
  public String getAvailableAnswer() {
    if (theContent != null && isFieldMissing("answer")) {
      return theContent.getAnswer();
    }
    return answer;
  }
  
    
  public HashMap getAllAvailableAnswerML() {
    HashMap map = Util.getHashMap(getAvailableAnswerML());
    map.put(channel.getLanguage(),getAvailableAnswer(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableAnswerML() {
    if (theContent != null && isFieldMissing("answer")) {
      return theContent.getAnswerML();
    }
    return answerML;
  }
  public String getAvailableAnswer(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(answer, channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextString())) {
          return answer;
      	}
      } else {
      	if (answerML != null && Util.notEmpty((String)answerML.get(lang))) {
      	  return (String)answerML.get(lang);
      	}
      }
      return Util.getString(theContent.getAnswer(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return answer;
    }
    return answerML == null ? "" : Util.getString((String)answerML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // faq
  // ----------------------------------------------------------------------  
  protected boolean isFaqValidated = true;
  protected generated.Faq faq;
  String __faqStr = null;
  public void setFaq(String v) {
    __faqStr = v;
  }
  public generated.Faq getAvailableFaq() {
    if (theContent != null && isFieldMissing("faq")) {
      return theContent.getFaq();
    }
    return faq;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // order
  // ----------------------------------------------------------------------  
  protected boolean isOrderValidated = true;
  protected int order = 0;
  public void setOrder(String v) {
    try {
      order = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isOrderValidated = false;
    }
  }
  public int getAvailableOrder() {
    if (theContent != null && isFieldMissing("order")) {
      return theContent.getOrder();
    }
    return order;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// U0Qz2e2HpuuPyK2yFyMAXQ==
