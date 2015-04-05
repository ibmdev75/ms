<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
jcmsContext.addCSSHeader("plugins/MiniSiteCMSPlugin/css/Tag/tagfull.css");
Tag obj = (Tag)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
String style="color:"+obj.getCouleurTexte()+"; background:"+obj.getCouleurFond();
String styleCounter="color:"+obj.getCouleurFond();

%>
<div class="tags">
    <a href="#" style="<%=style %>"><%=obj.getDescription() %><span style="<%=styleCounter%>"><%=obj.getCompteur() %></span></a>
    
</div>

 
