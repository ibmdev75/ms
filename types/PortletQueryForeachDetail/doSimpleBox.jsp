<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet; %>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>

<div class="pqf-dashboard">
  <ul class="item-box">
    <%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
      <%@ include file="doSimpleBoxInner.jspf" %>
    <%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
  </ul>
</div>

<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>