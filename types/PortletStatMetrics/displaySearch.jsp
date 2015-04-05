<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>

<% generated.AbstractPortletStat box = (generated.AbstractPortletStat) portlet;  %>
<%@ include file='../AbstractPortletStat/initStatParams.jspf' %>

<% PortletStatMetrics plm    = (PortletStatMetrics) box; %>
<% ObjectIntTreeMap  wordsMap = (ObjectIntTreeMap)wsMap.get("Search_FullText");	%>

<jalios:if predicate='<%= wordsMap != null %>'>
<jalios:chart dataMap='<%= wordsMap %>' 
              display='<%= "hchart" %>' 
              isPercent='<%= false %>' 
              sort='<%= "greater" %>' 
              max='<%= plm.getTopTen() %>' 
              fixHLengthWidth='<%= 15 %>' 
              colorFirst='<%= 0 %>'
				      colorRotate='<%= 2 %>'
				      locale='<%= userLocale %>'
 			        unit='<%= glp("ui.statreport.lbl.hits") %>'
              />
<br/><span style="font: bold 11px Arial, Helvetica, Sans-Serif; color: #880000;"><%= glp("ui.statreport.lbl.totalactivity",wordsMap.getSum()) %></span>
</jalios:if>

<hr width='100%' size='1' noshade="noshade"/>
<div class='text'><%= glp("ui.statreport.desc.searchcat") %></div><br/>
<% ObjectIntTreeMap  catMap = (ObjectIntTreeMap)wsMap.get("Search_Category");	%>
<jalios:if predicate='<%= catMap != null %>'>
	<jalios:chart dataMap='<%= catMap %>' 
	              display='<%= "hchart" %>' 
	              isPercent='<%= false %>' 
	              sort='<%= "greater" %>' 
	              max='<%= plm.getTopTen() %>' 
	              fixHLengthWidth='<%= 15 %>' 
	              colorFirst='<%= 0 %>'
				        colorRotate='<%= 2 %>'
				        locale='<%= userLocale %>'
 			                unit='<%= glp("ui.statreport.lbl.hits") %>'
				        beautifier='<%= new com.jalios.jtaglib.ChartTagBeautifier(new BeautifierData(StatListener.TRUNCATE)) %>'
	              />
<br/><span style="font: bold 11px Arial, Helvetica, Sans-Serif; color: #880000;"><%= glp("ui.statreport.lbl.totalactivity",catMap.getSum()) %></span>
</jalios:if>

<hr width='100%' size='1' noshade="noshade"/>
<div class='text'><%= glp("ui.statreport.desc.searchtype") %></div><br/>
<% ObjectIntTreeMap  typesMap = (ObjectIntTreeMap)wsMap.get("Search_Types");	%>
<jalios:if predicate='<%= typesMap != null %>'>
	<jalios:chart dataMap='<%= typesMap %>' 
	              display='<%= "hchart" %>' 
	              isPercent='<%= false %>' 
	              sort='<%= "greater" %>' 
	              max='<%= plm.getTopTen() %>' 
	              fixHLengthWidth='<%= 15 %>' 
	              colorFirst='<%= 0 %>'
		            colorRotate='<%= 2 %>'
		            locale='<%= userLocale %>'
 			    unit='<%= glp("ui.statreport.lbl.hits") %>'
		            />
</jalios:if>
<br/><span style="font: bold 11px Arial, Helvetica, Sans-Serif; color: #880000;"><%= glp("ui.statreport.lbl.totalactivity",typesMap.getSum()) %></span>
<hr width='100%' size='1' noshade="noshade"/>