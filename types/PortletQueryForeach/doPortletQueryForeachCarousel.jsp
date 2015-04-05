<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

PortletQueryForeach box = (PortletQueryForeach) portlet;
%>
<%@ include file='doQuery.jspf' %>
<%@ include file='doSort.jspf' %>

<% if (Util.notEmpty(collection)) { %>
  <%-- ----------------------------- --%>
  <%-- 1. Compute and store the HTML --%>
  <%-- ----------------------------- --%>
  <%
  // Setup display
  jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_QUERY);
  jcmsContext.addJavaScript("js/lib/bootstrap/carousel.js");
  jcmsContext.addCSSHeader("css/jalios/core/jalios-carousel.css");
  String carouselId = "Carousel_" + box.getId();
  int maxCat = 2;
  int abstractMaxLength = 120;
  
  // PQF options
  boolean carouselShowPager = "Yes".equals(box.getShowPager());

  // PQFD options
  boolean carouselShowTitle       = Util.toBoolean(request.getAttribute("pqf-carousel-show-title"), true);
  boolean carouselShowAbstract    = Util.toBoolean(request.getAttribute("pqf-carousel-show-abstract"), false);
  boolean carouselShowAuthor      = Util.toBoolean(request.getAttribute("pqf-carousel-show-author"), false);
  boolean carouselShowCategories  = Util.toBoolean(request.getAttribute("pqf-carousel-show-categories"), false);
  String carouselShowDate         = Util.getString(request.getAttribute("pqf-carousel-show-date"), "");
  boolean carouselShowStatus      = Util.toBoolean(request.getAttribute("pqf-carousel-show-status"), false);
  boolean carouselShowType        = Util.toBoolean(request.getAttribute("pqf-carousel-show-type"), false);
  boolean carouselShowRights      = Util.toBoolean(request.getAttribute("pqf-carousel-show-rights"), false);
  boolean carouselShowId          = Util.toBoolean(request.getAttribute("pqf-carousel-show-id"), false);

  // Add "pqf-carousel-option-idle" to css classes to disable auto-start
  boolean isIdleOption = Util.getString(box.getCssClasses(), "").contains("pqf-carousel-option-idle");
  boolean isAutoStart = !isIdleOption;
  StringBuilder slidesBuilder = new StringBuilder();
  StringBuilder pagerBuilder = new StringBuilder();
  %>
  <%@ include file='doForeachHeader.jspf' %>
    <%
    boolean isActive = qfeIdx == box.getSkipFirstResults();
    boolean showPubAbstract = carouselShowAbstract && Util.notEmpty(itPub.getAbstract(userLang));
    boolean carouselShowCaption = carouselShowTitle || showPubAbstract || carouselShowAuthor;
    %>
    <jalios:buffer name='carouselImages'>
      <div class='item<%= isActive ? " active" : "" %>'>
        <% if (Util.isEmpty(itPub.getDataImage())) { %>
          <jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush='true' />
        <% } else { %>
          <div class="carousel-img">
            <div class="carousel-thumb">
              <jalios:thumbnail path="<%= itPub.getDataImage() %>" width="1000" height="800"><jalios:icon src="image" /></jalios:thumbnail>
            </div>
          </div>
          <% if (carouselShowCaption) { %>
            <div class="carousel-caption" title='<%= encodeForHTMLAttribute(itPub.getTitle(userLang)) %>'>
              <% if (carouselShowTitle) { %>
                <div class='carousel-data-title'>
                  <jalios:link data='<%= itPub %>' params='<%= displayURLparams %>' css='noTooltipCard carousel-meta-data'><%= itPub.getTitle(userLang) %></jalios:link>
                </div>
              <% } %>
              <% if (showPubAbstract) { %>
                <p class='carousel-data-abstract carousel-meta-data'>
                  <jalios:wiki span='true'><jalios:truncate length="<%= abstractMaxLength %>" suffix="..."><%= itPub.getAbstract(userLang) %></jalios:truncate></jalios:wiki>
                </p>
              <% } %>
              <% if (carouselShowAuthor) { %>
                <p class='carousel-meta-data carousel-data-author'>  
                  <jalios:link data='<%= itPub.getAuthor() %>' params='<%= displayURLparams %>' css='noTooltipCard'><%= itPub.getAuthor() %></jalios:link>
                  &middot;
                </p>
              <% } %>
              <% if (Util.notEmpty(carouselShowDate) && !"none".equalsIgnoreCase(carouselShowDate)) { %>
                <p class='carousel-meta-data carousel-data-date'>  
                  <jalios:date date='<%= getSortDate(itPub, carouselShowDate) %>' format='short' locale='<%= userLocale %>'/>
                  &middot;
                </p>
              <% } %>
              <% if (carouselShowCategories && Util.notEmpty(itPub.getCategories())) { %>
                <p class='carousel-data-categories'>  
                  <% 
                  int i=0;
                  for (Category cat : itPub.getCategories()) { 
                    if (++i <= maxCat) { %>
                      <a class="meta-cat" href="<%= ResourceHelper.getQuery() + "?cids=" + cat.getId() %>"><%= cat.getName(userLang) %></a>
                    <% } %>
                  <% } %>
                  &middot;
                </p>
              <% } %>
              <% if (carouselShowStatus) { %>
                <p class='carousel-meta-data carousel-data-pstatus'>  
                  <%= itPub.getWFStateLabelHtml(userLang) %>
                  &middot;
                </p>
              <% } %>
              <% if (carouselShowType) { %>
                <p class='carousel-meta-data carousel-data-type'>  
                  <%= itPub.getTypeLabel(userLang) %>
                  &middot;
                </p>
              <% } %>
              <% if (carouselShowRights && itPub.hasAnyReadRights()) { %>
                <p class='carousel-meta-data carousel-data-type' title='<%= glp("ui.com.alt.restricted", itPub.getReadRightsString(5)) %>'>  
                  <jalios:icon src="key" /> &middot;
                </p>
              <% } %>
              <% if (carouselShowId) { %>
                <p class='carousel-meta-data carousel-data-id'>  
                  <%= itPub.getId() %>
                </p>
              <% } %>
            </div>
          <% } %>
        <% } %>
      </div>
    </jalios:buffer>
    <% slidesBuilder.append(carouselImages.toString()); %>
    <jalios:buffer name='carouselPager'>
      <li data-target="#<%= carouselId %>" data-slide-to="<%= qfeIdx %>"<%= isActive ? " class='active'" : "" %>></li>
    </jalios:buffer>
    <% pagerBuilder.append(carouselPager.toString()); %>
  <%@ include file='doForeachFooter.jspf' %>
  
  
  <%-- -------------------------- --%>
  <%--     2. Print HTML          --%>
  <%-- -------------------------- --%>
  <div id="<%= carouselId %>" class="pqf-carousel carousel slide<%= carouselShowPager ? " show-pager" : "" %>"<%= isAutoStart ? " data-ride='carousel'" : "" %>>
  
    <%-- Indicators / pager --%>
    <% if (carouselShowPager) { %>
      <ol class="carousel-indicators">
        <%= pagerBuilder.toString() %>
      </ol>
    <% } %>
  
    <%-- Wrapper for slides --%>
    <div class="carousel-inner">
      <%= slidesBuilder.toString() %>
    </div>
  
    <%-- Controls --%>
    <div class="pqf-carousel-controls">
      <a class="carousel-control left" href="#Carousel_<%= box.getId() %>" role="button" data-slide="prev">
        <jalios:icon src="chevron-left"/>
      </a>
      <a class="carousel-control right" href="#Carousel_<%= box.getId() %>" role="button" data-slide="next">
        <jalios:icon src="chevron-right"/>
      </a>
    </div>
  </div>

  <% if ("Link".equals(box.getShowPager())) { %>
    <%-- Only show pager in "Link" mode --%>
    <%@ include file="doPager.jspf" %>
  <% } %>
<% } %>