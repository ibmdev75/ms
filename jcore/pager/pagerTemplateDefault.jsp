<%--
  @Summary: Default template used by the pager tag
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/pager/pagerTemplateInit.jspf' %><%

boolean hasCtxMenu = pageSizes.length > 1 || (handler.getItemsNbr() > pageSizes[0] && handler.canShowPagerAll());
int ctxMenuCounter = 0;
if (hasCtxMenu) {
  ctxMenuCounter = (Util.toInt(request.getSession().getAttribute("pagerCtxMenuCounter"),0)+1) % 20;
  request.getSession().setAttribute("pagerCtxMenuCounter",""+ctxMenuCounter);
  request.setAttribute("pagerCtxMenuCounter",""+ctxMenuCounter);
}

// This template may be used with any template name, but if : 
// - it is explicitely used with template name "pqf" (PortletQueryForeach) 
// - or current template usage is "box" (only applied when explicitely specified or when a portlet is detected to skip BO cases)
// then some details will be hidden to save space
final String currentTemplateUsage = Util.getString(jcmsContext.getTemplateUsage(), (jcmsContext.getPortlet() != null) ? "box" : null);
final boolean isPQF = templateName.equals("pqf") || "box".equals(currentTemplateUsage);
if (isPQF) {
  handler.setShowFirstLink(false);
  handler.setShowLastLink(false);
}

boolean hasContent = handler.getPagesNbr() != 1 || hasCtxMenu;
if (hasContent) { 
%><div class="pagination-wrapper"><ul class="pagination<% if (isPQF) { %> pagination-sm pqf<% } %>"><%

  if (handler.isPagerAll()) {
    %><li class="pgInfo"><a href="<%= handler.getShowPagerURL() %>" class="<%= linkCss %>"><%= glp("ui.pager.show") %></a></li><%
  } else { 

    // ============================================================
    // Pages Navigation links
    
    // do not print pages navigation links if there is just one page
    if (handler.getPagesNbr() != 1) {
      
      if (!isPQF) {
        %><li class="pgEmpty pgInfo disabled"><span><%= glp("ui.pager.page-nbr", handler.getCurrentPage(), handler.getPagesNbr()) %></span></li><%
      }
      
      // =======================
      // "First page" and "Previous page" links :  <<  <      
      if (pagesLinksNbrs.length < handler.getPagesNbr()) {
        final String firstPageSymbol = "&lt;&lt;";; // &#8810;
	      if (handler.isFirstPage()) { 
	        if (handler.getShowFirstLink()) { %><li class="pgFirst pgEmpty disabled"><span><%= firstPageSymbol %></span></li><% }
                        %><li class="pgPrev pgEmpty disabled"><span>&lt;</span></li><%
	      } else {
	        if (handler.getShowFirstLink()) { %><li class="pgFirst"><a href="<%= handler.getFirstLinkURL() %>" rel="prev" title="<%= glp("ui.pager.txt.first") %>" class="<%= linkCss %>"><%= firstPageSymbol %></a></li><% }
              	        %><li class="pgPrev"><a href="<%= handler.getPreviousLinkURL() %>" rel="prev" title="<%= glp("ui.pager.txt.previous") %>" class="<%= linkCss %>">&lt;</a></li><%
	      }
      }
 
      // =======================
      // Pages link :  ... [3] [4] [5] ... 
	    for (int i = 0; i < pagesLinksNbrs.length ; i++) {
	      int pageNbr = pagesLinksNbrs[i];
	      if (pageNbr == handler.getCurrentPage()) {
	        %><li class="pgNum pgEmpty active"><span><%= pageNbr %></span></li><%
	      } else {
	        %><li class="pgNum"><a href="<%= handler.getPageLinkURL(pageNbr) %>" rel="<%= pageNbr < handler.getCurrentPage() ? "prev" : "next" %>" class="<%= linkCss %>" title="<%= glp("ui.pager.goto-page", pageNbr) %>"><%= pageNbr %></a></li><%
	      }
	    }
      
      // =======================
      // "Next page" and "Last page" links:  >  >>
      if (pagesLinksNbrs.length < handler.getPagesNbr()) {
        final String lastPageSymbol = "&gt;&gt;"; // &#8811;
	      if (handler.isLastPage()) { 
	                      %><li class="pgNext pgEmpty disabled"><span>&gt;</span></li><% 
	        if (handler.getShowLastLink()) { %><li class="pgLast pgEmpty disabled"><span><%= lastPageSymbol %></span></li><% }
	      } else {
	                      %><li class="pgNext"><a href="<%= handler.getNextLinkURL() %>" title="<%= glp("ui.pager.txt.next") %>" rel="next" class="<%= linkCss %>">&gt;</a></li><%
	        if (handler.getShowLastLink()) { %><li class="pgLast"><a href="<%= handler.getLastLinkURL() %>" rel="next" title="<%= glp("ui.pager.txt.last") %>" class="<%= linkCss %>"><%= lastPageSymbol %></a></li><% }
	      }
      }

    } // pages navigation links
    
    // ============================================================
    if (hasCtxMenu) {
      String currentPageSizeInfo = glp("ui.pager.per-page", handler.getPageSize());
      %><li class="pgInfo">
        <a href="#" class="ctxmenu pagerCtxMenu<%= ctxMenuCounter %>"  title="<%= encodeForHTMLAttribute(currentPageSizeInfo) %>"><% if (!isPQF) { %><%= currentPageSizeInfo %><% } %> <jalios:icon src="caret"/></a><%
        %><ul class="ctxMenu ctxInfo ctxInfoLink click aligned" id="pagerCtxMenu<%= ctxMenuCounter %>" style="display: none; width:100px;"><%

        // =======================
        // Pages size link : 10, 20, 50 
        // Only display page size links if there is more than 1 available page size
        if (pageSizes.length > 1) {

          for (int i = 0; i < pageSizes.length; i++) {
            int pageSize = pageSizes[i];
            final boolean isCurrentPageSize = (pageSize == handler.getPageSize());
            final String liAttr = isCurrentPageSize ? "class=\"disabled\"" : "";
            final String aAttr = isCurrentPageSize ?  "" : ("class=\"" + linkCss +"\"");
            %><li <%= liAttr %>><a href="<%= handler.getShowPageSizeURL(pageSize) %>" <%= aAttr %> title="<%= glp("ui.pager.per-page.long", pageSize) %>"><%= glp("ui.pager.per-page", pageSize) %></a></li><%
          }
        }

        // =======================
        // Pager All Link
        if (handler.canShowPagerAll()) {
         %><li><a href="<%= handler.getPagerAllURL() %>" title="<%= glp("ui.pager.all.long") %>" class="<%= linkCss %>"><%= glp("ui.pager.all") %></a></li><%
        }
        
        %></ul><%
      %></li><%

    }// context menu  (page size or pager all link)

  }// ! pager all  
%></ul></div><%
}
handler.clearSessionParams();
%>