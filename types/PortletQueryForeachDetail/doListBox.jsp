<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeachDetail box = (PortletQueryForeachDetail) portlet;  %>

<%@ include file="../PortletQueryForeach/doQuery.jspf" %>
<%@ include file="../PortletQueryForeach/doSort.jspf" %>

<table class="table-data">
  <%@ include file="../PortletQueryForeach/doForeachHeader.jspf" %>
  
  <% if(pagerHandler.getStart() + 1 == itPublicationCounter.intValue()) { %>
    <% String sortImg = (pagerHandler.isReverse() ? "sortUp.gif" : "sortDown.gif"); %>
    <tr>
      <%-- Item index --%>
      <th class="fit"></th>
      <%-- Edit icon --%>
      <th class="fit"></th>
      <%-- Rights icon --%>
      <% if(box.getShowRights()) { %>
        <th class="fit">
          <jalios:icon src="key-white" alt='<%= glp("ui.com.lbl.rights") %>' />
          <jalios:pager name="pagerHandler" action="showSort" sort="right" />
        </th>
      <% } %>
      <%-- Title --%>
      <% if(box.getShowTitle()) { %>
        <th>
          <%= glp("ui.com.lbl.title") %>
          <jalios:pager name="pagerHandler" action="showSort" sort="title" />
        </th>
      <% } %>
      <%-- Abstract --%>
      <% if(box.getShowAbstract()) { %>
        <th><%= glp("ui.com.lbl.abstract") %></th>
      <% } %>
      <%-- Author --%>
      <% if(box.getShowAuthor()) { %>
        <th>
          <%= glp("ui.com.lbl.author") %>
          <jalios:pager name="pagerHandler" action="showSort" sort="author" />
        </th>
      <% } %>
      <%-- Categories --%>
      <% if(box.getShowCategories()) { %>
        <th><%= glp("ui.com.lbl.categories") %></th>
      <% } %>
      <%-- Status --%>
      <% if(box.getShowStatus()) { %>
        <th class="fit">
          <%= glp("ui.com.lbl.status") %>
          <jalios:pager name="pagerHandler" action="showSort" sort="pstatus" />
        </th>
      <% } %>
      <%-- Type --%>
      <% if(box.getShowType()) { %>
        <th>
          <%= glp("ui.com.lbl.type") %>
          <jalios:pager name="pagerHandler" action="showSort" sort="type" />
        </th>
      <% } %>
      <%-- Date --%>
      <% if(Util.notEmpty(box.getShowDate()) &&  !"none".equalsIgnoreCase(box.getShowDate())) { %>
        <% if("cdate".equalsIgnoreCase(box.getShowDate())) { %>
          <th>
            <%= glp("ui.com.lbl.cdate") %>
            <jalios:pager name="pagerHandler" action="showSort" sort="date" />
          </th>
        <% } else if("mdate".equalsIgnoreCase(box.getShowDate())) { %>
          <th>
            <%= glp("ui.com.lbl.mdate") %>
            <jalios:pager name="pagerHandler" action="showSort" sort="mdate" />
          </th>
        <% } else if("pdate".equalsIgnoreCase(box.getShowDate())) { %>
          <th>
            <%= glp("ui.com.lbl.pdate") %>
            <jalios:pager name="pagerHandler" action="showSort" sort="pdate" />
          </th>
        <% } else if("edate".equalsIgnoreCase(box.getShowDate())) { %>
          <th>
            <%= glp("ui.com.lbl.edate") %>
             <jalios:pager name="pagerHandler" action="showSort" sort="edate" />
          </th>
        <% } %>
      <% } %>
      <%-- ID --%>
      <% if(box.getShowId()) { %>
        <th>
          <%= glp("ui.com.lbl.id") %>
          <jalios:pager name="pagerHandler" action="showSort" sort="id" />
        </th>
      <% } %>
      <%-- Caddy --%>
      <th class="fit"></th>
    </tr>
  <% } %>
  
  <tr>
    <%-- Item index --%>
    <td class="fit numeric"><%= itPublicationCounter.intValue() %>.</td>
    <%-- Edit icon --%>
    <td class="fit"><jalios:edit pub="<%= itPub %>" popup="true" /></td>
    <%-- Rights icon --%>
    <% if(box.getShowRights()) { %>
      <td class="fit"><% if(itPub.hasAnyReadRights()) { %><jalios:icon src="key" alt='<%= glp("ui.com.alt.restricted", itPub.getReadRightsString(5)) %>' /><% } %></td>
    <% } %>
    <%-- Title --%>
    <% if(box.getShowTitle()) { %>
      <td><jalios:dataicon data="<%= itPub %>" /> <jalios:link data="<%= itPub %>" params="<%= displayURLparams %>" /></td>
    <% } %>
    <%-- Abstract --%>
    <% if(box.getShowAbstract()) { %>
      <td><jalios:wiki truncateLength="100" truncateSuffix="..."><%= itPub.getAbstract(userLang) %></jalios:wiki></td>
    <% } %>
    <%-- Author --%>
    <% if(box.getShowAuthor()) { %>
      <td class="nowrap"><jalios:memberphoto member="<%= itPub.getAuthor() %>" size="<%= PhotoSize.ICON %>" /> <jalios:link data="<%= itPub.getAuthor() %>"/></td>
    <% } %>
    <%-- Categories --%>
    <% if(box.getShowCategories()) { %>
      <td class="meta-categories">
        <% if(Util.notEmpty(itPub.getCategories())) { %>
          <% for (Category cat : itPub.getCategories()) { %>
            <a class="meta-cat" <%= Util.notEmpty(cat.getColor()) ? "style='background-color:"+ cat.getColor() +"'" : "" %> href="<%= ResourceHelper.getQuery() + "?cids=" + cat.getId() %>"><%= cat.getName(userLang) %></a>
          <% } %>
        <% } %>
      </td>
    <% } %>
    <%-- Status --%>
    <% if(box.getShowStatus()) { %>
      <td class="fit"><%= itPub.getWFStateLabelHtml(userLang) %></td>
    <% } %>
    <%-- Type --%>
    <% if(box.getShowType()) { %>
      <td><%= itPub.getTypeLabel(userLang) %></td>
    <% } %>
    <%-- Date --%>
    <% if(Util.notEmpty(box.getShowDate()) &&  !"none".equalsIgnoreCase(box.getShowDate())) { %>
      <td class="date-time"><jalios:date date='<%= getSortDate(itPub , box.getShowDate()) %>' format='short'/></td>
    <% } %>
    <%-- ID --%>
    <td class="numeric"><%= itPub.getId() %></td>
    <%-- Caddy --%>
    <td><jalios:caddy data="<%= itPub %>" /></td>
  </tr>
  
  <%@ include file="../PortletQueryForeach/doForeachFooter.jspf" %>
</table>

<%@ include file="../PortletQueryForeach/doPager.jspf" %>
