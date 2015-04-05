<%--
  @Summary: Default template used by the pager tag
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/pager/pagerTemplateInit.jspf' %><%
%>
<div class='pager'><%

  if (handler.isPagerAll()) {
    %><a href="<%= handler.getShowPagerURL() %>"><%= glp("ui.pager.show") %></a><%
  }
  
  if (!handler.isPagerAll()) { 

    // ============================================================
    // Pages Navigation links
    
    // do not print pages navigation links if there is just one page
    if (handler.getPagesNbr() != 1) {
      
      // =======================
      // "First page" and "Previous page" links :  |<  <
      if (handler.isFirstPage()) { 
        %> <% if (handler.getShowFirstLink()) { %><%= glp("ui.pager.first.disabled") %><% } %><% 
        %> <%= glp("ui.pager.previous.disabled") %><%
      } else {
        %> <% if (handler.getShowFirstLink()) { %><a href="<%= handler.getFirstLinkURL() %>" rel="prev" title="<%= glp("ui.pager.txt.first") %>"><%= glp("ui.pager.first") %></a><% } %><%
        %> <a href="<%= handler.getPreviousLinkURL() %>" rel="prev" title="<%= glp("ui.pager.txt.previous") %>"><%= glp("ui.pager.previous") %></a><%
      }
      
      // =======================
      // Pages link :  ... [3] [4] [5] ... 
	    if (startingPagesLinksHidden) {
	      %> ...<%
	    }
	    for (int i = 0; i < pagesLinksNbrs.length ; i++) {
	      int pageNbr = pagesLinksNbrs[i];
	      if (pageNbr == handler.getCurrentPage()) {
	        %> <span class='currentPage'>[<%= pageNbr %>]</span><%
	      } else {
	        %> <a href="<%= handler.getPageLinkURL(pageNbr) %>" rel="<%= pageNbr < handler.getCurrentPage() ? "prev" : "next" %>" title="<%= glp("ui.pager.goto-page", pageNbr) %>"><%= pageNbr %></a><%
	      }
	    }
	    if (endingPagesLinksHidden) {
	      %> ...<%
	    }
      
      // =======================
      // "Next page" and "Last page" links:  >  >|
      if (handler.isLastPage()) { 
        %> <%= glp("ui.pager.next.disabled") %><% 
        %> <% if (handler.getShowLastLink()) { %><%= glp("ui.pager.last.disabled") %><% } %><%
      } else {
        %> <a href="<%= handler.getNextLinkURL() %>" rel="next" title="<%= glp("ui.pager.txt.next") %>"><%= glp("ui.pager.next") %></a><%
        %> <% if (handler.getShowLastLink()) { %><a href="<%= handler.getLastLinkURL() %>" rel="next" title="<%= glp("ui.pager.txt.last") %>"><%= glp("ui.pager.last") %></a><% } %><%
      }
      
      %><br /><%
      
    } // pages navigation links

    // ============================================================
    // Pages size link : 10, 20, 50 

    // Only display page size links if there is more than 1 available page size
    if (pageSizes.length > 1) {
      
      %><%= glp("ui.pager.show-by") %><%
      
      for (int i = 0; i < pageSizes.length; i++) {
        int pageSize = pageSizes[i];
        if (pageSize == handler.getPageSize()) {
          %> <%= pageSize %><%
        } else {
          %> <a href="<%= handler.getShowPageSizeURL(pageSize) %>"><%= pageSize %></a><%
        }
        // separator
        if (i + 1 < pageSizes.length) {
          %>, <%
        } else {
          %> <%
        }
      }
      
    }
    // Pager All Link
    if (handler.canShowPagerAll() && handler.getPagesNbr() != 1) {
      if (pageSizes.length > 1) { %> - <% }
      %><a href="<%= handler.getPagerAllURL() %>" title="<%= glp("ui.pager.all.long") %>"><%= glp("ui.pager.all") %></a><%
    }
	 
  }// ! pager all
%>
</div>