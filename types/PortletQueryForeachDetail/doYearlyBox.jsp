<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeachDetail box = (PortletQueryForeachDetail) portlet;  %>

<%!
public TreeSet getYearSet(Set pubSet , String date) {
  TreeSet yearSet = new TreeSet();
  Calendar cal = Calendar.getInstance();

  for(Iterator it = pubSet.iterator(); it.hasNext();) {
    Publication itPub = (Publication)it.next();
    cal.setTime(itPub.getDate(date , itPub.getCdate()));
    yearSet.add(new Integer(cal.get(Calendar.YEAR)));
  }
  return yearSet;
}
%>

<%@ include file="../PortletQueryForeach/doQuery.jspf" %>


<%-- *** DISPLAY YEARS ************************************************************ --%>
<% 
TreeSet yearSet = getYearSet((Set)collection , box.getOrderBy());
if (yearSet.isEmpty()) {
  return;
}

int year = Util.toInt(PortalManager.receiveAction(request , box , "year"), ((Integer)yearSet.last()).intValue()); 
PortalManager.removeAction(request , box , "year");
%>

<% if(yearSet.size() > 1) { %>
  <%--
  <ul class="nav nav-pills">
    <jalios:foreach collection="<%= yearSet %>" name="itYear" type="Integer">
      <% if(itYear.intValue() == year) { %>
        <li class="active"><a href="#"><%= itYear %></a></li>
      <% } else { %>
        <li><a href='<%= PortalManager.sendAction(request , box , "year" , "" + itYear) %>' class="ajax-refresh"><%= itYear %></a></li>
      <% } %>
    </jalios:foreach>
  </ul>
  --%>
  <div class="pqf-years br">
  <jalios:foreach collection="<%= yearSet %>" name="itYear" type="Integer">
    <div class="btn-group">
      <% if(itYear.intValue() == year) { %>
        <a href="#" class="btn btn-primary"><%= itYear %></a>
      <% } else { %>
        <a href='<%= PortalManager.sendAction(request , box , "year" , "" + itYear) %>' class="ajax-refresh btn btn-default"><%= itYear %></a>
      <% } %>
    </div>
  </jalios:foreach>
  </div>
<% } %>


<%-- *** SELECT PUB OF THIS YEAR ************************************************************ --%>
<% 
  Calendar cal = Calendar.getInstance();
  cal.set(Calendar.YEAR, year);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.DAY_OF_MONTH, 1);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.MONTH, 0);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.HOUR_OF_DAY, 0);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.MINUTE, 0);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.SECOND, 0);
  Date beginDate = cal.getTime();

  cal.set(Calendar.YEAR, year);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.DAY_OF_MONTH, 1);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.MONTH, 11);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.DAY_OF_MONTH, 31);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.HOUR_OF_DAY, 23);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.MINUTE, 59);
  // to force update of the calendar object as precised in javadoc
  cal.getTime();
  cal.set(Calendar.SECOND, 59);
  Date endDate = cal.getTime();
%>

<jalios:query name="selectedSet"
              dataset="<%= (Set)collection %>"
              selector="<%= Publication.getDateSelector(box.getOrderBy(), beginDate, endDate) %>"
              comparator="<%= ComparatorManager.getComparator(Publication.class, box.getOrderBy(), true) %>" />
<%
if (Util.isEmpty(selectedSet) && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);
}

Map<Integer, List<Publication>> map = new HashMap<Integer, List<Publication>>();

if(Util.notEmpty(selectedSet)) {
  for(Object obj : selectedSet) {
    Publication pub = (Publication) obj;
    Date itDate = pub.getDate(box.getOrderBy(), pub.getCdate());
    cal.setTime(itDate);
    int month = cal.get(Calendar.MONTH);
    List<Publication> list = map.get(month);
    if(list == null) {
      list = new ArrayList<Publication>();
      map.put(month, list);
    }
    list.add(pub);
  }
}

String[] monthLabels = (new DateFormatSymbols(userLocale)).getMonths();

String orderDate = ((PortletQueryForeachDetail)box).getShowDate();
boolean showDate = Util.notEmpty(orderDate);

String displayURLparams = (box.getContextCategory() ? "&amp;cid="+currentCategory.getId() : "")+(box.getShowInCurrentPortal() ? "&amp;portal="+portal.getId() : "");
%>
<% for(Map.Entry<Integer, List<Publication>> entry : map.entrySet()) { %>
  <% Integer currMonth = entry.getKey(); %>
  <% List<Publication> pubList = entry.getValue(); %>
  <jalios:accordion multiOpen="true">
    <jalios:accordion-panel active="true" title='<%= Util.recapitalize(monthLabels[currMonth]) + " " + year %>' picture="calendar">
      <%--<ul class="list-group">--%>
      <ul class="item-box">
        <% int cptMonth = 0; %>
        <% for(Publication itPub : pubList) { %>
          <%--<li class="list-group-item">--%>
          <li class="item">
            <% if(showDate) { %>
              <% Date itemDate = itPub.getDate(orderDate); %>
              <%@ include file="/jcore/doItemBoxDate.jspf" %>
            <% } %>
            <div class="item-icons-large">
              <jalios:edit data="<%= itPub %>" popup="true" />
            </div>
            <% if(box.getShowTitle()) { %>
              <span class="pqf-item-title"><jalios:dataicon data="<%= itPub %>" /> <jalios:link data="<%= itPub %>" params="<%= displayURLparams %>" /></span>
            <% } %>
            <% if(box.getShowAbstract() && Util.notEmpty(itPub.getAbstract(userLang))) { %>
              <div class="pqf-item-abstract"><jalios:wiki truncateLength="100" truncateSuffix="..."><%= itPub.getAbstract(userLang) %></jalios:wiki></div>
            <% } %>
          </li>
          <%
          cptMonth++;
          if(cptMonth == box.getMaxResults() && "Link".equals(box.getShowPager())) {
            break; // Stop to loop in publication list for the current month 
          }
          %>
        <% } %>
        <% if(cptMonth == box.getMaxResults() && "Link".equals(box.getShowPager())) { %>
          <ul class="pager">
            <li>
            <% if(box.getQueries().length > 1) { %>
              <a href='<%= ServletUtil.getUrlWithUpdatedParam(request,"id",box.getId()) %>' class="PagerLink"><%= box.getPagerLabel(userLang) %></a>
            <% } else { %>
              <a href='<%= ResourceHelper.getQuery() %>?<%= ServletUtil.escapeAmpersand(box.getQueries()[0]) %><%= "Portal".equals(box.getRefineQueries()) ? "&amp;cids="+portalCategory.getId() : "" %><%= "Current".equals(box.getRefineQueries()) ? "&amp;cids="+currentCategory.getId() : "" %>&amp;sort=<%= Util.getString(box.getOrderBy(),"date").toLowerCase() %>' class="PagerLink"><%= box.getPagerLabel(userLang) %></a>
            <% } %>
            </li>
          </ul>
        <% } %>
      </ul>
    </jalios:accordion-panel>
  </jalios:accordion>
<% } %>
