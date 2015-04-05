<%@ include file="/jcore/doInitPage.jspf" %>
<% 
SQLQueryResult sqr = (SQLQueryResult) request.getAttribute("sqr");

if (sqr == null) {
  String dataSource = (String) request.getAttribute("dataSource"); 
  String sqlQuery = (String) request.getAttribute("sqlQuery");
  int maxRows = Util.toInt(request.getAttribute("maxRows"), 100);
%>
<jalios:sqlquery name="sqr2" dataSource="<%= dataSource %>" maxRows="<%= maxRows %>">
<%= sqlQuery %>
</jalios:sqlquery>
<%
  sqr = sqr2;
}
%>
<%-- *** ERROR ******************************* --%>
<% if (sqr.isError() && isWSAdmin) { %>
  <jalios:message level="<%= MessageLevel.WARN %>" title="ui.sql.lbl.error" dismissable="false">
    <pre><%= sqr.getSQLQuery() %></pre>
    <ul>
      <li><label><%= glp("ui.sql.lbl.err-msg") %> :</label> <%= sqr.getErrorMessage() %></li>
      <li><label><%= glp("ui.sql.lbl.err-code") %> :</label> <%= sqr.getErrorCode() %></li>
      <li><label><%= glp("ui.sql.lbl.err-state") %> :</label> <%= sqr.getSQLState() %></li>
    </ul>
  </jalios:message>

<%-- *** NO RESULT ******************************* --%>
<% } else if (sqr.isEmpty()) { %>
  <jalios:message title="" msg='<%= glp("ui.sql.lbl.result", 0) %>' dismissable="false" />

<%-- *** DISPLAY RESULT ******************************* --%>
<% } else { %>
  <p><span class="label label-info"><%= glp("ui.sql.lbl.result", sqr.getRowCount()) %></span></p>
  
  <% String paramPrefix = String.valueOf((Util.toInt(request.getAttribute("sqlQueryPager"), 0) + 1)); %>
  <jalios:pager name="dqPagerHandler" declare="true" action="init" size="<%= sqr.getRowList().size() %>" paramPrefix='<%= "sqlPager" + paramPrefix %>' />
  <% request.setAttribute("sqlQueryPager",paramPrefix); %>
  
  <table class="table-data table-condensed">
    <tr>
      <th>&nbsp;</th>
      <jalios:foreach array="<%= sqr.getColumnNames() %>" name="itColName" type="String">
        <th><%= itColName %></th>
      </jalios:foreach>
    </tr>
    <jalios:foreach collection="<%= sqr.getRowList() %>" 
                    name="itRow" 
                    type="SQLQueryResult.Row"
                    max="<%=  dqPagerHandler.getPageSize() %>"
                    skip="<%= dqPagerHandler.getStart() %>"
                    counter="rowCounter">
      <tr>
        <td class="numeric"><%= dqPagerHandler.getStart() + rowCounter.intValue() %></td>
        <jalios:foreach collection="<%= itRow.getColumnList() %>" name="itCol" type="Object" counter="colCounter">
          <td><%= itCol %></td>
        </jalios:foreach>
      </tr>
    </jalios:foreach>
  </table>
  
  <jalios:pager name="dqPagerHandler" />

<% } %>