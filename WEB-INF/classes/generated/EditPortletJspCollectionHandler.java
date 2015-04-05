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
public class EditPortletJspCollectionHandler extends EditAbstractCollectionHandler {
   
  protected PortletJspCollection theContent;
  
  public Class getPublicationClass() {
    return PortletJspCollection.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletJspCollection  
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
  
    if ("jsp".equals(field)) {
      return getAvailableJsp();
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
  // validateCommonCreateUpdatePortletJspCollection  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletJspCollection() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletJspCollection()) {
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
    
    if (!validateCommonCreateUpdatePortletJspCollection()) {
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
    PortletJspCollection obj = (PortletJspCollection)data;
    obj.setJsp(getAvailableJsp());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletJspCollection) {
      super.setId(v);
      theContent = (PortletJspCollection)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // jsp
  // ----------------------------------------------------------------------  
  protected String jsp = channel.getTypeFieldEntry(PortletJspCollection.class, "jsp", true).getDefaultTextString();
  public void setJsp(String[]  v) {
    jsp = getMainLangValue(v, true, true);
  }
  public String getAvailableJsp() {
    if (theContent != null && isFieldMissing("jsp")) {
      return theContent.getJsp();
    }
    return jsp;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// foretdC+6z2GqPR+qKiIyg==
