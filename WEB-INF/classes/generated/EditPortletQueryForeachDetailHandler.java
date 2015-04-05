// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:50 CET 2015
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
public class EditPortletQueryForeachDetailHandler extends EditPortletQueryForeachHandler {
   
  protected PortletQueryForeachDetail theContent;
  
  public Class getPublicationClass() {
    return PortletQueryForeachDetail.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletQueryForeachDetail  
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
  
    if ("showTitle".equals(field)) {
      return getAvailableShowTitle();
    }
    
    if ("showAbstract".equals(field)) {
      return getAvailableShowAbstract();
    }
    
    if ("showAuthor".equals(field)) {
      return getAvailableShowAuthor();
    }
    
    if ("showCategories".equals(field)) {
      return getAvailableShowCategories();
    }
    
    if ("showDate".equals(field)) {
      return getAvailableShowDate();
    }
    
    if ("showStatus".equals(field)) {
      return getAvailableShowStatus();
    }
    
    if ("showType".equals(field)) {
      return getAvailableShowType();
    }
    
    if ("showRights".equals(field)) {
      return getAvailableShowRights();
    }
    
    if ("showId".equals(field)) {
      return getAvailableShowId();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("showTitle".equals(field)) {
      return PortletQueryForeachDetail.getShowTitleValues();
    }
    if ("showAbstract".equals(field)) {
      return PortletQueryForeachDetail.getShowAbstractValues();
    }
    if ("showAuthor".equals(field)) {
      return PortletQueryForeachDetail.getShowAuthorValues();
    }
    if ("showCategories".equals(field)) {
      return PortletQueryForeachDetail.getShowCategoriesValues();
    }
    if ("showDate".equals(field)) {
      return PortletQueryForeachDetail.getShowDateValues();
    }
    if ("showStatus".equals(field)) {
      return PortletQueryForeachDetail.getShowStatusValues();
    }
    if ("showType".equals(field)) {
      return PortletQueryForeachDetail.getShowTypeValues();
    }
    if ("showRights".equals(field)) {
      return PortletQueryForeachDetail.getShowRightsValues();
    }
    if ("showId".equals(field)) {
      return PortletQueryForeachDetail.getShowIdValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("showTitle".equals(field)) {
      return PortletQueryForeachDetail.getShowTitleLabels(userLang);
    }
    if ("showAbstract".equals(field)) {
      return PortletQueryForeachDetail.getShowAbstractLabels(userLang);
    }
    if ("showAuthor".equals(field)) {
      return PortletQueryForeachDetail.getShowAuthorLabels(userLang);
    }
    if ("showCategories".equals(field)) {
      return PortletQueryForeachDetail.getShowCategoriesLabels(userLang);
    }
    if ("showDate".equals(field)) {
      return PortletQueryForeachDetail.getShowDateLabels(userLang);
    }
    if ("showStatus".equals(field)) {
      return PortletQueryForeachDetail.getShowStatusLabels(userLang);
    }
    if ("showType".equals(field)) {
      return PortletQueryForeachDetail.getShowTypeLabels(userLang);
    }
    if ("showRights".equals(field)) {
      return PortletQueryForeachDetail.getShowRightsLabels(userLang);
    }
    if ("showId".equals(field)) {
      return PortletQueryForeachDetail.getShowIdLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletQueryForeachDetail  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletQueryForeachDetail() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletQueryForeachDetail()) {
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
    
    if (!validateCommonCreateUpdatePortletQueryForeachDetail()) {
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
    PortletQueryForeachDetail obj = (PortletQueryForeachDetail)data;
    obj.setShowTitle(getAvailableShowTitle());
    obj.setShowAbstract(getAvailableShowAbstract());
    obj.setShowAuthor(getAvailableShowAuthor());
    obj.setShowCategories(getAvailableShowCategories());
    obj.setShowDate(getAvailableShowDate());
    obj.setShowStatus(getAvailableShowStatus());
    obj.setShowType(getAvailableShowType());
    obj.setShowRights(getAvailableShowRights());
    obj.setShowId(getAvailableShowId());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletQueryForeachDetail) {
      super.setId(v);
      theContent = (PortletQueryForeachDetail)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // showTitle
  // ----------------------------------------------------------------------  
  protected boolean showTitle = true;
  public void setShowTitle(boolean  v) {
    this.showTitle = v;
  }
  
  public boolean getAvailableShowTitle() {
    if (theContent != null && isFieldMissing("showTitle")) {
      return theContent.getShowTitle();
    }
    return showTitle;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showAbstract
  // ----------------------------------------------------------------------  
  protected boolean showAbstract = false;
  public void setShowAbstract(boolean  v) {
    this.showAbstract = v;
  }
  
  public boolean getAvailableShowAbstract() {
    if (theContent != null && isFieldMissing("showAbstract")) {
      return theContent.getShowAbstract();
    }
    return showAbstract;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showAuthor
  // ----------------------------------------------------------------------  
  protected boolean showAuthor = false;
  public void setShowAuthor(boolean  v) {
    this.showAuthor = v;
  }
  
  public boolean getAvailableShowAuthor() {
    if (theContent != null && isFieldMissing("showAuthor")) {
      return theContent.getShowAuthor();
    }
    return showAuthor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showCategories
  // ----------------------------------------------------------------------  
  protected boolean showCategories = false;
  public void setShowCategories(boolean  v) {
    this.showCategories = v;
  }
  
  public boolean getAvailableShowCategories() {
    if (theContent != null && isFieldMissing("showCategories")) {
      return theContent.getShowCategories();
    }
    return showCategories;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showDate
  // ----------------------------------------------------------------------  
  protected String showDate = channel.getTypeFieldEntry(PortletQueryForeachDetail.class, "showDate", true).getDefaultTextString();
  public void setShowDate(String[]  v) {
    showDate = getMainLangValue(v, true, true);
  }
  public String getAvailableShowDate() {
    if (theContent != null && isFieldMissing("showDate")) {
      return theContent.getShowDate();
    }
    return showDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showStatus
  // ----------------------------------------------------------------------  
  protected boolean showStatus = false;
  public void setShowStatus(boolean  v) {
    this.showStatus = v;
  }
  
  public boolean getAvailableShowStatus() {
    if (theContent != null && isFieldMissing("showStatus")) {
      return theContent.getShowStatus();
    }
    return showStatus;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showType
  // ----------------------------------------------------------------------  
  protected boolean showType = false;
  public void setShowType(boolean  v) {
    this.showType = v;
  }
  
  public boolean getAvailableShowType() {
    if (theContent != null && isFieldMissing("showType")) {
      return theContent.getShowType();
    }
    return showType;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showRights
  // ----------------------------------------------------------------------  
  protected boolean showRights = false;
  public void setShowRights(boolean  v) {
    this.showRights = v;
  }
  
  public boolean getAvailableShowRights() {
    if (theContent != null && isFieldMissing("showRights")) {
      return theContent.getShowRights();
    }
    return showRights;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showId
  // ----------------------------------------------------------------------  
  protected boolean showId = false;
  public void setShowId(boolean  v) {
    this.showId = v;
  }
  
  public boolean getAvailableShowId() {
    if (theContent != null && isFieldMissing("showId")) {
      return theContent.getShowId();
    }
    return showId;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// xUZHpma5Yuwrcpl2Ixooyg==
