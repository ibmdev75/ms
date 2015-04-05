<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  Publication obj = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  if (obj == null){
    obj = (Publication) request.getAttribute("PortalElement");
  }
  if (obj == null){
    // JCMS-3398: Prevent display of NPE
    logger.warn("doDisplay.jsp: no Publication was retrieved. Redirect to index.jsp. Url was: " + ServletUtil.getUrl(request));
    sendRedirect("index.jsp");
    return;
  }
  
  // displayURLparams must be used in <jalios:url>/<jalios:link> to
  // propagate JCMS behavior (portlet options, highligth params, etc)
  String displayURLparams = (String)request.getAttribute("displayURLparams");
%>

<h3>
<jalios:link data='<%= obj %>' params='<%= displayURLparams %>'>
  <% /* %>Title<% */ %><%= obj.getTitle(userLang) %>
  <jalios:edit pub="<%= obj %>" />
</jalios:link>
</h3>

<div class="abstract" <%= JcmsUtil.getFieldLangAttributes(obj, "abstract", userLang) %>>
	<jalios:if predicate="<%= Util.notEmpty(obj.getAbstract(userLang)) %>">
	  <% /* %>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh 
	  euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
	  enim ad minim veniam, quis nostrud exercitation ulliam corper suscipit 
	  lobortis nisl ut aliquip ex ea commodo consequat. Duis autem veleum iriure 
	  dolor in hendrerit in vulputate velit esse molestie consequat, vel willum 
	  lunombro dolore eu feugiat nulla facilisis at vero eros et accumsan et 
	  iusto odio dignissim qui blandit praesent luptatum zzril delenit augue
	  duis dolore te feugait nulla facilisi.<% */ %>
	  
	  <%
	  TypeFieldEntry tfe = channel.getTypeAbstractFieldEntry(obj.getClass());
	  if (tfe != null && tfe.isWysiwyg()){ %>
	    <jalios:wysiwyg><%= obj.getAbstract(userLang) %></jalios:wysiwyg>
	  <% } else { String truncateSuffix = "...&nbsp;<a href='" + JcmsUtil.getDisplayUrl(obj, userLocale) + "'>" + glp("ui.com.txt.read-more") + "</a>"; %>
	  <jalios:wiki truncateLength="400" truncateSuffix='<%= truncateSuffix %>'><%= obj.getAbstract(userLang) %></jalios:wiki>
	  <% } %>
	  
	</jalios:if>
</div>