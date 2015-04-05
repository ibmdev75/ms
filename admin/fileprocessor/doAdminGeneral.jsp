<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.fileprocessor.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.processingmanagement.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.repository.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.ui.*" %><%
%><%@ page import="com.jalios.jcms.handler.*"%><%
%><%@include file="fpUImethods.jspf" %><%

{
  FileProcessorManager fileProcessorManager = FileProcessorManager.getInstance();
  RepositoryManager repositoryManager = RepositoryManager.getInstance();
  Repository repository = (Repository) request.getAttribute("repository");
  if (repository == null) {
    String repositoryId = getAlphaNumParameter("repository", null);
    repository = repositoryManager.getRepository(repositoryId);
  }
  if (repository == null) {
    return;
  }
  
  DirectoryScanner scanner = repository.getDirectoryScanner();
  boolean scanningRunning = scanner.isRunning(); 
  FileProcessingLog lastProcessingLog = getLastProcessingLog(repository);

  int allPersistedFilesSetNbr = getAllPersistedFilesCount(repository);
  int allGloballyBlackListedFilesNumber = getAllGloballyBlackListedFilesCount(repository);
  int allPartiallyBlackListedFilesNumber = getAllPartiallyBlackListedFilesCount(repository);
  int allErrorFilesNumber = getAllErrorFileCount(repository);
  
%>
<% if (!jcmsContext.isAjaxRequest()) { %>
<div class='tab-page'>
  <h2 class="tab"><jalios:icon src='<%= FileProcessorUIUtil.ICON_GLOBAL_REPORT %>'  title='<%= glp("fileprocessor.adm.tab.status") %>' /> <%= glp("fileprocessor.adm.tab.globalreport") %></h2>
  <div  id="processinggeneral" class='tabinfo general'>
<% } %>

  <%-- Section for the generic informations --%>
  <fieldset>
    <legend class="formLabel"><%= glp("fileprocessor.adm.genericinformation.section.lbl") %></legend>
    <dl class="dl-horizontal">
        <dt><%= glp("fileprocessor.adm.filesinfo.persistedFileSetSize") %></dt>
        <dd>
         <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"mainTab", "status"}, new String[] {String.valueOf(FileProcessorAdminHandler.TABINDEX_FILES_STATUS), null})%>">
          <%= allPersistedFilesSetNbr %>
         </a>
        </dd>
      <% String percent = FileProcessorUIUtil.getDisplayPercent(allGloballyBlackListedFilesNumber, allPersistedFilesSetNbr); %>
        <dt><%= glp("fileprocessor.adm.filesinfo.globallyblacklistedfilesnumber") %></dt>
        <dd>
         <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"mainTab", "status"}, new String[] {String.valueOf(FileProcessorAdminHandler.TABINDEX_FILES_STATUS), "globallyblacklisted"})%>">
          <%= allGloballyBlackListedFilesNumber %>/<%= allPersistedFilesSetNbr %>
          <%= (percent != null) ? "(" + percent + ")" : "" %>
         </a>
        </dd>
      <% percent = FileProcessorUIUtil.getDisplayPercent(allPartiallyBlackListedFilesNumber, allPersistedFilesSetNbr); %>
        <dt><%= glp("fileprocessor.adm.filesinfo.partiallyblacklistedfilesnumber") %></dt>
        <dd>
         <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"mainTab", "status"}, new String[] {String.valueOf(FileProcessorAdminHandler.TABINDEX_FILES_STATUS), "partiallyblacklisted"})%>">
          <%= allPartiallyBlackListedFilesNumber %>/<%= allPersistedFilesSetNbr %>
          <%= (percent != null) ? "(" + percent + ")" : "" %>
         </a>
        </dd>
      <% percent = FileProcessorUIUtil.getDisplayPercent(allErrorFilesNumber, allPersistedFilesSetNbr); %>
        <dt><%= glp("fileprocessor.adm.filesinfo.errorfilesnumber") %></dt>
        <dd>
         <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"mainTab", "status"}, new String[] {String.valueOf(FileProcessorAdminHandler.TABINDEX_FILES_STATUS), "error"})%>">
          <%= allErrorFilesNumber %>/<%= allPersistedFilesSetNbr %>
          <%= (percent != null) ? "(" + percent + ")" : "" %>
         </a>
        </dd>
    </dl>
  </fieldset>
  
  <%-- Section for the informations relative to the last scanning --%>
  <fieldset>
    <legend class="formLabel"><%= glp("fileprocessor.adm.scanning") %></legend>
    <dl class="dl-horizontal">
        <dt><%= glp("fileprocessor.adm.state") %></dt>
        <dd>
          <%
           if (repositoryManager.isLaunched(repository.getId())) {
            %><jalios:icon src="tick" /> <%
            if (scanningRunning) { 
              %><jalios:icon src="waitsmall" /> <%
            }
            %><%= scanningRunning ? glp("fileprocessor.adm.state.running") : glp("fileprocessor.adm.state.started") %><%
           } else {
            %><jalios:icon src="warning" /> <%= glp("fileprocessor.adm.state.stopped") %><%
           }
          %>
        </dd>
      <tr> 
        <dt><%= glp("fileprocessor.adm.scanning.lastscan-date") %></dt>
        <dd>
          <% if (scanner.getLastScanEndDate() == null) { %>
          <%= glp("fileprocessor.adm.info.noscan") %>
          <% } else { %>
          <jalios:date date="<%= scanner.getLastScanEndDate() %>" format="short" />
          <jalios:time date="<%= scanner.getLastScanEndDate() %>" format='<%= "HH:mm:ss" %>' />
          (<%= glp("fileprocessor.adm.lastscan.info", scanner.getLastScanFileCount(), DateUtil.formatDuration(scanner.getLastScanDuration(), userLocale)) %>)
          <% } %>
        </dd>
        <dt><%= glp("fileprocessor.adm.scanning.nextscan-date") %></dt>
        <dd>
          <%
            Date nextScanDate = repositoryManager.getNextScanDate(repository.getId());
            if (nextScanDate == null) {
          %>
          <%= glp("fileprocessor.adm.info.notavailable") %>
          <% } else { %>
          <jalios:date date="<%= nextScanDate %>" format="short" />
          <jalios:time date="<%= nextScanDate %>" format='<%= "HH:mm:ss" %>' />
          <% } %>
        </dd>
    </dl>

    <div style="margin-top:5px;">
     <% String formName = "scanningActionForm"; %>
     <form action='<%= channel.getSecuredBaseUrl(request) + FileProcessorAdminHandler.FP_ADMIN_JSP %>' method='post' name='<%= formName %>' id='<%= formName  %>'>
       <%@include file="doAdminFilesListHiddenParams.jspf" %>
       
      <% if (repositoryManager.isLaunched(repository.getId())) { %>
       <input class='btn btn-default confirm' type='submit' name="opStop" value='<%= glp("fileprocessor.adm.stopRepository") %>' />
      <% } else { %>
       <input class='btn btn-default confirm' type='submit' name="opStart" value='<%= glp("fileprocessor.adm.startRepository") %>' />
      <% } %>
      <% if (!scanningRunning && repositoryManager.isLaunched(repository.getId())) { %>
       <input class='btn confirm btn-primary' type='submit' name="opExecuteNextAlarmNow" value="<%= glp("fileprocessor.adm.executeNextAlarmNowRepository") %>" />
      <% } %>
     </form>
    </div>
       
  </fieldset>  
  
<% if (!jcmsContext.isAjaxRequest()) { %>
  </div>
</div>
<% } %>

<jalios:javascript>
 var update = function() {
    document.fire('refresh:before' ,{ wrapper: 'processinggeneral' });
    new Ajax.Updater('processinggeneral', JcmsJsContext.getContextPath() + '/admin/fileprocessor/doAdminGeneral.jsp', {
      evalScripts: true,
      parameters: { repository: '<%= repository.getId() %>' },
      onComplete: function() {
        document.fire('refresh:after' ,{ wrapper: 'processinggeneral' });
      }
    });
 };
 <% boolean processingRunning = fileProcessorManager.isProcessingThreadRunning(); %>
 update.delay(<%= (scanningRunning || processingRunning) ? "1" : "10" %>);
</jalios:javascript>

<% } %>
<%@ include file='/jcore/doAjaxFooter.jspf' %>