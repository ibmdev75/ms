<%@page import="java.util.Map.Entry"%>
<%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><div class="chart-result" style="overflow:hidden;"><%
String CS_PLUGIN_NAME = "CollaborativeSpacePlugin"; 
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, AdminReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{

  	long mbrCount = 0;
	Map<Date, Double> mbrCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> mbrUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> mbrDeleteCountDataMap = new HashMap<Date, Double>();
	
	long dBMbrCount = 0;
	Map<Date, Double> dBMbrCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> dBMbrUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> dBMbrDeleteCountDataMap = new HashMap<Date, Double>();
	
	long wsCount = 0;
	Map<Date, Double> wsCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> wsUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> wsDeleteCountDataMap = new HashMap<Date, Double>();
	
	long csCount = 0;
	Map<Date, Double> csCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> csUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> csDeleteCountDataMap = new HashMap<Date, Double>();
	
	Map<Date, Double> quotaValueDataMap = new HashMap<Date, Double>();
	Map<Date, Double> quotaMaxDataMap = new HashMap<Date, Double>();

	Map<String, Integer> aggregatedMemberMap = new HashMap();
	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, AdminReportMetric.class);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,AdminReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
		AdminReportMetric metric = (AdminReportMetric) metricIt.next();
		Date reportStartDate =  metric.getStartDate();
		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		
		mbrCount = metric.getMbrCount();
		mbrCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getMbrCreateCount()));
		mbrUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getMbrUpdateCount()));
		mbrDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getMbrDeleteCount()));
		
		dBMbrCount = metric.getDBMbrCount();
		dBMbrCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getDBMbrCreateCount()));
		dBMbrUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getDBMbrUpdateCount()));
		dBMbrDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getDBMbrDeleteCount()));
		
		wsCount = metric.getWsCount();
		wsCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getWsCreateCount()));
		wsUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getWsUpdateCount()));
		wsDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getWsDeleteCount()));
		
		csCount = metric.getCsCount();
		csCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getCsCreateCount()));
		csUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getCsUpdateCount()));
		csDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getCsDeleteCount()));		

		quotaValueDataMap.put(cal.getTime(), Double.valueOf(metric.getQuotaValue()));
		quotaMaxDataMap.put(cal.getTime(), Double.valueOf(metric.getQuotaMax()));
	}
	
	Plugin csPlugin = PluginManager.getPluginManager().getPlugin(CS_PLUGIN_NAME);
	boolean isCSPlugin = csPlugin != null && csPlugin.isInitialized();
  
  
  int memberSummary = (int)(
      Util.sum(mbrCreateCountDataMap.values()) + Util.sum(dBMbrCreateCountDataMap.values()) - 
      (Util.sum(mbrDeleteCountDataMap.values()) + Util.sum(dBMbrDeleteCountDataMap.values())));

  int wsSummary = (int)(Util.sum(wsCreateCountDataMap.values()) - Util.sum(wsDeleteCountDataMap.values()));
  %>
  
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= memberSummary >= 0 ? "+" : "" %><%= memberSummary %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AdminReportAgent.mbr-section") %></div>
	      </div>
      </div>        
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= wsSummary >= 0 ? "+" : "" %><%= wsSummary %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AdminReportAgent.ws-section") %></div>
	      </div>    
      </div>        
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><jalios:filesize size="<%= (int)Util.mean(quotaValueDataMap.values()) %>" /></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AdminReportAgent.quota-section") %></div>
	      </div>  
      </div>        
    </div>
  </div>
  
	<div class="row">
		<% String suffix = "_mbr_admin_report"; %>
		<div class="col-md-6 report-element mbr-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.mbr-section") %> (<%=mbrCount %>/<%=dBMbrCount %>)</h3>
			<p class="help-block"><%=glp("ui.analytics.AdminReportAgent.mbr-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.mbrCreateCount") %>'
					valuesMap='<%=mbrCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.mbrUpdateCount") %>'
					valuesMap='<%=mbrUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.mbrDeleteCount") %>'
					valuesMap='<%=mbrDeleteCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.dBMbrCreateCount") %>'
					valuesMap='<%=dBMbrCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.dBMbrUpdateCount") %>'
					valuesMap='<%=dBMbrUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.dBMbrDeleteCount") %>'
					valuesMap='<%=dBMbrDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
		<% suffix = "_quota_admin_report"; %>
		<div class="col-md-6 report-element quota-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.quota-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AdminReportAgent.quota-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true"  width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.quotaMax") %>'
					valuesMap='<%=quotaMaxDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.quotaValue") %>'
					valuesMap='<%=quotaValueDataMap %>'
				/>
				<jalios:flotChartOption>
				{
			        yaxis: {
			            tickFormatter: function(v){ return $.jalios.analytics.formatSize(parseInt(v), 0)}
			        },
              bars: {
                 show: false
              },
              lines:{
                 show: true
              },
              points: {
                 show : false
              }
			    }
				</jalios:flotChartOption>
			</jalios:flotChart>
		</div>
	</div>
	<% if(wk == null){ %>
	<div class="row-fluid">		
		<% suffix = "_ws_admin_report"; %>
		<div class="col-md-6 report-element ws-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.ws-section") %> (<%=wsCount %>)</h3>
			<p class="help-block"><%=glp(isCSPlugin?"ui.analytics.AdminReportAgent.ws-section.help":"ui.analytics.AdminReportAgent.ws-section.help-without-cs") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.wsCreateCount") %>'
					valuesMap='<%=wsCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.wsUpdateCount") %>'
					valuesMap='<%=wsUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.wsDeleteCount") %>'
					valuesMap='<%=wsDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
		<%if(isCSPlugin){ %>
		<% suffix = "_cs_admin_report"; %>
		<div class="col-md-6 report-element cs-chart">
			<h3><%=glp("ui.analytics.AdminReportAgent.cs-section") %> (<%=csCount %>)</h3>
			<p class="help-block"><%=glp("ui.analytics.AdminReportAgent.cs-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.csCreateCount") %>'
					valuesMap='<%=csCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.csUpdateCount") %>'
					valuesMap='<%=csUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AdminReportAgent.csDeleteCount") %>'
					valuesMap='<%=csDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
		<%} %>
	</div>
	<%} %>
	<div class="row-fluid">	
		<jalios:include target="JCMS_ANALYTICS_ADMIN_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>