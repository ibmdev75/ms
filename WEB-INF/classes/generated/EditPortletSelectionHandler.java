// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:49 CET 2015
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
public class EditPortletSelectionHandler extends EditAbstractCollectionHandler {
   
  protected PortletSelection theContent;
  
  public Class getPublicationClass() {
    return PortletSelection.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletSelection  
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
  
    if ("showDisplayHeaderFooter".equals(field)) {
      return getAvailableShowDisplayHeaderFooter();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("showDisplayHeaderFooter".equals(field)) {
      return PortletSelection.getShowDisplayHeaderFooterValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("showDisplayHeaderFooter".equals(field)) {
      return PortletSelection.getShowDisplayHeaderFooterLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletSelection  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletSelection() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletSelection()) {
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
    
    if (!validateCommonCreateUpdatePortletSelection()) {
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
    PortletSelection obj = (PortletSelection)data;
    obj.setShowDisplayHeaderFooter(getAvailableShowDisplayHeaderFooter());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletSelection) {
      super.setId(v);
      theContent = (PortletSelection)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // showDisplayHeaderFooter
  // ----------------------------------------------------------------------  
  protected boolean showDisplayHeaderFooter = true;
  public void setShowDisplayHeaderFooter(boolean  v) {
    this.showDisplayHeaderFooter = v;
  }
  
  public boolean getAvailableShowDisplayHeaderFooter() {
    if (theContent != null && isFieldMissing("showDisplayHeaderFooter")) {
      return theContent.getShowDisplayHeaderFooter();
    }
    return showDisplayHeaderFooter;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// JIA4ohlIkMq4Lg1aJHvVuA==
