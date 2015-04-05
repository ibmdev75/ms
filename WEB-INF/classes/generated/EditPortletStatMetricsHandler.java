// This file has been automatically generated.
// Generation date : Wed Jan 28 18:43:59 CET 2015
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
public class EditPortletStatMetricsHandler extends EditAbstractPortletStatHandler {
   
  protected PortletStatMetrics theContent;
  
  public Class getPublicationClass() {
    return PortletStatMetrics.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletStatMetrics  
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
  
    if ("statListener".equals(field)) {
      return getAvailableStatListener();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("statListener".equals(field)) {
      return PortletStatMetrics.getStatListenerValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("statListener".equals(field)) {
      return PortletStatMetrics.getStatListenerLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletStatMetrics  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletStatMetrics() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletStatMetrics()) {
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
    
    if (!validateCommonCreateUpdatePortletStatMetrics()) {
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
    PortletStatMetrics obj = (PortletStatMetrics)data;
    obj.setStatListener(getAvailableStatListener());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletStatMetrics) {
      super.setId(v);
      theContent = (PortletStatMetrics)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // statListener
  // ----------------------------------------------------------------------  
  protected String statListener = channel.getTypeFieldEntry(PortletStatMetrics.class, "statListener", true).getDefaultTextString();
  public void setStatListener(String[]  v) {
    statListener = getMainLangValue(v, true, true);
  }
  public String getAvailableStatListener() {
    if (theContent != null && isFieldMissing("statListener")) {
      return theContent.getStatListener();
    }
    return statListener;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// WdMddBktG6NluqHA43TaRA==
