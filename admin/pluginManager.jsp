<%--
  @Summary: Plugin manager
  @Category: Admin / Plugin
  @Author: Jean-Philippe Encausse
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.7
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@page import="com.jalios.jcms.rss.RssManager"%><%--
--%><%

  if (!checkAccess("admin/operation/plugin-mgr")) { 
    sendForbidden(request, response);
    return;
  }
  request.setAttribute("title", glp("ui.adm.mn.op.plugin-mgr")); 
  request.setAttribute("pluginManagerSubAdminMenu", "true");
  
  PluginManager pluginMgr = PluginManager.getPluginManager();
  
  if (pluginMgr.getPlugins().size() <= 0){
    setInfoMsg(glp("ui.adm.plugin.edit.no-plugin"), request);
  }
  
  boolean mustRestart = false;
  for (Plugin plugin : pluginMgr.getPlugins()) {
    mustRestart |= plugin.mustRestart(); 
  }
  if (mustRestart) {
    setWarningMsg(glp("ui.adm.plugin.warn.restart-needed"), request);
  }
  
%><%@ include file='/admin/doAdminHeader.jspf' %>

<h1 class="boTitle icon iconPlugin"><% /* %>Plugin Manager<% */ %><%= glp("ui.adm.mn.op.plugin-mgr") %> (<%= pluginMgr.getPlugins().size() %>)</h1>
<%@ include file='/jcore/doMessageBox.jspf' %>

<% 
  boolean devMode = channel.getBooleanProperty("channel.dev-tools.enabled", true);
%>

<div class="row">
  <div class="col-md-8">

<table class="table-data">
<thead>
<tr>
  <th class='fit' colspan='2'>&nbsp;</th>
  <th class='fit'><%= glp("ui.com.lbl.status") %></th>
  <th class='fit'><%= glp("ui.com.lbl.version") %></th>
  <th class='spacer'><%= glp("ui.com.lbl.label") %></th>
  <th class=''><%= glp("ui.adm.plugin.lbl.author") %></th>
  <th class='fit'><%= glp("ui.com.lbl.license") %></th>
  <th class='fit'>&nbsp;</th>
</tr>
</thead>
<tbody>
<jalios:pager name='pmPagerHandler' declare='true' action='init' pageSize='50' size='<%= pluginMgr.getPlugins().size() %>'/>
<% 
  Set<Plugin> pluginSet = new TreeSet<Plugin>(new Plugin.LabelComparator(userLang));
  pluginSet.addAll(pluginMgr.getPlugins());

  Plugin mainPlugin = pluginMgr.getMainPlugin();
  if (mainPlugin != null) {
    pluginSet.remove(mainPlugin);
  }
  List<Plugin> pluginList = new ArrayList(pluginSet);
  if (mainPlugin != null) {
    pluginList.add(0, mainPlugin);
  }
%>
<jalios:foreach collection="<%= pluginList %>" 
                name="itPlugin" 
                type="com.jalios.jcms.plugin.Plugin"
                max="<%= pmPagerHandler.getPageSize() %>"
                skip="<%= pmPagerHandler.getStart() %>">
<% String build = itPlugin.getBuild(userLocale); %>
<tr> 
  <td class="fit"><% if(itPlugin.isDeployed() && devMode){ %><a href='admin/displayPlugin.jsp?name=<%= itPlugin.getName() %>' title="<%= glp("ui.com.alt.edit") %>"><jalios:icon  src='edit' /></a><% } %></td>
  <td class="fit numeric"><%= itCounter.intValue() + pmPagerHandler.getStart() %>.</td>
  <td class="nowrap" ><%= itPlugin.getStatus(userLang) %></td>
  <td class="nowrap"><%= itPlugin.getVersion() %> <% if (Util.notEmpty(build)){ %><jalios:tooltip><%= build %></jalios:tooltip><% } %></td>
  <td><jalios:icon src='<%= itPlugin.getIcon() %>' />&nbsp;<a href='admin/displayPlugin.jsp?name=<%= itPlugin.getName() %>' title='<%= glp("ui.adm.plugin.alt.display",itPlugin.getLabel(userLang)) %>'><%= itPlugin.getLabel(userLang) %></a></td>
  <td><%= itPlugin.getAuthor() %></td>
  <td class="nowrap"><%= itPlugin.getLicense() %></td>
  <td>
    <%= itPlugin.getStatusIcons(userLang) %>
    <% if (itPlugin.isMainPlugin()) { %>
    <jalios:icon src="star"  title='<%= glp("ui.adm.plugin.lbl.main-plugin") %>'/>
    <% } %>
  </td>
</tr>
</jalios:foreach>
</tbody>
</table>
<jalios:pager name='pmPagerHandler'/><br />

<% if (mustRestart && channel.getAppServerInfo().isRestartSupported()) { %>
  <button class="btn btn-danger" 
          onclick="confirmAction('<%= encodeForJavaScript(glp("msg.js.confirm")) %>', '<%= contextPath %>/admin/restart.jsp?redirect=admin/pluginManager.jsp');"
          type="button"><%= glp("ui.com.btn.restart") %></button>
<% } %>

</div><div class="col-md-4">

<% if (devMode){ %>

<jalios:panel title="ui.adm.plugin.lbl.upload">
	<p><%= glp("ui.adm.plugin.lbl.search-jx") %></p>
	<form name='displayForm' action='admin/displayPlugin.jsp' method='post' enctype="multipart/form-data" style='display: inline;'>  
	  <input  type="file"     name='archive' style='margin-top: 8px;'/><br/>
	  <input  type='checkbox' name='opDeploy' value='true' checked='checked' class='formCheckbox' /> <%= glp("ui.adm.plugin.lbl.deploy-auto") %><br/>
	  <button type='submit'   name='opUpload' class='btn btn-primary' value="true" style='margin-top: 8px;'><%= glp("ui.adm.plugin.lbl.upload") %></button>
  </form>
</jalios:panel>

<jalios:panel title="ui.adm.plugin.lbl.create">
	<form name='editForm' action='admin/editPlugin.jsp' method='post' class='form-horizontal'>
	  <jalios:field label="ui.adm.plugin.edit.internal-name" name='<%= "name" %>' ml='<%= false %>'>
	    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
		</jalios:field>
		<jalios:field>
		  <button type='submit' name='opSave' class='btn btn-default' value='true'><%= glp("ui.adm.plugin.lbl.create") %></button>
		</jalios:field>
	</form>
</jalios:panel>
<% } %>

<% if (channel.getBooleanProperty("jx.rss.enabled",true)) { %>
<jalios:rss id="PluginRSS" name="myRssChannel" source='<%= channel.getProperty("url.jx.plugins.rss") %>'  eventListeners="<%= RssManager.getInstance().getDefaultListeners() %>" />
<% if (myRssChannel != null) { %>
  <jalios:panel title="ui.adm.plugin.lbl.rss-jx">
    <ul class="item-list">
    <jalios:foreach collection='<%= myRssChannel.getItemList() %>'  type='com.jalios.util.RssItem' name='itRss' max='5'>
      <li>
        <%= itCounter.intValue() %>.
        <jalios:icon src="plugin-package" alt='P' title=""/>
        <a href='<%= itRss.getLink() %>' target='_blank'><%= itRss.getTitle() %></a>
      </li>
    </jalios:foreach>
    </ul>
    <div class="text-right"><a href='<%= channel.getProperty("url.jx.plugins") %>' target='_blank'><%= glp("ui.com.txt.more") %></a></div>
  </jalios:panel>
<% }} %>


  </div>
</div>

<%@ include file='/admin/doAdminFooter.jspf' %>