<%@ include file='/jcore/doInitPage.jspf' %><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

  String style   = PortalManager.getOutterStyles(portlet).trim() +" "+ PortalManager.getInnerStyles(portlet).trim();
  String classes = PortalManager.getOutterClasses(portlet).trim()+" "+ PortalManager.getInnerClasses(portlet).trim();

%><jalios:buffer name="buffer"><%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %></jalios:buffer><% 

  style   += " "+Util.getString(request.getAttribute("styleOutterCustom"),"");
  style   += " "+Util.getString(request.getAttribute("styleInnerCustom"), "");
  classes += " "+Util.getString(request.getAttribute("classOutterCustom"),"");
  classes += " "+Util.getString(request.getAttribute("classInnerCustom"), "");
  
  if (Util.notEmpty(style)){
    style = " style=\""+style.trim()+"\"";
  }
  
  if (Util.notEmpty(classes)){
    classes = " class=\""+classes.trim()+"\"";
  }
  
%><div id="<%= portletDomId %>" <%= classes %><%= style %>><%= buffer %></div><%

  request.removeAttribute("styleOutterCustom");
  request.removeAttribute("styleInnerCustom");
  request.removeAttribute("classOutterCustom");
  request.removeAttribute("classInnerCustom");   
%>
