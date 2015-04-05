<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcms.handler.EditDataHandler" %>
<%
  EditDataHandler handler  = (EditDataHandler) request.getAttribute("formHandler");
  if (handler == null || !handler.isFieldEdition("")){
    return;
  }
  
  Class classBeingProcessed = (Class) request.getAttribute("classBeingProcessed");
  if (classBeingProcessed == null) {
    classBeingProcessed = handler.getDataClass() ;
  }  
  
  if (classBeingProcessed == null) {
    return;
  }
  
  String   formName      = Util.getString(request.getAttribute("formName"),"editForm");
  boolean  fieldSet      = Util.toBoolean(request.getAttribute("extraDataFieldSet"),false);
  boolean  separator     = Util.toBoolean(request.getAttribute("extraDataSeparator"),!fieldSet);
  boolean  isDBDataClass = DBData.class.isAssignableFrom(classBeingProcessed); 
  boolean  isHorizontalLayout = Util.toBoolean(request.getAttribute("extraDataHorizontalLayout"),false);
  Set<String> extraDataSet = (Set<String>)request.getAttribute("extraDataSet");
  
  // Retrieve authorized values
  Map<String,String> defaultExtraData  = isDBDataClass ? null : Data.getNewDefaultExtraDataMap(classBeingProcessed, null, false, classBeingProcessed == handler.getDataClass());
  Map<String,String> defaultExtraDBData = Data.getNewDefaultExtraDBDataMap(classBeingProcessed, null, false, classBeingProcessed == handler.getDataClass());

  // Filter extraData
  if (extraDataSet != null) {
    if (defaultExtraData != null) {
      for(Iterator it = defaultExtraData.keySet().iterator(); it.hasNext();) {
        String key = (String)it.next();
        if (!extraDataSet.contains(key)) {
          it.remove();
        }
      }
    }
    if (defaultExtraDBData != null) {
      for(Iterator it = defaultExtraDBData.keySet().iterator(); it.hasNext();) {
        String key = (String)it.next();
        if (!extraDataSet.contains(key)) {
          it.remove();
        }
      }
    }    
  }
  
  
  boolean processExtraData = !isDBDataClass && Util.notEmpty(defaultExtraData);
  boolean processExtraDBData = Util.notEmpty(defaultExtraDBData);
  
  // Retrieve object values
  Map<String,String> availableExtraData = processExtraData ? handler.getAvailableExtraDataMap() : null ;
  Map<String,String> availableExtraDBData = processExtraDBData ? handler.getAvailableExtraDBDataMap() : null;

  processExtraData = Util.notEmpty(availableExtraData);
  processExtraDBData = Util.notEmpty(availableExtraDBData);

  if (!processExtraData && !processExtraDBData) {
    return;
  }
%>
<% if (fieldSet) { %>
<fieldset>
<% } %>
<%  
  int formHiddenCount = 0;

  // 1. Extra Data
  if (processExtraData) {
	  String extraKeyFieldName = "extraKeys";
	  String extraValueFieldName = "extraValues";
	  String prefix = Util.getString(request.getAttribute("extraPrefix"), "");  
	  Map<String,String> availableValuesMap = availableExtraData;
	  for (Map.Entry<String,String> itEntry : defaultExtraData.entrySet()) {
	    %><%@ include file='/jcore/doEditExtraDataField.jspf' %><%
	  }
  }
  
  // 2. Extra DB Data
  if (processExtraDBData) {
	  String extraKeyFieldName = "extraDBKeys";
	  String extraValueFieldName = "extraDBValues";
	  String prefix = Util.getString(request.getAttribute("extraDBPrefix"), "");
    Map<String,String> availableValuesMap = availableExtraDBData;
	  for (Map.Entry<String,String> itEntry : defaultExtraDBData.entrySet()) {
	    %><%@ include file='/jcore/doEditExtraDataField.jspf' %><%
	  }
  }
  
  %><jalios:include target="EDIT_EXTRADATA" targetContext="tr" /><%
  %>
<% if (fieldSet) { %>
</fieldset>
<% } %>