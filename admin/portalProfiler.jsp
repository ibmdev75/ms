<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.tools.*" %><%

  if (!checkAccess("admin/dev/portal-profiler")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.tools.ProfilerHandler"><%
 %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

  request.setAttribute("title", glp("ui.profiler.title"));  
  request.setAttribute("profilerSubAdminMenu", "true");  

%>
<%@ include file="/admin/doAdminHeader.jspf" %>
<h1 class="boTitle icon iconGauge"><% /* %>Profiler<% */ %><%= glp("ui.profiler.title") %></h1>
<%@ include file='/jcore/doMessageBox.jspf' %>
<style>
 TABLE.siteOptions { margin-left: 10px; }
 TABLE.siteOptions TH,
 TABLE.siteOptions TD { text-align: left; font-weight: normal; padding: 0 4px; }
 TABLE.siteOptions TR.ok TD.currentState { color: #228822; }
 TABLE.siteOptions TR.warning TD.currentState { color: #FF0000; }
  DIV.Cache   { width: 10px; height: 10px; margin:5px; border: 1px solid gray; cursor: default; }
  DIV.Cache1  { background-color: #EEEEEE; }
  DIV.Cache2  { background-color: #CCCCFF; }
  DIV.Cache3  { background-color: #FFBEBE; }
  DIV.Cache4  { background-color: #FFEBC6; }
  DIV.Cache5  { background-color: #D2FFD2; }
  DIV.Cache6  { background-color: #EDBAFF; }
  DIV.Cache7  { background-color: #F7FEA0; }
</style>

<jalios:message msg="ui.profiler.how-to" dismissable="true" />

<fieldset>
<legend class='formLabel'><%= glp("ui.profiler.prof.create.intro") %></legend>
 <form name='createProfilerForm' action='<%= contextPath %>/admin/portalProfiler.jsp' method='post' class="form-inline">
  <input type='hidden' name='action' value='true' />
  <input type='text' class="form-control" name='name' value='<%= formHandler.getName() %>' />
  <button type='button' name='create' onclick='simpleSubmitForm(window, createProfilerForm, "opCreate")' class='btn <%= Util.isEmpty(Profiler.getAllProfilers()) ?"btn-primary" : "btn-default" %>'>
    <%= glp("ui.profiler.prof.create") %>
  </button>
 </form>
</fieldset>
<br />
<%
  int profilerIdx = 1;
  int displayedResultNbr = 0;
  Collection profilers = Profiler.getAllProfilers();
	for (Iterator itProfiler = profilers.iterator(); itProfiler.hasNext(); profilerIdx++) {
	  Profiler curProfiler = (Profiler) itProfiler.next();
    String formName = "profiler" + profilerIdx + "Form";
%>
<form name='<%= formName %>' action='<%= contextPath %>/admin/portalProfiler.jsp'  method='post'>
  <fieldset>
  <legend class='formLabel'><%= curProfiler.getName() %></legend>
  <input type='hidden' name='action' value='true' />
  <input type='hidden' name='name' value='<%= curProfiler.getName() %>' />
  <% if (curProfiler.isProfiling()) { %>
    <%= glp("ui.profiler.param-infos", curProfiler.getName(),
            JcmsUtil.getDisplayUrl(PortalManager.getHomeCategory(), userLocale, "profilerName="+curProfiler.getName(), true),
            JcmsUtil.getDisplayUrl(PortalManager.getHomeCategory(), userLocale, "profilerName="+curProfiler.getName()+"&amp;profilerShowGUI=true", true)) %>
    <button type='button' name='end' onclick='simpleSubmitForm(window, <%= formName %>, "opEndProfiling")' class='btn btn-primary'><%= glp("ui.profiler.prof.end") %></button>
  <% } else {%>
    <button type='button' name='start' onclick='simpleSubmitForm(window, <%= formName %>, "opStartProfiling")' class='btn btn-primary'><%= glp("ui.profiler.prof.start") %></button>
  <% }%>
  <button type='button' name='delete' onclick='simpleSubmitForm(window, <%= formName %>, "opDelete")' class='btn btn-default'><%= glp("ui.profiler.prof.delete") %></button>

  <br />

  <% if (!curProfiler.isProfiling() && curProfiler.getAverageConsumedMemory() != -1) { %>
    <%
      displayedResultNbr++;
      long profiledRequestNbr = curProfiler.getProfiledRequestNumber();
      Date startDate = curProfiler.getStartDate();
      Date endDate = curProfiler.getEndDate();
    %>

  <h2 class='boTitle'><%= glp("ui.profiler.results.request-nbr", profiledRequestNbr)%> (<jalios:time date="<%= startDate %>"/> - <jalios:time date="<%= endDate %>"/>)</h2>

  <style type="text/css"> .exceedThreshold { color: red; font-weight: bold; } </style>  
  <table id='profilerTable' class='table-data'>
    <tr>
      <th colspan="2"></th>
      <th><%= glp("ui.com.lbl.type") %></th>
      <th><%= glp("ui.com.core-type.lbl.PortalElement") %></th>
      <th></th>
	    <th colspan="2" width='150'><jalios:icon src='timer'  /> <%= glp("ui.profiler.results.time") %></th>
	    <th colspan="2" width='150'><jalios:icon src='memory'  /> <%= glp("ui.profiler.results.memory") %></th>
      <th colspan="2" width='150'><jalios:icon src='txt'  /> <%= glp("ui.profiler.results.outsize") %></th>
	   </tr>
  <%
    int measureIdx = 1;
		TreeMap averageMeasuresMap = curProfiler.getSortedAverageMeasuresMap();
    long[] percent = new long[3];
    boolean memoryMeasuresInvalid = false;
		for (Iterator itEntry = averageMeasuresMap.entrySet().iterator(); itEntry.hasNext(); measureIdx++) {
		  Map.Entry entry = (Map.Entry) itEntry.next();
		  String id = (String) entry.getKey();
		  long[] averageMeasures = (long[]) entry.getValue();
      Publication portlet = channel.getPublication(id);
      if (portlet == null) {
        logger.info("Profiler unkwown id: " + id);
        continue;
      }
      percent[0] = curProfiler.getAverageConsumedMemory() == 0 ? 0 : averageMeasures[0] * 100 / curProfiler.getAverageConsumedMemory();
      percent[1] = curProfiler.getAverageElapsedTime() == 0    ? 0 : averageMeasures[1] * 100 / curProfiler.getAverageElapsedTime();
      percent[2] = curProfiler.getAverageOutputSize() == 0     ? 0 : averageMeasures[2] * 100 / curProfiler.getAverageOutputSize();
      boolean isLeafPortlet = !(portlet instanceof PortletCollection) && !(portlet instanceof Portal);
      boolean isExcedingMemThreshold = percent[0] > 15;
      boolean isExcedingTimeThreshold = percent[1] > 15;
      boolean isExcedingOutputSizeThreshold = percent[2] > 15;
      if (percent[0] <= 0) memoryMeasuresInvalid = true;
	%>
    <tr <%= isLeafPortlet ? "" : "style='color: #AAAAAA;'" %>>
      <td class="text-right"><jalios:edit data='<%= portlet %>' popup='<%= true %>'/></td>
      <td class="text-right"><%= measureIdx %>.</td>
      <%-- Type --%>
      <td>
        <jalios:dataicon data="<%= portlet %>"/>
        <%= channel.getTypeLabel(portlet.getClass(), userLang) %>
      </td>
      <%-- Title --%>
      <td><%= portlet.getTitle(userLang) %></td>
      <%-- Cache --%>
      <td class="text-center"><% if (portlet instanceof PortalElement) { %><div title="<%= glp("ui.editportlet.cache." + ((PortalElement) portlet).getCacheType()) %>" class="Cache Cache<%= ((PortalElement) portlet).getCacheTypeInt() %>">&nbsp;</div><% } %></td>
      <%-- Time --%>
	    <td class="text-right <%= isLeafPortlet && isExcedingTimeThreshold ? "exceedThreshold" : "" %>">
        <%= DateUtil.formatDuration(averageMeasures[1], userLocale) %>
      </td>
      <td class="text-right <%= isLeafPortlet && isExcedingTimeThreshold ? "exceedThreshold" : "" %>">
        <%= percent[1] %> %
      </td>
      <%-- Memory --%>
	    <td class="text-right <%= isLeafPortlet && isExcedingMemThreshold ? "exceedThreshold" : "" %>">
        <%= averageMeasures[0] > 0 ? Util.formatFileSize(averageMeasures[0], userLocale) : glp("ui.profiler.results.memory.invalid") %>
      </td>
      <td class="text-right <%= isLeafPortlet && isExcedingMemThreshold ? "exceedThreshold" : "" %>">
        <%= percent[0] > 0 ? (percent[0] + " %") : glp("ui.profiler.results.memory.invalid") %>
      </td>
      <%-- Output Size --%>
      <td class="text-right <%= isLeafPortlet && isExcedingOutputSizeThreshold ? "exceedThreshold" : "" %>">
        <%= Util.formatFileSize(averageMeasures[2], userLocale) %>
      </td>
      <td class="text-right <%= isLeafPortlet && isExcedingOutputSizeThreshold ? "exceedThreshold" : "" %>">
        <%= percent[2] %> %
      </td>
	  </tr>
		<%  
		  }
		%>
    <tr style='font-weight: bold;'>
      <td class="text-right" colspan='5'><%= glp("ui.profiler.results.total") %></td>
      <td class="text-right"><%= DateUtil.formatDuration(curProfiler.getAverageElapsedTime(), userLocale) %> </td>
      <td class="text-right">100%</td>
      <td class="text-right"><%= Util.formatFileSize(curProfiler.getAverageConsumedMemory(), userLocale) %> </td>
      <td class="text-right">100%</td>
      <td class="text-right"><%= Util.formatFileSize(curProfiler.getAverageOutputSize(), userLocale) %> </td>
      <td class="text-right">100%</td>
    </tr>
  </table>
  <% if (memoryMeasuresInvalid) { %><%= glp("ui.profiler.results.memory.warning") %><% } %>
  </ul>
  <% } // !isProfiling && result != -1 %>
  </fieldset>
</form>
<%
  }
%>
<% if (displayedResultNbr > 0) { %>
<br/>
<table class='layout'>
<tr>
 <td class='vTop' width="50%">
  
  <div class="well well-small"  style="padding: 10px; background-image: none;">
	 <%
	    boolean cacheMgrEnabled = channel.getBooleanProperty("cache-mgr.enabled", true);
	    boolean jsPackerEnabled = channel.getBooleanProperty("channel.js-packer.enabled", true);
	    boolean cssPackerEnabled = channel.getBooleanProperty("channel.css-packer.enabled", true);
	    boolean gzipFilterEnabled = channel.getBooleanProperty("channel.gzip-filter.enabled", true);
	    boolean devModeEnabled = channel.getBooleanProperty("channel.dev-mode.enabled", true);
	    boolean dnsResolvingEnabled = channel.getBooleanProperty("statreporter.resolvehost", false);
	 %>
	  <p><%= glp("ui.profiler.check-options.options1") %></p>
	  <table class="siteOptions">
	   <thead>
	    <tr>
	      <th><%= glp("ui.profiler.check-options.option") %></th>
	      <th><%= glp("ui.profiler.check-options.current") %></th>
	      <th><%= glp("ui.profiler.check-options.recommended") %></th>
	    </tr>
	   </thead>
	   <tbody>
	    <tr class="<%= cacheMgrEnabled ? "ok" : "warning" %>">
	      <th><%= glp("ui.adm.prop.adv.cache") %></th>
	      <td class="currentState"><%= glp(cacheMgrEnabled ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled") %></td>
	      <td><%= glp("ui.com.lbl.enabled") %></td>
	    </tr>
	    <tr class="<%= devModeEnabled ? "warning" : "ok" %>">
	      <th><%= glp("ui.adm.prop.adv.dev-mode") %></th>
	      <td class="currentState"><%= glp(devModeEnabled ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled") %></td>
	      <td><%= glp("ui.com.lbl.disabled") %></td>
	    </tr>
	    <tr class="<%= dnsResolvingEnabled ? "warning" : "ok" %>">
	      <th><%= glp("ui.adm.prop.stat.dns") %></th>
	      <td class="currentState"><%= glp(dnsResolvingEnabled ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled") %></td>
	      <td><%= glp("ui.com.lbl.disabled") %></td>
	    </tr>
	   </tbody>
	  </table>
	  <br />
	  <p><%= glp("ui.profiler.check-options.options2") %></p>
	  <table class="siteOptions">
	   <thead>
	    <tr>
	      <th><%= glp("ui.profiler.check-options.option") %></th>
	      <th><%= glp("ui.profiler.check-options.current") %></th>
	      <th><%= glp("ui.profiler.check-options.recommended") %></th>
	    </tr>
	   </thead>
	   <tbody>
	    <tr class="<%= jsPackerEnabled ? "ok" : "warning" %>">
	      <th><%= glp("ui.adm.prop.adv.jspacker") %></th>
	      <td class="currentState"><%= glp(jsPackerEnabled ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled") %></td>
	      <td><%= glp("ui.com.lbl.enabled") %></td>
	    </tr>
	    <tr class="<%= cssPackerEnabled ? "ok" : "warning" %>">
	      <th><%= glp("ui.adm.prop.adv.csspacker") %></th>
	      <td class="currentState"><%= glp(cssPackerEnabled ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled") %></td>
	      <td><%= glp("ui.com.lbl.enabled") %></td>
	    </tr>
	    <tr class="<%= gzipFilterEnabled ? "ok" : "warning" %>">
	      <th><%= glp("ui.adm.prop.adv.gzipfilter") %></th>
	      <td class="currentState"><%= glp(gzipFilterEnabled ? "ui.com.lbl.enabled" : "ui.com.lbl.disabled") %></td>
	      <td><%= glp("ui.com.lbl.enabled") %></td>
	    </tr>
	   </tbody>
	  </table>
	</div>
	
 </td>
 <td class='vTop fit'>&nbsp;</td>
 <td class='vTop'>

  <div class="well well-small"  style="padding: 10px; background-image: none;"">
    <p><strong><%= glp("ui.profiler.cache-legend") %></strong></p>
    <table class='layout'>
      <tr><td width="25"><div class="Cache Cache1"></div></td><td><%= glp("ui.editportlet.cache.None") %></td></tr>
      <tr><td><div class="Cache Cache2"></div></td><td><%= glp("ui.editportlet.cache.Server") %></td></tr>
      <tr><td><div class="Cache Cache3"></div></td><td><%= glp("ui.editportlet.cache.Session") %></td></tr>
      <tr><td><div class="Cache Cache4"></div></td><td><%= glp("ui.editportlet.cache.Groups") %></td></tr>
      <tr><td><div class="Cache Cache5"></div></td><td><%= glp("ui.editportlet.cache.Members") %></td></tr>
      <tr><td><div class="Cache Cache6"></div></td><td><%= glp("ui.editportlet.cache.SessionAndVisitors") %></td></tr>
      <tr><td><div class="Cache Cache7"></div></td><td><%= glp("ui.editportlet.cache.VisitorsOnly") %></td></tr>
    </table>
  </div>
  
 </td>
 </tr>
</table>  
<% } %>

<%@ include file="/admin/doAdminFooter.jspf" %>