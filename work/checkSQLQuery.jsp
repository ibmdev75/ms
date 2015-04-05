<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!isLogged || !loggedMember.isWorker()){
    jcmsContext.sendForbidden();
    return;
  }

%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<% 
String dataSource = getUntrustedStringParameter("dataSource", null); // ENCODE !! 
String sqlQuery = getUntrustedStringParameter("sqlQuery", null); // ENCODE !! 
int maxRows = getIntParameter("maxRows", 100);
request.setAttribute("dataSource", dataSource);
request.setAttribute("sqlQuery", sqlQuery);
request.setAttribute("maxRows", String.valueOf(maxRows));
%>
<div class="WorkArea">
  <jalios:message title="" dismissable="false">
    <div><label><%= glp("ui.com.lbl.datasource") %> :</label> <%= channel.getDataSourceLabel(dataSource, userLang) %></div>
    <div><label><%= glp("ui.com.lbl.max-rows") %> :</label> <%= maxRows %></div>
    <pre><%= sqlQuery %></pre>
  </jalios:message>
  <jsp:include page='/jcore/doDisplaySQLQuery.jsp'/>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>