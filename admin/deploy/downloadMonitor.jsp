<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  request.setAttribute("title",channel.getName()); 
  request.setAttribute("zone","InternalUI");
  jcmsContext.addCustomHeader("<meta http-equiv='refresh' content='1; URL="+ contextPath +"/admin/deploy/downloadMonitor.jsp'>");
  jcmsContext.addBodyAttributes("scroll",  "auto");
  jcmsContext.addBodyAttributes("bgcolor", "#eeeeee");
  jcmsContext.addBodyAttributes("text",    "#000000");
  jcmsContext.addBodyAttributes("style",  "padding: 5px 20px");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<% 
  DeployDownloadMonitor monitor = (DeployDownloadMonitor)request.getSession().getAttribute("deployDownloadMonitor"); 
%>

<%-- *** NOT YET AVAILABLE ************************************************* --%>
<% if (monitor == null) { %>
In progress...

<%-- *** COMPLETED ************************************************* --%>
<% } else if (monitor.isCompleted()) { %>
<% request.getSession().removeAttribute("deployDownloadMonitor"); %>
<script>
this.close();
</script>

<%-- *** MONITORING ************************************************* --%>
<% } else { %>

<%-- --- PROGRESSION BAR ------------------------ --%>
<font face='Arial, sans-serif' size='2'><%= glp(monitor.getTitleProp()) %></font>
<div class="gauge">
  <span class="start">0%</span>
  <div class="progress" style="width: <%= ((int)monitor.getPercent()) %>%;">
    <span class="status"><%= ((int)monitor.getPercent()) %>%</span>
  </div>
  <span class="end">100%</span>
</div>

<%-- --- STEPS ------------------------ --%>
<ol><%   for(int i = 1; i <= monitor.getMaxStep(); i++) { 
     if (monitor.getStep() == i) { 
%><li><strong><%= glp(monitor.getStepPropPrefix() + "." + i) %></strong></li>
<%     } else { %>
<li><%= glp(monitor.getStepPropPrefix() + "." + i) %></li>
<%     } 
   } %>
</ol>
<% } %>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
