// This file has been automatically generated.
// Generation date : Fri Apr 03 22:18:33 CEST 2015
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
public class EditArticleMSHandler extends EditArticleHandler {
   
  protected ArticleMS theContent;
  
  public Class getPublicationClass() {
    return ArticleMS.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpArticleMS  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      List list = processDataIds("tag",__tagStr,generated.Tag.class);
      this.tag = (generated.Tag[])list.toArray(new generated.Tag[0]);
    }
    if (!validateUploadedFileDocument(getAvailableTag(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableTag(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("tag".equals(field)) {
      return getAvailableTag();
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
  // validateCommonCreateUpdateArticleMS  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateArticleMS() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateArticleMS()) {
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
    
    if (!validateCommonCreateUpdateArticleMS()) {
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
    ArticleMS obj = (ArticleMS)data;
    obj.setTag(getAvailableTag());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof ArticleMS) {
      super.setId(v);
      theContent = (ArticleMS)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // tag
  // ----------------------------------------------------------------------  
  protected generated.Tag[] tag = new generated.Tag[0];
  protected int tagAddCount = 0;
  String[] __tagStr = null;
  public void setTag(String[]  v) {
    __tagStr = v;
  }
  public generated.Tag[] getAvailableTag() {
    if (theContent != null && isFieldMissing("tag")) {
      if (theContent.getTag() == null) {
        return tag;
      }
      return theContent.getTag();
    }
    return tag;
  }
  
    
  
  public void setTagAddCount(int  v) {
    tagAddCount = v;
  }
  
  public int getTagCount() {
    int arraySize = Util.getSize(getAvailableTag());
    int res = 3 + arraySize + tagAddCount;
    return res;
  }
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// NrA66xiKPmPbYu/uCNOPGw==
