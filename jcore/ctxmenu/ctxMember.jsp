<%@ include file="/jcore/doInitPage.jspf" %><%

  boolean disabled = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("channel.ctxmenu.disabled"), false);
  if (disabled){
    return;
  }

  Member mbr = getMemberParameter("ctxId");
  if (mbr == null || !isLogged){
    return;
  }

  String properties = channel.getProperty("ctxmenu.mbr");
  String classes =  getUntrustedStringParameter("classes", "");
  MemberCtxMenu mcm = new com.jalios.jcms.ajax.MemberCtxMenu(jcmsContext);

%><jalios:include target="CTXMENU_HEADER_MEMBER" targetContext="li" /><%= mcm.getCtxMenu(mbr.getId(), properties) %><jalios:include target="CTXMENU_FOOTER_MEMBER" targetContext="li" />