<%--
	@Summary: ArchivedPublication FullDisplay, retrieve and display content's saved html
	@Category: Archive
	@Author: Oliver Jaquemet
	@Copyright: Jalios SA
	@Customizable: False
	@Requestable: False
	@Deprecated: False
	@Since: jcms-5.0.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  ArchivedPublication pub = (ArchivedPublication)request.getAttribute("publication");
  String archiveHtmlPath = pub.getSavedHtmlPath(userLang);
%>
<div>
<jalios:if predicate="<%= Util.notEmpty(archiveHtmlPath) %>">
  <jalios:include file='<%= "/" + archiveHtmlPath %>' />
</jalios:if>
</div> 
