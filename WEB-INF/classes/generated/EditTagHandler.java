// This file has been automatically generated.
// Generation date : Sat Apr 04 12:22:33 CEST 2015
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
public class EditTagHandler extends EditPublicationHandler {
   
  protected Tag theContent;
  
  public Class getPublicationClass() {
    return Tag.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpTag  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("url", __urlStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        url = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isUrlValidated = Util.isEmpty(__urlStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableUrl(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableUrl(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }
    
    if ("couleurFond".equals(field)) {
      return getAvailableCouleurFond();
    }
    
    if ("couleurTexte".equals(field)) {
      return getAvailableCouleurTexte();
    }
    
    if ("compteur".equals(field)) {
      return getAvailableCompteur();
    }
    
    if ("url".equals(field)) {
      return getAvailableUrl();
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
  // validateCommonCreateUpdateTag  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateTag() {
    if (!isCompteurValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "compteur", userLang)));
      return false;
    }
    if (!isUrlValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "url", userLang)));
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
    if (!validateCommonCreateUpdateTag()) {
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
    
    if (!validateCommonCreateUpdateTag()) {
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
    Tag obj = (Tag)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setCouleurFond(getAvailableCouleurFond());
    obj.setCouleurTexte(getAvailableCouleurTexte());
    obj.setCompteur(getAvailableCompteur());
    obj.setUrl(getAvailableUrl());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Tag) {
      super.setId(v);
      theContent = (Tag)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected String description = channel.getTypeFieldEntry(Tag.class, "description", true).getDefaultTextString();
  protected HashMap descriptionML = channel.getTypeFieldEntry(Tag.class, "description", true).getDefaultTextMap();
  public void setDescription(String[]  v) {
    description = getMainLangValue(v, false, true);
    descriptionML = getMLMap(v, false, true);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescription();
    }
    return description;
  }
  
    
  public HashMap getAllAvailableDescriptionML() {
    HashMap map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }
  
  public HashMap getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(Tag.class, "description", true).getDefaultTextString())) {
          return description;
      	}
      } else {
      	if (descriptionML != null && Util.notEmpty((String)descriptionML.get(lang))) {
      	  return (String)descriptionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDescription(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return description;
    }
    return descriptionML == null ? "" : Util.getString((String)descriptionML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // couleurFond
  // ----------------------------------------------------------------------  
  protected String couleurFond = channel.getTypeFieldEntry(Tag.class, "couleurFond", true).getDefaultTextString();
  public void setCouleurFond(String[]  v) {
    couleurFond = getMainLangValue(v, true, true);
  }
  public String getAvailableCouleurFond() {
    if (theContent != null && isFieldMissing("couleurFond")) {
      return theContent.getCouleurFond();
    }
    return couleurFond;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // couleurTexte
  // ----------------------------------------------------------------------  
  protected String couleurTexte = channel.getTypeFieldEntry(Tag.class, "couleurTexte", true).getDefaultTextString();
  public void setCouleurTexte(String[]  v) {
    couleurTexte = getMainLangValue(v, true, true);
  }
  public String getAvailableCouleurTexte() {
    if (theContent != null && isFieldMissing("couleurTexte")) {
      return theContent.getCouleurTexte();
    }
    return couleurTexte;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // compteur
  // ----------------------------------------------------------------------  
  protected boolean isCompteurValidated = true;
  protected int compteur = 0;
  public void setCompteur(String v) {
    try {
      compteur = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isCompteurValidated = false;
    }
  }
  public int getAvailableCompteur() {
    if (theContent != null && isFieldMissing("compteur")) {
      return theContent.getCompteur();
    }
    return compteur;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------  
  protected boolean isUrlValidated = true;
  protected com.jalios.jcms.portlet.PortalElement url;
  String __urlStr = null;
  public void setUrl(String v) {
    __urlStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableUrl() {
    if (theContent != null && isFieldMissing("url")) {
      return theContent.getUrl();
    }
    return url;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// +qNWViAJg4j615PcmPqrqQ==
