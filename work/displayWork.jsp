<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Generic display page for working publication
  @Category: Internal
--%><%@ include file='/jcore/doInitPage.jspf' %><%

  Publication publication = getPublicationParameter("id");

  if (publication == null) {
    sendRedirect("work/pubBrowser.jsp", request, response);
    return;
  }
  
  if (WorkflowManager.getInstance().previewInFO(publication)) {
    sendRedirect(publication.getDisplayUrl(userLocale) + "?preview=true");
  }
  
  if (!publication.canBeReadBy(loggedMember)) {
    sendForbidden(request, response);
    return;
  }
  
  // Set the right workspace for the given publication
  workspace = publication.getWorkspace();
  Workspace.setSessionWorkspace(request.getSession(), workspace);
  Workspace.setRequestWorkspace(request, workspace);
  
  String iframeURL = "work/displayWorkIframe.jsp?id=" + publication.getId() + "&amp;basetarget=_top";
%><%@ include file='/work/doWorkHeader.jspf' %><% request.setAttribute("JALIOS_STATTHISPAGE","false"); %>
<h1 class='boTitle icon iconPreview'>
  <%= glp("ui.work.dpl.title", publication.getTitle(userLang)) %>
</h1>

<%-- Work Header --%>
<%@ include file='/work/doDisplayHeaderWork.jspf' %>

<%-- Content iframe --%>
<div id="waitingMessage" class='formInfo'>
 <jalios:icon src="waitsmall" alt='loading' /> <%= glp("ui.work.dpl.loading") %>
</div>
<iframe id="displayWorkIframe" src="<%= iframeURL %>"
        frameborder="0" style="visibility:hidden; padding: 5px; border: 1px solid #eee;"></iframe>

<jalios:javascript> 
 function resizeIframeToViewport() {
   var vpBounds = Util.getViewportBounds(); // { x, y, width, height }
   var iframe = $('displayWorkIframe');
   iframe.style.width = Math.max(200, vpBounds.width - 56) + "px"; 
   iframe.style.height = Math.max(150, vpBounds.height - 260) + "px"; 
 }
 function hideWaitAndShowIframe() {
   $('waitingMessage').hide();
   $('displayWorkIframe').style.visibility = 'visible';
   resizeIframeToViewport();
 }
 setTimeout(hideWaitAndShowIframe,1);
 Event.observe(window, 'resize', function() { setTimeout(resizeIframeToViewport,1); });
</jalios:javascript>

<%@ include file='/work/doDisplayFooterWork.jsp' %> 
<%@ include file='/work/doWorkFooter.jspf' %>