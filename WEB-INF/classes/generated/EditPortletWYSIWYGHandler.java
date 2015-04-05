// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:07 CET 2015
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
public class EditPortletWYSIWYGHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletWYSIWYG theContent;
  
  public Class getPublicationClass() {
    return PortletWYSIWYG.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletWYSIWYG  
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
  
    if ("wysiwyg".equals(field)) {
      return getAllAvailableWysiwygML();
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
  // validateCommonCreateUpdatePortletWYSIWYG  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletWYSIWYG() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletWYSIWYG()) {
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
    
    if (!validateCommonCreateUpdatePortletWYSIWYG()) {
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
    PortletWYSIWYG obj = (PortletWYSIWYG)data;
    obj.setWysiwyg(getAvailableWysiwyg());
    obj.setWysiwygML(getAvailableWysiwygML());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletWYSIWYG) {
      super.setId(v);
      theContent = (PortletWYSIWYG)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // wysiwyg
  // ----------------------------------------------------------------------  
  protected String wysiwyg = channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextString();
  protected HashMap wysiwygML = channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextMap();
  public void setWysiwyg(String[]  v) {
      v = WysiwygManager.cleanHtml(v, WysiwygManager.getCleanHtmlContextMap(theContent, "wysiwyg"));
    wysiwyg = getMainLangValue(v, true, false);
    wysiwygML = getMLMap(v, true, false);
  }
  public String getAvailableWysiwyg() {
    if (theContent != null && isFieldMissing("wysiwyg")) {
      return theContent.getWysiwyg();
    }
    return wysiwyg;
  }
  
    
  public HashMap getAllAvailableWysiwygML() {
    HashMap map = Util.getHashMap(getAvailableWysiwygML());
    map.put(channel.getLanguage(),getAvailableWysiwyg(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableWysiwygML() {
    if (theContent != null && isFieldMissing("wysiwyg")) {
      return theContent.getWysiwygML();
    }
    return wysiwygML;
  }
  public String getAvailableWysiwyg(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(wysiwyg, channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextString())) {
          return wysiwyg;
      	}
      } else {
      	if (wysiwygML != null && Util.notEmpty((String)wysiwygML.get(lang))) {
      	  return (String)wysiwygML.get(lang);
      	}
      }
      return Util.getString(theContent.getWysiwyg(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return wysiwyg;
    }
    return wysiwygML == null ? "" : Util.getString((String)wysiwygML.get(lang), "");
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// YYv907fni1yC+RxXAb1zkQ==
