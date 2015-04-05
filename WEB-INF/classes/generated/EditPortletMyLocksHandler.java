// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:09 CET 2015
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
public class EditPortletMyLocksHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletMyLocks theContent;
  
  public Class getPublicationClass() {
    return PortletMyLocks.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMyLocks  
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
  
    if ("refineWorkspace".equals(field)) {
      return getAvailableRefineWorkspace();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("refineWorkspace".equals(field)) {
      return PortletMyLocks.getRefineWorkspaceValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("refineWorkspace".equals(field)) {
      return PortletMyLocks.getRefineWorkspaceLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMyLocks  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMyLocks() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletMyLocks()) {
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
    
    if (!validateCommonCreateUpdatePortletMyLocks()) {
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
    PortletMyLocks obj = (PortletMyLocks)data;
    obj.setRefineWorkspace(getAvailableRefineWorkspace());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMyLocks) {
      super.setId(v);
      theContent = (PortletMyLocks)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // refineWorkspace
  // ----------------------------------------------------------------------  
  protected boolean refineWorkspace = false;
  public void setRefineWorkspace(boolean  v) {
    this.refineWorkspace = v;
  }
  
  public boolean getAvailableRefineWorkspace() {
    if (theContent != null && isFieldMissing("refineWorkspace")) {
      return theContent.getRefineWorkspace();
    }
    return refineWorkspace;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// JhOeebv737uy8klnVu6ZHA==
