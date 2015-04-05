<%--
  @Summary: Template used to display any video file through JW Player
--%><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

  int jwplayerCounter = Util.toInt(request.getSession().getAttribute("jwplayerCounter"),0) + 1;
  request.getSession().setAttribute("jwplayerCounter", String.valueOf(jwplayerCounter));
  String divId = "jwplayer" + jwplayerCounter;

  String skin = channel.getProperty("media.template.jwplayer-video.skin","");
  String licenseKey = channel.getProperty("media.template.jwplayer.license-key","");
  
  // Use responsive layout when default MediaTag size was used
  // otherwise use the explicit size received with a 4/3 ratio
  // known caveat : generated thumbnail does not follow the responsive layout dimension&ratio
  final boolean useResponsive = (maxWidth == 320 && maxHeight == 240);
  int width = maxWidth;
  int height = (width * 3) / 4;
  // ensure multiple of 2 for correct handling of flv thumbnail by ffmpeg: 
  width = (int) (Math.floor(width/2) * 2);
  height = (int) (Math.floor(height/2) * 2);
  
  String preview = "";
  if (fileDoc != null) {
    File previewImageFile = ThumbnailTag.createThumbnail(fileDoc, null, null, null, width, height);
    if (previewImageFile != null) {
      preview = ServletUtil.getBaseUrl(request) + channel.getRelativePath(previewImageFile);
    }
  }

  jcmsContext.addJavaScript("flash/lib/jwplayer.js");
%>
<div id="<%= divId %>"></div>
<jalios:javascript>
<% if (Util.notEmpty(licenseKey)) { %>
jwplayer.key = '<%= encodeForJavaScript(licenseKey) %>';
<% } %>
jwplayer('<%= divId %>').setup({
  base: "<%= encodeForJavaScript(ServletUtil.getBaseUrl(request)) %>flash/lib/",
  file:        "<%= encodeForJavaScript(ServletUtil.getBaseUrl(request) + mediaPath) %>",<%
 if (useResponsive) {  %>
  width: "100%",
  aspectratio: "<%= channel.getProperty("media.template.jwplayer-video.responsive-aspectratio", "16:9") %>", <%
 } else { %>
  width:       <%= width %>,
  height:      <%= height %>, <%
 } %>
  <% if (Util.notEmpty(skin)){ %>skin: '<%= ServletUtil.getBaseUrl(request) %><%= skin %>',<% } %>
  <% if (Util.notEmpty(preview)){ %>image: '<%= preview %>',<% } %>
  controlbar: 'bottom',
  allowfullscreen: true
});
</jalios:javascript>