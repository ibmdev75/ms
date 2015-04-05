<%--
  @Summary: Common result display page
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  // Improvement JCMS-2476 : Take into account the "jcms.resource.default-template.query" resource if it is specified
  String currentTemplateUsage = jcmsContext.getTemplateUsage();
  String defaultQueryTemplate = channel.getProperty("jcms.resource.default-template.query", "");
  if (TypeTemplateEntry.USAGE_DISPLAY_QUERY.equals(currentTemplateUsage) &&
      Util.notEmpty(defaultQueryTemplate) && !"custom/jcms/doResultDisplay.jsp".equals(defaultQueryTemplate)) {
    %><jsp:include page='<%= "/" + defaultQueryTemplate %>' flush="true" /><%
    return;
  }

  Publication obj = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  if (obj == null){
    obj = (Publication) request.getAttribute("PortalElement");
  }

  PortalInterface reqPortal = getDataParameter("portal", PortalInterface.class);

  // displayURLparams must be used in <jalios:url>/<jalios:link> to
  // propagate JCMS behavior (portlet options, highligth params, etc)
  String displayURLparams = (String)request.getAttribute("displayURLparams");
%>
<div class="search-result media <%= Util.getClassShortName(obj) %> MID_<%= obj.getAuthor().getId() %>">

  <div class="search-result-header">
    <jalios:include target="RESULTDISPLAY_HEADER" />
    <h3>
      <jalios:link data='<%= obj %>' params='<%= displayURLparams %>'>
        <jalios:dataicon data="<%= obj %>" />
        <%= obj.getTitle(userLang) %>
      </jalios:link>
      <jalios:edit pub="<%= obj %>" popup='<%= Util.toBoolean(request.getAttribute("result-display.edit.popup"), true) %>' />
    </h3>
  </div>

  <% if (obj instanceof FileDocument) { %>
    <jalios:thumbnail css="pull-left img-thumbnail search-result-thumbnail" fileDoc="<%= (FileDocument)obj %>" width='<%= JcmsConstants.THUMBNAIL_LARGE_WIDTH %>' height='<%= JcmsConstants.THUMBNAIL_LARGE_HEIGHT %>'/>
  <% } else if (obj instanceof WebPage && Util.notEmpty(channel.getProperty("tag.thumbnail.thumbshot.url"))) { %>
    <jalios:thumbnail css="pull-left img-thumbnail search-result-thumbnail" url="<%= Util.getString(((WebPage)obj).getUrlToShot(), ((WebPage)obj).getUrl()) %>" width='<%= JcmsConstants.THUMBNAIL_LARGE_WIDTH %>' height='<%= JcmsConstants.THUMBNAIL_LARGE_HEIGHT %>'><jalios:icon src="image" /></jalios:thumbnail>
  <% } else if (Util.notEmpty(obj.getDataImage())) { %>
    <jalios:thumbnail css="pull-left img-thumbnail search-result-thumbnail" path="<%= obj.getDataImage() %>" width='<%= JcmsConstants.THUMBNAIL_LARGE_WIDTH %>' height='<%= JcmsConstants.THUMBNAIL_LARGE_HEIGHT %>'><jalios:icon src="image" /></jalios:thumbnail>
  <% } %>

  <div class="search-result-body media-body">
    <% { %>
      <% Publication pub = obj; %>
      <%@ include file="/front/publication/doPublicationAbstract.jspf" %>
    <% } %>

    <%@ include file="/custom/jcms/doResultDisplayMetadata.jspf" %>
  </div>
  <jalios:include target="RESULTDISPLAY_FOOTER" />
</div>