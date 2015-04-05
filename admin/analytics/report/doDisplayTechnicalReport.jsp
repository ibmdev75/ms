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
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, TechnicalReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{

	Map<Date, Double> requestCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> requestBotCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> rssAccessCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> openAPICountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> authFailCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> csrfCountDataMap = new HashMap<Date, Double>();
	Map<Date, Double> averageAccessTimeDataMap = new HashMap<Date, Double>();
  
	Map<String, Integer> aggregatedBrowserMap = new HashMap();
	Map<String, Integer> aggregatedBotMap = new HashMap();
	Map<String, Integer> aggregatedOsMap = new HashMap();
	Map<String, Integer> aggregatedZoneMap = new HashMap();
	Map<String, Integer> aggregatedIpMap = new HashMap();
	Map<String, Integer> aggregatedReferrerMap = new HashMap();
	Map<String, ContentTopValue> aggregatedSlowRequestMap = new HashMap();
  	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, TechnicalReportMetric.class);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,TechnicalReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
		TechnicalReportMetric metric = (TechnicalReportMetric) metricIt.next();
		Date reportStartDate =  metric.getStartDate();
		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		
		requestCountDataMap.put(cal.getTime(), Double.valueOf(metric.getRequestCount()));
		requestBotCountDataMap.put(cal.getTime(), Double.valueOf(metric.getRequestBotCount()));
		rssAccessCountDataMap.put(cal.getTime(), Double.valueOf(metric.getRssAccessCount()));
		openAPICountDataMap.put(cal.getTime(), Double.valueOf(metric.getOpenAPICount()));
		authFailCountDataMap.put(cal.getTime(), Double.valueOf(metric.getAuthFailCount()));
		csrfCountDataMap.put(cal.getTime(), Double.valueOf(metric.getCsrfCount()));
		averageAccessTimeDataMap.put(cal.getTime(), Double.valueOf(metric.getAverageAccessTime()));
	  		  
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedBrowserMap, metric.getBrowserTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedBotMap, metric.getBotTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedOsMap, metric.getOsTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedZoneMap, metric.getZoneTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedIpMap, metric.getIpTop());
		AnalyticsManager.aggregateKeyIntegerMap(aggregatedReferrerMap, metric.getReferrerTop());
		AnalyticsManager.aggregateKeyContentTopMap(aggregatedSlowRequestMap,AnalyticsManager.getDeserializedContentTopMap(metric.getSlowRequestTop()));
	}
	SortedMap<String, Integer> topBrowserMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedBrowserMap, 10);
	SortedMap<String, Integer> topBotMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedBotMap, 10);
	SortedMap<String, Integer> topOsMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedOsMap, 10);
	SortedMap<String, Integer> topZoneMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedZoneMap, 10);
	SortedMap<String, Integer> topIpMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedIpMap, 10);
	SortedMap<String, Integer> topReferrerMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedReferrerMap, 10);
	SortedMap<String, ContentTopValue> topSlowRequestMap = AnalyticsManager.getSortedContentTopMap(aggregatedSlowRequestMap, 10);	
  
  double averageSummary = (int)Util.mean(averageAccessTimeDataMap.values());
  averageSummary = averageSummary / (double)1000;
  
  String topBrowser = null;
  int browserPercentSummary = 0;
  if (Util.notEmpty(topBrowserMap)) {
    topBrowser = topBrowserMap.firstKey();
    int browserTopCount = aggregatedBrowserMap.get(topBrowser);
    int browserSum = (int)Util.sum(aggregatedBrowserMap.values());
    browserPercentSummary = (100*browserTopCount) / browserSum;
  }
%>
  
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)Util.sum(requestCountDataMap.values()) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.TechnicalReportAgent.request-section") %></div>
	      </div>
      </div>  
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= averageSummary %> s</div>
	        <div class="indicator-text"><%=glp("ui.analytics.TechnicalReportAgent.average-section") %></div>
	      </div>         
      </div>  
      <% if (Util.notEmpty(topBrowser)) { %>
      <div class="col-md-4 col-xs-6 col-sm-6">
	      <div class="indicator">
	        <div class="indicator-value"><%= browserPercentSummary %>%</div>
	        <%
	        String summaryBrowserLabel = glp("ui.analytics.browser."+topBrowser);
          if (summaryBrowserLabel.startsWith("ui.")) {
            summaryBrowserLabel = topBrowser;
          }
	        %>
	        <div class="indicator-text"><%=summaryBrowserLabel %></div>
	      </div>   
      </div>  
      <% } %>
    </div>
  </div> 
  
	<div class="row">
		<% String suffix = "_request_technical_report";%>		
		<div class="col-md-6 report-element request-chart">		
			<h3><%= glp("ui.analytics.TechnicalReportAgent.request-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.request-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" selectableLegend="true" width="500px">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.requestCount") %>'
					valuesMap='<%=requestCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.requestBotCount") %>'
					valuesMap='<%=requestBotCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.rssAccessCount") %>'
					valuesMap='<%=rssAccessCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.openAPICount") %>'
					valuesMap='<%=openAPICountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.authFailCount") %>'
					valuesMap='<%=authFailCountDataMap %>'
				/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.csrfCount") %>'
					valuesMap='<%=csrfCountDataMap %>'
				/>
			</jalios:flotChart>
		</div>
		<% suffix = "_average_technical_report";%>		
		<div class="col-md-6 report-element average-chart">		
			<h3><%= glp("ui.analytics.TechnicalReportAgent.average-section") %></h3>	
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.average-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' externalLegend="true" width='500px'>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.TechnicalReportAgent.averageAccessTime") %>'
					valuesMap='<%=averageAccessTimeDataMap %>'
				/>
			</jalios:flotChart>
		</div>
	</div>
	<%
	if(Util.notEmpty(topBrowserMap) || Util.notEmpty(topOsMap)){%>
	<div class="row-fluid">		
		<%if(Util.notEmpty(topBrowserMap)){%>
			<%suffix = "_topBrowser_technical_report_visits"; %>
			<div  class="col-md-6 report-element topBrowser">
				<h3><%=glp("ui.analytics.TechnicalReportAgent.topBrowser-section") %></h3>
				<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topBrowser-section.help") %></p>
				<%
					Map<String, Double> topBrowserDataMap = new TreeMap<String, Double>();
			 		for(Entry<String, Integer> entry : topBrowserMap.entrySet()){
						String key = entry.getKey();
						String label = glp("ui.analytics.browser."+key);
            if (label.startsWith("ui.")) {
              label = key;
            }
						double value = 0;
						if(entry.getValue() != null){
						  value = entry.getValue().doubleValue();
						}
						if(topBrowserDataMap.containsKey(label)){
						  topBrowserDataMap.put(label, Double.valueOf(topBrowserDataMap.get(label).doubleValue() + value));
						}
						else{
						  topBrowserDataMap.put(label, Double.valueOf(value)); 
						}						
				 	}%>
				<jalios:flotPieChart name='<%=suffix%>' valuesMap='<%=topBrowserDataMap %>'>
					<jalios:flotChartOption>
				 	{
						series: {
							pie: { combine: {threshold: 0.02}}
						}
				    }
					</jalios:flotChartOption>
				</jalios:flotPieChart>
			</div>
		<%}
		if(Util.notEmpty(topOsMap)){ %>
		<%suffix = "_topOS_technical_report_visits"; %>
		<div  class="col-md-6 report-element topOS">
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topOS-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topOS-section.help") %></p>
			<%
				Map<String, Double> topOsDataMap = new TreeMap<String, Double>();
		 		for(Entry<String, Integer> entry : topOsMap.entrySet()){
					String key = entry.getKey();
					String label = glp("ui.analytics.os."+key);
			        if (label.startsWith("ui.")) {
			        	label = key;
			        }          
			        double value = 0;
					if(entry.getValue() != null){
					  value = entry.getValue().doubleValue();
					}
					if(topOsDataMap.containsKey(label)){
					  topOsDataMap.put(label, Double.valueOf(topOsDataMap.get(label).doubleValue() + value));
					}
					else{
					  topOsDataMap.put(label, Double.valueOf(value)); 
					}
				}%>
			<jalios:flotPieChart name='<%=suffix%>' valuesMap='<%=topOsDataMap %>'>
			</jalios:flotPieChart>
		</div>
		<%} %>				
	</div>
	<%} 
	if(Util.notEmpty(topZoneMap) || Util.notEmpty(topIpMap)){
	%>
	<div class="row-fluid">	
		<%
		if(Util.notEmpty(topZoneMap)){%>
			<%suffix = "_topZone_technical_report_visits"; %>
			<div  class="col-md-6 report-element topZone">
				<h3><%=glp("ui.analytics.TechnicalReportAgent.topZone-section") %></h3>
				<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topZone-section.help") %></p>				
				<%
					Map<String, Double> topZoneDataMap = new TreeMap<String, Double>();
			 		for(Entry<String, Integer> entry : topZoneMap.entrySet()){
						String key = entry.getKey();
						double value = 0;
						if(entry.getValue() != null){
						  value = entry.getValue().doubleValue();
						}
						if(topZoneDataMap.containsKey(key)){
						  topZoneDataMap.put(key, Double.valueOf(topZoneDataMap.get(key).doubleValue() + value));
						}
						else{
						  topZoneDataMap.put(key, Double.valueOf(value)); 
						}
					}%>
				<jalios:flotPieChart name='<%=suffix%>' valuesMap='<%=topZoneDataMap %>'>
				</jalios:flotPieChart>
			</div>	
		<%} 	 	
		Map<String, Double> topIpDataMap = new TreeMap<String, Double>();
		if(Util.notEmpty(topIpMap)){%>	
			<%suffix = "_topIp_technical_report_visits"; %>
			<div  class="col-md-6 report-element topIp">
				<h3><%=glp("ui.analytics.TechnicalReportAgent.topIp-section") %></h3>
				<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topIp-section.help") %></p>				
				<%
					for(Entry<String, Integer> entry : topIpMap.entrySet()){
						String key = entry.getKey();
						double value = 0;
						if(entry.getValue() != null){
						  value = entry.getValue().doubleValue();
						}
						if(topIpDataMap.containsKey(key)){
						  topIpDataMap.put(key, Double.valueOf(topIpDataMap.get(key).doubleValue() + value));
						}
						else{
						  topIpDataMap.put(key, Double.valueOf(value)); 
						}
					}%>
				<jalios:flotPieChart name='<%=suffix%>' valuesMap='<%=topIpDataMap %>'>
				</jalios:flotPieChart>
			</div>
		<%} %>
	</div>
	<%} %>
	<%if(Util.notEmpty(topBotMap)){ %>
	<div class="row-fluid">
		<%suffix = "_topBot_technical_report_visits"; %>
		<div  class="col-md-6 report-element topBot">
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topBot-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topBot-section.help") %></p>				
			<%
				Map<String, Double> topBotDataMap = new TreeMap<String, Double>();
		 		for(Entry<String, Integer> entry : topBotMap.entrySet()){
					String key = entry.getKey();
					double value = 0;
					if(entry.getValue() != null){
					  value = entry.getValue().doubleValue();
					}
					if(topBotDataMap.containsKey(key)){
					  topBotDataMap.put(key, Double.valueOf(topBotDataMap.get(key).doubleValue() + value));
					}
					else{
					  topBotDataMap.put(key, Double.valueOf(value)); 
					}
				}%>
			<jalios:flotPieChart name='<%=suffix%>' valuesMap='<%=topBotDataMap %>'>
			</jalios:flotPieChart>
		</div>
	</div>
	<%} %>
	<div class="row-fluid">
		<div class="col-md-6 report-element topZone">
			<%suffix = "_topReferrer_technical_report_visits"; %>
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topReferrer-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topReferrer-section.help") %></p>
			<table style="overflow:auto;" class="table-data">
        <thead>
  				<tr>
            <th class="fit"></th>
  					<th class="spacer"><%=glp("ui.analytics.TechnicalReportAgent.topReferrer.name") %></th>
  					<th class="text-overflow fit"><%= glp("ui.analytics.TechnicalReportAgent.topReferrer.number") %></th>
  				</tr>
        </thead>
				<tbody>
          <% if (Util.isEmpty(topReferrerMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topReferrerMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
					<% String key = entry.getKey(); %>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td>
							<div class="key"  style="max-width:400px;" title="<%=encodeForHTMLAttribute(key) %>" >
								<%=encodeForHTML(key) %>
							</div>
						</td>
						<td class="text-overflow text-right"><%=entry.getValue() %></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>
		<div class="col-md-6 report-element topSlowRequest">
		<%suffix = "_topSlowRequest_technical_report_visits"; %>
			<h3><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th></th>
						<th class="spacer"><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest.name") %></th>
						<th class="fit text-overflow"><%=glp("ui.analytics.TechnicalReportAgent.topSlowRequest.portal") %></th>
						<th class="fit text-overflow"><%= glp("ui.analytics.TechnicalReportAgent.topSlowRequest.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topSlowRequestMap)) { %>
          <tr>
            <td class="spacer" colspan="4"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topSlowRequestMap.entrySet() %>" name="entry" type="Map.Entry<String, ContentTopValue>">
					<%
					    Double value = new Double(0);
						String key = entry.getKey();
						String title = "";
						if(entry.getValue() != null){
					    	ContentTopValue topValue  = entry.getValue();
					    	title = topValue.getTitle();
						  	value = Double.valueOf(topValue.getRequestCount());
						}				  	
					%>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="key"  title="<%=encodeForHTMLAttribute(key) %>">							
							<%=encodeForHTML(key) %>
						</td>
						<td class="text-overflow">
							<%=encodeForHTML(title == null ?"":title) %>
						</td>
						<td class="text-overflow text-right"><%=value.intValue() %></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>	
	</div>
	<div class="row-fluid">
		<jalios:include target="JCMS_ANALYTICS_TECHNICAL_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>