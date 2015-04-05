// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:58 CET 2015
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
public class EditPortletMenuHandler extends EditAbstractPortletHandler {
   
  protected PortletMenu theContent;
  
  public Class getPublicationClass() {
    return PortletMenu.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMenu  
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
  
    if ("items".equals(field)) {
      return getAvailableItems();
    }
    
    if ("itemSeparaor".equals(field)) {
      return getAvailableItemSeparaor();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("items".equals(field)) {
      return PortletMenu.getItemsValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("items".equals(field)) {
      return PortletMenu.getItemsLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMenu  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMenu() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletMenu()) {
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
    
    if (!validateCommonCreateUpdatePortletMenu()) {
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
    PortletMenu obj = (PortletMenu)data;
    obj.setItems(getAvailableItems());
    obj.setItemSeparaor(getAvailableItemSeparaor());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMenu) {
      super.setId(v);
      theContent = (PortletMenu)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // items
  // ----------------------------------------------------------------------  
  protected String[] items = new String[0];
  protected int itemsAddCount = 0;
  public void setItems(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.items = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableItems() {
    if (theContent != null && isFieldMissing("items")) {
      if (theContent.getItems() == null) {
        return items;
      }
      return theContent.getItems();
    }
    return items;
  }
  
    
  
  public void setItemsAddCount(int  v) {
    itemsAddCount = v;
  }
  
  public int getItemsCount() {
    int arraySize = Util.getSize(getAvailableItems());
    int res = 3 + arraySize + itemsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // itemSeparaor
  // ----------------------------------------------------------------------  
  protected String itemSeparaor = channel.getTypeFieldEntry(PortletMenu.class, "itemSeparaor", true).getDefaultTextString();
  public void setItemSeparaor(String[]  v) {
    itemSeparaor = getMainLangValue(v, true, true);
  }
  public String getAvailableItemSeparaor() {
    if (theContent != null && isFieldMissing("itemSeparaor")) {
      return theContent.getItemSeparaor();
    }
    return itemSeparaor;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// VjWSK4eG9xMfMXcoMHWZXw==
