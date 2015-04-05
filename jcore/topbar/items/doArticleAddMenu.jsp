<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>    
<%-- Article --%>
<% if (isLogged && loggedMember.canPublishSome(Article.class)) { %>
<a class="publish-menu-item list-group-item" href="types/Article/editArticle.jsp?ws=<%= workspace.getId() %>&amp;redirect=$PREVIEW_URL$"><jalios:icon css="topbar-icon" title="" src="article" /> <%= glp("publish-menu.content.article") %></a>
<% } %>