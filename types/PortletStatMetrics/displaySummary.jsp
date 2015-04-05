<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>

<% generated.AbstractPortletStat box = (generated.AbstractPortletStat) portlet;  %>
<%@ include file='../AbstractPortletStat/initStatParams.jspf' %>
<% 
custom.stat.SummaryListener sl = (custom.stat.SummaryListener) listener;
long[] datas = (long[]) wsMap.get("Entry"); 
int counter = 0;
Date startDate = new Date(datas[1]);
Date endDate = new Date(datas[2]);

String periodStart = DateFormat.getDateInstance(DateFormat.LONG, userLocale).format(startDate) + " " + DateFormat.getTimeInstance(DateFormat.LONG, userLocale).format(startDate);
String periodEnd = DateFormat.getDateInstance(DateFormat.LONG, userLocale).format(endDate) + " " + DateFormat.getTimeInstance(DateFormat.LONG, userLocale).format(endDate);
String periodDuration = DateUtil.formatDuration(startDate, endDate, userLocale);
%>
<jalios:if predicate='<%= datas != null %>'>
  <br />
  <div align='center'>
	<table class='layout border'>
	  <tr class='<%= counter++ % 2 == 0 ? "odd" : "even" %>'>
	    <td class='label'><%= glp("ui.statreport.lbl.summary.scope") %></td>
	    <td class='text'><%= all ? "All Workspace" : workspace.getTitle(userLang) %></td>
	  </tr>
	  <tr class='<%= counter++ % 2 == 0 ? "odd" : "even" %>'>
	    <td class='label'><%= glp("ui.statreport.lbl.summary.period") %></td>
	    <td class='text'><%= glp("ui.statreport.lbl.summary.period2", periodStart, periodEnd, periodDuration) %></td>
	  </tr>
	  <tr class='<%= counter++ % 2 == 0 ? "odd" : "even" %>'>
	    <td class='label'><%= glp("ui.statreport.lbl.summary.line") %></td>
	    <td class='text'><%= datas[0] %> / <%= sl.lineCount %> <jalios:icon src='help'  title='<%= glp("ui.statreport.lbl.summary.line.h") %>' /></td>
	  </tr>
	  <tr class='<%= counter++ % 2 == 0 ? "odd" : "even" %>'>
	    <td class='label'><%= glp("ui.statreport.lbl.summary.sess") %></td>
	    <td class='text'><jalios:duration time='<%= sl.session.averageSessionDuration %>' /></td>
	  </tr>
	  <tr class='<%= counter++ % 2 == 0 ? "odd" : "even" %>'>
	    <td class='label'><%= glp("ui.statreport.lbl.summary.req") %></td>
	    <td class='text'><jalios:duration time='<%= sl.request.averageRequestProcess %>' /></td>
	  </tr>
	  <tr class='<%= counter++ % 2 == 0 ? "odd" : "even" %>'>
	    <td class='label'><%= glp("ui.statreport.lbl.summary.durat") %></td>
	    <td class='text'><jalios:duration time='<%= datas[4] - datas[3] %>' /></td>
	  </tr>
	</table>
	</div>
	<br />
</jalios:if>

<jalios:if predicate='<%= all %>'>
	<%
	  ObjectIntTreeMap wsLineCountMap = new ObjectIntTreeMap();
	  for (Iterator it = listener.getWorkspaceMap().entrySet().iterator(); it.hasNext() ;){
	  	Map.Entry itEntry = (Map.Entry) it.next();
	  	String  itKey = itEntry.getKey().toString();
	  	Map     itMap = (Map)itEntry.getValue();
	  	long    itVal = ((long[])itMap.get("Entry"))[0];
	  	
	  	if (itKey.equals("ALL_WORKSPACE")){
	  	  itKey = glp("ui.statreport.lbl.allworkspace");
	  	}
	  	wsLineCountMap.inc(itKey,(int)itVal);
	  }
	%>
  <H2><%= glp("ui.statreport.lbl.summary.graph") %></H2>
	<jalios:chart dataMap='<%= wsLineCountMap %>' 
			          display='<%= "hchart" %>' 
			          isPercent='<%= false %>' 
			          sort='<%= "greater" %>' 
			          colorFirst='<%= 0 %>'
		            colorRotate='<%= 2 %>'
		            locale='<%= userLocale %>'
			          />
</jalios:if>
