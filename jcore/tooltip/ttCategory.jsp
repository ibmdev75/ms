<%@ include file="/jcore/doInitPage.jspf" %><%
  Category cat = getCategoryParameter("ttId");
  if (cat == null){
    return;
  }
  
  if (!cat.canBeReadBy(loggedMember)) {
    return;
  }
  
%><div class='tt-card tt-category'>
  <div class='popover-body'>
    <div class='name'><%= cat.getName(userLang) %></div>
    <jalios:include target="CATEGORY_TOOLTIP_CONTENT" targetContext="bloc" />
  </div>
  <div class='popover-footer tt-btn focus'>
    <jalios:include target="CATEGORY_TOOLTIP_FOOTER" targetContext="inline" />
  </div>
</div>
