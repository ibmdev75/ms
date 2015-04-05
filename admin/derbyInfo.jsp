<%@ include file="/jcore/doInitPage.jspf" %><%

if (!isAdmin) {
  sendForbidden(request, response);
  return;
}

request.setAttribute(glp("ui.adm.dbinfo.conf.derby.info"), "Derby Info");

%><%@ include file="/jcore/doEmptyHeader.jspf" %><%

  DerbyManager derbyMgr = DerbyManager.getInstance();

%>

<div class="page-header"><h1><%= glp("ui.adm.dbinfo.conf.derby.info") %></h1></div>

<table class="table-data table-condensed"    style="margin: 10px;">
  <tr>
    <th style="text-align: left;">Sys Info</th>
  </tr>
  <tr>
    <td>
      <pre><%= derbyMgr.getSysInfo() %></pre>
    </td>
  </tr>
</table>

<table class="table-data table-condensed"    style="margin: 10px;">
  <tr>
    <th style="text-align: left;">Runtime Info</th>
  </tr>
  <tr>
    <td>
      <pre><%= derbyMgr.getRuntimeInfo() %></pre>
    </td>
  </tr>
</table>
