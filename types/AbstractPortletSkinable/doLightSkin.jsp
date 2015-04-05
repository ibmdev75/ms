<%--
  @Summary: A simple skin with optional display title
  @Customizable: True
  @Requestable: False
--%>
<%@ include file='/jcore/doInitPage.jspf' %><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

String id              = portletDomId;
String styleOutter     = PortalManager.getOutterStyles(portlet).trim();
String styleInner      = PortalManager.getInnerStyles(portlet).trim();
String classOutter     = PortalManager.getOutterClasses(portlet).trim();
String classInner      = PortalManager.getInnerClasses(portlet).trim();

PortletSkinable portletSkinable  = (PortletSkinable) portlet;

jcmsContext.addCSSHeader("types/AbstractPortletSkinable/light-skin.css");
%><jalios:buffer name="buffer"><%@ include file='/jcore/portal/doIncludePortletTemplate.jsp' %></jalios:buffer><%

String styleOutterCustom = Util.getString(request.getAttribute("styleOutterCustom"), ""); 
String styleInnerCustom  = Util.getString(request.getAttribute("styleInnerCustom"), "");
String classOutterCustom = Util.getString(request.getAttribute("classOutterCustom"), "");
String classInnerCustom  = Util.getString(request.getAttribute("classInnerCustom"), "");

styleOutter = (styleOutter + " " + styleOutterCustom).trim();
styleInner = (styleInner + " " + styleInnerCustom).trim();

classOutter = (classOutter + " " + classOutterCustom).trim();
classInner = (classInner + " " + classInnerCustom).trim();

boolean showHeader = Util.toBoolean((Boolean)request.getAttribute("defaultSkin.show-header"), true);
// Hide skinTitle if no dedicated displayTitle
showHeader = showHeader && Util.notEmpty(portletSkinable.getDisplayTitle(userLang).trim());

String info = (String)request.getAttribute("defaultSkin.info");
boolean showInfo = Util.notEmpty(info);
String footer =  (String)request.getAttribute("defaultSkin.footer");
boolean showFooter = Util.notEmpty(footer);
%>
<jalios:panel id="<%= id %>" css='<%= "light-skin panel-default " + classOutter %>' style="<%= styleOutter %>">
  
  <% if (showHeader) { %>
  <jalios:panel-heading css='<%= !jcmsContext.getBrowser().isIE() ? "dnd-header" : "" %>'>
    <% if (showInfo) { %><div class="panel-actions"><%= info %></div><% } %>
    <div class="panel-title"><%@ include file="doSkinTitle.jspf" %></div>
  </jalios:panel-heading>
  <% } %>

  <jalios:panel-body css="<%= classInner %>" style="<%= styleInner %>">
    <%= buffer %>
  </jalios:panel-body>

  <% if (showFooter) { %>
  <jalios:panel-footer>
    <%= footer %>
  </jalios:panel-footer>
  <% } %>
  
</jalios:panel>
<%
request.removeAttribute("styleOutterCustom");
request.removeAttribute("styleInnerCustom");
request.removeAttribute("classOutterCustom");
request.removeAttribute("classInnerCustom");
request.removeAttribute("defaultSkin.show-header"); 
request.removeAttribute("defaultSkin.info"); 
request.removeAttribute("defaultSkin.footer");   
%>