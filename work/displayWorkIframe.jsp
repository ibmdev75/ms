<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Generic display page for working publication
  @Category: Internal
--%><%

  String lang = getAlphaNumParameter("lang", null);
  if (Util.notEmpty(lang) && channel.getLanguageList().contains(lang)) {
    request.setAttribute("userLang", lang);
    request.setAttribute("userLocale", I18nUtil.getLocale(lang));
  }

%><%@ include file='/jcore/doInitPage.jspf' %><%

Publication publication = getPublicationParameter("id");

if (publication == null) {
  sendRedirect("work/pubBrowser.jsp", request, response);
  return;
}

if (publication instanceof FaqEntry) {
  FaqEntry fe = (FaqEntry)publication;
  sendRedirect("work/displayWorkIframe.jsp?id=" + fe.getFaq().getId() + "&preview=true&#" + fe.getId(), request, response);
  return;
} 

if (publication instanceof GlossaryEntry) {
  GlossaryEntry ge = (GlossaryEntry)publication;
  sendRedirect("work/displayWorkIframe.jsp?id=" + ge.getGlossary().getId() + "&preview=true&#" + ge.getId(), request, response);
  return;
} 

// NOTE: ServletUtil.getUrl() do not use ID because of Descriptive URL 
request.setAttribute("inFO","true");
Workspace.setRequestWorkspace(request , publication.getWorkspace());


if (!publication.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}

if (publication instanceof PortalElement){
	request.setAttribute("PortalElement", publication);
}

if (publication instanceof PortalInterface){
  request.setAttribute("Portal", publication);
}


// Fix both JCMS-1957 and JCMS-3857 by making sure request attributes modified above are updated in jcmsContext: 
// inFO, PortalElement, Portal, 
jcmsContext.forceUpdate();

// Fix bug JCMS-3025 : Avoid security warning message when previewing Portlet Redirection in Back Office
if (publication instanceof PortalRedirect){
  String redirectUrl = ((PortalRedirect)publication).getRedirectURL(loggedMember);
  JcmsContext.sendRedirect(redirectUrl, false, request, response);
  return;
}

// ------------------------------------------ QUERY STRING TO HIGHLIGHT  --------------------------------------------------
request.setAttribute("metakeywords",Util.join(publication.getCategories(loggedMember) , ","));
request.setAttribute("title", publication.getTitle(userLang));
request.setAttribute("zone", "WorkArea");
jcmsContext.addBodyAttributes("class", "displayWork"); 
%>

<jalios:buffer name='theBodyContent'>
<% if (publication instanceof PortalElement ) { %>
		<%  displayPortlet = (PortalElement)publication; %>
     <div style="border:1px solid black; ">
		<%@ include file='/jcore/portal/doIncludePortlet.jspf' %>
     </div>
<% } else { %>
	<% request.setAttribute(PortalManager.PORTAL_PUBLICATION, publication);
	   request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
		 String displayTemplate = "/" + publication.getTemplatePath(jcmsContext); %>
		 <jsp:include page="<%= displayTemplate %>" flush="true"></jsp:include>
<%   request.removeAttribute("isInContentFullDisplay");
   } %>
</jalios:buffer>

<jalios:buffer name='theFullPage'>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<%= theBodyContent %>
<%@ include file='/jcore/doEmptyFooter.jspf' %> 
</jalios:buffer>

<%@ include file='/jcore/doDisplayBuffer.jspf' %>

<%= theFullPage %>