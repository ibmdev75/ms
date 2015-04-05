<%--
  @Summary: FileProcessor Adminstration page
  @Since: jcms-7.0 
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.fileprocessor.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.processingmanagement.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.repository.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.ui.*" %><%
%><%@ page import="com.jalios.jcms.handler.*"%><%
%><%@include file="fpUImethods.jspf" %><%

 %><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.fileprocessor.LegacyWitnessFileImportHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
 %></jsp:useBean><% 

  if (formHandler.validate()) {
    return;
  }

  FileProcessorManager fileProcessorManager = FileProcessorManager.getInstance();
  RepositoryManager repositoryManager = RepositoryManager.getInstance();

  jcmsContext.addJavaScript("js/jalios/table.js");

  jcmsContext.addJavaScript("js/jalios/fileprocessor.js");
  jcmsContext.addCSSHeader("css/jalios/fileprocessor.css");
  
  // Title of the page
  request.setAttribute("title", glp("fileprocessor.adm.pagetitle"));  
  
  // in admin header, which menu and sub menu must be bolded
  request.setAttribute("operationAdminMenu", "true");
  request.setAttribute("fileProcessorSubAdminMenu", "true");

  String repositoryId = getAlphaNumParameter("repositoryId", "JCMSUpload");
  String witnessFilePath = getUntrustedStringParameter("witnessFilePath", "WEB-INF/plugins/FileProcessorPlugin/JCMSUpload/JCMSUpload.txt");
  boolean renameFileAfterImport = getBooleanParameter("renameFileAfterImport", true);
  
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div id="fpLegacyImport">
  <div class="page-header"><h1>Legacy File Processing Import</h1></div>
  
  <%@ include file='/jcore/doMessageBox.jspf' %>
   
   <div class='alert alert-info'>
    You must repeat the import operation on each replica of a JSync cluster (i.e.: each webapp instance having a different URID).
   </div>
  <p>
   
  <form action="admin/fileprocessor/importLegacy.jsp" method="post">
 
   <table class='layout'>
    <tr>
     <td class="text-right"><label class="formLabel" for="repositoryIdInput">Repository ID</label></td>
     <td><input id="repositoryIdInput" type="text" name="repositoryId" value="<%= repositoryId %>" size="20" /></td>
    </tr>
    
    <tr>
     <td class="text-right"><label class="formLabel" for="witnessFilePathInput">Witness File Path</label></td>
     <td><input id="witnessFilePathInput" type="text" name="witnessFilePath" value="<%= encodeForHTMLAttribute(witnessFilePath) %>" size="80" /></td>
    </tr>
    
    <tr>
     <td class="text-right"><label class="formLabel" for="renameFileAfterImportEnabledInput">Rename file after import</label></td>
     <td>
       <input id="renameFileAfterImportEnabledInput" type="radio" name="renameFileAfterImport" value="<%= true %>" <% if (renameFileAfterImport) { %>checked="checked"<% } %>/> <label for="renameFileAfterImportEnabledInput">Yes</label>
       <input id="renameFileAfterImportDisabledInput" type="radio" name="renameFileAfterImport" value="<%= false %>" <% if (!renameFileAfterImport) { %>checked="checked"<% } %>/> <label for="renameFileAfterImportDisabledInput">No</label>
     </td>
    </tr>

   </table>
    
    <input type="submit" name="opImport" class="btn btn-primary confirm" value="Import" />
  
  </form>

</div>
<%@ include file='/admin/doAdminFooter.jspf' %>
