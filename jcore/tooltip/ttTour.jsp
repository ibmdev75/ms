<%@ include file="/jcore/doInitPage.jspf" %><jalios:include target="TOOLTIP_TOUR" targetContext="empty" /><%
  
  if (!channel.getBooleanProperty("jcms.resource.tt-card.enabled", false)){
    return;
  }
  String ttStep = getStringParameter("ttStep", null, HttpUtil.DATAID_REGEX);
  if (ttStep == null) {
    return;
  }
  int ttIndex = getIntParameter("ttIndex", 0);
  int ttNext  = getIntParameter("ttNext", -1);
  int ttPrev  = getIntParameter("ttPrev", -1);
%>
<div class='tt-tour'>
  <div class='popover-body'>
    <div class='name'><%= ttStep %></div>
    <jalios:include target="TOUR_TOOLTIP_CONTENT" targetContext="bloc" />
  </div>
  <div class='popover-footer tt-btn focus'>
	  <div class="btn-group">
		  <button class="btn btn-sm btn-default" data-role="prev" <%= ttPrev != -1 ? "onclick='ttTourNext("+ttPrev+");'" : "disabled='disabled'" %>>&laquo; Prev</button>
		  <button class="btn btn-sm btn-default" data-role="next" <%= ttNext != -1 ? "onclick='ttTourNext("+ttNext+");'" : "disabled='disabled'" %>>Next &raquo;</button>  
		</div>
		<button class="btn btn-sm btn-default pull-right" data-role="end" onclick="ttTourEnd('<%= ttStep %>');">End tour</button> 
    <jalios:include target="TOUR_TOOLTIP_FOOTER" targetContext="inline" />
  </div>
</div>
<%@ include file='/jcore/doAjaxFooter.jspf' %>