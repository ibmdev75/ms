<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.mashup.*" %><%

  if (!checkAccess("admin/operation/import-mgr")) { 
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.mashup.ImportManagerHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

request.setAttribute("title", glp("ui.adm.mn.op.import-mgr")); 
request.setAttribute("importSubAdminMenu", "true"); 

jcmsContext.addJavaScript("js/jalios/importManager.js");
%>
<%@ include file='/admin/doAdminHeader.jspf' %>
<%
ImportManager importMgr = ImportManager.getInstance();
Map sourceMap = importMgr.getImportSourceMap();

List lastImportStatusList = importMgr.getLastImportStatusList();
%>

<div class="page-header"><h1><%= glp("ui.adm.mn.op.import-mgr") %></h1></div>

<%@ include file='/jcore/doMessageBox.jspf' %>

<% if (importMgr.isEnabled()) { %>
<%-- *** Buttons ************************************************** --%>
<div class="br">
<button class='btn btn-default' onclick="ImportManager.toggle($('importUrlForm')); return false;"><%= glp("ui.adm.import-mgr.lbl.import-url") %>...</button>&nbsp;
<button class='btn btn-default' onclick="ImportManager.toggle($('importFileForm')); return false;"><%= glp("ui.adm.import-mgr.lbl.import-file") %>...</button>&nbsp;
<button class='btn btn-default' onclick="ImportManager.toggle($('importTextForm')); return false;"><%= glp("ui.adm.import-mgr.lbl.import-text") %>...</button>&nbsp;
<button class='btn btn-default' onclick="ImportManager.toggle($('addSourceForm')); return false;"><%= glp("ui.adm.import-mgr.lbl.add-source") %>...</button>&nbsp;
</div>

<div>
  <%-- *** Import Options (buffer) ************************************************** --%>
  <jalios:buffer name="importOptions">
    <div class="importOptions">
      <div class="checkbox">
        <label><input class="formCheckbox" type="checkbox" name="optionFiles" checked="checked" /><%= glp("ui.adm.import-mgr.lbl.opt.files") %></label>
      </div>
      <div class="checkbox">
        <label><input class="formCheckbox" type="checkbox" name="optionCategories" checked="checked" /><%= glp("ui.adm.import-mgr.lbl.opt.categories") %></label>
      </div>
      <div class="checkbox">
        <label><input class="formCheckbox" type="checkbox" name="optionLocal" /><%= glp("ui.adm.import-mgr.lbl.opt.local") %></label>
      </div>
      <div class="checkbox">
        <label><input class="formCheckbox" type="checkbox" name="optionMilestone" checked="checked" /><%= glp("ui.adm.import-mgr.lbl.opt.milestone") %></label>
      </div>
    </div>
  </jalios:buffer>
  
  
  <%-- *** Import File Form ************************************************** --%>
  <div class="importForm" id="importFileForm"  style="display: none;">
    <jalios:panel title="ui.adm.import-mgr.lbl.import-file">
      <form action="admin/importManager.jsp" method="post" enctype="multipart/form-data">
        <jalios:message msg="ui.adm.import-mgr.import-file-info" />
        <input class="formTextfield" type="file" name="file" size="50" /> 
        <%= importOptions %>
        <input class="btn btn-primary" type="submit" name="opImportFile" value="<%= glp("ui.adm.import-mgr.import") %>" />
      </form>
    </jalios:panel>
  </div>
  
  <%-- *** Import URL Form ************************************************** --%>
  <div class="importForm" id="importUrlForm"  style="display: none;">
    <jalios:panel title="ui.adm.import-mgr.lbl.import-url">
      <form action="admin/importManager.jsp" method="post">
        <jalios:message msg="ui.adm.import-mgr.import-url-info" />
        
        <jalios:field name="url">
          <jalios:control type="<%= ControlType.URL %>" />
        </jalios:field>
                
        <%= importOptions %>
        <input class="btn btn-primary" type="submit" name="opImportUrl" value="<%= glp("ui.adm.import-mgr.import") %>" />
      </form>
    </jalios:panel>
  </div>
  
  <%-- *** Import Text Form ************************************************** --%>
  <div class="importForm" id="importTextForm"  style="display: none;">
    <jalios:panel title="ui.adm.import-mgr.lbl.import-text">
      <form action="admin/importManager.jsp" name="importText" method="post">
        <jalios:message msg="ui.adm.import-mgr.import-url-info" />
        <jalios:field name="text">
          <jalios:control settings='<%= new TextAreaSettings().rows(5) %>' />
        </jalios:field>
        <%= importOptions %>
        <input class="btn btn-primary" type="submit" name="opImportText" value="<%= glp("ui.adm.import-mgr.import") %>" />
      </form>
    </jalios:panel>
  </div>
  
  <%-- *** Add Source Form ************************************************** --%>
  <div class="importForm" id="addSourceForm"  style="display: <%= formHandler.showEditSourceForm() ? "block" : "none" %>;">
    <jalios:panel title='<%= formHandler.getSource() != null ? "ui.adm.import-mgr.lbl.edit-source" : "ui.adm.import-mgr.lbl.add-source" %>'>
      <form action="admin/importManager.jsp" name="editForm" method="post">
        <table class='layout'>
          <tr>
            <%-- Column 1 --%>
            <td class='vTop'>
              <%-- SOURCE BOX --%> 
              <fieldset>
                <legend class="formLabel"><%= glp("ui.adm.import-mgr.lgd.source") %></legend>
                <table class='layout'>
                  <%-- SOURCE NAME --%>             
                  <tr>
                    <td>
                     <jalios:field  name='<%= "sourceName" %>' label='<%= glp("ui.adm.import-mgr.lbl.name") %>' required='<%= true %>' value='<%= formHandler.getAvailableSourceName() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
                    </td>
                  </tr>
                  <%-- SOURCE URL --%>
                  <tr>
                    <td>
                     <jalios:field  name='<%= "sourceUrl" %>' label='<%= glp("ui.adm.import-mgr.lbl.url") %>' description='<%= glp("ui.adm.import-mgr.lbl.url.h") %>' required='<%= true %>' value='<%= formHandler.getAvailableSourceUrl() %>'>
    <jalios:control type="<%= ControlType.URL %>" />
  </jalios:field>
   
                    </td>
                  </tr>
                </table>
              </fieldset>
              
              <%-- IMPORT OPTION --%> 
              <fieldset>
                <legend class="formLabel"><%= glp("ui.adm.import-mgr.lgd.options") %></legend>
                <table class='layout'>
                  <tr>
                    <td>
                      <input class="formCheckbox" type="checkbox" name="optionFiles"      <%= formHandler.getAvailableOptionFiles() ? "checked='checked'" : "" %> /> <%= glp("ui.adm.import-mgr.lbl.opt.files") %><br/>
                      <input class="formCheckbox" type="checkbox" name="optionCategories" <%= formHandler.getAvailableOptionCategories() ? "checked='checked'" : "" %> /> <%= glp("ui.adm.import-mgr.lbl.opt.categories") %><br/>
                      <input class="formCheckbox" type="checkbox" name="optionLocal"      <%= formHandler.getAvailableOptionLocal() ? "checked='checked'" : "" %> /> <%= glp("ui.adm.import-mgr.lbl.opt.local") %><br/>
                      <input class="formCheckbox" type="checkbox" name="optionMilestone"  <%= formHandler.getAvailableOptionMilestone() ? "checked='checked'" : "" %> /> <%= glp("ui.adm.import-mgr.lbl.opt.milestone") %><br/>
                    </td>
                  </tr>
                </table>
              </fieldset>
            </td>
            <td width="20px">
            </td>
            <%--  Column 2 --%> 
            <td class='vTop'>
              <%--  SCHEDULE BOX --%> 
              <fieldset>
                <legend class="formLabel"><jalios:icon src="timer"  /> <%= glp("ui.adm.import-mgr.lgd.sched") %></legend>
                <table class='layout'>
              
                  <%--  SOURCE SCHEDULE ENABLED --%>
                  <tr>
                    <td>
                      <jalios:field  name='<%= "sourceScheduleEnabled" %>' label='<%= glp("ui.com.lbl.enabled") %>' required='<%= false %>' value='<%= String.valueOf(formHandler.getAvailableSourceScheduleEnabled()) %>'>
                        <jalios:control type="<%= ControlType.BOOLEAN %>" />
                      </jalios:field>
                    </td>
                  </tr>
                  <%--  SOURCE SCHEDULE FREQUENCY --%>
                  <tr>
                    <td>
                      <jalios:field  name='<%= "sourceScheduleFreq" %>' label='<%= glp("ui.adm.import-mgr.lbl.sched.freq") %>' description='<%= glp("ui.adm.import-mgr.lbl.sched.freq.h") %>' required='<%= false %>' value='<%= ""+formHandler.getAvailableSourceScheduleFreq() %>'>
                        <jalios:control settings='<%= new DurationSettings().resolution(DurationSettings.Resolution.MINUTE) %>' />
                      </jalios:field>
                    </td>
                  </tr>                
                  <%--  SOURCE SCHEDULE CRON --%>
                  <tr>
                    <td>
                      <jalios:field  name='<%= "sourceScheduleCron" %>' label='<%= glp("ui.adm.import-mgr.lbl.sched.cron") %>' description='<%= glp("ui.adm.import-mgr.lbl.sched.cron.h") %>' required='<%= false %>' value='<%= formHandler.getAvailableSourceScheduleCron() %>'>
                        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
                      </jalios:field>
                    </td>
                  </tr>
                </table>
              </fieldset>
            </td>
          </tr>
        </table>
        <% if (formHandler.getSource() != null) { %>
        <input type="hidden" name="sourceId" value="<%= formHandler.getSource().getId() %>" />
        <% } %>
        <input class="btn btn-primary" type="submit" name="opSaveSource" value="<%= glp("ui.com.btn.save") %>" />
        <button class="btn btn-default" onclick='document.location = "<%= contextPath %>/admin/importManager.jsp"; return false;'><%= glp("ui.com.btn.cancel") %></button>
      </form>
    </jalios:panel>
  </div>  
</div>

<%-- *** Tabs ************************************************** --%>
<div class="tab-pane" id="mainTab" style="margin-top: 10px;">

  <%-- *** Sources ************************************************** --%>
  <% if (!sourceMap.isEmpty()) { %>
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="import-sources"  /> <%= glp("ui.adm.import-mgr.lbl.sources") %></h2>
    
    <div class="tab-pane" id="sourceTab" style="margin-top: 10px;">
      <jalios:foreach collection='<%= sourceMap.entrySet() %>' type='Map.Entry' name='itEntry'>
      <%
      ImportSource source = (ImportSource)itEntry.getValue(); 
      Date lastImportDate = source.getLastImportDate();
      Date nextImportDate = source.getNextImportDate();
      ImportStatus status = source.getLastImportStatus();
      int sourceTab = itCounter.intValue() - 1;
      %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='<%= source.isScheduleEnabled() ? "import-source-sched" : "import-source" %>' /> <%= source.getName() %></h2>
        <table class='layout'>
          <tr>
            <td class='vTop'>
              <fieldset>
                <legend class='formLabel'><%= glp("ui.adm.import-mgr.lbl.config") %></legend>
                <ul>
                  <li><%= glp("ui.com.lbl.url") %> : <a href='<%= source.getUrl() %>'><%= source.getUrl() %></a></li>
                  <li>
                    <%= glp("ui.adm.import-mgr.lgd.options") %>
                    <ul>
                      <li><%= glp("ui.adm.import-mgr.lbl.opt.files") %> : <%= glp("ui.com.lbl." + source.getImportOptions().isImportFiles()) %>
                      <li><%= glp("ui.adm.import-mgr.lbl.opt.categories") %> : <%= glp("ui.com.lbl." + source.getImportOptions().isImportCategories()) %>
                      <li><%= glp("ui.adm.import-mgr.lbl.opt.local") %> : <%= glp("ui.com.lbl." + source.getImportOptions().isImportAsLocal()) %>
                      <li><%= glp("ui.adm.import-mgr.lbl.opt.milestone") %> : <%= glp("ui.com.lbl." + source.getImportOptions().isAppendMilestone()) %>
                    </ul>
                  </li>
                  <% if (!source.isScheduleEnabled()) { %>
                  <li><%= glp("ui.adm.import-mgr.lbl.sched.disabled") %></li>
                  <% } else { %>
                  <li>
                    <%= glp("ui.adm.import-mgr.lbl.sched.enabled") %>
                    <ul>
                      <% if (Util.notEmpty(source.getScheduleCron()) && source.getScheduleFrequency() < 1) { %>
                      <li><%= glp("ui.adm.import-mgr.lbl.sched.cron") %> : <%= source.getScheduleCron() %></li>
                      <% } else if (source.getScheduleFrequency() > 0) { %>
                      <li><%= glp("ui.adm.import-mgr.lbl.sched.freq") %> : <jalios:duration time='<%= source.getScheduleFrequency() * JaliosConstants.MILLIS_IN_ONE_MINUTE %>' /></li>
                      <% } %>
                      <li><%= glp("ui.adm.import-mgr.lbl.next-import") %> : <%= nextImportDate == null ? "" : channel.getDateTimeFormat(userLang).format(source.getNextImportDate()) %></li>
                    </ul>
                  </li>
                  <% } %>
                </ul>
              </fieldset>
            </td>
            <td width='10px'></td>
            <td class='vTop'>
              <fieldset>
                <legend class='formLabel'><%= glp("ui.adm.import-mgr.lbl.last-import-status") %></legend>
                <ul>
                  <% if (lastImportDate == null && status == null) { %>
                  <li><%= glp("ui.adm.import-mgr.lbl.info-na") %></li>
                  <% } %>
                  <% if (lastImportDate != null) { %>
                  <li><%=glp("ui.adm.import-mgr.lbl.last-import")%> : <%= channel.getDateTimeFormat(userLang).format(lastImportDate) %></li>
                  <% } %>
                  <% if (status != null) { %>
                  <li><%= glp("ui.com.lbl.date") %>: <jalios:date date='<%= status.getImportDate() %>' format='short' /> <jalios:time date='<%= status.getImportDate() %>' format='short' /></li>
                  <li><%= glp("ui.com.lbl.duration") %>: <%= DateUtil.formatDuration(status.getTime(), userLocale) %></li>
                  <%     if (status.isSuccess()) { %>
                  <li><%= glp("ui.com.lbl.import.batch") %>: <%= status.getBatch() %></li>
                  <li><%= glp("ui.adm.import-mgr.lbl.data-count") %>: <%= status.getDataCount() %></li>
                  <li><%= glp("ui.adm.import-mgr.lbl.create-count") %>: <%= status.getCreateCount() %></li>
                  <li><%= glp("ui.adm.import-mgr.lbl.update-count") %>: <%= status.getUpdateCount() %></li>
                  <li><%= glp("ui.adm.import-mgr.lbl.conflict-count") %>: <%= status.getConflictCount() %></li>
                  <li><%=glp("ui.adm.import-mgr.lbl.file-count")%>: <%=status.getFileCount()%></li>
                  <li><%=glp("ui.adm.import-mgr.lbl.file-error-count")%>: <%=status.getFileErrorCount()%></li>
                  <%   } else { %>
                  <li><jalios:icon src='warning'  /> <%= status.getErrorMsg() %></li>
                  <%   } %>
                  <% } %>
                </ul>
              </fieldset>
            </td>
          </tr>
          <tr>
            <td>
              <%
              String confirmImport     = encodeForJavaScript(glp("ui.adm.import-mgr.msg.import", source.getName()));
              String confirmFullImport = encodeForJavaScript(glp("ui.adm.import-mgr.msg.import-full", source.getName()));
              String confirmDelete     = encodeForJavaScript(glp("ui.adm.import-mgr.msg.source.delete", source.getName()));
              String tabParams         = "mainTab=0&amp;sourceTab=" + sourceTab + "&amp;";
              %>
              <button class='btn-primary btn' onclick='confirmAction("<%= confirmImport %>", "<%= contextPath %>/admin/importManager.jsp?<%= tabParams %>opImportSource=true&amp;sourceId=<%= source.getId() %>")'><%= glp("ui.adm.import-mgr.btn.import") %></button>
              <button style='margin-left: 10px;' class='btn btn-default' onclick='confirmAction("<%= confirmFullImport %>", "<%= contextPath %>/admin/importManager.jsp?<%= tabParams %>opFullImportSource=true&amp;sourceId=<%= source.getId() %>")'><%= glp("ui.adm.import-mgr.btn.full-import") %></button>
              <button style='margin-left: 30px;' class='btn btn-default' onclick='document.location = "<%= contextPath %>/admin/importManager.jsp?<%= tabParams %>sourceId=<%= source.getId() %>";'><%= glp("ui.com.alt.edit") %></button>
              <button style='margin-left: 10px;' class='btn btn-default' onclick='confirmAction("<%= confirmDelete %>", "<%= contextPath %>/admin/importManager.jsp?opDeleteSource=true&amp;sourceId=<%= source.getId() %>")'><%= glp("ui.com.btn.delete") %></button>
            </td>
          </tr>
        </table>
      </div>
      </jalios:foreach>
    </div>
  </div>
  <% } %>
  <%-- *** Logs ************************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src='log-icon'  /> <%= glp("ui.adm.import-mgr.lbl.logs") %></h2>
    <table class="table-data">
      <tr>
        <th></th>
        <th><%= glp("ui.com.lbl.date") %></th>
        <th><%= glp("ui.adm.import-mgr.lbl.time") %></th>
        <th><%= glp("ui.com.lbl.duration") %></th>
        <th><%= glp("ui.com.lbl.import.source") %></th>
        <th width='100%'><%= glp("ui.adm.import-mgr.lbl.info") %></th>
      </tr>
      <jalios:pager name='pagerHandler' 
                    declare='true' 
                    action='init' 
                    size='<%= lastImportStatusList.size() %>' 
                    parameterMap='<%= Util.getHashMap("mainTab", "1") %>'
                    />
      
      <jalios:foreach collection='<%= lastImportStatusList %>' name='status' type='ImportStatus'
                      max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">

      <tr <%= !status.isSuccess() ? "class='listErrorRow'" : "" %>> 
        <td><jalios:icon src='<%= status.isSuccess() ? "check-integrity" : "log-error" %>' /></td>
        <td nowrap="nowrap"><jalios:date date='<%= status.getImportDate() %>' format='short'/></td>
        <td nowrap="nowrap"><jalios:time date='<%= status.getImportDate() %>' format='short'/></td>
        <td nowrap="nowrap" align='right'><jalios:duration time='<%= status.getTime() %>' /></td>
        <td nowrap="nowrap">
          <% if (status.getSource() != null) { %>
          <jalios:icon src='import-source'  /> <%= status.getSource().getName() %>
           <% } else if (status.isUrl()) { %>
          <jalios:icon src='webpage'  /> <%= Util.getString(status.getHost(), "???") %>
          <% } else if (status.isFile()) { %>
          <jalios:icon src='xml'  /> <%= glp("ui.com.lbl.file") %>
          <% } else { %>
          <jalios:icon src='xml'  /> <%= glp("ui.adm.import-mgr.lbl.text") %>        
          <% } %>
        </td>
        <td>
            <% if (status.isUrl()) { %>
            <%= glp("ui.com.lbl.url") %>: <a href='<%= status.getUrl() %>'><%= status.getUrl() %></a><br/>
            <% } else if (status.isFile()) { %>
            <%= glp("ui.com.lbl.file-name", status.getFile()) %><br/>
            <% } %>
            <% if (status.isSuccess()) { %>
            <%   if (status.getDataCount() > 0 ) { %><%=glp("ui.adm.import-mgr.lbl.data-count")%>: <%=status.getDataCount()%><br/><% } %>
            <%   if (status.getCreateCount() > 0 ) { %><%=glp("ui.adm.import-mgr.lbl.create-count")%>: <%=status.getCreateCount()%><br/><% } %>
            <%   if (status.getUpdateCount() > 0 ) { %><%=glp("ui.adm.import-mgr.lbl.update-count")%>: <%=status.getUpdateCount()%><br/><% } %>
            <%   if (status.getConflictCount() > 0 ) { %><%=glp("ui.adm.import-mgr.lbl.conflict-count")%>: <%=status.getConflictCount()%><br/><% } %>
            <%   if (status.getFileCount() > 0 ) { %><%=glp("ui.adm.import-mgr.lbl.file-count")%>: <%=status.getFileCount()%><br/><% } %>
            <%   if (status.getFileErrorCount() > 0 ) { %><%=glp("ui.adm.import-mgr.lbl.file-error-count")%>: <%=status.getFileErrorCount()%><br/><% } %>
            <% } else { %>
            <jalios:icon src='warning'  /> <%= status.getErrorMsg() %><br/>
            <% } %>
            </ul>
        </td>
      </tr>
    </jalios:foreach>
    </table>
    <jalios:pager name="pagerHandler"/>  
  </div>
</div>
<% } /* importMgr.isEnabled() */ %>

<jalios:javascript>
  setSelectedTab("mainTab", <%= formHandler.getMainTab() %>);
  setSelectedTab("sourceTab", <%= formHandler.getSourceTab() %>);
</jalios:javascript>
<%@ include file='/admin/doAdminFooter.jspf' %>

