<%--
  @Summary: Template used to display any video file through MediaElement.js Player
--%><%@ page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

  int mejsplayerCounter = Util.toInt(request.getSession().getAttribute("mejsplayerCounter"),0) + 1;
  request.getSession().setAttribute("mejsplayerCounter", String.valueOf(mejsplayerCounter));
  String playerId = "mejsplayer" + mejsplayerCounter;

  String options = channel.getProperty("media.template.mejs-video.options", "");
  options = Util.getString(options, "{ pluginPath: '" + ServletUtil.getBaseUrl(request) + "js/lib/mejs/' }"); // absolute path required for fix JCMS-4419
  
  // Always use responsive, unless specified otherwise for current browser
  boolean useResponsive = channel.getBooleanProperty("media.template.mejs.use-responsive.browser-" + clientBrowser.getBrowserShortName(), true);
  
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
  
  jcmsContext.addJavaScript("js/lib/mejs/mediaelement-and-player.js");
  jcmsContext.addCSSHeader("js/lib/mejs/mediaelementplayer.css");

  String mediaUrl = mediaPath;
  String previewUrl = preview;

  // Use "http://www.example.com/upload/doc/filename.ext" instead of just "upload/doc/filename.ext" ?
  boolean useAbsoluteUrl = channel.getBooleanProperty("media.template.mejs.use-absolute-url", true);
  if (useAbsoluteUrl) {
    mediaUrl = ServletUtil.getBaseUrl(request) + mediaPath;
  }

  // Add authkey for private site or private document, to ensure plugin can download the file
  // without access to the browser session
  boolean useAuthKey = useAbsoluteUrl && (channel.isAuthenticationRequired() || !(fileDoc != null && fileDoc.isPublic())) &&
                       channel.getBooleanProperty("media.template.mejs.use-auth-key", true);
  if (useAuthKey) {
    mediaUrl = AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(mediaUrl, loggedMember);
    previewUrl = Util.isEmpty(previewUrl) ? previewUrl : AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(previewUrl, loggedMember);
  }

%>
<% if (useResponsive) { %><div class="mejs-responsive-wrapper"><% } %>
<video id="<%= playerId %>" src="<%= mediaUrl %>" preload="none" controls="controls"  <%
    %> width="<%= width %>" height="<%= height %>" <%
  if (useResponsive) {
    %> style="width:100%;height:100%;" <%
  }
  if (Util.notEmpty(previewUrl)){ %> poster="<%= previewUrl %>" <% } %>></video>
<% if (useResponsive) { %></div><% } %>
<jalios:javascript>
jQuery('#<%= playerId %>').mediaelementplayer(<%= options  %>);
</jalios:javascript>
