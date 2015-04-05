// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:00 CET 2015
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
public class EditPortletRecentHistoryHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletRecentHistory theContent;
  
  public Class getPublicationClass() {
    return PortletRecentHistory.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletRecentHistory  
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
  
    if ("historySize".equals(field)) {
      return getAvailableHistorySize();
    }
    
    if ("pageSize".equals(field)) {
      return getAvailablePageSize();
    }
    
    if ("filterOnCurrentWorkspace".equals(field)) {
      return getAvailableFilterOnCurrentWorkspace();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("filterOnCurrentWorkspace".equals(field)) {
      return PortletRecentHistory.getFilterOnCurrentWorkspaceValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("filterOnCurrentWorkspace".equals(field)) {
      return PortletRecentHistory.getFilterOnCurrentWorkspaceLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletRecentHistory  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletRecentHistory() {
    if (!isHistorySizeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "historySize", userLang)));
      return false;
    }
    if (!isPageSizeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "pageSize", userLang)));
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
    if (!validateCommonCreateUpdatePortletRecentHistory()) {
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
    
    if (!validateCommonCreateUpdatePortletRecentHistory()) {
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
    PortletRecentHistory obj = (PortletRecentHistory)data;
    obj.setHistorySize(getAvailableHistorySize());
    obj.setPageSize(getAvailablePageSize());
    obj.setFilterOnCurrentWorkspace(getAvailableFilterOnCurrentWorkspace());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletRecentHistory) {
      super.setId(v);
      theContent = (PortletRecentHistory)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // historySize
  // ----------------------------------------------------------------------  
  protected boolean isHistorySizeValidated = true;
  protected int historySize = 20;
  public void setHistorySize(String v) {
    try {
      historySize = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isHistorySizeValidated = false;
    }
  }
  public int getAvailableHistorySize() {
    if (theContent != null && isFieldMissing("historySize")) {
      return theContent.getHistorySize();
    }
    return historySize;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // pageSize
  // ----------------------------------------------------------------------  
  protected boolean isPageSizeValidated = true;
  protected int pageSize = 5;
  public void setPageSize(String v) {
    try {
      pageSize = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isPageSizeValidated = false;
    }
  }
  public int getAvailablePageSize() {
    if (theContent != null && isFieldMissing("pageSize")) {
      return theContent.getPageSize();
    }
    return pageSize;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // filterOnCurrentWorkspace
  // ----------------------------------------------------------------------  
  protected boolean filterOnCurrentWorkspace = false;
  public void setFilterOnCurrentWorkspace(boolean  v) {
    this.filterOnCurrentWorkspace = v;
  }
  
  public boolean getAvailableFilterOnCurrentWorkspace() {
    if (theContent != null && isFieldMissing("filterOnCurrentWorkspace")) {
      return theContent.getFilterOnCurrentWorkspace();
    }
    return filterOnCurrentWorkspace;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// I/Sek6UcVRx+DiqcAARpIA==
