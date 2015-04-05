<%--
  @Summary: Dispatch on the page which explains text search syntax, in the right language
  @Category: Documentation
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% if (userLang.equals("fr")) { %>
<jsp:include page='/work/textSearchHelp_fr.jsp' />
<% } else { %>
<jsp:include page='/work/textSearchHelp_en.jsp' />
<% } %>
