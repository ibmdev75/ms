// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:53 CET 2015
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
public class EditArticleHandler extends EditPublicationHandler {
   
  protected Article theContent;
  
  public Class getPublicationClass() {
    return Article.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpArticle  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      List list = processDataIds("relatedContents",__relatedContentsStr,com.jalios.jcms.Content.class);
      this.relatedContents = (com.jalios.jcms.Content[])list.toArray(new com.jalios.jcms.Content[0]);
    }
    if (!validateUploadedFileDocument(getAvailableRelatedContents(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableRelatedContents(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
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
    
    if ("picture".equals(field)) {
      return getAllAvailablePictureML();
    }
    
    if ("content".equals(field)) {
      return getAllAvailableContentML();
    }
    
    if ("relatedContents".equals(field)) {
      return getAvailableRelatedContents();
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
  // validateCommonCreateUpdateArticle  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateArticle() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateArticle()) {
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
    
    if (!validateCommonCreateUpdateArticle()) {
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
    Article obj = (Article)data;
    obj.setSummary(getAvailableSummary());
    obj.setSummaryML(getAvailableSummaryML());
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setPicture(getAvailablePicture());
    obj.setPictureML(getAvailablePictureML());
    obj.setContent(getAvailableContent());
    obj.setContentML(getAvailableContentML());
    obj.setRelatedContents(getAvailableRelatedContents());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Article) {
      super.setId(v);
      theContent = (Article)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  protected String summary = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextString();
  protected HashMap summaryML = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextMap();
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
      	if (!Util.isSameContent(summary, channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextString())) {
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
  protected String intro = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextString();
  protected HashMap introML = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextMap();
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
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextString())) {
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
  // picture
  // ----------------------------------------------------------------------  
  protected String picture = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextString();
  protected HashMap pictureML = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextMap();
  public void setPicture(String[]  v) {
    picture = getMainLangValue(v, true, true);
    pictureML = getMLMap(v, true, true);
  }
  public String getAvailablePicture() {
    if (theContent != null && isFieldMissing("picture")) {
      return theContent.getPicture();
    }
    return picture;
  }
  
    
  public HashMap getAllAvailablePictureML() {
    HashMap map = Util.getHashMap(getAvailablePictureML());
    map.put(channel.getLanguage(),getAvailablePicture(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailablePictureML() {
    if (theContent != null && isFieldMissing("picture")) {
      return theContent.getPictureML();
    }
    return pictureML;
  }
  public String getAvailablePicture(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(picture, channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextString())) {
          return picture;
      	}
      } else {
      	if (pictureML != null && Util.notEmpty((String)pictureML.get(lang))) {
      	  return (String)pictureML.get(lang);
      	}
      }
      return Util.getString(theContent.getPicture(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return picture;
    }
    return pictureML == null ? "" : Util.getString((String)pictureML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  protected String content = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextString();
  protected HashMap contentML = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextMap();
  public void setContent(String[]  v) {
      v = WysiwygManager.cleanHtml(v, WysiwygManager.getCleanHtmlContextMap(theContent, "content"));
    content = getMainLangValue(v, true, false);
    contentML = getMLMap(v, true, false);
  }
  public String getAvailableContent() {
    if (theContent != null && isFieldMissing("content")) {
      return theContent.getContent();
    }
    return content;
  }
  
    
  public HashMap getAllAvailableContentML() {
    HashMap map = Util.getHashMap(getAvailableContentML());
    map.put(channel.getLanguage(),getAvailableContent(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableContentML() {
    if (theContent != null && isFieldMissing("content")) {
      return theContent.getContentML();
    }
    return contentML;
  }
  public String getAvailableContent(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(content, channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextString())) {
          return content;
      	}
      } else {
      	if (contentML != null && Util.notEmpty((String)contentML.get(lang))) {
      	  return (String)contentML.get(lang);
      	}
      }
      return Util.getString(theContent.getContent(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return content;
    }
    return contentML == null ? "" : Util.getString((String)contentML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // relatedContents
  // ----------------------------------------------------------------------  
  protected com.jalios.jcms.Content[] relatedContents = new com.jalios.jcms.Content[0];
  protected int relatedContentsAddCount = 0;
  String[] __relatedContentsStr = null;
  public void setRelatedContents(String[]  v) {
    __relatedContentsStr = v;
  }
  public com.jalios.jcms.Content[] getAvailableRelatedContents() {
    if (theContent != null && isFieldMissing("relatedContents")) {
      if (theContent.getRelatedContents() == null) {
        return relatedContents;
      }
      return theContent.getRelatedContents();
    }
    return relatedContents;
  }
  
    
  
  public void setRelatedContentsAddCount(int  v) {
    relatedContentsAddCount = v;
  }
  
  public int getRelatedContentsCount() {
    int arraySize = Util.getSize(getAvailableRelatedContents());
    int res = 3 + arraySize + relatedContentsAddCount;
    return res;
  }
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// VxCAujMU2rZ8uVfVEwGe5w==
