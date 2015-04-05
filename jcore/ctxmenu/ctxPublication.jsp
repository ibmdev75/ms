<%@ include file="/jcore/doInitPage.jspf" %><%

  boolean disabled = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("channel.ctxmenu.disabled"), false);
  if (disabled){
    return;
  }

  Publication pub = getPublicationParameter("ctxId");
  if (pub == null || !pub.canBeReadBy(loggedMember)){
    return;
  }

  String properties = channel.getProperty("ctxmenu.pub");
  String classes =  getUntrustedStringParameter("classes", "");
  PublicationCtxMenu pcm = new com.jalios.jcms.ajax.PublicationCtxMenu(jcmsContext);

%><jalios:include target="CTXMENU_HEADER_PUBLICATION" targetContext="li" /><%= pcm.getCtxMenu(pub.getId(), properties, classes) %><jalios:include target="CTXMENU_FOOTER_PUBLICATION" targetContext="li" />