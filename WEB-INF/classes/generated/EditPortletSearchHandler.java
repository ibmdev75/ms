// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:56 CET 2015
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
public class EditPortletSearchHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletSearch theContent;
  
  public Class getPublicationClass() {
    return PortletSearch.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletSearch  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("queryPortlet", __queryPortletStr, generated.PortletQueryForeach.class);
      if (data != null) { 
        queryPortlet = (generated.PortletQueryForeach)data;
      } else {
        isQueryPortletValidated = Util.isEmpty(__queryPortletStr);
      }
    }
    {
      Data data = processDataId("displayPortal", __displayPortalStr, generated.PortletPortal.class);
      if (data != null) { 
        displayPortal = (generated.PortletPortal)data;
      } else {
        isDisplayPortalValidated = Util.isEmpty(__displayPortalStr);
      }
    }
    {
      Data data = processDataId("advancedSearchPortlet", __advancedSearchPortletStr, generated.PortletSearch.class);
      if (data != null) { 
        advancedSearchPortlet = (generated.PortletSearch)data;
      } else {
        isAdvancedSearchPortletValidated = Util.isEmpty(__advancedSearchPortletStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableQueryPortlet(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailableDisplayPortal(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailableAdvancedSearchPortlet(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableQueryPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableDisplayPortal(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableAdvancedSearchPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("titleText".equals(field)) {
      return getAllAvailableTitleTextML();
    }
    
    if ("searchWith".equals(field)) {
      return getAvailableSearchWith();
    }
    
    if ("searchIn".equals(field)) {
      return getAvailableSearchIn();
    }
    
    if ("instantSearch".equals(field)) {
      return getAvailableInstantSearch();
    }
    
    if ("query".equals(field)) {
      return getAvailableQuery();
    }
    
    if ("refineQueries".equals(field)) {
      return getAvailableRefineQueries();
    }
    
    if ("queryPortlet".equals(field)) {
      return getAvailableQueryPortlet();
    }
    
    if ("displayPortal".equals(field)) {
      return getAvailableDisplayPortal();
    }
    
    if ("advancedSearchPortlet".equals(field)) {
      return getAvailableAdvancedSearchPortlet();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("searchWith".equals(field)) {
      return PortletSearch.getSearchWithValues();
    }
    if ("searchIn".equals(field)) {
      return PortletSearch.getSearchInValues();
    }
    if ("instantSearch".equals(field)) {
      return PortletSearch.getInstantSearchValues();
    }
    if ("refineQueries".equals(field)) {
      return PortletSearch.getRefineQueriesValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("searchWith".equals(field)) {
      return PortletSearch.getSearchWithLabels(userLang);
    }
    if ("searchIn".equals(field)) {
      return PortletSearch.getSearchInLabels(userLang);
    }
    if ("instantSearch".equals(field)) {
      return PortletSearch.getInstantSearchLabels(userLang);
    }
    if ("refineQueries".equals(field)) {
      return PortletSearch.getRefineQueriesLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletSearch  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletSearch() {
    if (!isQueryPortletValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "queryPortlet", userLang)));
      return false;
    }
    if (!isDisplayPortalValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "displayPortal", userLang)));
      return false;
    }
    if (!isAdvancedSearchPortletValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "advancedSearchPortlet", userLang)));
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
    if (!validateCommonCreateUpdatePortletSearch()) {
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
    
    if (!validateCommonCreateUpdatePortletSearch()) {
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
    PortletSearch obj = (PortletSearch)data;
    obj.setTitleText(getAvailableTitleText());
    obj.setTitleTextML(getAvailableTitleTextML());
    obj.setSearchWith(getAvailableSearchWith());
    obj.setSearchIn(getAvailableSearchIn());
    obj.setInstantSearch(getAvailableInstantSearch());
    obj.setQuery(getAvailableQuery());
    obj.setRefineQueries(getAvailableRefineQueries());
    obj.setQueryPortlet(getAvailableQueryPortlet());
    obj.setDisplayPortal(getAvailableDisplayPortal());
    obj.setAdvancedSearchPortlet(getAvailableAdvancedSearchPortlet());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletSearch) {
      super.setId(v);
      theContent = (PortletSearch)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // titleText
  // ----------------------------------------------------------------------  
  protected String titleText = channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextString();
  protected HashMap titleTextML = channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextMap();
  public void setTitleText(String[]  v) {
    titleText = getMainLangValue(v, true, true);
    titleTextML = getMLMap(v, true, true);
  }
  public String getAvailableTitleText() {
    if (theContent != null && isFieldMissing("titleText")) {
      return theContent.getTitleText();
    }
    return titleText;
  }
  
    
  public HashMap getAllAvailableTitleTextML() {
    HashMap map = Util.getHashMap(getAvailableTitleTextML());
    map.put(channel.getLanguage(),getAvailableTitleText(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableTitleTextML() {
    if (theContent != null && isFieldMissing("titleText")) {
      return theContent.getTitleTextML();
    }
    return titleTextML;
  }
  public String getAvailableTitleText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(titleText, channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextString())) {
          return titleText;
      	}
      } else {
      	if (titleTextML != null && Util.notEmpty((String)titleTextML.get(lang))) {
      	  return (String)titleTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getTitleText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return titleText;
    }
    return titleTextML == null ? "" : Util.getString((String)titleTextML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // searchWith
  // ----------------------------------------------------------------------  
  protected String searchWith = channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getDefaultTextString();
  public void setSearchWith(String[]  v) {
    searchWith = getMainLangValue(v, true, true);
  }
  public String getAvailableSearchWith() {
    if (theContent != null && isFieldMissing("searchWith")) {
      return theContent.getSearchWith();
    }
    return searchWith;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // searchIn
  // ----------------------------------------------------------------------  
  protected String[] searchIn = new String[0];
  protected int searchInAddCount = 0;
  public void setSearchIn(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.searchIn = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableSearchIn() {
    if (theContent != null && isFieldMissing("searchIn")) {
      if (theContent.getSearchIn() == null) {
        return searchIn;
      }
      return theContent.getSearchIn();
    }
    return searchIn;
  }
  
    
  
  public void setSearchInAddCount(int  v) {
    searchInAddCount = v;
  }
  
  public int getSearchInCount() {
    int arraySize = Util.getSize(getAvailableSearchIn());
    int res = 3 + arraySize + searchInAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // instantSearch
  // ----------------------------------------------------------------------  
  protected boolean instantSearch = true;
  public void setInstantSearch(boolean  v) {
    this.instantSearch = v;
  }
  
  public boolean getAvailableInstantSearch() {
    if (theContent != null && isFieldMissing("instantSearch")) {
      return theContent.getInstantSearch();
    }
    return instantSearch;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // query
  // ----------------------------------------------------------------------  
  protected String query = channel.getTypeFieldEntry(PortletSearch.class, "query", true).getDefaultTextString();
  public void setQuery(String[]  v) {
    query = getMainLangValue(v, true, true);
  }
  public String getAvailableQuery() {
    if (theContent != null && isFieldMissing("query")) {
      return theContent.getQuery();
    }
    return query;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // refineQueries
  // ----------------------------------------------------------------------  
  protected String refineQueries = channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getDefaultTextString();
  public void setRefineQueries(String[]  v) {
    refineQueries = getMainLangValue(v, true, true);
  }
  public String getAvailableRefineQueries() {
    if (theContent != null && isFieldMissing("refineQueries")) {
      return theContent.getRefineQueries();
    }
    return refineQueries;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // queryPortlet
  // ----------------------------------------------------------------------  
  protected boolean isQueryPortletValidated = true;
  protected generated.PortletQueryForeach queryPortlet;
  String __queryPortletStr = null;
  public void setQueryPortlet(String v) {
    __queryPortletStr = v;
  }
  public generated.PortletQueryForeach getAvailableQueryPortlet() {
    if (theContent != null && isFieldMissing("queryPortlet")) {
      return theContent.getQueryPortlet();
    }
    return queryPortlet;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------  
  protected boolean isDisplayPortalValidated = true;
  protected generated.PortletPortal displayPortal;
  String __displayPortalStr = null;
  public void setDisplayPortal(String v) {
    __displayPortalStr = v;
  }
  public generated.PortletPortal getAvailableDisplayPortal() {
    if (theContent != null && isFieldMissing("displayPortal")) {
      return theContent.getDisplayPortal();
    }
    return displayPortal;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // advancedSearchPortlet
  // ----------------------------------------------------------------------  
  protected boolean isAdvancedSearchPortletValidated = true;
  protected generated.PortletSearch advancedSearchPortlet;
  String __advancedSearchPortletStr = null;
  public void setAdvancedSearchPortlet(String v) {
    __advancedSearchPortletStr = v;
  }
  public generated.PortletSearch getAvailableAdvancedSearchPortlet() {
    if (theContent != null && isFieldMissing("advancedSearchPortlet")) {
      return theContent.getAdvancedSearchPortlet();
    }
    return advancedSearchPortlet;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// RWLWXOeaztriJsVfRNUpfg==
