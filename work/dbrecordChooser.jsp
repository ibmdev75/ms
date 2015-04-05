<%@ page import="javax.sql.*, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.ResultSetMetaData" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/doEmptyHeader.jspf" %>
<% 
String dataSource = getUntrustedStringParameter("ds", null); // ENCODE !! 
String table = getUntrustedStringParameter("table", null); // ENCODE !!
String columns =  getUntrustedStringParameter("columns", null); // ENCODE !!
String labelCol = getUntrustedStringParameter("labelCol", null); // ENCODE !! 
String orderBy = getUntrustedStringParameter("orderBy", null); // ENCODE !! 
int maxRows = getIntParameter("maxRows", 100);

String sqlQuery = "select " + columns + " from " + table + (Util.notEmpty(orderBy) ? " ORDER BY " + orderBy : "");
logger.debug("sqlQuery: " + sqlQuery);
logger.debug("maxRows: " + maxRows);
boolean showRadioInsert = true;
boolean showCheckInsert = false;
%>
<%@ include file="/work/doInsertLinkParams.jspf" %>
<%@ include file="/work/doInsertLinkPopup.jspf" %>

<jalios:sqlquery name="sqr" dataSource="<%= dataSource %>" query="<%= sqlQuery %>" maxRows="<%= maxRows %>" />

<div class="WorkArea">

  <div class="page-header"><h1><jalios:icon src="dbrecord" /> <%= glp("ui.adm.type-edit.lbl.ed.dbrecord") %></h1></div>

  <%-- *** ERROR ******************************* --%>
  <% if (sqr.isError()) { %>
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
  <%= glp("ui.sql.lbl.no-res") %>
  
  <%-- *** DISPLAY RESULT ******************************* --%>
  <% } else { %>
    <jalios:pager name="dbrcPagerHandler" declare="true" action="init" size="<%= sqr.getRowList().size() %>" />
  
    <table class="table-data table-condensed">
      <tr>
        <td class="listHeader text-overflow" >&nbsp;</td>
        <td class="listHeader text-overflow" >&nbsp;</td>
        <jalios:foreach array="<%= sqr.getColumnNames() %>" name="itColName" type="String">
          <td class="listHeader text-overflow"><%= itColName %></td>
        </jalios:foreach>
      </tr>
    
      <jalios:foreach collection="<%= sqr.getRowList() %>" 
                      name="itRow" 
                      type="SQLQueryResult.Row"
                      max="<%=  dbrcPagerHandler.getPageSize() %>"
                      skip="<%= dbrcPagerHandler.getStart() %>"
                      counter="rowCounter">
        <% String rowId = itRow.get(0); %>
        <% String rowLabel = itRow.get(labelCol); %>
        <tr>
          <td class="text-right text-overflow" >
            <input type="radio" onclick='javascript:insertLink("<%= HttpUtil.encodeForJavaScript(rowId) %>", "<%= HttpUtil.encodeForJavaScript(rowLabel) %>", "<%= targetInput %>", "<%= targetLabel %>")' />
          </td>
          <td class="numeric"><%= dbrcPagerHandler.getStart() + rowCounter.intValue()%>.</td>
          <jalios:foreach collection="<%= itRow.getColumnList() %>" name="itCol" type="Object" counter="colCounter">
            <td><%= itCol %></td>
          </jalios:foreach>
        </tr>
      </jalios:foreach>
    </table>
    
    <jalios:pager name="dbrcPagerHandler" />
  
  <% } %>
</div>
<%@ include file="/jcore/doEmptyFooter.jspf" %>