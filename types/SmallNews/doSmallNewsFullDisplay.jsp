<%--
  @Deprecated: False
  @Customizable: True
  @Requestable: False
  @Summary: SmallNews display template
  @Category: Customized
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  SmallNews obj = (SmallNews)request.getAttribute("publication");

%>
<div class="fullDisplay SmallNews"> 
  <%@ include file='/front/publication/doPublicationHeader.jspf' %>  
          
  <% if (Util.notEmpty(obj.getIntro(userLang))) { %>
  <div class="smallnews-intro intro" <%= gfla(obj, "intro") %>><jalios:wiki data="<%= obj %>" field="intro"><%= obj.getIntro(userLang) %></jalios:wiki></div>
  <% } %>  
  <% if (Util.notEmpty(obj.getContent(userLang))) { %>
  <div class="smallnews-body" <%= gfla(obj, "content") %>><jalios:wiki data="<%= obj %>" field="content"><%= obj.getContent(userLang) %></jalios:wiki></div>
  <% } %>
</div>