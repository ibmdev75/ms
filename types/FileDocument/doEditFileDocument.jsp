<%--
  @Summary: FileDocument editor
  @Category: Customized
  @Author: Olivier Dedieu
  @Customizable: True
  @Requestable: True
--%><%@ include file='/jcore/doInitPage.jspf' %><%
  com.jalios.jcms.handler.EditFileDocumentHandler formHandler = (com.jalios.jcms.handler.EditFileDocumentHandler)request.getAttribute("formHandler");
  EditFileDocumentExtensionHandler extFormHandler = (EditFileDocumentExtensionHandler)request.getAttribute("extFormHandler");
  ServletUtil.backupAttribute(pageContext , "classBeingProcessed");
  request.setAttribute("classBeingProcessed", FileDocument.class);
%>
   <%-- Description ------------------------------------------------------------ --%> 
   <% if (formHandler.isFieldEdition("description")) { %>
	   <jalios:field  name="description" formHandler='<%= formHandler %>'>
		   <jalios:control />
	   </jalios:field>
   <% } %>

<% if (formHandler.getShowAllTabs()) { %>
   <%-- Filename ------------------------------------------------------------ --%> 
   <% if (formHandler.isFieldEdition("filename")) { %>
     <jalios:field label="ui.filedocument.lbl.filename" name="filename" formHandler='<%= formHandler %>' value="<%= formHandler.getAvailableFilename() %>">
         <jalios:control type="<%= ControlType.TEXTFIELD %>" />
     </jalios:field>
   <% } %>
   
	 <%-- OriginalFilename ------------------------------------------------------------ --%> 
	 <% if (formHandler.isFieldEdition("originalFilename")) { %>
	   <jalios:field label="ui.filedocument.lbl.ori-filename" name="originalFilename" formHandler='<%= formHandler %>' value="<%= formHandler.getAvailableOriginalFilename() %>">
	     <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	   </jalios:field>
   <% } %>
   
   <%-- ContentType ------------------------------------------------------------ --%> 
   <% if (formHandler.isFieldEdition("contentType")) { %>
     <jalios:field label="ui.filedocument.lbl.ctnt-type" name="contentType" formHandler='<%= formHandler %>' value="<%= formHandler.getAvailableContentType() %>">
       <jalios:control type="<%= ControlType.TEXTFIELD %>" />
     </jalios:field>
   <% } %>
 <% }  %>

<% if (formHandler.getPublicationClass().getName().startsWith("com.jalios.jcms.")) { %>
<%-- EXTENSION ------------------------------------------------------------ --%> 
<% if (extFormHandler != null) { %>
<%@ include file="/types/FileDocumentExtension/doEditFileDocumentExtension.jspf" %>
<% } %>

<%-- *** PLUGINS ********************** --%>
<jalios:include target="EDIT_PUB_MAINTAB" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% } %>
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>