<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>

<% generated.AbstractPortletStat box = (generated.AbstractPortletStat) portlet;  %>
<% PortletStatMetrics plm = (PortletStatMetrics) box; %>
<%@ include file='../AbstractPortletStat/initStatParams.jspf' %>

<%
  ObjectIntTreeMap rvMap       = (ObjectIntTreeMap)wsMap.get("visitorDay");
	ObjectIntTreeMap visitorMap  = (ObjectIntTreeMap)wsMap.get("Entry");
	
  if (rvMap == null){
  	return;
  }
%>

<%@ include file='../AbstractPortletStat/displayAverage.jspf' %>

<H2><%= glp("ui.statreport.lbl.visitor.title") %></H2>
<div align='center'>
<table class='layout border'>
  <tr class='head'>
    <td class='label' width='100%' nowrap><%= glp("ui.statreport.lbl.visitor.scope") %></td>
    <td class='label' nowrap>&nbsp;&nbsp; <%= glp("ui.statreport.lbl.visitor.avg") %>&nbsp;&nbsp;</td>
    <td class='label' nowrap>&nbsp;&nbsp; <%= glp("ui.statreport.lbl.visitor.max") %>&nbsp;&nbsp;</td>
    <td class='label' nowrap>&nbsp;&nbsp; <%= glp("ui.statreport.lbl.visitor.min") %>&nbsp;&nbsp;</td>
    <td class='label' nowrap>&nbsp;&nbsp; <%= glp("ui.statreport.lbl.visitor.total") %>&nbsp;&nbsp;</td>
    <td class='label' nowrap>&nbsp;&nbsp;<span title="<%= glp("ui.statreport.lbl.visitor.total-single") %>"><%= glp("ui.statreport.lbl.visitor.single") %></span>&nbsp;&nbsp;</td>
  </tr>
  <tr class='odd'>
    <td class='label' nowrap><%= glp("ui.statreport.lbl.visitor.lbl4") %></td>
    <td class='text' align='right'><%= rvMap.getAverage(2) %></td>
    <td class='text' align='right'><%= rvMap.getMax(2)     %></td>
    <td class='text' align='right'><%= rvMap.getMin(2)     %></td>
    <td class='text' align='right'><%= rvMap.getSum()      %></td>
    <td class='text' align='right'>&nbsp;</td>
  </tr>
  <tr class='even'>
    <td class='label' nowrap><%= glp("ui.statreport.lbl.visitor.lbl5") %></td>
    <td class='text' align='right'><%= rvMap.getAverage(1) %></td>
    <td class='text' align='right'><%= rvMap.getMax(1)     %></td>
    <td class='text' align='right'><%= rvMap.getMin(1)     %></td>
    <td class='text' align='right'><%= rvMap.getSum()      %></td>
    <td class='text' align='right'>&nbsp;</td>
  </tr>
  <tr class='odd'>
    <td class='label' nowrap><%= glp("ui.statreport.lbl.visitor.lbl6") %></td>
    <td class='text' align='right'><%= rvMap.getAverage(0) %></td>
    <td class='text' align='right'><%= rvMap.getMax(0)     %></td>
    <td class='text' align='right'><%= rvMap.getMin(0)     %></td>
    <td class='text' align='right'><%= rvMap.getSum()      %></td>
    <td class='text' align='right'>&nbsp;</td>
  </tr>
  <tr class='even'>
    <td class='label' nowrap><%= glp("ui.statreport.lbl.visitor.lbl3") %></td>
    <td class='text' align='right'><%= rvMap.getAverageCount(1) %></td>
    <td class='text' align='right'><%= rvMap.getMaxCount(1)     %></td>
    <td class='text' align='right'><%= rvMap.getMinCount(1)     %></td>
    <td class='text' align='right'><%= rvMap.getCount(2) %></td>
    <td class='text' align='right'>&nbsp;</td>
  </tr>
  <tr class='odd'>
    <td class='label' nowrap><%= glp("ui.statreport.lbl.visitor.lbl7") %></td>
    <td class='text' align='right'><%= rvMap.getAverageCount(0,1) %></td>
    <td class='text' align='right'><%= rvMap.getMaxCount(0,1)     %></td>
    <td class='text' align='right'><%= rvMap.getMinCount(0,1)     %></td>
    <td class='text' align='right'><%= rvMap.getCount(2)        %></td>
    <td class='text' align='right'>&nbsp;</td>
  </tr>
  <tr class='even'>
    <td class='label' nowrap><%= glp("ui.statreport.lbl.visitor.lbl2") %></td>
    <td class='text' align='right'><%= rvMap.getAverageCount() %></td>
    <td class='text' align='right'><%= rvMap.getMaxCount()     %></td>
    <td class='text' align='right'><%= rvMap.getMinCount()     %></td>
    <td class='text' align='right'><%= rvMap.getCount(1)       %></td>
    <td class='text' align='right'><%= rvMap.getCount(1,-1,1)  %></td>
  </tr>
</table>
</div>
<br />
<hr width='100%' size='1' noshade="noshade"/>

<%@ include file='../AbstractPortletStat/displayDateTimeChart.jspf' %>

<div class='label'><%= glp("ui.statreport.desc.ip") %></div>
<br />
<%@ include file='../AbstractPortletStat/displayTopChart.jspf' %>
