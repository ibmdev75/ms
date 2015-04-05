<%@ page import="com.jalios.jcms.search.LuceneDataSearchEngine" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  if (!isAdmin){
    return;
  }
  final LuceneDataSearchEngine se;
  String seName = getAlphaNumParameter("se", null);
  if ("cat".equals(seName)) {
    se = (LuceneDataSearchEngine) channel.getQueryManager().getCategorySearchEngine();
  } else { //if ("pub".equals(se)) {
    se = (LuceneDataSearchEngine) channel.getQueryManager().getPublicationSearchEngine();
  } 
  
  int operationPercent = se.getProgressState();
  long elapsedTime = System.currentTimeMillis() - se.getOperationStartTime();
  long timeRemaining = (operationPercent <= 0) ? 0 : (((elapsedTime * 100) / operationPercent) - elapsedTime);
  ObjectIntTreeMap chart = new ObjectIntTreeMap();
  chart.put(glp("ui.adm.search.lucene.op-running"), operationPercent);
  
  long freeMemory = Runtime.getRuntime().freeMemory();
  long totalMemory = Runtime.getRuntime().totalMemory();
  String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, userLocale); 
  String totalMemoryStr = Util.formatFileSize(totalMemory, userLocale); 
  int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <% if (operationPercent < 100 ) { %>
      <meta http-equiv=refresh content="5; URL=<%= ServletUtil.getUrl(request) %>">
    <% } %>
    <% if (!se.isOperationRunning() ) { %>
      <script>parent.location = parent.location;</script>
    <% } %>
    <jalios:chart printCSS='<%= true %>' colors='<%= new String[]{"#5D9FD1"} %>'/>
  </head>
  <body scroll="auto" bgcolor="#FFFFFF" text="#000000" style='margin: 0px;' >
    <table class='layout'>
      <tr>
        <td width='70%'><jalios:chart dataMap='<%= chart %>' display='hchart'/></td>
        <td>&nbsp;&nbsp;&nbsp;</td>
        <td style='font: normal 8pt arial,helvetica,sans-serif; color: #000000;'>
          <%= usedMemoryStr %> / <%= totalMemoryStr %> (<%= percentMemory %>%)
          <% if (timeRemaining != 0 ) { %>
          <br /><%= glp("ui.statreport.lbl.remain") %>: <jalios:duration time='<%= timeRemaining %>' />
          <% } %>
        </td>
      </tr>
    </table>
  </body>
</html>