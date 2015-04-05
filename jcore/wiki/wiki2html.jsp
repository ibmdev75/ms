<%@ include file='/jcore/doInitPage.jspf' %><% 
  request.setAttribute("com.jalios.jcms.WIKI_PREVIEW", Boolean.TRUE); 
  String wiki = getUntrustedStringParameter("wiki", null); // ENCODE !!
  if (Util.isEmpty(wiki)){
    return;
  }
%><jalios:wiki><%= Util.encodeHtmlBasicEntities(wiki) %></jalios:wiki>