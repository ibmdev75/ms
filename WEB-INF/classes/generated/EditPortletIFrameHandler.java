// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:59 CET 2015
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
public class EditPortletIFrameHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletIFrame theContent;
  
  public Class getPublicationClass() {
    return PortletIFrame.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletIFrame  
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
  
    if ("source".equals(field)) {
      return getAllAvailableSourceML();
    }
    
    if ("frameWidth".equals(field)) {
      return getAvailableFrameWidth();
    }
    
    if ("frameHeight".equals(field)) {
      return getAvailableFrameHeight();
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
  // validateCommonCreateUpdatePortletIFrame  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletIFrame() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletIFrame()) {
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
    
    if (!validateCommonCreateUpdatePortletIFrame()) {
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
    PortletIFrame obj = (PortletIFrame)data;
    obj.setSource(getAvailableSource());
    obj.setSourceML(getAvailableSourceML());
    obj.setFrameWidth(getAvailableFrameWidth());
    obj.setFrameHeight(getAvailableFrameHeight());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletIFrame) {
      super.setId(v);
      theContent = (PortletIFrame)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // source
  // ----------------------------------------------------------------------  
  protected String source = channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextString();
  protected HashMap sourceML = channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextMap();
  public void setSource(String[]  v) {
    source = getMainLangValue(v, true, true);
    sourceML = getMLMap(v, true, true);
  }
  public String getAvailableSource() {
    if (theContent != null && isFieldMissing("source")) {
      return theContent.getSource();
    }
    return source;
  }
  
    
  public HashMap getAllAvailableSourceML() {
    HashMap map = Util.getHashMap(getAvailableSourceML());
    map.put(channel.getLanguage(),getAvailableSource(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableSourceML() {
    if (theContent != null && isFieldMissing("source")) {
      return theContent.getSourceML();
    }
    return sourceML;
  }
  public String getAvailableSource(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(source, channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextString())) {
          return source;
      	}
      } else {
      	if (sourceML != null && Util.notEmpty((String)sourceML.get(lang))) {
      	  return (String)sourceML.get(lang);
      	}
      }
      return Util.getString(theContent.getSource(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return source;
    }
    return sourceML == null ? "" : Util.getString((String)sourceML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // frameWidth
  // ----------------------------------------------------------------------  
  protected String frameWidth = channel.getTypeFieldEntry(PortletIFrame.class, "frameWidth", true).getDefaultTextString();
  public void setFrameWidth(String[]  v) {
    frameWidth = getMainLangValue(v, true, true);
  }
  public String getAvailableFrameWidth() {
    if (theContent != null && isFieldMissing("frameWidth")) {
      return theContent.getFrameWidth();
    }
    return frameWidth;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // frameHeight
  // ----------------------------------------------------------------------  
  protected String frameHeight = channel.getTypeFieldEntry(PortletIFrame.class, "frameHeight", true).getDefaultTextString();
  public void setFrameHeight(String[]  v) {
    frameHeight = getMainLangValue(v, true, true);
  }
  public String getAvailableFrameHeight() {
    if (theContent != null && isFieldMissing("frameHeight")) {
      return theContent.getFrameHeight();
    }
    return frameHeight;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// bO6sySveJheWnBf1iWsNrA==
