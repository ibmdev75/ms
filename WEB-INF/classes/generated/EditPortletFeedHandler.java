// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:40 CET 2015
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
public class EditPortletFeedHandler extends EditPortletQueryForeachHandler {
   
  protected PortletFeed theContent;
  
  public Class getPublicationClass() {
    return PortletFeed.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletFeed  
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
  
    if ("formats".equals(field)) {
      return getAvailableFormats();
    }
    
    if ("copyright".equals(field)) {
      return getAllAvailableCopyrightML();
    }
    
    if ("useAuthKey".equals(field)) {
      return getAvailableUseAuthKey();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("formats".equals(field)) {
      return PortletFeed.getFormatsValues();
    }
    if ("useAuthKey".equals(field)) {
      return PortletFeed.getUseAuthKeyValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("formats".equals(field)) {
      return PortletFeed.getFormatsLabels(userLang);
    }
    if ("useAuthKey".equals(field)) {
      return PortletFeed.getUseAuthKeyLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletFeed  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletFeed() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletFeed()) {
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
    
    if (!validateCommonCreateUpdatePortletFeed()) {
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
    PortletFeed obj = (PortletFeed)data;
    obj.setFormats(getAvailableFormats());
    obj.setCopyright(getAvailableCopyright());
    obj.setCopyrightML(getAvailableCopyrightML());
    obj.setUseAuthKey(getAvailableUseAuthKey());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletFeed) {
      super.setId(v);
      theContent = (PortletFeed)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // formats
  // ----------------------------------------------------------------------  
  protected String[] formats = new String[0];
  protected int formatsAddCount = 0;
  public void setFormats(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.formats = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableFormats() {
    if (theContent != null && isFieldMissing("formats")) {
      if (theContent.getFormats() == null) {
        return formats;
      }
      return theContent.getFormats();
    }
    return formats;
  }
  
    
  
  public void setFormatsAddCount(int  v) {
    formatsAddCount = v;
  }
  
  public int getFormatsCount() {
    int arraySize = Util.getSize(getAvailableFormats());
    int res = 3 + arraySize + formatsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // copyright
  // ----------------------------------------------------------------------  
  protected String copyright = channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextString();
  protected HashMap copyrightML = channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextMap();
  public void setCopyright(String[]  v) {
    copyright = getMainLangValue(v, true, true);
    copyrightML = getMLMap(v, true, true);
  }
  public String getAvailableCopyright() {
    if (theContent != null && isFieldMissing("copyright")) {
      return theContent.getCopyright();
    }
    return copyright;
  }
  
    
  public HashMap getAllAvailableCopyrightML() {
    HashMap map = Util.getHashMap(getAvailableCopyrightML());
    map.put(channel.getLanguage(),getAvailableCopyright(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableCopyrightML() {
    if (theContent != null && isFieldMissing("copyright")) {
      return theContent.getCopyrightML();
    }
    return copyrightML;
  }
  public String getAvailableCopyright(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(copyright, channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextString())) {
          return copyright;
      	}
      } else {
      	if (copyrightML != null && Util.notEmpty((String)copyrightML.get(lang))) {
      	  return (String)copyrightML.get(lang);
      	}
      }
      return Util.getString(theContent.getCopyright(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return copyright;
    }
    return copyrightML == null ? "" : Util.getString((String)copyrightML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // useAuthKey
  // ----------------------------------------------------------------------  
  protected boolean useAuthKey = false;
  public void setUseAuthKey(boolean  v) {
    this.useAuthKey = v;
  }
  
  public boolean getAvailableUseAuthKey() {
    if (theContent != null && isFieldMissing("useAuthKey")) {
      return theContent.getUseAuthKey();
    }
    return useAuthKey;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// UG/eprbsBNsBseoT0z1+1g==
