// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:45 CET 2015
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
public class EditPortletQueryForeachHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletQueryForeach theContent;
  
  public Class getPublicationClass() {
    return PortletQueryForeach.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletQueryForeach  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      List list = processDataIds("firstPublications",__firstPublicationsStr,com.jalios.jcms.Content.class);
      this.firstPublications = (com.jalios.jcms.Content[])list.toArray(new com.jalios.jcms.Content[0]);
    }
    if (!validateUploadedFileDocument(getAvailableFirstPublications(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableFirstPublications(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("searchInDB".equals(field)) {
      return getAvailableSearchInDB();
    }
    
    if ("queries".equals(field)) {
      return getAvailableQueries();
    }
    
    if ("refineQueries".equals(field)) {
      return getAvailableRefineQueries();
    }
    
    if ("refineWithContextualCategories".equals(field)) {
      return getAvailableRefineWithContextualCategories();
    }
    
    if ("orderBy".equals(field)) {
      return getAvailableOrderBy();
    }
    
    if ("reverseOrder".equals(field)) {
      return getAvailableReverseOrder();
    }
    
    if ("maxResults".equals(field)) {
      return getAvailableMaxResults();
    }
    
    if ("skipFirstResults".equals(field)) {
      return getAvailableSkipFirstResults();
    }
    
    if ("showPager".equals(field)) {
      return getAvailableShowPager();
    }
    
    if ("pagerLabel".equals(field)) {
      return getAllAvailablePagerLabelML();
    }
    
    if ("pageSizes".equals(field)) {
      return getAvailablePageSizes();
    }
    
    if ("pagerAllLimit".equals(field)) {
      return getAvailablePagerAllLimit();
    }
    
    if ("hideWhenNoResults".equals(field)) {
      return getAvailableHideWhenNoResults();
    }
    
    if ("firstPublications".equals(field)) {
      return getAvailableFirstPublications();
    }
    
    if ("showInCurrentPortal".equals(field)) {
      return getAvailableShowInCurrentPortal();
    }
    
    if ("contextCategory".equals(field)) {
      return getAvailableContextCategory();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("searchInDB".equals(field)) {
      return PortletQueryForeach.getSearchInDBValues();
    }
    if ("refineQueries".equals(field)) {
      return PortletQueryForeach.getRefineQueriesValues();
    }
    if ("refineWithContextualCategories".equals(field)) {
      return PortletQueryForeach.getRefineWithContextualCategoriesValues();
    }
    if ("orderBy".equals(field)) {
      return PortletQueryForeach.getOrderByValues();
    }
    if ("reverseOrder".equals(field)) {
      return PortletQueryForeach.getReverseOrderValues();
    }
    if ("showPager".equals(field)) {
      return PortletQueryForeach.getShowPagerValues();
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletQueryForeach.getHideWhenNoResultsValues();
    }
    if ("showInCurrentPortal".equals(field)) {
      return PortletQueryForeach.getShowInCurrentPortalValues();
    }
    if ("contextCategory".equals(field)) {
      return PortletQueryForeach.getContextCategoryValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("searchInDB".equals(field)) {
      return PortletQueryForeach.getSearchInDBLabels(userLang);
    }
    if ("refineQueries".equals(field)) {
      return PortletQueryForeach.getRefineQueriesLabels(userLang);
    }
    if ("refineWithContextualCategories".equals(field)) {
      return PortletQueryForeach.getRefineWithContextualCategoriesLabels(userLang);
    }
    if ("orderBy".equals(field)) {
      return PortletQueryForeach.getOrderByLabels(userLang);
    }
    if ("reverseOrder".equals(field)) {
      return PortletQueryForeach.getReverseOrderLabels(userLang);
    }
    if ("showPager".equals(field)) {
      return PortletQueryForeach.getShowPagerLabels(userLang);
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletQueryForeach.getHideWhenNoResultsLabels(userLang);
    }
    if ("showInCurrentPortal".equals(field)) {
      return PortletQueryForeach.getShowInCurrentPortalLabels(userLang);
    }
    if ("contextCategory".equals(field)) {
      return PortletQueryForeach.getContextCategoryLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletQueryForeach  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletQueryForeach() {
    if (!isMaxResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxResults", userLang)));
      return false;
    }
    if (!isSkipFirstResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "skipFirstResults", userLang)));
      return false;
    }
    if (!isPageSizesValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "pageSizes", userLang)));
      return false;
    }
    if (!isPagerAllLimitValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "pagerAllLimit", userLang)));
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
    if (!validateCommonCreateUpdatePortletQueryForeach()) {
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
    
    if (!validateCommonCreateUpdatePortletQueryForeach()) {
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
    PortletQueryForeach obj = (PortletQueryForeach)data;
    obj.setSearchInDB(getAvailableSearchInDB());
    obj.setQueries(getAvailableQueries());
    obj.setRefineQueries(getAvailableRefineQueries());
    obj.setRefineWithContextualCategories(getAvailableRefineWithContextualCategories());
    obj.setOrderBy(getAvailableOrderBy());
    obj.setReverseOrder(getAvailableReverseOrder());
    obj.setMaxResults(getAvailableMaxResults());
    obj.setSkipFirstResults(getAvailableSkipFirstResults());
    obj.setShowPager(getAvailableShowPager());
    obj.setPagerLabel(getAvailablePagerLabel());
    obj.setPagerLabelML(getAvailablePagerLabelML());
    obj.setPageSizes(getAvailablePageSizes());
    obj.setPagerAllLimit(getAvailablePagerAllLimit());
    obj.setHideWhenNoResults(getAvailableHideWhenNoResults());
    obj.setFirstPublications(getAvailableFirstPublications());
    obj.setShowInCurrentPortal(getAvailableShowInCurrentPortal());
    obj.setContextCategory(getAvailableContextCategory());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletQueryForeach) {
      super.setId(v);
      theContent = (PortletQueryForeach)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // searchInDB
  // ----------------------------------------------------------------------  
  protected boolean searchInDB = false;
  public void setSearchInDB(boolean  v) {
    this.searchInDB = v;
  }
  
  public boolean getAvailableSearchInDB() {
    if (theContent != null && isFieldMissing("searchInDB")) {
      return theContent.getSearchInDB();
    }
    return searchInDB;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // queries
  // ----------------------------------------------------------------------  
  protected String[] queries = new String[0];
  protected int queriesAddCount = 0;
  public void setQueries(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.queries = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableQueries() {
    if (theContent != null && isFieldMissing("queries")) {
      if (theContent.getQueries() == null) {
        return queries;
      }
      return theContent.getQueries();
    }
    return queries;
  }
  
    
  
  public void setQueriesAddCount(int  v) {
    queriesAddCount = v;
  }
  
  public int getQueriesCount() {
    int arraySize = Util.getSize(getAvailableQueries());
    int res = 3 + arraySize + queriesAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // refineQueries
  // ----------------------------------------------------------------------  
  protected String refineQueries = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getDefaultTextString();
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
  // refineWithContextualCategories
  // ----------------------------------------------------------------------  
  protected boolean refineWithContextualCategories = false;
  public void setRefineWithContextualCategories(boolean  v) {
    this.refineWithContextualCategories = v;
  }
  
  public boolean getAvailableRefineWithContextualCategories() {
    if (theContent != null && isFieldMissing("refineWithContextualCategories")) {
      return theContent.getRefineWithContextualCategories();
    }
    return refineWithContextualCategories;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // orderBy
  // ----------------------------------------------------------------------  
  protected String orderBy = "udate";
  public void setOrderBy(String[]  v) {
    orderBy = getMainLangValue(v, true, true);
  }
  public String getAvailableOrderBy() {
    if (theContent != null && isFieldMissing("orderBy")) {
      return theContent.getOrderBy();
    }
    return orderBy;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // reverseOrder
  // ----------------------------------------------------------------------  
  protected String reverseOrder = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getDefaultTextString();
  public void setReverseOrder(String[]  v) {
    reverseOrder = getMainLangValue(v, true, true);
  }
  public String getAvailableReverseOrder() {
    if (theContent != null && isFieldMissing("reverseOrder")) {
      return theContent.getReverseOrder();
    }
    return reverseOrder;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------  
  protected boolean isMaxResultsValidated = true;
  protected int maxResults = 5;
  public void setMaxResults(String v) {
    try {
      maxResults = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaxResultsValidated = false;
    }
  }
  public int getAvailableMaxResults() {
    if (theContent != null && isFieldMissing("maxResults")) {
      return theContent.getMaxResults();
    }
    return maxResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skipFirstResults
  // ----------------------------------------------------------------------  
  protected boolean isSkipFirstResultsValidated = true;
  protected int skipFirstResults = 0;
  public void setSkipFirstResults(String v) {
    try {
      skipFirstResults = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isSkipFirstResultsValidated = false;
    }
  }
  public int getAvailableSkipFirstResults() {
    if (theContent != null && isFieldMissing("skipFirstResults")) {
      return theContent.getSkipFirstResults();
    }
    return skipFirstResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showPager
  // ----------------------------------------------------------------------  
  protected String showPager = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getDefaultTextString();
  public void setShowPager(String[]  v) {
    showPager = getMainLangValue(v, true, true);
  }
  public String getAvailableShowPager() {
    if (theContent != null && isFieldMissing("showPager")) {
      return theContent.getShowPager();
    }
    return showPager;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // pagerLabel
  // ----------------------------------------------------------------------  
  protected String pagerLabel = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextString();
  protected HashMap pagerLabelML = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextMap();
  public void setPagerLabel(String[]  v) {
    pagerLabel = getMainLangValue(v, true, true);
    pagerLabelML = getMLMap(v, true, true);
  }
  public String getAvailablePagerLabel() {
    if (theContent != null && isFieldMissing("pagerLabel")) {
      return theContent.getPagerLabel();
    }
    return pagerLabel;
  }
  
    
  public HashMap getAllAvailablePagerLabelML() {
    HashMap map = Util.getHashMap(getAvailablePagerLabelML());
    map.put(channel.getLanguage(),getAvailablePagerLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailablePagerLabelML() {
    if (theContent != null && isFieldMissing("pagerLabel")) {
      return theContent.getPagerLabelML();
    }
    return pagerLabelML;
  }
  public String getAvailablePagerLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pagerLabel, channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextString())) {
          return pagerLabel;
      	}
      } else {
      	if (pagerLabelML != null && Util.notEmpty((String)pagerLabelML.get(lang))) {
      	  return (String)pagerLabelML.get(lang);
      	}
      }
      return Util.getString(theContent.getPagerLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return pagerLabel;
    }
    return pagerLabelML == null ? "" : Util.getString((String)pagerLabelML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // pageSizes
  // ----------------------------------------------------------------------  
  protected boolean isPageSizesValidated = true;
  protected int[] pageSizes = new int[0];
  protected int pageSizesAddCount = 0;
  public void setPageSizes(String[] v) {
    try {
      v = Util.trimStringArray(v);
      pageSizes = new int[v.length];
      for(int i = 0; i < v.length; i++) {
        if (Util.isEmpty(v[i])) { continue; }
        pageSizes[i] = Integer.parseInt(v[i].trim());
      }
    } catch(NumberFormatException ex) {
      isPageSizesValidated = false;
    }
  }
  public int[] getAvailablePageSizes() {
    if (theContent != null && isFieldMissing("pageSizes")) {
      if (theContent.getPageSizes() == null) {
        return pageSizes;
      }
      return theContent.getPageSizes();
    }
    return pageSizes;
  }
  
    
  
  public void setPageSizesAddCount(int  v) {
    pageSizesAddCount = v;
  }
  
  public int getPageSizesCount() {
    int arraySize = Util.getSize(getAvailablePageSizes());
    int res = 3 + arraySize + pageSizesAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // pagerAllLimit
  // ----------------------------------------------------------------------  
  protected boolean isPagerAllLimitValidated = true;
  protected int pagerAllLimit = -1;
  public void setPagerAllLimit(String v) {
    try {
      pagerAllLimit = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isPagerAllLimitValidated = false;
    }
  }
  public int getAvailablePagerAllLimit() {
    if (theContent != null && isFieldMissing("pagerAllLimit")) {
      return theContent.getPagerAllLimit();
    }
    return pagerAllLimit;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------  
  protected boolean hideWhenNoResults = false;
  public void setHideWhenNoResults(boolean  v) {
    this.hideWhenNoResults = v;
  }
  
  public boolean getAvailableHideWhenNoResults() {
    if (theContent != null && isFieldMissing("hideWhenNoResults")) {
      return theContent.getHideWhenNoResults();
    }
    return hideWhenNoResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // firstPublications
  // ----------------------------------------------------------------------  
  protected com.jalios.jcms.Content[] firstPublications = new com.jalios.jcms.Content[0];
  protected int firstPublicationsAddCount = 0;
  String[] __firstPublicationsStr = null;
  public void setFirstPublications(String[]  v) {
    __firstPublicationsStr = v;
  }
  public com.jalios.jcms.Content[] getAvailableFirstPublications() {
    if (theContent != null && isFieldMissing("firstPublications")) {
      if (theContent.getFirstPublications() == null) {
        return firstPublications;
      }
      return theContent.getFirstPublications();
    }
    return firstPublications;
  }
  
    
  
  public void setFirstPublicationsAddCount(int  v) {
    firstPublicationsAddCount = v;
  }
  
  public int getFirstPublicationsCount() {
    int arraySize = Util.getSize(getAvailableFirstPublications());
    int res = 3 + arraySize + firstPublicationsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // showInCurrentPortal
  // ----------------------------------------------------------------------  
  protected boolean showInCurrentPortal = false;
  public void setShowInCurrentPortal(boolean  v) {
    this.showInCurrentPortal = v;
  }
  
  public boolean getAvailableShowInCurrentPortal() {
    if (theContent != null && isFieldMissing("showInCurrentPortal")) {
      return theContent.getShowInCurrentPortal();
    }
    return showInCurrentPortal;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // contextCategory
  // ----------------------------------------------------------------------  
  protected boolean contextCategory = false;
  public void setContextCategory(boolean  v) {
    this.contextCategory = v;
  }
  
  public boolean getAvailableContextCategory() {
    if (theContent != null && isFieldMissing("contextCategory")) {
      return theContent.getContextCategory();
    }
    return contextCategory;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// HmSzaOKyQTvyl4mHxj90nA==
