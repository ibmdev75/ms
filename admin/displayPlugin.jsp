<%--
  @Summary: Plugin
  @Category: Admin / Plugin
  @Author: Jean-Philippe Encausse
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.7
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="org.apache.log4j.spi.LoggingEvent" %><%

  if (!checkAccess("admin/operation/plugin-mgr")) { 
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="displayPluginHandler" scope="page" class="com.jalios.jcms.plugin.DisplayPluginHandler"><%
 %><jsp:setProperty name="displayPluginHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="displayPluginHandler" property="*" /><%
%></jsp:useBean><%

  boolean devMode = channel.getBooleanProperty("channel.dev-tools.enabled", true); 
  
  if (displayPluginHandler.validate()) {
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/logs.css");
  jcmsContext.addCSSHeader("css/jalios/plugin.css");
  
  Plugin itPlugin = displayPluginHandler.getPlugin();
  if (itPlugin == null) {
    sendRedirect("admin/pluginManager.jsp");
    return;
  }
  
  request.setAttribute("title", itPlugin.getLabel(userLang));
  request.setAttribute("pluginManagerSubAdminMenu", "true");  
  String warnColor= "class='warning'";
  String missColor= "class='miss'";
  String warnFile = "<img src='images/jalios/icons/warnSmall.gif' alt='warn' title=\""+glp("ui.adm.plugin.alt.exists")+"\" class='icon'/>";
  String jarFile  = "<img src='images/jalios/icons/files/jar.gif' alt='jar'  title=\""+glp("ui.adm.plugin.alt.jar")+"\" class='icon'/>";
  String redirect = "admin/displayPlugin.jsp?name="+itPlugin.getName();

  boolean isDeployed = itPlugin.isDeployed();
  boolean mustAndCanRestart = itPlugin.mustRestart() && channel.getAppServerInfo().isRestartSupported();
  boolean displayPluginActions = devMode && (isDeployed || mustAndCanRestart);
  
  
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header">
  <h1><%= itPlugin.getLabel(userLang) %><% if (itPlugin.isMainPlugin()) { %> - <em><%= glp("ui.adm.plugin.lbl.main-plugin") %></em><% } %></h1>
</div>

<p>
 <jalios:wiki><%= itPlugin.getDescription(userLang) %></jalios:wiki>
</p>

<%@ include file='/jcore/doMessageBox.jspf' %>

<div class="row">

  <div class="<%= displayPluginActions ? "col-md-3" : "col-md-4" %>">  
    <img src='<%= itPlugin.getPreview() %>' class='thumb' style="height: 100%;"/>
  </div>
  
  <div class="<%= displayPluginActions ? "col-md-6" : "col-md-8" %>">

    <table class="table-data">
      <tr>
        <th width="20%"><%= glp("ui.com.lbl.status") %></th>
        <td><%= itPlugin.getStatus(userLang) %></td>
      </tr>
      <tr>
        <th><%= glp("ui.com.lbl.version") %></th>
        <td><%= Util.getString(itPlugin.getVersion(),"1.0") %></td>
      </tr>
      <tr>
        <th><%= glp("ui.com.lbl.infos") %></th>
        <td><% if (Util.notEmpty(itPlugin.getUrl())){ %><a href='<%= itPlugin.getUrl() %>' target='_blank'><%= itPlugin.getUrl() %></a><% } %></td>
      </tr>

      <tr>
        <th width="20%"><%= glp("ui.adm.plugin.lbl.author") %></th>
        <td><%= Util.getString(itPlugin.getAuthor(),"") %></td>
      </tr>

    </table>
  </div><%-- col --%>

 <% if (displayPluginActions) { %>
  <div class="col-md-3">
    <% if (itPlugin.isDeployed()) { %>
    <jalios:panel title="ui.adm.plugin.lbl.actions" css="panel-default">
      
        <ul class="item-list">
          <li><jalios:icon src='edit'         alt='E' /> <a href="admin/editPlugin.jsp?name=<%= itPlugin.getName() %>&amp;redirect=<%= redirect %>" ><%= glp("ui.adm.plugin.lbl.edit") %></a></li>
          <% if (itPlugin.isInitialized()){ %>
          <li><jalios:icon src='menu-delete'  alt='S' /> <a class="modal confirm" title="<%= glp("ui.adm.plugin.alert.stop") %>" href="admin/editPlugin.jsp?opStop=true&amp;name=<%= itPlugin.getName() %>&amp;redirect=<%= redirect %>"><%= glp("ui.adm.plugin.btn.stop") %></a></li>
          <% } else if (itPlugin.isStopped()){ %>
          <li><jalios:icon src='plugin-next'   alt='S' /> <a class="modal confirm" title="<%= glp("ui.adm.plugin.alert.start") %>"  href="admin/editPlugin.jsp?opStart=true&amp;name=<%= itPlugin.getName() %>&amp;redirect=<%= redirect %>" ><%= glp("ui.adm.plugin.btn.start") %></a></li>
          <% }%>
          <li><jalios:icon src='trash-empty'   alt='T' /> <a class="modal confirm" title="<%= glp("ui.adm.plugin.alert.delete") %>" href="admin/editPlugin.jsp?opDelete=true&amp;name=<%= itPlugin.getName() %>&amp;redirect=<%= redirect %>"  onclick="setSelectedTab('mainTab', 2);"  ><%= glp("ui.adm.plugin.btn.delete") %></a></li>
          <li><jalios:icon src='edit-script'   alt='R' /> <a href="<%= HttpUtil.getUrlWithCSRFToken("admin/displayPlugin.jsp?opRefreshSignature=true&amp;name=" + itPlugin.getName() + "&amp;redirect=" + redirect, request, true) %>" ><%= glp("ui.adm.plugin.lbl.refresh-signature") %></a></li>
        </ul>
        
    </jalios:panel>
    <% } %>
    
    <% if (mustAndCanRestart) { %>
     <% String restartRedirect = ServletUtil.encodeURL("admin/displayPlugin.jsp?name=" + itPlugin.getName()); %>
     <button class="btn btn-danger"
             onclick="confirmAction('<%= encodeForJavaScript(glp("msg.js.confirm")) %>', '<%= contextPath %>/admin/restart.jsp?redirect=<%= restartRedirect %>');"
             type="button"><%= glp("ui.com.btn.restart") %></button>
    <% } %>
  </div><%-- col --%>
 <% } %>
 
</div><%-- row --%>

<div class="tab-pane" id='mainTab'>

<%-- ||| ADMINISTRATION ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
<% if (itPlugin.isDeployed()){ %>

  
      <%-- ||| CONFIGURATION |||||||||||||||||||||| --%>
      <% String configuration =  itPlugin.getConfiguration(); %>
      <% if (configuration != null){ %>
      <div class='tab-page configuration'>
        <h2 class="tab"><jalios:icon src='admin'  title='<%= glp("ui.adm.plugin.lbl.config") %>'/> <%= glp("ui.adm.plugin.lbl.config") %></h2>
        <div class="container-fluid">
          <jsp:include page='<%= "/"+configuration %>' />
        </div>
      </div>
      <% } %>
      
      <%-- ||| PROPERTIES |||||||||||||||||||||| --%>
      <div class='tab-page properties'>
        <h2 class="tab"><jalios:icon src='properties'  title='<%= glp("ui.adm.plugin.lbl.properties") %>'/> <%= glp("ui.adm.plugin.lbl.properties") %></h2>
        <div class="container-fluid">
          <jsp:include page='<%= "/"+itPlugin.getPropertiesEditor() %>' />
        </div> 
      </div>
  
        <%-- ||| LOGS ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
        <%
          PluginAppender pa = PluginAppender.getLastInstanceCreated();
          List eventList = pa != null ? pa.getLoggedEventList(itPlugin.getName()) : null;
          if (eventList != null) { 
        %>
        <div class='tab-page logs'>
          <h2 class="tab"><jalios:icon src='log-icon'  title='<%= glp("ui.adm.logs.title") %>'/> <%= glp("ui.adm.logs.title") %></h2>
          <jalios:message msg='<%= glp("ui.adm.plugin.doc.logevent", itPlugin.getName()) %>' title="" />
        
            <table class="table-data">
                <thead>
                    <tr>
                      <th><%= glp("ui.adm.logs.log.level") %></th>
                      <th><%= glp("ui.adm.logs.log.date") %></th>
                      <th><%= glp("ui.adm.logs.log.time") %></th>
                      <th><%= glp("ui.adm.logs.log.message") %></th>
                    </tr>
                </thead>
                <tbody>
                <jalios:foreach collection="<%= eventList %>"  name="itEvent" type="LoggingEvent">
                  <tr>
                    <% 
                      Date eventDate = new Date(itEvent.timeStamp);
                      String[] throwableStrRep = itEvent.getThrowableStrRep();
                      String levelClass = "label ";
                      if ("INFO".equals(itEvent.getLevel().toString())) {
                        levelClass += "label-info";
                      }
                      else if ("WARN".equals(itEvent.getLevel().toString())) {
                        levelClass += "label-warning";
                      }
                      else if ("ERROR".equals(itEvent.getLevel().toString())) {
                        levelClass += "label-important";
                      }
                      else if ("FATAL".equals(itEvent.getLevel().toString())) {
                        levelClass += "label-important";
                      }
                    %>
                    <td class="fit nowrap"><span class="<%= levelClass %>"><%= glp("ui.adm.logs.level."+itEvent.getLevel()) %></span></td>
                    <td class="fit date-time"><jalios:date date="<%= eventDate %>" format='<%= "yyyy/MM/dd" %>' /></td>
                    <td class="fit date-time"><jalios:time date="<%= eventDate %>" format='<%= "HH:mm:ss" %>' /></td>
                    <td width="100%">
                    <%= itEvent.getMessage() %>
                    <% if (throwableStrRep!= null) {%>
                      <a href="" class="showDetailLink" onclick="Element.addClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>+</a>
                      <a href="" class="hideDetailLink" onclick="Element.removeClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>-</a>
                      <div class="eventDetail">
                        <% for (int i = 0; i < throwableStrRep.length; i++) { %><%= throwableStrRep[i] %><% } %>
                      </div>
                    <% } %>
                    </td>
                  </tr>
                </jalios:foreach> 
                </tbody>
            </table>
        </div>
        <% } %>
  

<% } %>

    
    <div class='tab-page package' id='packageTab'>
      <h2 class="tab"><jalios:icon src='package'  title='<%= glp("ui.adm.plugin.lbl.package") %>'/> <%= glp("ui.adm.plugin.lbl.package") %></h2>
        <jalios:message msg='<%= glp("ui.adm.plugin.doc.version", itPlugin.getName()) %>' title="" />

    <div class='tab-pane'>    
    <%-- ||| PLUGIN FILES ||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
    
    <div class='tab-page files'>
      <h2 class="tab"><%= glp("ui.adm.plugin.lbl.files") %></h2>
      <% boolean missingFiles = false; %>
      
      <%-- ||| TYPES ||||||||||||||||||||||||||||||||||||| --%>
      <% 
        Map typeMap = itPlugin.getTypesPath(true,false); 
        if (Util.notEmpty(typeMap)) {
        %>
      <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.types") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
              <th><%= glp("ui.com.lbl.type") %></th>
            </tr>
        </thead>
        <tbody>
        
        <jalios:foreach collection='<%= typeMap.entrySet() %>' type='Map.Entry' name='itEntry'>
          <% 
            String    itType       = (String) itEntry.getKey();
            Set       itPathSet    = (Set)   itEntry.getValue();
          %>
          <jalios:foreach collection='<%= itPathSet %>' type='java.lang.String' name='itPath' counter='itCounter2'>
          <% 
            boolean isTemplate = itPath.endsWith("-templates.xml");
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            if (!isTemplate){ // kludge
              missingFiles = exists ? missingFiles : true;
            }
          %>
          <% if (exists || !isTemplate) { %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.<%= itCounter2 %></td>
            <td><%= exists ? "" : warnFile  %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
            <td><%= itType %></td>
          </tr>
          <% } %>
          </jalios:foreach>
        </jalios:foreach>
        </tbody>
        </table>
        <% } %>
        
        <%-- ||| TEMPLATE |||||||||||||||||||||||||||||||||| --%>
      <% 
          List templateEntryList = itPlugin.getTypeTemplateEntries();
          if (Util.notEmpty(templateEntryList)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.templates") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.label") %></th>
              <th><%= glp("ui.com.lbl.tmpl-usage") %></th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= templateEntryList %>' type='TypeTemplateEntry' name='tte'>
          <%
            String itPath = tte.getPath();
            String itType = tte.getPath();
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true;
          %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : warnFile %> <%= tte.getLabel(userLang) %></td>
            <td><%= tte.getUsage() %></td>
            <td><%= tte.getName() %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>
        
        <%-- ||| WORKFLOW ||||||||||||||||||||||||||||||||||||| --%>
        <% 
          Set wfSet = itPlugin.getWorkflowsPath(); 
          if (Util.notEmpty(wfSet)) {
        %>
        <h2 class='boTitle'><%= glp("ui.com.lbl.workflow") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= wfSet %>' type='java.lang.String' name='itPath'>
          <% 
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true; 
          %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : warnFile %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>
        
        <%-- ||| JARS ||||||||||||||||||||||||||||||||||||| --%>
        <% 
          Set    jarsSet       = itPlugin.getJarsPath();
          String pluginJarPath = "WEB-INF/lib/"+itPlugin.getName()+".jar";
          File   pluginJar     = new File(channel.getRealPath(pluginJarPath));
          if (pluginJar.exists()){
            jarsSet.add(pluginJarPath);
          }
          if (Util.notEmpty(jarsSet)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.jars") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= jarsSet %>' type='String' name='itPath'>
          <% 
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true; 
          %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : warnFile %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>
      
      <%-- ||| JAVA ||||||||||||||||||||||||||||||||||||| --%>
        <% 
          boolean existsJar = new File(channel.getRealPath(itPlugin.getJarPath())).exists();
          Set     javaSet   = itPlugin.getJavaPath(true);
          if (Util.notEmpty(javaSet)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.java") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= javaSet %>' type='java.lang.String' name='itPath'>
          <%
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true; 
          %>
      <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : (existsJar ? jarFile : warnFile) %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>
      
    <%-- ||| HIBERNATE ||||||||||||||||||||||||||||||||||||| --%>
    <% 
      Set     hbmSet   = itPlugin.getHibernateMappingsPath();
      if (Util.notEmpty(hbmSet)) {
    %>
    <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.hbm") %></h2>
    <table class="table-data">
    <thead>
      <tr>
        <th>&nbsp;</th>
        <th><%= glp("ui.com.lbl.name") %></th>
        <th><%= glp("ui.adm.plugin.lbl.path") %></th>
      </tr>
    </thead>
    <tbody>
    <jalios:foreach collection='<%= hbmSet %>' type='java.lang.String' name='itPath'>
      <% 
        boolean exists = new File(channel.getRealPath(itPath)).exists();
        missingFiles = (exists || existsJar) ? missingFiles : true;
      %>
      <tr <%= exists ? "" : warnColor %>>
        <td class="fit text-right"><%= itCounter %>.</td>
        <td><%= exists ? "" : (existsJar ? jarFile : warnFile) %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
        <td><%= itPath %></td>
      </tr>
    </jalios:foreach>
    </tbody>
    </table>
    <% } %>
    
      <%-- ||| PLUGIN HOOKS (listener / controlers / ...) |||||||||||| --%>
        <% 
        {
          Map itemMap = itPlugin.getPluginComponentPath(true); 
          if (Util.notEmpty(itemMap)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.component") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
              <th><%= glp("ui.com.lbl.type") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= itemMap.entrySet() %>' type='Map.Entry' name='itEntry'>
          <%
            String itPath  = (String) itEntry.getKey();
            String itType  = (String) itEntry.getValue();
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true;
          %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : (existsJar ? jarFile : warnFile) %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
            <td><%= itType %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } 
      } %>

    <%-- ||| PLUGIN OPEN API RESOURCES (listener / controlers / ...) |||||||||||| --%>
    <%
    {
      Map itemMap = itPlugin.getOpenAPIResourcePath(true); 
      if (Util.notEmpty(itemMap)) {
    %>
    <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.component") %></h2>
    <table class="table-data">
    <thead>
      <tr>
        <th>&nbsp;</th>
        <th><%= glp("ui.com.lbl.name") %></th>
        <th><%= glp("ui.adm.plugin.lbl.path") %></th>
        <th><%= glp("doc.rest.native-rsrc.th.uri-templates") %></th>
      </tr>
    </thead>
    <tbody>
    <jalios:foreach collection='<%= itemMap.entrySet() %>' type='Map.Entry' name='itEntry'>
      <%
        String itPath  = (String) itEntry.getKey();
        String itType  = (String) itEntry.getValue();
        boolean exists = new File(channel.getRealPath(itPath)).exists();
        missingFiles = exists ? missingFiles : true;
      %>
      <tr <%= exists ? "" : warnColor %>>
        <td class="fit text-right"><%= itCounter %>.</td>
        <td><%= exists ? "" : (existsJar ? jarFile : warnFile) %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
        <td><%= itPath %></td>
        <td><%= itType %></td>
      </tr>
    </jalios:foreach>
    </tbody>
    </table>
    <% }
    } %>
      
      <%-- ||| PRIVATE ||||||||||||||||||||||||||||||||||||| --%>
        <% 
          Set privateSet = itPlugin.getPrivatesPath(); 
          if (Util.notEmpty(privateSet)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.private") %> (<%= glp("ui.adm.plugin.lbl.private-path",itPlugin) %>)</h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= privateSet %>' type='java.lang.String' name='itPath'>
          <% 
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true; 
          %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : warnFile %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>
      
      <%-- ||| PUBLIC ||||||||||||||||||||||||||||||||||||| --%>
        <% 
          Set publicSet = itPlugin.getPublicsPath(); 
          if (Util.notEmpty(publicSet)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.public") %> (<%= glp("ui.adm.plugin.lbl.public-path",itPlugin) %>)</h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= publicSet %>' type='java.lang.String' name='itPath'>
          <% 
            File file = new File(channel.getRealPath(itPath));
            boolean exists = file.exists(); 
          %>
          <tr <%= exists ? "" : missColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : warnFile %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>

    
    <%-- ||| WEBAPP ||||||||||||||||||||||||||||||||||||| --%>
        <% 
          Set weabappSet = itPlugin.getWebappsPath(); 
          if (Util.notEmpty(weabappSet)) {
        %>
        <h2 class='boTitle'><%= glp("ui.adm.plugin.lbl.webapp") %></h2>
        <table class="table-data">
        <thead>
            <tr>
              <th>&nbsp;</th>
              <th><%= glp("ui.com.lbl.name") %></th>
              <th><%= glp("ui.adm.plugin.lbl.path") %></th>
            </tr>
        </thead>
        <tbody>
        <jalios:foreach collection='<%= weabappSet %>' type='java.lang.String' name='itPath'>
          <% 
            boolean exists = new File(channel.getRealPath(itPath)).exists();
            missingFiles = exists ? missingFiles : true; 
          %>
          <tr <%= exists ? "" : warnColor %>>
            <td class="fit text-right"><%= itCounter %>.</td>
            <td><%= exists ? "" : warnFile %> <%= itPath.substring(itPath.lastIndexOf("/")+1) %></td>
            <td><%= itPath %></td>
          </tr>
        </jalios:foreach>
        </tbody>
        </table>
      <% } %>
  </div>

<%-- ||| VERSION ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
    <% Set packageSet = itPlugin.getPackageSet(); %>
    <div class='tab-page version'>
      <h2 class="tab"><%= glp("ui.com.lbl.version") %></h2>
    <form name='displayForm' action='admin/displayPlugin.jsp' method='post'>
        <% if (Util.notEmpty(packageSet)) { %>
        <table class="table-data">
          <thead>
                <tr>
                  <th class="fit" colspan='2'></th>
                  <th width="100%"><%= glp("ui.com.lbl.name") %></th>
                  <th><%= glp("ui.com.lbl.version") %></th>
                  <th><%= glp("ui.com.lbl.date") %></th>
                  <th><%= glp("ui.com.lbl.size") %></th>
                  <th class="fit text-overflow">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
              <jalios:foreach collection="<%= packageSet %>" name="itFile" type="File">
              <% 
                int    itPos     = itFile.getName().indexOf("_");
                int    itPos2    = itFile.getName().length() - PluginManager.PLUGIN_EXTENSION.length();
                String itVersion = itPos > 0 ? itFile.getName().substring(itPos+1,itPos2) : "";
              %>
              <tr>
                <td class="fit text-overflow"><% if (devMode) { %><input type='radio' name='package' value='<%= itFile.getName() %>' class='formRadiobox'><% } %></td>
                <td class=" numeric"><%= itCounter.intValue() %>.</td>
                <td><a href='admin/downloadPlugin.jsp?name=<%= itPlugin.getName() %>&amp;opDownload=<%= ServletUtil.encodeURL(itFile.getName()) %>'><%= itFile.getName() %></a></td>
                <td class="numeric"><%= itVersion %></td>
                <td class="date-time">
                  <jalios:date date="<%= new Date(itFile.lastModified()) %>" format="short"/>
                  <jalios:time date="<%= new Date(itFile.lastModified()) %>" format="short"/>
                </td>
                <td class="numeric nowrap"><jalios:filesize size="<%= itFile.length() %>" /></td>
                <td class="fit"><a href="admin/displayPlugin.jsp?opDeletePackage=<%= ServletUtil.encodeURL(itFile.getName()) %>&amp;name=<%= itPlugin.getName() %>&amp;redirect=<%= redirect %>" title="<%= glp("ui.adm.plugin.alert.delete-archive") %>" class="confirm modal"><jalios:icon src='trash-empty'   /></a></td>
              </tr>
          </jalios:foreach>
        </tbody>
        </table>
        <% } %>
        
        <%-- ||| BUTTONS ||||||||||||||||||||||||||||| --%>
        <% if (devMode) { %>
        <% String disabled = itPlugin.mustRestart() ? "disabled='disabled'" : ""; %>
        <table class='layout'>
          <tr>
            <td width='100%'>
                <% if (itPlugin.isDeployed() && !missingFiles){ %>
                  <input type='submit' <%= disabled %> title="<%= glp("ui.adm.plugin.alert.package", itPlugin.getPackageName()) %>"  class='btn btn-primary modal confirm' name='opPackage' value="<%= glp("ui.adm.plugin.btn.package") %>" />
                <% } %>            
                <% if(Util.notEmpty(packageSet)){ %>
                      <% if(itPlugin.isDeployed()){ %>
                        <input type='submit' <%= disabled %> title="<%= glp("ui.adm.plugin.alert.upgrade") %>" class='btn btn-default modal confirm' class='btn btn-default' name='opDeploy' value="<%= glp("ui.adm.plugin.btn.upgrade") %>"/>
                      <% } else { %>
                        <input type='submit' <%= disabled %> title="<%= glp("ui.adm.plugin.alert.deploy") %>"  class='btn btn-default modal confirm' name='opDeploy' value="<%= glp("ui.adm.plugin.btn.deploy") %>"/>
                    <% } %>
                  <% } %>
            </td>

          </tr>
          <% if (itPlugin.isDeployed() && !missingFiles){ %>
          <tr>
            <td nowrap='nowrap' class='vMiddle'><input type='checkbox' name='source' value='true' class='formCheckbox' checked='checked' /> <%= glp("ui.adm.plugin.lbl.include-src") %></td>
          </tr>
          <% } %>
          <% if (itPlugin.isDeployed() && missingFiles){ %>
          <tr>
            <td nowrap="nowrap"><div class="alert"><%= glp("ui.adm.plugin.lbl.package-missing") %></div></td>
          </tr>
          <% } %>
        </table>
          <input type='hidden' name='action' value='true' />
            <input type='hidden' name='name' value='<%= itPlugin.getName() %>' />
            <input type='hidden' name='redirect' value='admin/displayPlugin.jsp?name=<%= itPlugin.getName() %>' />
        <% } %>
        </form> 
    </div>
      
  
 <%-- ||| DEPENDENCIES ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
    
    <% if (Util.notEmpty(itPlugin.getDependenceSet())){ %>
    <div class='tab-page dependencies'>
      <h2 class="tab"><%= glp("ui.adm.plugin.lbl.dependencies") %></h2>
        <table class="table-data">
          <thead>
                <tr>
                  <th class="fit text-right" colspan='2'>&nbsp;</th>
                  <th><%= glp("ui.com.lbl.label") %></th>
                  <th><%= glp("ui.com.lbl.status") %></th>
                  <th><%= glp("ui.com.lbl.version") %></th>
                  <th><%= glp("ui.adm.plugin.lbl.author") %></th>
                </tr>
            </thead>
            <tbody>
            <jalios:foreach collection="<%= itPlugin.getDependenceSet() %>" name="itDepend" type="com.jalios.jcms.plugin.Plugin">
            <tr>
              <td class="fit text-overflow"><a href='admin/editPlugin.jsp?name=<%= itDepend.getName() %>&amp;redirect=<%= ServletUtil.encodeURL("admin/displayPlugin.jsp?name="+itPlugin.getName()) %>' title="<%= glp("ui.com.alt.edit") %>"><jalios:icon src='edit' /></a></td>
              <td class="fit text-overflow"><%= itCounter.intValue() %>.</td>
              <td><jalios:icon src='<%= itDepend.getIcon() %>' />&nbsp;<a href='admin/displayPlugin.jsp?name=<%= itDepend.getName() %>' title="<%= glp("ui.adm.plugin.alt.display",itDepend.getLabel(userLang)) %>"><%= itDepend.getLabel(userLang) %></a></td>
              <td><%= itDepend.getStatus(userLang) %></td>
              <td><%= itDepend.getVersion() %></td>
              <td><%= itDepend.getAuthor() %></td>
            </tr>
            </jalios:foreach>
            </tbody>
        </table>
    </div>
    <% } %>

    <%-- ||| CHANGE LOG ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
  <% String changeLog = itPlugin.getChangeLog();  %>
    <% if (changeLog != null){ %>
    <div class='tab-page changes'>
      <h2 class="tab"><%= glp("ui.adm.plugin.lbl.changelog") %></h2>
        <div class='pre'><jalios:include file='<%= changeLog %>' /></div>
    </div>
    <% } %>
    
    <%-- ||| LICENSE |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
    <% String license = itPlugin.getTextLicense();  %>
    <% if (license != null){ %>
    <div class='tab-page license'>
      <h2 class="tab"><%= glp("ui.com.lbl.license") %></h2>
        <div class='pre'><jalios:include file='<%= license %>' /></div>
    </div>
    <% } %>
  </div>
  </div>
  
  <%-- ||| DOCUMENTATION ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
  <% String documentation = itPlugin.getDocumentation(); %>
  <% if (documentation != null){ %>
  <div class='tab-page documentation'>
    <h2 class="tab"><jalios:icon src='book-open'  title='<%= glp("ui.com.lbl.doc") %>'/> <%= glp("ui.com.lbl.doc") %></h2>
    <jalios:message>
      <p><a href='<%= documentation %>' target='_blank'><%= glp("ui.adm.plugin.doc.doc") %></a></p>
    </jalios:message>
    <iframe src='<%= documentation %>' frameborder='0' class='doc-iframe'></iframe>
  </div>
  <% } %>

  <%-- ||| ADVANCED ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --%>
  <div class='tab-page advanced'>
    <h2 class="tab"><jalios:icon src='advanced'  title='<%= glp("ui.work.form.tab.adv") %>'/> <%= glp("ui.work.form.tab.adv") %></h2>
      
      <table class="table-data">
        <tr>
          <th class="fit nowrap"><%= glp("ui.com.lbl.name") %></th>
          <td width="100%"><%= itPlugin.getName() %></td>
        </tr>
        <tr>
          <th class="fit nowrap"><%= glp("ui.adm.plugin.lbl.build") %></th>
          <td><%= Util.getString(itPlugin.getBuild(userLocale),"") %></td>
        </tr>
        <tr>
          <th class="fit nowrap"><%= glp("ui.adm.plugin.lbl.jcms") %></th>
          <td><%= Util.getString(itPlugin.getJCMSVersion(),"") %></td>
        </tr>
        <tr>
          <th class="fit nowrap"><%= glp("ui.adm.plugin.lbl.jsync") %></th>
          <td><%= glp("ui.com.lbl."+itPlugin.getJSync()) %></td>
        </tr>
        <tr>
          <th class="fit nowrap"><%= glp("ui.adm.plugin.lbl.order") %></th>
          <td><%= itPlugin.getOrder() %></td>
        </tr>
        <tr>
          <th class="fit nowrap"><%= glp("ui.adm.plugin.lbl.appserver") %></th>
          <td><jalios:if predicate='<%= Util.notEmpty(itPlugin.getAppServer()) %>'><ul><li><%= Util.join(itPlugin.getAppServer(),"</li><li>") %></li></ul></jalios:if></td>
        </tr>
        <tr>
          <th class="fit nowrap"><%= glp("ui.com.lbl.license") %></th>
          <td><%= Util.getString(itPlugin.getLicense(),"") %></td>
        </tr>  
        <tr>
          <th class="fit nowrap"><%= glp("ui.adm.mn.docs.api") %></th>
          <td><%= itPlugin.getJavadocHtmlLink() %></td> 
        </tr>
              
    </table>
  </div>

</div>

<%@ include file='/admin/doAdminFooter.jspf' %>