<%--
  @Summary: Display JCMS Monitoring information managed by com.jalios.jcms.monitoring.MonitoringManager
  @Category: Admin / Channel
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
--%><%@ include file='/jcore/doInitPage.jspf' %><% 

  if (!checkAccess("admin/monitoring/monitoring")) {
    sendForbidden(request, response);
    return;
  }

long freeMemory = Runtime.getRuntime().freeMemory();
long totalMemory = Runtime.getRuntime().totalMemory();
long usedMemory = totalMemory - freeMemory;

com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 
long storeMemory = loadReport.getMemoryUsed();

// Force Garbage collection 
long memBefore = getLongParameter("memBefore", 0);
if (isAdmin && hasParameter("forceGarbageCollection")) {
  Util.forceFullGarbageCollection(2000);
  sendRedirect("admin/monitoring.jsp?memBefore="+ memBefore, request, response);
}

request.setAttribute("monitoringSubAdminMenu", "true"); 
int counter = 0;

%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<h1 class='boTitle icon iconMonitoring'><%= glp("ui.adm.mn.info.monitoring") %></h1>

<div class='row-fluid'>

  <div class="well well-small col-md-3">
    <div class="br">
    <h4><%= glp("ui.adm.ch-status.mem.infos") %></h4>
    <% if (memBefore != 0 && memBefore-usedMemory > 0) { %><span style="color:green"><%= glp("ui.adm.ch-status.mem.saved-by-gc") %> <%= Util.formatFileSize(memBefore-usedMemory, userLocale) %> (<%= (int)((memBefore-usedMemory) * 100 / totalMemory)%>%)</span><br /><% } %>
    <span style="color:blue"><%= glp("ui.adm.ch-status.mem.used") %> <%= Util.formatFileSize(usedMemory, userLocale) %> (<%= (int)(usedMemory * 100 / totalMemory)%>%)</span><br />
    <span style="color:gray"><%= glp("ui.adm.ch-status.mem.store-load") %> <%= Util.formatFileSize(storeMemory, userLocale) %> (<%= (int)(storeMemory * 100 / totalMemory)%>%)</span><br />
    <%= glp("ui.adm.ch-status.mem.total") %> <%= Util.formatFileSize(totalMemory, userLocale) %>
    <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
    </div>
    <input class='btn btn-danger' type='button' value='<%= glp("ui.adm.ch-status.mem.garbage-coll") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/monitoring.jsp?forceGarbageCollection=true&memBefore=<%= usedMemory %>")' />
  </div>
  
	<div class="col-md-6">
<%
  com.jalios.jcms.monitoring.MonitoringManager mm = com.jalios.jcms.monitoring.MonitoringManager.getMonitoringManager();

  SimpleDateFormat sdf = channel.getDateTimeFormat(userLang);
  Date startDate = new Date(System.currentTimeMillis() - 2 * JcmsConstants.MILLIS_IN_ONE_HOUR);
  startDate = startDate.before(mm.getOldestEventDate()) ? mm.getOldestEventDate() : startDate;
  String startDateStr = sdf.format(startDate);
%>
<form name="chartOptionsForm" class="form-horizontal">

  <fieldset>
    <legend><%= glp("ui.adm.ch-status.mem.date-intro") %></legend>
    <jalios:field name="startDate" label='<%= glp("monitoring.chart.start-date") %>' value="<%= startDate %>">
      <jalios:control settings='<%= new DateSettings().displayTime() %>' />
    </jalios:field>
    
    <jalios:field name="endDate" label='<%= glp("monitoring.chart.end-date") %>' value="<%= new Date() %>">
      <jalios:control settings='<%= new DateSettings().displayTime() %>' />
    </jalios:field>
    <button class="btn btn-default" type="button" onclick="JCMS.Monitoring.handleChartFormChange();"><%= glp("ui.com.btn.refresh") %></button>
  </fieldset>

  <fieldset>
    <legend><%= glp("ui.adm.ch-status.mem.select-label") %></legend>
        <%
          Map<String, String> PREDEFINED_PERIODS = new LinkedHashMap<String, String>();
          PREDEFINED_PERIODS.put("2", glp("ui.adm.ch-status.mem.select-opt", 2));
          PREDEFINED_PERIODS.put("4", glp("ui.adm.ch-status.mem.select-opt", 4));
          PREDEFINED_PERIODS.put("12", glp("ui.adm.ch-status.mem.select-opt", 12));
          PREDEFINED_PERIODS.put("24", glp("ui.adm.ch-status.mem.select-opt", 24));
          PREDEFINED_PERIODS.put("week", glp("ui.adm.ch-status.mem.select-week"));
          PREDEFINED_PERIODS.put("all", glp("ui.adm.ch-status.mem.select-all"));
        %>
    <jalios:field label='ui.analytics.report.predefined-period' name='monitor_hour_select' id="monitor_hour_select" value='2'>
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(PREDEFINED_PERIODS.keySet()).enumLabels(PREDEFINED_PERIODS.values()) %>' />
    </jalios:field>
    <button class="btn btn-default" type="button" onclick="JCMS.Monitoring.handlePredefinedSettingsChange();"><%= glp("ui.com.btn.refresh") %></button>
  </fieldset>
  
<jalios:javascript>
'JCMS.Monitoring'._namespace({
	glNewChartImg: null,
	checkChartLoading: function() {
	  if (JCMS.Monitoring.glNewChartImg) {
	    if (JCMS.Monitoring.glNewChartImg.complete) { 
	      var chartImg = $('chartImg');
	      chartImg.src = JCMS.Monitoring.glNewChartImg.src;
	      chartImg.show();
	      $('loadingMsg').hide();
	      JCMS.Monitoring.glNewChartImg = null;
	      return;
	    }
	    setTimeout('JCMS.Monitoring.checkChartLoading()', 500);
	  }
	},
	handleChartFormChange: function() {
	 $('chartImg').hide();
	 $('loadingMsg').show();
	 var startDate = document.chartOptionsForm.startDate.value;
	 var endDate = document.chartOptionsForm.endDate.value;
	 var chartURL = 'admin/monitoringChart.jsp' + 
	                '?startDate=' + encodeURIComponent(startDate) + 
	                '&endDate=' + encodeURIComponent(endDate) +
	                '&random=' + encodeURIComponent(Math.random());
	 JCMS.Monitoring.glNewChartImg = new Image();
	 JCMS.Monitoring.glNewChartImg.src = chartURL;
	 JCMS.Monitoring.checkChartLoading();
	},
	handlePredefinedSettingsChange: function() {
	 var hours = $F('monitor_hour_select');
	 if (hours == 0) {
	   return;
	 }
	 var startDate;
	 switch (hours) {
	   case '2':
     case '4':
     case '12':
     case '24': {
       startDate = jQuery.jalios.ui.Widget.Date.dateToString(new Date(Date.now() - hours*3600000), true); 
       break;
     }
	   case 'week': startDate = jQuery.jalios.ui.Widget.Date.dateToString(new Date(Date.now() - 7*24*3600000), true); break;
	   case 'all': startDate = '<%= sdf.format(mm.getOldestEventDate()) %>'; break;
	   default:   return;
	 }
	 document.chartOptionsForm.startDate.value = startDate;
	 document.chartOptionsForm.endDate.value = '';
	 JCMS.Monitoring.handleChartFormChange();
	},
  loadDefaultChartImage: function() {
    JCMS.Monitoring.glNewChartImg = new Image();
    JCMS.Monitoring.glNewChartImg.src = "admin/monitoringChart.jsp?startDate=<%= startDateStr %>";
   JCMS.Monitoring.checkChartLoading();
  }
});
Event.observe('monitor_hour_select', 'change', JCMS.Monitoring.handlePredefinedSettingsChange);
JCMS.Monitoring.loadDefaultChartImage();
</jalios:javascript>
</form>

  </div>
  
</div><%-- row-fluid --%>
  
<div class='row-fluid'>
  <div class="col-md-9">
  
  <table>  
  <tr>

    <%-- --------------------------------------------------------------- --%>
    <%-- ROW 2, CELL 1, Chart's Legend --%>
    <td class="text-right">
<style type="text/css">
 #legends        {
   height: 700px; padding: 0 5px; margin-right: 5px;
   border: 1px solid #aaa; background-color: #f4f4f4;
   font-size: 8pt; font-family: Arial, Helvetica, sans-serif;
   line-height: 1;
 }
 #lTitle         {
   height:  38px; padding-top: 10px; border-bottom: 1px solid #aaa; 
   text-align: center; font-weight: bold; font-size: 18px;
 }
 #memoryLegend   { height: 115px; margin-top: 20px; border-bottom: 1px solid #aaa; }
 #restartsLegend { height:  18px; margin-top:  10px; border-bottom: 1px solid #aaa; }
 #requestsLegend { height: 97px; margin-top: 20px; border-bottom: 1px solid #aaa; }
 #sessionsLegend { height:  85px; margin-top: 10px; border-bottom: 1px solid #aaa; }
 #objectsLegend  { height: 130px; margin-top: 10px; border-bottom: 1px solid #aaa; }
 #threadsLegend  { height: 100px; margin-top: 10px; }
 .legendTitle     { font-weight: bold; }
 .legendArea      { padding-right: 10px; margin:2px; border-right: 12px solid gray; text-align: right; }
 .legendThickLine { padding-right: 10px; margin:2px; border-right: 12px solid gray; text-align: right; }
 .legendThinLine  { padding-right: 10px; margin:2px; border-right: 12px solid gray; text-align: right; }
</style>
<div id="legends">
    <div id="lTitle">
    <%= glp("monitoring.chart.legend") %>
    </div>
    <div id="memoryLegend">
     <div class="legendTitle"><%= glp("monitoring.chart.axis.memory") %></div>
     <div class="legendArea" style="border-color: #FF9B9B;"><%= glp("monitoring.chart.series.mem-used") %></div>
     <div class="legendThinLine" style="border-color: blue;"><%= glp("monitoring.chart.series.mem-total") %></div>
    </div>
    <div id="restartsLegend">
     <div class="legendTitle"><%= glp("monitoring.chart.marker.restart") %></div>
    </div>
    <div id="requestsLegend">
     <div class="legendTitle"><%= glp("monitoring.chart.axis.request") %></div>
     <div class="legendThinLine" style="border-color: #FF9B9B;"><%= glp("monitoring.chart.series.request-nbr") %></div>
     <div class="legendThickLine" style="border-color: blue"><%= glp("monitoring.chart.series.request-mav") %></div>
    </div>
    <div id="sessionsLegend">
     <div class="legendTitle"><%= glp("monitoring.chart.axis.session") %></div>
     <div class="legendThickLine" style="border-color: red;"><%= glp("monitoring.chart.series.allses-nbr") %></div>
     <div class="legendThinLine" style="border-color: blue;"><%= glp("monitoring.chart.series.logged-nbr") %></div>
     <div class="legendThinLine" style="border-color: green;"><%= glp("monitoring.chart.series.guest-nbr") %></div>
     <div class="legendThinLine" style="border-color: orange;"><%= glp("monitoring.chart.series.robot-nbr") %></div>
    </div>
    <div id="objectsLegend">
     <div class="legendTitle"><%= glp("monitoring.chart.axis.object") %></div>
     <div class="legendThickLine" style="border-color: red;"><%= glp("monitoring.chart.series.data-nbr") %></div>
   <div class="legendThinLine" style="border-color: orange;"><%= glp("monitoring.chart.series.dbdata-nbr") %></div>
   <div class="legendThinLine" style="border-color: pink;"><%= glp("monitoring.chart.series.ugc-nbr") %></div>
     <div class="legendThinLine" style="border-color: blue;"><%= glp("monitoring.chart.series.content-nbr") %></div>
     <div class="legendThinLine" style="border-color: green;"><%= glp("monitoring.chart.series.doc-nbr") %></div>
     <div class="legendThinLine" style="border-color: brown"><%= glp("monitoring.chart.series.mbr-nbr") %></div>
     <div class="legendThinLine" style="border-color: yellow;"><%= glp("monitoring.chart.series.other-nbr") %></div>
    </div>
  <div id="threadsLegend">
   <div class="legendTitle"><%= glp("monitoring.chart.axis.threads") %></div>
   <div class="legendThickLine" style="border-color: red;"><%= glp("monitoring.chart.series.threads-nbr") %></div>
   <div class="legendThinLine" style="border-color: blue;"><%= glp("monitoring.chart.series.daemon-threads-nbr") %></div>
   <div class="legendThinLine" style="border-color: green;"><%= glp("monitoring.chart.series.active-threads-nbr") %></div>
   <div class="legendThinLine" style="border-color: orange;"><%= glp("monitoring.chart.series.interrupted-threads-nbr") %></div>
   </div>
</div>
    </td>
    
    <%-- --------------------------------------------------------------- --%>
    <%-- ROW 2, CELL 2, Chart --%>
    <td class='vTop text-center'>
      <div id="loadingMsg" class='formLabel'>
        <img id="waitImg" src="images/jalios/icons/wait.gif">
        <%= glp("monitoring.chart.loading") %>
      </div>
      <img id="chartImg" alt="" style="border: 1px solid black; display:none;" src="s.gif" />
    </td>
    
  </tr>
</table>

  </div><%-- col-md-9 --%>
</div><%-- row-fluid --%>

<%@ include file='/admin/doAdminFooter.jspf' %> 