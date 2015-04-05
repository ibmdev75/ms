<%--
	@Summary: JSP to render the FullDisplay of a content to Archive, used by ArchiveManager with jsp2file
	@Category: Archive
	@Author: Oliver Jaquemet
	@Copyright: Jalios SA
	@Customizable: False
	@Requestable: False
	@Deprecated: False
	@Since: jcms-4.1.1
	
	If you change this file, do not forget to remove archiveRenderer*
	from WEB-INF\jcmswork\Trash, it will force jsp2file to recompile it.
	It is used only with jsp2file, so do not use error or warning through redirection.
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
	Publication publication = getPublicationParameter("id");
	if (publication == null) {
		System.out.println("[ArchiveRenderer] Missing or invalid publication"); 
		return;
	}
		if (loggedMember == null) {
		System.out.println("[ArchiveRenderer] No logged member"); 
		return;
	}
	if (!isAdmin) {
		System.out.println("[ArchiveRenderer] forbidden access from non admin member, "
												+ loggedMember.getFullName());
	  return;
	}
	
	
	String pubClassSN = Util.getClassShortName(publication);
	String archiveDisplayJspPath = "/types/" + pubClassSN + "/do" + pubClassSN + "ArchiveDisplay.jsp";
	File archiveDisplayJspFile = new File(channel.getRealPath(archiveDisplayJspPath));

	String displayTemplate = archiveDisplayJspPath;
	if (!archiveDisplayJspFile.exists()) {
	  request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
		displayTemplate = "/" + publication.getTemplatePath(TypeTemplateEntry.USAGE_DISPLAY_FULL,true);
		request.removeAttribute("isInContentFullDisplay");
	}

	request.setAttribute(PortalManager.PORTAL_PUBLICATION, publication);
%>
<jsp:include page='<%= displayTemplate %>' flush="true" />

