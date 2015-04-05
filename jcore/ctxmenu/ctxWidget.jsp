<%@ include file="/jcore/doInitPage.jspf" %><%

  String classes     =  getUntrustedStringParameter("classes", "");
  String items       =  getUntrustedStringParameter("items", "");
  String lang        =  getUntrustedStringParameter("lang", "");
  String chooserType =  getUntrustedStringParameter("chooserType", "");
  String chooserId   =  getUntrustedStringParameter("chooserId", "");
  
  WidgetCtxMenu wcm = new com.jalios.jcms.ajax.WidgetCtxMenu(jcmsContext);  
%><jalios:include target="CTXMENU_HEADER_WIDGET" targetContext="li" /><%= wcm.getCtxMenu(items, lang, chooserType, chooserId) %><jalios:include target="CTXMENU_FOOTER_WIDGET" targetContext="li" />