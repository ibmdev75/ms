<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.fileprocessor.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.processingmanagement.*" %><%

  if (!checkAccess("admin/operation/file-processor")) { 
    return;
  }

  FileProcessorManager fileProcessorManager = FileProcessorManager.getInstance();
  List<ProcessingData> processingDataList = fileProcessorManager.getProcessingDataQueueCopy();
  
%>
<% if (!jcmsContext.isAjaxRequest()) { %>
<div id="processingactions" class='displayactions'>
<% } %>
<%
  if (Util.notEmpty(processingDataList)) {
%>
<jalios:pager name='fpPDPagerHandler' 
              declare='true' action='init' 
              size='<%= processingDataList.size() %>'
          />

  <table class="table-data table-condensed"  style="width: 900px">
    <thead>
      <tr>
        <th class="left fixed" scope="col"><%= glp("fileprocessor.adm.events.repository") %></th>        
        <th class="left fixed" scope="col"><%= glp("fileprocessor.adm.msg.processingdatatype") %></th>        
        <th class="center fixed" scope="col"><%= glp("fileprocessor.adm.msg.processingdatastate") %> </a>
        <th class="center large" scope="col"><%= glp("fileprocessor.adm.msg.progress") %> </a></th>
        <th class="left fixed" scope="col"><%= glp("fileprocessor.adm.msg.processingdata.submit-date") %></th>        
        <th class="left fixed" scope="col"><%= glp("fileprocessor.adm.msg.processingdata.start-date") %></th>        
        <th class="left fixed" scope="col"><%= glp("fileprocessor.adm.msg.processingdata.end-date") %></th>        
        <th class="left fixed" scope="col"><%= glp("ui.com.lbl.duration") %></th>        
    </thead>
  <jalios:foreach name="itProcessingData" type="ProcessingData" 
                  collection="<%= processingDataList %>"
                  skip="<%= fpPDPagerHandler.getStart() %>"
                  max="<%= fpPDPagerHandler.getPageSize() %>">
    <%
      final String processingDataState; 
      if (itProcessingData.isInterrupted()) {
        processingDataState = "interrupted"; 
      } else if (itProcessingData.isFinished()) {
        processingDataState = "finished"; 
      } else if (itProcessingData.isStarted()) {
        processingDataState = "running"; 
      } else {
        processingDataState = "queued"; 
      }
    %>
    <tr class="<%= processingDataState %>">
      <td class="repository">
        <%= itProcessingData.getRepository().getName() %>
      </td>
      <td class="processingdatatype">
        <%= glp("fileprocessor.adm.processingdatatype." + itProcessingData.getType()) %>
      </td>
      <td class="state">
        <%= glp("fileprocessor.adm.processingdatastate." + processingDataState) %>
      </td>
      <td class="data">
         <%
          int fileCount = itProcessingData.getFileCount();
          int processedFileCount = itProcessingData.getFileProcessedCount();
          int ignoredFileCount = itProcessingData.getFileIgnoredCount();
          int treatedFileCount = processedFileCount + ignoredFileCount;
          int progressPercent = fileCount == 0 ? 100 : (int)((100 * treatedFileCount) / fileCount);
          // Processed length is at min 1, because with 0 width, div.data doesn't appear
          int progressWidth = progressPercent == 0 ? 1 : progressPercent; 
          String progressBarText = (!itProcessingData.isStarted()) ? String.valueOf(fileCount) : (treatedFileCount + "/" + fileCount + " (" + progressPercent + "%)");
         %>
          <div class="progress <% if (progressPercent < 100) {%>progress-striped active<% } %>" style="min-width: 300px;">
            <div class="progress-bar" role="progressbar" aria-valuenow="<%= progressPercent %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= progressWidth %>%; min-width: <%= progressBarText.length()%>ex;">
              <%= progressBarText  %>
            </div>
          </div>
          <div class="file">
               <%-- File being processed or concerned by operation --%>             
               <%
                // Display Filename being processed if any,  
                // Always display filename when there is only one file submitted 
                File currentFile = (fileCount == 1) ? Util.getFirst(itProcessingData.getFileSet()) : itProcessingData.getCurrentFile();
                if (currentFile != null) {
                  String fileName = currentFile.getName();
                  String filepath = itProcessingData.getRepository().getFilenameRelativeToBaseDirectory(currentFile);
                  %> <span title="<%= filepath %>"><%= fileName %></span><%
                }
               %>
          </div>
      </td>
      <td>
        <jalios:date date="<%= itProcessingData.getCreationDate() %>" format="short" />
        <jalios:time date="<%= itProcessingData.getCreationDate() %>" format='<%= "HH:mm:ss" %>' />
      </td>
      <td>
       <% if (itProcessingData.isStarted()) { %>
         <jalios:date date="<%= itProcessingData.getProcessingStartDate() %>" format="short" />
         <jalios:time date="<%= itProcessingData.getProcessingStartDate() %>" format='<%= "HH:mm:ss" %>' />
       <% } %>
      </td>
      <td>
       <% if (itProcessingData.isFinished()) { %>
         <jalios:date date="<%= itProcessingData.getProcessingEndDate() %>" format="short" />
         <jalios:time date="<%= itProcessingData.getProcessingEndDate() %>" format='<%= "HH:mm:ss" %>' />
       <% } %>
      </td>
      <td>
       <% if (itProcessingData.isStarted()) { %>
         <% long duration = (itProcessingData.isFinished() ? itProcessingData.getProcessingEndDate().getTime() : System.currentTimeMillis()) - itProcessingData.getProcessingStartDate().getTime();%>
         <jalios:duration time='<%= duration %>'/>
       <% } %>
      </td>
    </tr>
  </jalios:foreach>
  <%--  SAMPLE FOR TESTS
    <tr class="interrupted">
      <td class="label">INTERRUPTED : <%= glp("fileprocessor.adm.processingdatatype.SCANNER") %></td>
      <td class="data">
        <div class="interrupted processingDataStats">
          <div class="progress" style="width: <%= 40 %>%;">
            <div class="data"><%= 20  %>/<%= 50 %> (<%= 40 %>%)</div>
          </div>
        </div>
      </td>
      <td class="state">
        <%= glp("fileprocessor.adm.processingdatastate." + "interrupted") %>
      </td>
    </tr>
    <tr class="finished">
      <td class="label">FINISHED: <%= glp("fileprocessor.adm.processingdatatype.FILE") %></td>
      <td class="data">
        <div class="finished processingDataStats">
          <div class="progress" style="width: <%= 0 %>%;">
            <div class="data"><%= 0  %>/<%= 1 %> (<%= 0 %>%)</div>
          </div>
        </div>
      </td>
      <td class="state">
        <%= glp("fileprocessor.adm.processingdatastate." + "finished") %>
      </td>
    </tr>
    <tr class="running">
      <td class="label">IN PROGRESS: <%= glp("fileprocessor.adm.processingdatatype.FILESET") %></td>
      <td class="data">
        <div class="processingDataStats">
          <div class="progress" style="width: <%= 40 %>%;">
            <div class="data"><%= 20  %>/<%= 50 %> (<%= 40 %>%)</div>
          </div>
        </div>
      </td>
      <td class="state">
        <%= glp("fileprocessor.adm.processingdatastate." + "running") %> 
      </td>
    </tr>
 --%>  
  </table>
  <jalios:pager name='fpPDPagerHandler'  />
<p>

<% } /* notEmpty(processingDataList) */ %>

   <span id="processingthread-status-update" style="display:none">
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

<% if (!jcmsContext.isAjaxRequest()) { %>
</div>
<% } %>

<jalios:javascript>
 var update = function() {
    document.fire('refresh:before' ,{ wrapper: 'processingactions' });
    new Ajax.Updater('processingactions', JcmsJsContext.getContextPath() + '/admin/fileprocessor/doAdminDisplayActions.jsp', {
      evalScripts: true,
      onComplete: function() {
        document.fire('refresh:after' ,{ wrapper: 'processingactions' });
        $('processingthread-status').update($('processingthread-status-update').innerHTML);
      }
    });
 };
 update.delay(<%= processingRunning ? "1" : "10" %>);
</jalios:javascript>

<%@ include file='/jcore/doAjaxFooter.jspf' %>