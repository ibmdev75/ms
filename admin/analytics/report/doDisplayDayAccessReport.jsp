<%@page import="java.util.Map.Entry"%>
<%@page import="com.jalios.jcms.analytics.agent.*"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.analytics.metric.*"%><%
%><%@page import="com.jalios.jcms.analytics.ui.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><div class="chart-result" style="overflow:hidden;"><%
ReportHandler formHandler = (ReportHandler) request.getAttribute("ui.analytics.current-report-handler");
String suffix = "_day_access_agent_visits";
Date endDate = formHandler.getAvailableEndDate();
endDate = DateUtil.getDayEndDate(endDate, userLocale);
Date beginDate = formHandler.getAvailableBeginDate();
String wkId = formHandler.getAnalyticsWS();
Workspace wk = channel.getData(Workspace.class, wkId);
Set<AbstractReportMetric> metricSet = AbstractStatisticAgent.getMetricObjectSet(wk,beginDate,endDate, null, AccessReportMetric.class);
AnalyticsManager.removeToDayMetric(metricSet);
if(Util.isEmpty(metricSet)){
  %><%=glp("ui.analytics.report.no-result")%><%
}
else{
	HashMap<Date, Double> visitDataMap = new HashMap<Date, Double>();
	HashMap<Date, Double> printDataMap = new HashMap<Date, Double>();
	HashMap<Date, Double> downloadDataMap = new HashMap<Date, Double>();
	HashMap<Date, Double> visitorDataMap = new HashMap<Date, Double>();
	HashMap<Date, Double> loggedVisitorDataMap = new HashMap<Date, Double>();

	Map<String, Integer> aggregatedMemberMap = new HashMap();
  Map<String, Integer> aggregatedCategoryMap = new HashMap();
	Map<String, Integer> aggregatedAnonymousUriMap = new HashMap();
	Map<String, Integer> aggregatedWorkspaceMap = new HashMap();
	Map<String, ContentTopValue> aggregatedContentMap = new HashMap();
	
	//fill with empty report in period if report are missing
	AnalyticsManager.completeMetricObjectSet(metricSet, beginDate, endDate, userLocale, AccessReportMetric.class);
	Set<AbstractReportMetric> uridMetricSet = new TreeSet<AbstractReportMetric>(new AbstractStatisticAgent.AbstractReportMetricComparator());
	uridMetricSet.addAll(metricSet);
	metricSet = AnalyticsManager.aggregateAllUrid(metricSet,AccessReportMetric.class);
	
	Iterator<AbstractReportMetric> metricIt = metricSet.iterator();
	while(metricIt.hasNext()){
	  AccessReportMetric metric = (AccessReportMetric) metricIt.next();
	  Date reportStartDate =  metric.getStartDate();
	  Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);

	  visitDataMap.put(cal.getTime(), Double.valueOf(metric.getVisitCount()));
	  downloadDataMap.put(cal.getTime(), Double.valueOf(metric.getDownloadCount()));
	  printDataMap.put(cal.getTime(), Double.valueOf(metric.getPrintViewCount()));
	
	  visitorDataMap.put(cal.getTime(), Double.valueOf(metric.getVisitorCount()));
	  loggedVisitorDataMap.put(cal.getTime(), Double.valueOf(metric.getLoggedVisitorCount()));
		  
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedMemberMap, metric.getMemberTop());
    AnalyticsManager.aggregateKeyIntegerMap(aggregatedCategoryMap, metric.getPortalCategoryTop());
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedWorkspaceMap, metric.getWorkspaceTop());	  
	  AnalyticsManager.aggregateKeyIntegerMap(aggregatedAnonymousUriMap, metric.getAnonymousPageTop());
	  AnalyticsManager.aggregateKeyContentTopMap(aggregatedContentMap,AnalyticsManager.getDeserializedContentTopMap(metric.getContentTop()));
	}
	SortedMap<String, Integer> topMbrMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedMemberMap, 10);
  SortedMap<String, Integer> topCatMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedCategoryMap, 10);
	SortedMap<String, Integer> topWkMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedWorkspaceMap, 10);
	SortedMap<String, Integer> topAnonymousUriMap = AnalyticsManager.getInstance().getSortedTopMap(aggregatedAnonymousUriMap, 10);
	SortedMap<String, ContentTopValue> topContentMap = AnalyticsManager.getSortedContentTopMap(aggregatedContentMap, 10);
%>
  <div class="summary-wrapper row">  
    <div class="summary col-md-10 col-md-offset-1 row">
      <div class="col-md-4 col-xs-6 col-sm-4">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)Util.sum(visitDataMap.values()) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.DayAccessAgent.visit-section") %></div>
	      </div>
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
	      <div class="indicator">
	      <%
	      double meanVisitor = Util.mean(visitorDataMap.values());
	      %>
	        <div class="indicator-value"><%= Double.toString(Math.round(meanVisitor*100)/100d) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.DayAccessAgent.visitor-key-indicator") %></div>
	      </div>       
      </div>
      <div class="col-md-4 col-xs-6 col-sm-4">
	      <div class="indicator">
	        <div class="indicator-value"><%= (int)Util.sum(downloadDataMap.values()) %></div>
	        <div class="indicator-text"><%=glp("ui.analytics.DayAccessAgent.download-section") %></div>
	      </div>   
      </div>
    </div>
  </div>
  
  
	<div class="row">
		<div class="col-md-6 report-element visits-chart">
			<h3><%=glp("ui.analytics.DayAccessAgent.visit-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.visit-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' width="500px;"
				externalLegend="true" selectableLegend="true">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.DayAccessAgent.visitCount") %>'
					valuesMap='<%=visitDataMap %>'
					/> 
			</jalios:flotChart>
		</div>		
		<%suffix = "_day_access_agent_down"; %>
		<div class="col-md-6 report-element download-chart">
			<h3><%=glp("ui.analytics.DayAccessAgent.download-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.download-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>' width="500px;"
				externalLegend="true" selectableLegend="true">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.DayAccessAgent.downloadCount") %>'
					valuesMap='<%=downloadDataMap %>'
					/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.DayAccessAgent.printViewCount") %>'
					valuesMap='<%=printDataMap %>'
					/>
			</jalios:flotChart>
		</div>
	</div>
	<div class="row-fluid">
		<%suffix = "_day_access_agent_mbr"; %>
		<div class="col-md-6 report-element members-chart">
			<h3><%=glp("ui.analytics.DayAccessAgent.visitor-section") %></h3>			
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.visitor-section.help") %></p>
			<jalios:flotChart name='<%=suffix%>'  width="500px;"
				externalLegend="true" selectableLegend="true">
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.DayAccessAgent.visitorCount") %>'
					valuesMap='<%=visitorDataMap %>'
					/>
				<jalios:flotChartData 
					label='<%=glp("ui.analytics.DayAccessAgent.loggedVisitorCount") %>'
					valuesMap='<%=loggedVisitorDataMap %>'
					/>
			</jalios:flotChart> 
		</div>
		<%
	  		HashMap<String, Double> uridDataMap = new HashMap<String, Double>();
			Iterator<AbstractReportMetric> uridMetricIt = uridMetricSet.iterator();
			while(uridMetricIt.hasNext()){
		  		AccessReportMetric metric = (AccessReportMetric) uridMetricIt.next();
		  		String urid = metric.getUrid();
		  		if(Util.isEmpty(urid)){
		  		  continue;
		  		}
		  		Date reportStartDate =  metric.getStartDate();
		  		Calendar cal = AnalyticsManager.getUtcTime(reportStartDate, userLocale);
		  		Double value = uridDataMap.get(urid);
		  		if(value == null){
		  		  value = new Double(metric.getVisitCount());
		  		}
		  		else{
		  		  value = new Double(value.doubleValue() + metric.getVisitCount());
		  		}
		  		uridDataMap.put(urid, value);
			}
			if(uridDataMap.size() > 1){
			%><div class="col-md-6 report-element urid-chart"><%
			%><%suffix = "_day_access_agent_urid"; %>
			<h3><%=glp("ui.analytics.DayAccessAgent.urid-section") %></h3>			
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.urid-section.help") %></p>
			<jalios:flotPieChart name='<%=suffix%>' 
				valuesMap='<%=uridDataMap %>'>
				<jalios:flotChartOption>
			 	{
					series: {
						pie: { combine: {threshold: 0.02}}
					}
			    }
				</jalios:flotChartOption>
			</jalios:flotPieChart>
			</div>
			<%} %>
		<%suffix = "_day_access_agent_topWorkspace"; %>
		<% if(wk == null){ %>
		<div class="col-md-6 report-element topWorkspace">
			<h3><%=glp("ui.analytics.DayAccessAgent.topWorkspace-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.topWorkspace-section.help") %></p>
			<%
				Map<String, Double> topWkDataMap = new TreeMap<String, Double>();
				if(Util.notEmpty(topWkMap)){
			 		for(Entry<String, Integer> entry : topWkMap.entrySet()){
						String key = entry.getKey();
						Workspace tmpWk = channel.getWorkspace(key);
						Double value = new Double(0);
						if(entry.getValue() != null){
						  value = Double.valueOf(entry.getValue().doubleValue());
						}
						topWkDataMap.put(tmpWk == null ? key : tmpWk.getTitle(userLang), value);
					}
			 	}%>
			<jalios:flotPieChart name='<%=suffix%>' 
				valuesMap='<%=topWkDataMap %>'>
				<jalios:flotChartOption>
			 	{
					series: {
						pie: { combine: {threshold: 0.02}}
					}
			    }
				</jalios:flotChartOption>
			</jalios:flotPieChart>
		</div>			
		<%}%>
	</div>
  
  
	<div class="row-fluid">		
	<%suffix = "_day_access_agent_mbrTop"; %>
		<div class="col-md-6 report-element memberTop">
			<h3><%=glp("ui.analytics.DayAccessAgent.memberTop-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.memberTop-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th class="fit"></th>
						<th class="spacer text-overflow"><%=glp("ui.analytics.DayAccessAgent.memberTop.member") %></th>
						<th class="fit spacer text-overflow"><%= glp("ui.analytics.DayAccessAgent.memberTop.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topMbrMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topMbrMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
 					<%
					    String key = entry.getKey();
			  		  	//check the associated member if any
			  		  	Member mbr = channel.getMember(key);
			  		  	boolean isRealMember = false;
			  		  	if(mbr == null || Util.isEmpty(mbr.getFullName())){
			 	  		    key = "unknown user - "+key;
			 	  		}
			 	  		else{
			 	  		   key = mbr.getFullName();
			 	  		  isRealMember= true;
			 	  		}
					%>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="spacer">
						<%if(isRealMember){ %>
	      				    <jalios:memberphoto member="<%= mbr %>" size="<%= PhotoSize.ICON %>"/>
	          				<jalios:link data="<%=mbr%>"/><%
						} else { 
							%><%=key %><%
						}%></td>
						<td class="text-right"><%=entry.getValue() %></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>
		<%suffix = "_day_access_agent_contentTop"; %>
		<div class="col-md-6 report-element contentTop">
			<h3><%=glp("ui.analytics.DayAccessAgent.contentTop-section") %></h3>
			<p class="help-block"><%=glp("ui.analytics.DayAccessAgent.contentTop-section.help") %></p>
			<table class="table-data">
				<thead>
					<tr>
            <th></th>
						<th class="spacer text-overflow"><%=glp("ui.analytics.DayAccessAgent.contentTop.name") %></th>
						<th class="text-overflow"><%= glp("ui.analytics.DayAccessAgent.contentTop.number") %></th>
					</tr>
				</thead>
				<tbody>
          <% if (Util.isEmpty(topContentMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topContentMap.entrySet() %>" name="entry" type="Map.Entry<String, ContentTopValue>">
					<%
					    String pubId = entry.getKey();
					    ContentTopValue topValue  = entry.getValue();
					    Publication pub = channel.getData(Publication.class, pubId);
					    String title = pub == null ? topValue.getTitle() : pub.getTitle(userLang);
					    int nbr = topValue.getRequestCount();
					%>
					<tr>
            <td class="text-right"><%= itCounter %></td>
						<td class="spacer"><%
						if(pub == null) {
						  %><%=title %><%
						}else{
						  %><jalios:dataicon data="<%= pub %>" /> <%
						  %><jalios:link data="<%=pub%>"/><%
						}
						%></td>
						<td class="text-right"><%=nbr%></td>
					</tr>
          </jalios:foreach>
					<% } %>
				</tbody>
			</table>
		</div>		
	</div>
	
  
  <div class="row-fluid">   
  <%suffix = "_day_access_agent_catTop"; %>
    <div class="col-md-6 report-element categoryTop">
      <h3><%=glp("ui.analytics.DayAccessAgent.categoryTop-section") %></h3>
      <p class="help-block"><%=glp("ui.analytics.DayAccessAgent.categoryTop-section.help") %></p>
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit"></th>
            <th class="spacer text-overflow"><%=glp("ui.analytics.DayAccessAgent.categoryTop.category") %></th>
            <th class="fit spacer text-overflow"><%= glp("ui.analytics.DayAccessAgent.categoryTop.number") %></th>
          </tr>
        </thead>
        <tbody>
          <% if (Util.isEmpty(topCatMap)) { %>
          <tr>
            <td class="spacer" colspan="3"><%=glp("ui.analytics.report.no-result") %></td>
          </tr>
          <% } else { %>
          <jalios:foreach collection="<%= topCatMap.entrySet() %>" name="entry" type="Map.Entry<String, Integer>">
          <%
              String key = entry.getKey();
              //check the associated member if any
              Category cat = channel.getCategory(key);
              boolean isRealCat = true;
              if(cat == null || Util.isEmpty(cat.getName(userLang))){
                 key = "unknown category - "+key;
                 isRealCat = false;
              }
          %>
          <tr>
            <td class="text-right"><%= itCounter %></td>
            <td class="spacer">
            <%if(isRealCat){ %>
                    <jalios:link data="<%=cat%>"/><%
            } else { 
              %><%=key %><%
            }%></td>
            <td class="text-right"><%=entry.getValue() %></td>
          </tr>
          </jalios:foreach>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>
	<div class="row-fluid">
		<jalios:include target="JCMS_ANALYTICS_DAY_ACCESS_REPORT" targetContext="DIV"/>
	</div>
<%}%>
</div>