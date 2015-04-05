<%--
  @Summary: Display archived publication html fragment using css
  @Category: Work Area / Content
  @Author: Oliver Jaquemet
  @Copyright: Jalios
  @Customizable: False
  @Requestable: True
  @Deprecated: False 
  @Since: jcms-4.1.1
--%><%@ include file='/jcore/doInitPage.jspf' %><%

  String archiveRowId = getAlphaNumParameter("id", null);
  ArchivedPublication archive = ArchiveManager.getArchive(archiveRowId);
  if (archive == null) {
    sendRedirect("work/archiveBrowser.jsp", request, response);
    return;
  }
  if (!archive.canBeReadBy(loggedMember)) {
    sendForbidden(request, response); 
    return;
  }
  
  String archiveLang = getAlphaNumParameter("lang", userLang);
  String archiveHtmlPath = archive.getSavedHtmlPath(archiveLang);

  if (Util.notEmpty(archiveHtmlPath)) {
  	// Set FrontOffice CSS and JS
  	jcmsContext.addCSSHeader(JcmsJspContext.getFrontOfficeCSSHeader());
  	jcmsContext.addJavaScript(JcmsJspContext.getFrontOfficeJavaScriptSet());
  	jcmsContext.addCSSHeader("css/portal/jalios.css");
  	
    %><%@ include file='/jcore/doEmptyHeader.jspf' %><div style="margin: 10px;"><%
    %><jalios:include file='<%= "/" + archiveHtmlPath %>' /><%
    %><%@ include file='/jcore/doEmptyFooter.jspf' %></div><%
  }
  
%>