<%--
  @Summary: Default Member card
  @Category: UI Component
  @Author: Sylvain DEVAUX
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: False
  @Deprecated: False
  @Since: jcms-9.1
--%><%@ include file="/jcore/doInitPage.jspf" %><%
Member itMember = (Member) request.getAttribute("card-member");
if (itMember == null) { return; }

%><%@ include file="/front/card/member/doMemberCard.jspf" %>