// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:12 CET 2015
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
public class EditPortletWorkflowHandler extends EditPortletQueryForeachHandler {
   
  protected PortletWorkflow theContent;
  
  public Class getPublicationClass() {
    return PortletWorkflow.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletWorkflow  
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
  
    if ("maximumItemsPerWorkspace".equals(field)) {
      return getAvailableMaximumItemsPerWorkspace();
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
  // validateCommonCreateUpdatePortletWorkflow  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletWorkflow() {
    if (!isMaximumItemsPerWorkspaceValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maximumItemsPerWorkspace", userLang)));
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
    if (!validateCommonCreateUpdatePortletWorkflow()) {
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
    
    if (!validateCommonCreateUpdatePortletWorkflow()) {
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
    PortletWorkflow obj = (PortletWorkflow)data;
    obj.setMaximumItemsPerWorkspace(getAvailableMaximumItemsPerWorkspace());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletWorkflow) {
      super.setId(v);
      theContent = (PortletWorkflow)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // maximumItemsPerWorkspace
  // ----------------------------------------------------------------------  
  protected boolean isMaximumItemsPerWorkspaceValidated = true;
  protected int maximumItemsPerWorkspace = 0;
  public void setMaximumItemsPerWorkspace(String v) {
    try {
      maximumItemsPerWorkspace = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaximumItemsPerWorkspaceValidated = false;
    }
  }
  public int getAvailableMaximumItemsPerWorkspace() {
    if (theContent != null && isFieldMissing("maximumItemsPerWorkspace")) {
      return theContent.getMaximumItemsPerWorkspace();
    }
    return maximumItemsPerWorkspace;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// FoPnI484v01WARGpOonDkA==
