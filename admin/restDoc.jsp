<%@ page import="com.jalios.jcms.rest.*,org.restlet.resource.Resource" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%

  String[] versionElements = channel.getJcmsInfo().getVersion().split("\\s");
  String version = "JCMS " + versionElements[1]; 
  String title = glp("doc.rest.title", version);
  jcmsContext.setPageTitle(title);
  Map<String, Class<? extends Resource>> resourcesMap = RestletApplication.getStandardResourcesMap();

%>
<div class="page-header"><h1><%= title %></h1></div>

<h2 class="boTitle"><%= glp("doc.rest.intro.section-title") %></h2>
<p><%= glp("doc.rest.intro.content") %></p>

<h2 class="boTitle"><%= glp("doc.rest.native-rsrc.section-title") %></h2>
<p><%= glp("doc.rest.native-rsrc.intro") %></p>

<table class="table-data">
  <tr>
    <th scope="col" style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.native-rsrc.th.uri-templates") %></th>
    <th scope="col" style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.native-rsrc.th.meth") %></th>
    <th scope="col" style="width: 100%;vertical-align: top;"><%= glp("doc.rest.native-rsrc.th.rsrc-desc") %></th>
  </tr>
  <% for (Map.Entry<String, Class<? extends Resource>> itResourceEntry :  resourcesMap.entrySet()) { %>
  <tr>
    <td style="vertical-align: top;" nowrap="nowrap">/rest<%= itResourceEntry.getKey() %></td>
    <td style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.rsrc-meth." + Util.getClassShortName(itResourceEntry.getValue())).replaceAll(",", "<br />") %></td>
    <td style="vertical-align: top;"><%= glp("doc.rest.rsrc-desc." + Util.getClassShortName(itResourceEntry.getValue())) %></td>
  </tr>
  <% } %>
</table>



<% Map<Plugin, Map<String, Class<? extends JcmsRestResource>>> pluginsResourcesMap = RestManager.getInstance().getExtendedResourcesMap(); 
if ( Util.notEmpty(pluginsResourcesMap) ) { %>
<h2 class="boTitle"><%= glp("doc.rest.plugin-rsrc.section-title") %></h2>
<p><%= glp("doc.rest.plugin-rsrc.intro") %></p>

<table class="table-data">
  <tr>
    <th scope="col" style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.plugin-rsrc.th.plugin-name") %></th>
    <th scope="col" style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.plugin-rsrc.th.uri-templates") %></th>
    <th scope="col" style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.plugin-rsrc.th.meth") %></th>
    <th scope="col" style="width: 100%;vertical-align: top;"><%= glp("doc.rest.plugin-rsrc.th.rsrc-desc") %></th>
  </tr>
 <% for (Map.Entry<Plugin, Map<String, Class<? extends JcmsRestResource>>> itPluginResourcesEntry : pluginsResourcesMap.entrySet()) { %>
  <% Plugin itPlugin = itPluginResourcesEntry.getKey(); %>
  <% for (Map.Entry<String, Class<? extends JcmsRestResource>> itResourceEntry : itPluginResourcesEntry.getValue().entrySet()) { %>
  <tr>
    <td style="vertical-align: top;" nowrap="nowrap"><jalios:icon src="<%= itPlugin.getIcon() %>"   /> <a href="admin/displayPlugin.jsp?name=<%= itPlugin.getName() %>"><%= itPlugin.getLabel(userLang) %></a></td>
    <td style="vertical-align: top;" nowrap="nowrap">/rest<%= itResourceEntry.getKey() %></td>
    <td style="vertical-align: top;" nowrap="nowrap"><%= glp("doc.rest.rsrc-meth." + Util.getClassShortName(itResourceEntry.getValue())).replaceAll(",", "<br />") %></td>
    <td style="vertical-align: top;"><%= glp("doc.rest.rsrc-desc." + itResourceEntry.getKey()) %></td>
  </tr>
  <% } %>
 <% } %>
</table>
<% } %>

<%@ include file='/admin/doAdminFooter.jspf' %>