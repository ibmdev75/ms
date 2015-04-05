<%@page import="java.util.Map.Entry"%>
<%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><div class="chart-result" style="overflow:hidden;"><%
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, AccountReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{

  	long accountCount = 0;
  	long contactCount = 0;
  	long disabledAccountCount = 0;
  	long guestCount = 0;
  
	Map<Date, Double> accountCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> accountUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> accountDeleteCountDataMap = new HashMap<Date, Double>();
	
	Map<Date, Double> contactCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> contactUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> contactDeleteCountDataMap = new HashMap<Date, Double>();
	
	Map<Date, Double> disabledAccountCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> disabledAccountUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> disabledAccountDeleteCountDataMap = new HashMap<Date, Double>();
	
	Map<Date, Double> guestCreateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> guestUpdateCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> guestDeleteCountDataMap = new HashMap<Date, Double>();
  
	Map<String, Integer> aggregatedMemberMap = new HashMap();

	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, AccountReportMetric.class);	
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,AccountReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
		AccountReportMetric metric = (AccountReportMetric) metricIt.next();
		Date reportStartDate =  metric.getStartDate();
		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		
		accountCount = metric.getAccountCount();
		accountCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getAccountCreateCount()));
		accountUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getAccountUpdateCount()));
		accountDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getAccountDeleteCount()));

		contactCount = metric.getContactCount();
		contactCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getContactCreateCount()));
		contactUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getContactUpdateCount()));
		contactDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getContactDeleteCount()));

		disabledAccountCount = metric.getDisabledCount();
		disabledAccountCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getDisabledCreateCount()));
		disabledAccountUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getDisabledUpdateCount()));
		disabledAccountDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getDisabledDeleteCount()));

		guestCount = metric.getGuestCount();
		guestCreateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getGuestCreateCount()));
		guestUpdateCountDataMap.put(cal.getTime(), Double.valueOf(metric.getGuestUpdateCount()));
		guestDeleteCountDataMap.put(cal.getTime(), Double.valueOf(metric.getGuestDeleteCount()));
	}	    
  
  
  %>
  
  
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= accountCount %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AccountReportAgent.account-section") %></div>
	      </div>
      </div>
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= guestCount %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AccountReportAgent.guest-section") %></div>
	      </div>   
      </div>
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= contactCount %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.AccountReportAgent.contact-section") %></div>
	      </div> 
      </div>
    </div>
  </div>  

	<div class="row">
		<% String suffix = "_account_account_report"; %>
		<div class="col-md-6 report-element account-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.account-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.account-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.accountCreateCount") %>'
					valuesMap='<%=accountCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.accountUpdateCount") %>'
					valuesMap='<%=accountUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.accountDeleteCount") %>'
					valuesMap='<%=accountDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
			
		<% suffix = "_disabled_account_report"; %>
		<div class="col-md-6 report-element disabled-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.disabled-section") %> (<%=disabledAccountCount %>)</h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.disabled-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.disabledAccountCreateCount") %>'
					valuesMap='<%=disabledAccountCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.disabledAccountUpdateCount") %>'
					valuesMap='<%=disabledAccountUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.disabledAccountDeleteCount") %>'
					valuesMap='<%=disabledAccountDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
	</div>
	<div class="row-fluid">
		<% if(wk == null){ %>
		<% suffix = "_contact_account_report"; %>
		<div class="col-md-6 report-element contact-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.contact-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.contact-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.contactCreateCount") %>'
					valuesMap='<%=contactCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.contactUpdateCount") %>'
					valuesMap='<%=contactUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.contactDeleteCount") %>'
					valuesMap='<%=contactDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
		<%} %>
			
		<% suffix = "_guest_account_report"; %>
		<div class="col-md-6 report-element guest-chart">
			<h3><%=glp("ui.analytics.AccountReportAgent.guest-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.AccountReportAgent.guest-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.guestCreateCount") %>'
					valuesMap='<%=guestCreateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.guestUpdateCount") %>'
					valuesMap='<%=guestUpdateCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.AccountReportAgent.guestDeleteCount") %>'
					valuesMap='<%=guestDeleteCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
	</div>
	<div class="row-fluid">
		<jalios:include target="JCMS_ANALYTICS_ACCOUNT_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>