// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:48 CET 2015
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
public class EditPortletTopMemberHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletTopMember theContent;
  
  public Class getPublicationClass() {
    return PortletTopMember.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletTopMember  
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
  
    if ("titleText".equals(field)) {
      return getAllAvailableTitleTextML();
    }
    
    if ("maxResults".equals(field)) {
      return getAvailableMaxResults();
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
  // validateCommonCreateUpdatePortletTopMember  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletTopMember() {
    if (!isMaxResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxResults", userLang)));
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
    if (!validateCommonCreateUpdatePortletTopMember()) {
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
    
    if (!validateCommonCreateUpdatePortletTopMember()) {
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
    PortletTopMember obj = (PortletTopMember)data;
    obj.setTitleText(getAvailableTitleText());
    obj.setTitleTextML(getAvailableTitleTextML());
    obj.setMaxResults(getAvailableMaxResults());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletTopMember) {
      super.setId(v);
      theContent = (PortletTopMember)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // titleText
  // ----------------------------------------------------------------------  
  protected String titleText = channel.getTypeFieldEntry(PortletTopMember.class, "titleText", true).getDefaultTextString();
  protected HashMap titleTextML = channel.getTypeFieldEntry(PortletTopMember.class, "titleText", true).getDefaultTextMap();
  public void setTitleText(String[]  v) {
    titleText = getMainLangValue(v, true, true);
    titleTextML = getMLMap(v, true, true);
  }
  public String getAvailableTitleText() {
    if (theContent != null && isFieldMissing("titleText")) {
      return theContent.getTitleText();
    }
    return titleText;
  }
  
    
  public HashMap getAllAvailableTitleTextML() {
    HashMap map = Util.getHashMap(getAvailableTitleTextML());
    map.put(channel.getLanguage(),getAvailableTitleText(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableTitleTextML() {
    if (theContent != null && isFieldMissing("titleText")) {
      return theContent.getTitleTextML();
    }
    return titleTextML;
  }
  public String getAvailableTitleText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(titleText, channel.getTypeFieldEntry(PortletTopMember.class, "titleText", true).getDefaultTextString())) {
          return titleText;
      	}
      } else {
      	if (titleTextML != null && Util.notEmpty((String)titleTextML.get(lang))) {
      	  return (String)titleTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getTitleText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return titleText;
    }
    return titleTextML == null ? "" : Util.getString((String)titleTextML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------  
  protected boolean isMaxResultsValidated = true;
  protected int maxResults = 10;
  public void setMaxResults(String v) {
    try {
      maxResults = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaxResultsValidated = false;
    }
  }
  public int getAvailableMaxResults() {
    if (theContent != null && isFieldMissing("maxResults")) {
      return theContent.getMaxResults();
    }
    return maxResults;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// j5Y6ZAWqyFUBYCDSXi3yDQ==
