<%
  if (hasParameter("opRefresh")) {
    request.setAttribute("CheckCSRF", Boolean.TRUE);
  }
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/monitoring/check-integrity")) {
    sendForbidden(request, response);
    return;
  }

boolean refresh = hasParameter("opRefresh");
Map report = channel.getDataIntegrityReport(refresh); 
if (refresh) {
  sendRedirect("admin/checkIntegrity.jsp", request, response);
  return;
}

boolean replaceCaddyContent = hasParameter("opReplaceCaddyContent");
if (replaceCaddyContent) {
  Caddy caddy = Caddy.getCaddy(request);
  caddy.clear();
  caddy.addAll(report.keySet());
  sendRedirect("work/caddy/", request, response);
  return;
}
%>
<% 
request.setAttribute("title", glp("ui.adm.dic.title"));  
request.setAttribute("integritySubAdminMenu", "true");  
%>
<%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.dic.title") %></h1></div>
<jalios:message dismissable="true" level="<%= Util.notEmpty(report) ? com.jalios.jcms.context.MessageLevel.WARN : com.jalios.jcms.context.MessageLevel.INFO %>">
  <p>
    <% if (Util.notEmpty(report)) { %>
     <a href='<%= ServletUtil.getUrlWithUpdatedParam(request, "opReplaceCaddyContent", "true") %>'><jalios:icon src="caddy-replace"  title='<%= glp("ui.com.alt.replace-caddy.datas") %>' /></a>
    <% } %>
    <jalios:icon src='<%= Util.isEmpty(report) ? "check-integrity" : "warning" %>'   />
    <%= glp("ui.adm.dic.lbl.info", report.size()) %>
  </p>
  <p>
    <%= glp("ui.adm.dic.lbl.date") %> 
    <jalios:date date='<%= channel.getDataIntegrityReportDate() %>' format='<%= "short" %>' />
    <jalios:time date='<%= channel.getDataIntegrityReportDate() %>' format='<%= "short" %>' />
  </p>
</jalios:message>

<div class="navbar navbar-default navbar-table-header">
  <form class="navbar-form">
    <a href="<%= HttpUtil.getUrlWithCSRFToken("admin/checkIntegrity.jsp?opRefresh=true", request, true) %>" class="btn btn-primary" ><%= glp("ui.com.btn.refresh") %></a>
    <a href='admin/exportCSVIntegrity.jsp' class="btn btn-default"><jalios:icon src="csv" /> <%= glp("ui.com.btn.csv") %></a>
  </form> 
</div>

<%-- *** CONSTRAINT VIOLATION TABLE ******************** --%>
<% if (Util.notEmpty(report)) { %>
<table id='pubTable' class='table-data'>
  <tr>
   <th colspan='2'>
      
    </th>
    <th>ID</th>
    <th><%= glp("ui.adm.dic.lbl.type") %></th>
    <th><%= glp("ui.adm.dic.lbl.value") %></th>
    <th width='100%'><%= glp("ui.adm.dic.lbl.const") %></th>
    <th class='listHeader'>&nbsp;</th>
  </tr>
<jalios:pager name='ciPagerHandler' declare='true' action='init' size='<%= report.keySet().size() %>'/>
<jalios:foreach collection='<%= report.keySet() %>' 
                name='itData' 
                type='Data'
                max='<%= ciPagerHandler.getPageSize() %>'
                skip='<%= ciPagerHandler.getStart() %>'> 
<% ControllerStatus itStatus = (ControllerStatus)report.get(itData); %>
  <tr> 
    <td class="fit nowrap"><jalios:edit id='<%= itData.getId() %>'/></td>
    <td class="numeric"><%= ciPagerHandler.getStart() + itCounter.intValue() %>.</td>
    <td><%= itData.getId() %></td>
    <td><%= Util.getClassShortName(itData.getClass()) %></td>
    <td class="nowrap"><jalios:truncate length='20' suffix='...'><%= itData.toString() %></jalios:truncate></td>
    <td><%= itStatus.getMessage(userLang)  %></td>
    <td class="fit"><jalios:caddy data="<%= itData %>" /></td>
  </tr>
</jalios:foreach>
</table>
<jalios:pager name='ciPagerHandler'/>
<% } %>


<%@ include file='/admin/doAdminFooter.jspf' %>
