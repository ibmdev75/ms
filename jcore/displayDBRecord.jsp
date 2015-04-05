<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/doHeader.jspf' %>

<% 
String dataSource = getUntrustedStringParameter("dataSource", null); // ENCODE !! 
String table      = getUntrustedStringParameter("table", null); // ENCODE !! 
String keyCol     = getUntrustedStringParameter("keyCol", null); // ENCODE !! 
String keyVal     = getUntrustedStringParameter("keyVal", null); // ENCODE !!

SQLQueryResult sqr = new SQLQueryResult(dataSource, "*", table, null, new String[]{keyCol} , new String[]{keyVal} , true,  1);
%>
<%-- *** ERROR ******************************* --%>
<% if (sqr.isError() && isWSAdmin) { %>
<%= glp("ui.sql.lbl.error") %>
<ul>
<li><%= sqr.getSQLQuery() %></li>
<li><%= glp("ui.sql.lbl.err-msg") %> <%= sqr.getErrorMessage() %></li>
<li><%= glp("ui.sql.lbl.err-code") %> <%= sqr.getErrorCode() %></li>
<li><%= glp("ui.sql.lbl.err-state") %> <%= sqr.getSQLState() %></li>
</ul>
<%-- *** NO RESULT ******************************* --%>
<% } else if (sqr.isEmpty()) { %>
<%= glp("ui.sql.lbl.no-res") %>

<%-- *** DISPLAY RESULT ******************************* --%>
<% } else { %>
<% SQLQueryResult.Row row =(SQLQueryResult.Row)sqr.getRowList().get(0); %>

<div class="fullDisplay dbrecord">
<table class="fieldList">
  <% for(int i = 0; i < sqr.getColumnNames().length; i++) { %>
  <tr class="field">
    <td class='label'><%= sqr.getColumnNames()[i] %></td>
    <td class='data'><%= row.get(i) %></td>
  </tr>
  <% } %>
</table>
<% } %>
<%@ include file='/jcore/doFooter.jspf' %>