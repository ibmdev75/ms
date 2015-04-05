<%@ include file="/jcore/doInitPage.jspf" %><%
  
  boolean disabled = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("channel.ctxmenu.disabled"), false);
  if (disabled){
    return;
  }
  
  Publication pub = getPublicationParameter("ctxId");
  if (pub == null || !isLogged || !loggedMember.canWorkOn(pub)){
    return;
  }
  
  String properties = channel.getProperty("ctxmenu.por");
  String classes =  getUntrustedStringParameter("classes", "");
  PortletCtxMenu pocm = new com.jalios.jcms.ajax.PortletCtxMenu(jcmsContext);

%><jalios:include target="CTXMENU_HEADER_PORTLET" targetContext="li" /><%= pocm.getCtxMenu(pub.getId(), properties) %><jalios:include target="CTXMENU_FOOTER_PORTLET" targetContext="li" />