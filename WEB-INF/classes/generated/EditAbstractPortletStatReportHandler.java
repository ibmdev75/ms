// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:04 CET 2015
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
public class EditAbstractPortletStatReportHandler extends EditAbstractCollectionHandler {
   
  protected AbstractPortletStatReport theContent;
  
  public Class getPublicationClass() {
    return AbstractPortletStatReport.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractPortletStatReport  
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
  
    if ("scheduleDate".equals(field)) {
      return getAvailableScheduleDate();
    }
    
    if ("startingDate".equals(field)) {
      return getAvailableStartingDate();
    }
    
    if ("endingDate".equals(field)) {
      return getAvailableEndingDate();
    }
    
    if ("schedule".equals(field)) {
      return getAvailableSchedule();
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
  // validateCommonCreateUpdateAbstractPortletStatReport  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractPortletStatReport() {
    if (!isScheduleDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "scheduleDate", userLang), HttpUtil.encodeForHTML(__scheduleDateStr)));
      return false;
    }
    if (!isStartingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startingDate", userLang), HttpUtil.encodeForHTML(__startingDateStr)));
      return false;
    }
    if (!isEndingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endingDate", userLang), HttpUtil.encodeForHTML(__endingDateStr)));
      return false;
    }
    if (!isScheduleValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "schedule", userLang)));
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
    if (!validateCommonCreateUpdateAbstractPortletStatReport()) {
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
    
    if (!validateCommonCreateUpdateAbstractPortletStatReport()) {
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
    if (!isScheduleDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "scheduleDate", userLang), HttpUtil.encodeForHTML(__scheduleDateStr)));
      return false;
    }
    if (!isStartingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startingDate", userLang), HttpUtil.encodeForHTML(__startingDateStr)));
      return false;
    }
    if (!isEndingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endingDate", userLang), HttpUtil.encodeForHTML(__endingDateStr)));
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
    if (!isScheduleDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "scheduleDate", userLang), HttpUtil.encodeForHTML(__scheduleDateStr)));
      return false;
    }
    if (!isStartingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startingDate", userLang), HttpUtil.encodeForHTML(__startingDateStr)));
      return false;
    }
    if (!isEndingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endingDate", userLang), HttpUtil.encodeForHTML(__endingDateStr)));
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
    if (!isScheduleDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "scheduleDate", userLang), HttpUtil.encodeForHTML(__scheduleDateStr)));
      return false;
    }
    if (!isStartingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "startingDate", userLang), HttpUtil.encodeForHTML(__startingDateStr)));
      return false;
    }
    if (!isEndingDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "endingDate", userLang), HttpUtil.encodeForHTML(__endingDateStr)));
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    AbstractPortletStatReport obj = (AbstractPortletStatReport)data;
    obj.setScheduleDate(getAvailableScheduleDate());
    obj.setStartingDate(getAvailableStartingDate());
    obj.setEndingDate(getAvailableEndingDate());
    obj.setSchedule(getAvailableSchedule());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractPortletStatReport) {
      super.setId(v);
      theContent = (AbstractPortletStatReport)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // scheduleDate
  // ----------------------------------------------------------------------  
  protected String __scheduleDateStr = "";
  protected boolean isScheduleDateValidated = true;
  protected Date scheduleDate;
  public void setScheduleDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __scheduleDateStr = v.trim();      
      scheduleDate = dateFormatter.parse(__scheduleDateStr);
    } catch(java.text.ParseException ex) {
      isScheduleDateValidated = false;
    }
  }
  public java.util.Date getAvailableScheduleDate() {
    if (theContent != null && isFieldMissing("scheduleDate")) {
      return theContent.getScheduleDate();
    }
    return scheduleDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // startingDate
  // ----------------------------------------------------------------------  
  protected String __startingDateStr = "";
  protected boolean isStartingDateValidated = true;
  protected Date startingDate;
  public void setStartingDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __startingDateStr = v.trim();      
      startingDate = dateFormatter.parse(__startingDateStr);
    } catch(java.text.ParseException ex) {
      isStartingDateValidated = false;
    }
  }
  public java.util.Date getAvailableStartingDate() {
    if (theContent != null && isFieldMissing("startingDate")) {
      return theContent.getStartingDate();
    }
    return startingDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // endingDate
  // ----------------------------------------------------------------------  
  protected String __endingDateStr = "";
  protected boolean isEndingDateValidated = true;
  protected Date endingDate;
  public void setEndingDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __endingDateStr = v.trim();      
      endingDate = dateFormatter.parse(__endingDateStr);
    } catch(java.text.ParseException ex) {
      isEndingDateValidated = false;
    }
  }
  public java.util.Date getAvailableEndingDate() {
    if (theContent != null && isFieldMissing("endingDate")) {
      return theContent.getEndingDate();
    }
    return endingDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // schedule
  // ----------------------------------------------------------------------  
  protected boolean isScheduleValidated = true;
  protected long schedule = 0;
  public void setSchedule(String v) {
    try {
      schedule = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      isScheduleValidated = false;
    }
  }
  
  public long getAvailableSchedule() {
    if (theContent != null && isFieldMissing("schedule")) {
      return theContent.getSchedule();
    }
    return schedule;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// YrbnhBMcCTJGV7A4PHaaAg==
