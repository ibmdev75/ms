// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:02 CET 2015
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
public class EditAbstractPortletStatHandler extends EditAbstractPortletSkinableHandler {
   
  protected AbstractPortletStat theContent;
  
  public Class getPublicationClass() {
    return AbstractPortletStat.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractPortletStat  
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
  
    if ("tabGroup".equals(field)) {
      return getAllAvailableTabGroupML();
    }
    
    if ("displayTimeChart".equals(field)) {
      return getAvailableDisplayTimeChart();
    }
    
    if ("displayWeekChart".equals(field)) {
      return getAvailableDisplayWeekChart();
    }
    
    if ("displayAverage".equals(field)) {
      return getAvailableDisplayAverage();
    }
    
    if ("regExpFilter".equals(field)) {
      return getAvailableRegExpFilter();
    }
    
    if ("topTen".equals(field)) {
      return getAvailableTopTen();
    }
    
    if ("filteredArea".equals(field)) {
      return getAvailableFilteredArea();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("displayTimeChart".equals(field)) {
      return AbstractPortletStat.getDisplayTimeChartValues();
    }
    if ("displayWeekChart".equals(field)) {
      return AbstractPortletStat.getDisplayWeekChartValues();
    }
    if ("displayAverage".equals(field)) {
      return AbstractPortletStat.getDisplayAverageValues();
    }
    if ("regExpFilter".equals(field)) {
      return AbstractPortletStat.getRegExpFilterValues();
    }
    if ("filteredArea".equals(field)) {
      return AbstractPortletStat.getFilteredAreaValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("displayTimeChart".equals(field)) {
      return AbstractPortletStat.getDisplayTimeChartLabels(userLang);
    }
    if ("displayWeekChart".equals(field)) {
      return AbstractPortletStat.getDisplayWeekChartLabels(userLang);
    }
    if ("displayAverage".equals(field)) {
      return AbstractPortletStat.getDisplayAverageLabels(userLang);
    }
    if ("regExpFilter".equals(field)) {
      return AbstractPortletStat.getRegExpFilterLabels(userLang);
    }
    if ("filteredArea".equals(field)) {
      return AbstractPortletStat.getFilteredAreaLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractPortletStat  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractPortletStat() {
    if (!isTopTenValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "topTen", userLang)));
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
    if (!validateCommonCreateUpdateAbstractPortletStat()) {
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
    
    if (!validateCommonCreateUpdateAbstractPortletStat()) {
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
    AbstractPortletStat obj = (AbstractPortletStat)data;
    obj.setTabGroup(getAvailableTabGroup());
    obj.setTabGroupML(getAvailableTabGroupML());
    obj.setDisplayTimeChart(getAvailableDisplayTimeChart());
    obj.setDisplayWeekChart(getAvailableDisplayWeekChart());
    obj.setDisplayAverage(getAvailableDisplayAverage());
    obj.setRegExpFilter(getAvailableRegExpFilter());
    obj.setTopTen(getAvailableTopTen());
    obj.setFilteredArea(getAvailableFilteredArea());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractPortletStat) {
      super.setId(v);
      theContent = (AbstractPortletStat)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // tabGroup
  // ----------------------------------------------------------------------  
  protected String tabGroup = channel.getTypeFieldEntry(AbstractPortletStat.class, "tabGroup", true).getDefaultTextString();
  protected HashMap tabGroupML = channel.getTypeFieldEntry(AbstractPortletStat.class, "tabGroup", true).getDefaultTextMap();
  public void setTabGroup(String[]  v) {
    tabGroup = getMainLangValue(v, true, true);
    tabGroupML = getMLMap(v, true, true);
  }
  public String getAvailableTabGroup() {
    if (theContent != null && isFieldMissing("tabGroup")) {
      return theContent.getTabGroup();
    }
    return tabGroup;
  }
  
    
  public HashMap getAllAvailableTabGroupML() {
    HashMap map = Util.getHashMap(getAvailableTabGroupML());
    map.put(channel.getLanguage(),getAvailableTabGroup(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableTabGroupML() {
    if (theContent != null && isFieldMissing("tabGroup")) {
      return theContent.getTabGroupML();
    }
    return tabGroupML;
  }
  public String getAvailableTabGroup(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(tabGroup, channel.getTypeFieldEntry(AbstractPortletStat.class, "tabGroup", true).getDefaultTextString())) {
          return tabGroup;
      	}
      } else {
      	if (tabGroupML != null && Util.notEmpty((String)tabGroupML.get(lang))) {
      	  return (String)tabGroupML.get(lang);
      	}
      }
      return Util.getString(theContent.getTabGroup(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return tabGroup;
    }
    return tabGroupML == null ? "" : Util.getString((String)tabGroupML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // displayTimeChart
  // ----------------------------------------------------------------------  
  protected boolean displayTimeChart = true;
  public void setDisplayTimeChart(boolean  v) {
    this.displayTimeChart = v;
  }
  
  public boolean getAvailableDisplayTimeChart() {
    if (theContent != null && isFieldMissing("displayTimeChart")) {
      return theContent.getDisplayTimeChart();
    }
    return displayTimeChart;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayWeekChart
  // ----------------------------------------------------------------------  
  protected boolean displayWeekChart = true;
  public void setDisplayWeekChart(boolean  v) {
    this.displayWeekChart = v;
  }
  
  public boolean getAvailableDisplayWeekChart() {
    if (theContent != null && isFieldMissing("displayWeekChart")) {
      return theContent.getDisplayWeekChart();
    }
    return displayWeekChart;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayAverage
  // ----------------------------------------------------------------------  
  protected boolean displayAverage = true;
  public void setDisplayAverage(boolean  v) {
    this.displayAverage = v;
  }
  
  public boolean getAvailableDisplayAverage() {
    if (theContent != null && isFieldMissing("displayAverage")) {
      return theContent.getDisplayAverage();
    }
    return displayAverage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // regExpFilter
  // ----------------------------------------------------------------------  
  protected boolean regExpFilter = true;
  public void setRegExpFilter(boolean  v) {
    this.regExpFilter = v;
  }
  
  public boolean getAvailableRegExpFilter() {
    if (theContent != null && isFieldMissing("regExpFilter")) {
      return theContent.getRegExpFilter();
    }
    return regExpFilter;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // topTen
  // ----------------------------------------------------------------------  
  protected boolean isTopTenValidated = true;
  protected int topTen = 10;
  public void setTopTen(String v) {
    try {
      topTen = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isTopTenValidated = false;
    }
  }
  public int getAvailableTopTen() {
    if (theContent != null && isFieldMissing("topTen")) {
      return theContent.getTopTen();
    }
    return topTen;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // filteredArea
  // ----------------------------------------------------------------------  
  protected String filteredArea = channel.getTypeFieldEntry(AbstractPortletStat.class, "filteredArea", true).getDefaultTextString();
  public void setFilteredArea(String[]  v) {
    filteredArea = getMainLangValue(v, true, true);
  }
  public String getAvailableFilteredArea() {
    if (theContent != null && isFieldMissing("filteredArea")) {
      return theContent.getFilteredArea();
    }
    return filteredArea;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// LzCdILDaJxbvOa7vxc1qsQ==
