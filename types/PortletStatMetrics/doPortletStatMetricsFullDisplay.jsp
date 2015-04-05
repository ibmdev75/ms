<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% generated.AbstractPortletStat box = (generated.AbstractPortletStat) portlet;  %><%
%><H1>&nbsp;<%= glp(box.getDisplayTitle(userLang)) %></H1>

<%@ include file='../AbstractPortletStat/initStatParams.jspf' %>

<jalios:if predicate='<%= getBooleanParameter("debug",false) %>'>
----------------------------------------------- DEBUG -----------------------------------------------<br />
<ul>
  <li> Handle:  <%= listener.handleTime %> / <%= listener.handleCount %> = <%= listener.handleTime / listener.handleCount %> ms </li>
  <li> Nano Process:  <%= listener.getNanoDuration()%> ms</li>
  <li> Zone: <%= zone %> </li>
</ul>
----------------------------------------------- DEBUG -----------------------------------------------<br />
</jalios:if>

<span class='stat'>	
	<div class='text'>
	  <jalios:if predicate='<%= Util.notEmpty(box.getDescription(userLang)) %>'><%= glp(box.getDescription(userLang)) %></jalios:if>
	</div>
  <hr width='100%' size='1' noshade="noshade"/>
  <% if (wsMap == null) { %>
  <div class='text'><%= glp("ui.statreport.lbl.portlet.noresult") %></div>
  <% } else { %>
	<% PortletStatMetrics plm = (PortletStatMetrics) box; %>
	<jalios:select>
		<jalios:if predicate='<%= Util.isEmpty(listener.getDisplay()) %>'>
			<%@ include file='../AbstractPortletStat/displayAverage.jspf' %>
			<%@ include file='../AbstractPortletStat/displayTopChart.jspf' %>
	  	<%@ include file='../AbstractPortletStat/displayDateTimeChart.jspf' %>
		</jalios:if>
		<jalios:default>
		  <% String jspFullDisplay = "/types/PortletStatMetrics/"+listener.getDisplay(); %>
		  <jsp:include page='<%= jspFullDisplay %>' flush='true' />
		</jalios:default>
	</jalios:select>
   <div class='text' align='right'>
    <%= glp("ui.stateditor.lbl.portlet.areaflt") %> : <%= glp("ui.statreport.lbl.area." + Util.getString(plm.getFilteredArea(), "All")) %> -
    <%= glp("ui.stateditor.lbl.portlet.dispflt") %> : <%= glp(plm.getRegExpFilter() ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled" ) %>
  </div>
 <% } %>
</span>
