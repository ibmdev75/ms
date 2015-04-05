// This file has been automatically generated.
// Generation date : Wed Jan 28 18:44:16 CET 2015
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
public class EditPortletRowHandler extends EditAbstractCollectionHandler {
   
  protected PortletRow theContent;
  
  public Class getPublicationClass() {
    return PortletRow.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletRow  
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
  
    if ("rowSpacing".equals(field)) {
      return getAvailableRowSpacing();
    }
    
    if ("cellWidth".equals(field)) {
      return getAvailableCellWidth();
    }
    
    if ("alignHorizontal".equals(field)) {
      return getAvailableAlignHorizontal();
    }
    
    if ("alignVertical".equals(field)) {
      return getAvailableAlignVertical();
    }
    
    if ("backgroundColor".equals(field)) {
      return getAvailableBackgroundColor();
    }
    
    if ("backgroundImage".equals(field)) {
      return getAvailableBackgroundImage();
    }
    
    if ("backgroundRepeat".equals(field)) {
      return getAvailableBackgroundRepeat();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("alignHorizontal".equals(field)) {
      return PortletRow.getAlignHorizontalValues();
    }
    if ("alignVertical".equals(field)) {
      return PortletRow.getAlignVerticalValues();
    }
    if ("backgroundRepeat".equals(field)) {
      return PortletRow.getBackgroundRepeatValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("alignHorizontal".equals(field)) {
      return PortletRow.getAlignHorizontalLabels(userLang);
    }
    if ("alignVertical".equals(field)) {
      return PortletRow.getAlignVerticalLabels(userLang);
    }
    if ("backgroundRepeat".equals(field)) {
      return PortletRow.getBackgroundRepeatLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletRow  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletRow() {
    if (!isRowSpacingValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "rowSpacing", userLang)));
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
    if (!validateCommonCreateUpdatePortletRow()) {
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
    
    if (!validateCommonCreateUpdatePortletRow()) {
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
    PortletRow obj = (PortletRow)data;
    obj.setRowSpacing(getAvailableRowSpacing());
    obj.setCellWidth(getAvailableCellWidth());
    obj.setAlignHorizontal(getAvailableAlignHorizontal());
    obj.setAlignVertical(getAvailableAlignVertical());
    obj.setBackgroundColor(getAvailableBackgroundColor());
    obj.setBackgroundImage(getAvailableBackgroundImage());
    obj.setBackgroundRepeat(getAvailableBackgroundRepeat());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletRow) {
      super.setId(v);
      theContent = (PortletRow)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // rowSpacing
  // ----------------------------------------------------------------------  
  protected boolean isRowSpacingValidated = true;
  protected int rowSpacing = 0;
  public void setRowSpacing(String v) {
    try {
      rowSpacing = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isRowSpacingValidated = false;
    }
  }
  public int getAvailableRowSpacing() {
    if (theContent != null && isFieldMissing("rowSpacing")) {
      return theContent.getRowSpacing();
    }
    return rowSpacing;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cellWidth
  // ----------------------------------------------------------------------  
  protected String[] cellWidth = new String[0];
  protected int cellWidthAddCount = 0;
  public void setCellWidth(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.cellWidth = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableCellWidth() {
    if (theContent != null && isFieldMissing("cellWidth")) {
      if (theContent.getCellWidth() == null) {
        return cellWidth;
      }
      return theContent.getCellWidth();
    }
    return cellWidth;
  }
  
    
  
  public void setCellWidthAddCount(int  v) {
    cellWidthAddCount = v;
  }
  
  public int getCellWidthCount() {
    int arraySize = Util.getSize(getAvailableCellWidth());
    int res = 3 + arraySize + cellWidthAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // alignHorizontal
  // ----------------------------------------------------------------------  
  protected String[] alignHorizontal = new String[0];
  protected int alignHorizontalAddCount = 0;
  public void setAlignHorizontal(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.alignHorizontal = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableAlignHorizontal() {
    if (theContent != null && isFieldMissing("alignHorizontal")) {
      if (theContent.getAlignHorizontal() == null) {
        return alignHorizontal;
      }
      return theContent.getAlignHorizontal();
    }
    return alignHorizontal;
  }
  
    
  
  public void setAlignHorizontalAddCount(int  v) {
    alignHorizontalAddCount = v;
  }
  
  public int getAlignHorizontalCount() {
    int arraySize = Util.getSize(getAvailableAlignHorizontal());
    int res = 3 + arraySize + alignHorizontalAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // alignVertical
  // ----------------------------------------------------------------------  
  protected String[] alignVertical = new String[0];
  protected int alignVerticalAddCount = 0;
  public void setAlignVertical(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.alignVertical = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableAlignVertical() {
    if (theContent != null && isFieldMissing("alignVertical")) {
      if (theContent.getAlignVertical() == null) {
        return alignVertical;
      }
      return theContent.getAlignVertical();
    }
    return alignVertical;
  }
  
    
  
  public void setAlignVerticalAddCount(int  v) {
    alignVerticalAddCount = v;
  }
  
  public int getAlignVerticalCount() {
    int arraySize = Util.getSize(getAvailableAlignVertical());
    int res = 3 + arraySize + alignVerticalAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // backgroundColor
  // ----------------------------------------------------------------------  
  protected String[] backgroundColor = new String[0];
  protected int backgroundColorAddCount = 0;
  public void setBackgroundColor(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.backgroundColor = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableBackgroundColor() {
    if (theContent != null && isFieldMissing("backgroundColor")) {
      if (theContent.getBackgroundColor() == null) {
        return backgroundColor;
      }
      return theContent.getBackgroundColor();
    }
    return backgroundColor;
  }
  
    
  
  public void setBackgroundColorAddCount(int  v) {
    backgroundColorAddCount = v;
  }
  
  public int getBackgroundColorCount() {
    int arraySize = Util.getSize(getAvailableBackgroundColor());
    int res = 3 + arraySize + backgroundColorAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // backgroundImage
  // ----------------------------------------------------------------------  
  protected String[] backgroundImage = new String[0];
  protected int backgroundImageAddCount = 0;
  public void setBackgroundImage(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.backgroundImage = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableBackgroundImage() {
    if (theContent != null && isFieldMissing("backgroundImage")) {
      if (theContent.getBackgroundImage() == null) {
        return backgroundImage;
      }
      return theContent.getBackgroundImage();
    }
    return backgroundImage;
  }
  
    
  
  public void setBackgroundImageAddCount(int  v) {
    backgroundImageAddCount = v;
  }
  
  public int getBackgroundImageCount() {
    int arraySize = Util.getSize(getAvailableBackgroundImage());
    int res = 3 + arraySize + backgroundImageAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // backgroundRepeat
  // ----------------------------------------------------------------------  
  protected String[] backgroundRepeat = new String[0];
  protected int backgroundRepeatAddCount = 0;
  public void setBackgroundRepeat(String[]  v) {
    List list = new ArrayList();
    for(int i = 0; i < v.length; i++) {
      String str = v[i].trim();   
      str = JcmsUtil.escapeHtml(str);
      list.add(str);
    }
    this.backgroundRepeat = Util.trimStringArray((String[])list.toArray(new String[0]));   
  }
  
  public String[] getAvailableBackgroundRepeat() {
    if (theContent != null && isFieldMissing("backgroundRepeat")) {
      if (theContent.getBackgroundRepeat() == null) {
        return backgroundRepeat;
      }
      return theContent.getBackgroundRepeat();
    }
    return backgroundRepeat;
  }
  
    
  
  public void setBackgroundRepeatAddCount(int  v) {
    backgroundRepeatAddCount = v;
  }
  
  public int getBackgroundRepeatCount() {
    int arraySize = Util.getSize(getAvailableBackgroundRepeat());
    int res = 3 + arraySize + backgroundRepeatAddCount;
    return res;
  }
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 1lC5obVSefAL3y5Oau5Z8Q==
