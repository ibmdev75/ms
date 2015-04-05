<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>    
<%-- FileDocument --%>
<% if (isLogged && loggedMember.canPublishSome(FileDocument.class)) { %>
<a class="modal publish-menu-item list-group-item" href="work/docChooserModal.jsp?id=x&amp;redirect=$PREVIEW_URL$&amp;refresh=true"><jalios:icon css="topbar-icon" title="" src="upload" /> <%= glp("publish-menu.document.upload") %></a>    
<% } %>