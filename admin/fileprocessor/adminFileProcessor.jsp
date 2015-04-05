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

  if (!checkAccess("admin/operation/file-processor")) { 
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.fileprocessor.ui.FileProcessorAdminHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
 %></jsp:useBean><% 

  if (formHandler.validate()) {
	  return;
	}
 
  FileProcessorManager fileProcessorManager = FileProcessorManager.getInstance();
  RepositoryManager repositoryManager = RepositoryManager.getInstance();
  Repository repository = formHandler.getRepository();

  jcmsContext.addJavaScript("js/jalios/fileprocessor.js");
  jcmsContext.addCSSHeader("css/jalios/fileprocessor.css");
  
  // Title of the page
  request.setAttribute("title", glp("fileprocessor.adm.pagetitle"));  
  
  // in admin header, which menu and sub menu must be bolded
  request.setAttribute("operationAdminMenu", "true");
  request.setAttribute("fileProcessorSubAdminMenu", "true");

  // Global declaration of variables
  String action = channel.getSecuredBaseUrl(request) + FileProcessorAdminHandler.FP_ADMIN_JSP;
  String redirect = action;
  String formName = null; 


%><%@ include file='/admin/doAdminHeader.jspf' %>

<div id="fpAdmin">
	<h1 class='boTitle icon iconFileproc'>
   <%= glp("fileprocessor.adm.maintitle") %>
   <span id="processingthread-status" class="processingthread-status">
    <%-- Content of this span updated in AJAX by doAdminDisplayAction.jsp --%>
    <%
     boolean processingRunning = fileProcessorManager.isProcessingThreadRunning();
     if (fileProcessorManager.isProcessingThreadAlive()) {
      %><jalios:icon src="tick" /> <%
      if (processingRunning) { 
        %><jalios:icon src="waitsmall" /> <%
      }
      %><%= processingRunning ? glp("fileprocessor.adm.state.running") : glp("fileprocessor.adm.state.started") %><%
     } else {
      %><jalios:icon src="warning" /> <%= glp("fileprocessor.adm.state.stopped") %><%
     }
    %>
   </span>
  </h1>
  <%@ include file='/jcore/doMessageBox.jspf' %>

  <%-- --- LAST PROCESSING DATA (Queued and Treated, cross repositories) --%>
  <jalios:include jsp="/admin/fileprocessor/doAdminDisplayActions.jsp" />

	<% 
	 /* If several repositories are available, it is possible to choose the right repository */
	 if (formHandler.getAvailableRepositories().size() > 1) { %>
	<form action='<%= action %>' method='get' name='changeRepositoryForm' id='changeRepositoryForm' class="form-inline br">
	  <span class='formLabel'><%= glp("fileprocessor.adm.repositoryid") %></span>
		<select name="repositoryId" onchange='javascript:changeRepositoryForm.submit()' class="form-control">
		  <option value="" disabled="disabled"><%= glp("fileprocessor.adm.choosearepository") %></option>
		 <jalios:foreach collection="<%= formHandler.getAvailableRepositories() %>" name="itRepository" type="Repository">
		  <option value="<%= itRepository.getId() %>" <% if (itRepository.getId().equals(formHandler.getAvailableRepositoryId())) { %>selected="selected"<% } %>  ><%= itRepository.getName() %></option>
		 </jalios:foreach>
		</select>
	</form>
	<% } /* end of repositories selection */
	
	   if ( repository != null ) {
	     // Variables relative to the current repository
		   final RepositoryIndexer indexer = repository.getIndexer();
       final FileProcessingLog lastProcessingLog = getLastProcessingLog(repository); // DB query
       final int allPersistedFilesSetNbr = getAllPersistedFilesCount(repository); // DB query

       // Store current repository in request attribute for doAdminGeneral.jsp (dynamic JSP include)
       request.setAttribute("repository", repository);
	%>
	<jalios:javascript>
		  setSelectedTab("mainTab", <%= formHandler.getMainTab() %>);
	</jalios:javascript>
	<div class="tab-pane" id='mainTab'>  

    <%-- --- GLOBAL REPORT FOR REPOSITORY --------------------- --%>
    <jalios:include jsp="/admin/fileprocessor/doAdminGeneral.jsp" />    
    <%-- --- STATUS OF FILES PROCESSED ------------------------ --%>
    <%@ include file="doAdminFilesList.jspf" %>
		<%-- --- LIST OF EXTENSIONS AND PROCESSORSS -------------- --%>
		<%@ include file="doAdminExtensionsAndProcessors.jspf" %>
    <%-- --- LIST OF EXTENSIONS ------------------------------- --%>
    <%@ include file="doAdminExtensions.jspf" %>
    <%-- --- DISPLAY CURRENT EVENTS --------------------------- --%>
    <%@ include file="doAdminDisplayEvents.jspf" %>
    <%-- --- REPOSITORY SETTINGS ------------------------------ --%>
    <%@ include file="doAdminConfiguration.jspf" %>
    
    <jalios:include target="FILEPROCESSOR_ADMIN" targetContext="tab-page" />
	</div>
<% } /* End of repositoryid not null */ %>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %>
