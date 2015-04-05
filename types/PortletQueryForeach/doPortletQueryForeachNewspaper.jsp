<%--
  @Summary: Newspaper template for editorial Publications
  @Category: Template
  @Author: Sylvain DEVAUX
  @Customizable: True
  @Requestable: False
  @Since: jcms-9.0.1
--%>
<%@ page contentType="text/html; charset=UTF-8" %><%

%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

PortletQueryForeach box = (PortletQueryForeach) portlet;
String resultTemplate = "/types/PortletQueryForeach/doNewspaperResultDisplay.jsp";

// Css
jcmsContext.addCSSHeader("css/jalios/ux/jalios-pqf-newspaper.css");
%>

<%-- Compute & sort results --%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>

<%
boolean anyResult = Util.notEmpty(collection);
boolean isFirstResultLead = Util.toBoolean(request.getAttribute("pqf-newspaper-first-lead"), false);
%>

<div class="newspaper-results">

  <%-- No results message --%>
  <% if (!anyResult) { %>
    <jalios:message msg="ui.pqf.lbl.no-content" title="" css="no-result" />
  <% } %>

  <%-- Starts with a Row --%>
  <% if (anyResult) { %>
    <div class="row clearfix">
  <% } %>
  <%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
    <%
    boolean firstResult = itPublicationCounter == startIdx + 1; // current result is the first one 
    boolean lastResult = !it.hasNext() || (qfeIdx + 1 >= startIdx + pagerHandler.getPageSize());
    boolean firstResultFull = firstResult && isFirstResultLead; // current result is the first one AND it should take 100% width
    
    StringBuilder classes = new StringBuilder(128);
    // Class to identify a "result"
    classes.append("newspaper-result-wrapper");
    // Classes for "layout"
    classes.append(" col-xs-12");

    if (firstResultFull) {
      // Should first publication take 100%?
      classes.append(" col-sm-12");
    } else {
      // Else, takes 50%
      classes.append(" col-sm-6");
    }
    
    if (firstResult) {
      classes.append(" first-result");
    }
    if (lastResult) {
      classes.append(" last-result");
    }
    boolean newRow;
    if (isFirstResultLead) {
      if (firstResult) {
        newRow = true; // Always close the row here
      } else {
        newRow = (itPublicationCounter - startIdx) % 2 == 1; // new row every 2 results (with a gap of 1 item)
      }
    } else {
      newRow = (itPublicationCounter - startIdx) % 2 == 0; // new row every 2 results
    }
    newRow = newRow && !lastResult; // No empty row after last result

    // Customize landscape minimum width breakpoint
    request.setAttribute("publication-image-landscape-min-width", 470);
    %>
    <div class="<%= classes.toString() %>">
      <jsp:include page="<%= resultTemplate %>" flush="true" />
    </div>

    <%-- Ends current row + starts a new one (prevents bad alignment of floating results' column) --%>
    <% if (newRow) { %>
      </div><div class="row clearfix"><%-- new row needed w/o masonry for alignment purpose --%>
    <% } %>

  <%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>

  <% if (anyResult) { %>
    </div><%-- EOF first DIV.row --%>
  <% } %>

  <%@ include file="/front/portlet/doAddButton.jspf" %>
</div>

<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>