// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:08 CET 2015
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
public class EditPortletImageHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletImage theContent;
  
  public Class getPublicationClass() {
    return PortletImage.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletImage  
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
  
    if ("image".equals(field)) {
      return getAllAvailableImageML();
    }
    
    if ("link".equals(field)) {
      return getAllAvailableLinkML();
    }
    
    if ("alt".equals(field)) {
      return getAllAvailableAltML();
    }
    
    if ("targetWindow".equals(field)) {
      return getAvailableTargetWindow();
    }
    
    if ("imgWidth".equals(field)) {
      return getAvailableImgWidth();
    }
    
    if ("imgHeight".equals(field)) {
      return getAvailableImgHeight();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("targetWindow".equals(field)) {
      return PortletImage.getTargetWindowValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("targetWindow".equals(field)) {
      return PortletImage.getTargetWindowLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletImage  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletImage() {
    if (!isImgWidthValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "imgWidth", userLang)));
      return false;
    }
    if (!isImgHeightValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "imgHeight", userLang)));
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
    if (!validateCommonCreateUpdatePortletImage()) {
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
    
    if (!validateCommonCreateUpdatePortletImage()) {
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
    PortletImage obj = (PortletImage)data;
    obj.setImage(getAvailableImage());
    obj.setImageML(getAvailableImageML());
    obj.setLink(getAvailableLink());
    obj.setLinkML(getAvailableLinkML());
    obj.setAlt(getAvailableAlt());
    obj.setAltML(getAvailableAltML());
    obj.setTargetWindow(getAvailableTargetWindow());
    obj.setImgWidth(getAvailableImgWidth());
    obj.setImgHeight(getAvailableImgHeight());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletImage) {
      super.setId(v);
      theContent = (PortletImage)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------  
  protected String image = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextString();
  protected HashMap imageML = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextMap();
  public void setImage(String[]  v) {
    image = getMainLangValue(v, true, true);
    imageML = getMLMap(v, true, true);
  }
  public String getAvailableImage() {
    if (theContent != null && isFieldMissing("image")) {
      return theContent.getImage();
    }
    return image;
  }
  
    
  public HashMap getAllAvailableImageML() {
    HashMap map = Util.getHashMap(getAvailableImageML());
    map.put(channel.getLanguage(),getAvailableImage(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableImageML() {
    if (theContent != null && isFieldMissing("image")) {
      return theContent.getImageML();
    }
    return imageML;
  }
  public String getAvailableImage(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(image, channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextString())) {
          return image;
      	}
      } else {
      	if (imageML != null && Util.notEmpty((String)imageML.get(lang))) {
      	  return (String)imageML.get(lang);
      	}
      }
      return Util.getString(theContent.getImage(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return image;
    }
    return imageML == null ? "" : Util.getString((String)imageML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // link
  // ----------------------------------------------------------------------  
  protected String link = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextString();
  protected HashMap linkML = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextMap();
  public void setLink(String[]  v) {
    link = getMainLangValue(v, true, true);
    linkML = getMLMap(v, true, true);
  }
  public String getAvailableLink() {
    if (theContent != null && isFieldMissing("link")) {
      return theContent.getLink();
    }
    return link;
  }
  
    
  public HashMap getAllAvailableLinkML() {
    HashMap map = Util.getHashMap(getAvailableLinkML());
    map.put(channel.getLanguage(),getAvailableLink(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableLinkML() {
    if (theContent != null && isFieldMissing("link")) {
      return theContent.getLinkML();
    }
    return linkML;
  }
  public String getAvailableLink(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(link, channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextString())) {
          return link;
      	}
      } else {
      	if (linkML != null && Util.notEmpty((String)linkML.get(lang))) {
      	  return (String)linkML.get(lang);
      	}
      }
      return Util.getString(theContent.getLink(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return link;
    }
    return linkML == null ? "" : Util.getString((String)linkML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // alt
  // ----------------------------------------------------------------------  
  protected String alt = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextString();
  protected HashMap altML = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextMap();
  public void setAlt(String[]  v) {
    alt = getMainLangValue(v, true, true);
    altML = getMLMap(v, true, true);
  }
  public String getAvailableAlt() {
    if (theContent != null && isFieldMissing("alt")) {
      return theContent.getAlt();
    }
    return alt;
  }
  
    
  public HashMap getAllAvailableAltML() {
    HashMap map = Util.getHashMap(getAvailableAltML());
    map.put(channel.getLanguage(),getAvailableAlt(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableAltML() {
    if (theContent != null && isFieldMissing("alt")) {
      return theContent.getAltML();
    }
    return altML;
  }
  public String getAvailableAlt(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(alt, channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextString())) {
          return alt;
      	}
      } else {
      	if (altML != null && Util.notEmpty((String)altML.get(lang))) {
      	  return (String)altML.get(lang);
      	}
      }
      return Util.getString(theContent.getAlt(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return alt;
    }
    return altML == null ? "" : Util.getString((String)altML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // targetWindow
  // ----------------------------------------------------------------------  
  protected String targetWindow = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getDefaultTextString();
  public void setTargetWindow(String[]  v) {
    targetWindow = getMainLangValue(v, true, true);
  }
  public String getAvailableTargetWindow() {
    if (theContent != null && isFieldMissing("targetWindow")) {
      return theContent.getTargetWindow();
    }
    return targetWindow;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // imgWidth
  // ----------------------------------------------------------------------  
  protected boolean isImgWidthValidated = true;
  protected int imgWidth = 0;
  public void setImgWidth(String v) {
    try {
      imgWidth = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isImgWidthValidated = false;
    }
  }
  public int getAvailableImgWidth() {
    if (theContent != null && isFieldMissing("imgWidth")) {
      return theContent.getImgWidth();
    }
    return imgWidth;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // imgHeight
  // ----------------------------------------------------------------------  
  protected boolean isImgHeightValidated = true;
  protected int imgHeight = 0;
  public void setImgHeight(String v) {
    try {
      imgHeight = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isImgHeightValidated = false;
    }
  }
  public int getAvailableImgHeight() {
    if (theContent != null && isFieldMissing("imgHeight")) {
      return theContent.getImgHeight();
    }
    return imgHeight;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// jHtHqwpC8P+IbODfGJUOtw==
