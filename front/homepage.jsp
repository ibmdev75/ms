<%@ include file='/jcore/doInitPage.jspf'%><%-- 
--%><%@ include file='/jcore/portal/doPortletParams.jspf'%><%-- 
--%><%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%
  PortalJspCollection box = (PortalJspCollection) portlet;
  ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
%>
<%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%>
<%
  ServletUtil.restoreAttribute(pageContext , "ShowChildPortalElement");
  jcmsContext.addCSSHeader("css/homepage.css");
%>


<div class="homepage">

  <%-- HEADER --%>
  <div class="homepage-header"></div>

  <%-- BODY --%>
  <div class="homepage-body">
    <div class="container-fluid">
    
      <%-- SELECTION --%>
      <div class="homepage-body-selection col-md-9">
        <%= getPortlet(bufferMap,"selection") %>
      </div>
    
      <%-- SIDEBAR --%>
      <div class="homepage-body-sidebar col-md-3">
        <%= getPortlet(bufferMap, "sidebar") %>
      </div>
    </div>

  </div>
  
  <%-- FOOTER --%>
  <div class="homepage-footer">
    <a href="http://www.jalios.com/">Jalios</a>
    &middot; <a href="http://community.jalios.com/">Jalios Community</a>
    &middot; <a href="https://twitter.com/Jalios"><jalios:icon src="glyph: icomoon-twitter2" /></a>
    &middot; <a href="https://fr.linkedin.com/company/jalios"><jalios:icon src="glyph: icomoon-linkedin" /></a>
    &middot; <a href="https://plus.google.com/108411499182746766279/posts"><jalios:icon src="glyph: icomoon-google-plus2" /></a>
    &middot; <a href="https://fr-fr.facebook.com/pages/Jalios/247043108786021"><jalios:icon src="glyph: icomoon-facebook2" /></a>
  </div>

</div>
