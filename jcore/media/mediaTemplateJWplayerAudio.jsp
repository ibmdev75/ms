<%--
  @Summary: Template used to display any audio file through JW Player
--%><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

  int jwplayerCounter = Util.toInt(request.getSession().getAttribute("jwplayerAudioCounter"),0) + 1;
  request.getSession().setAttribute("jwplayerAudioCounter", String.valueOf(jwplayerCounter));
  String divId = "jwplayerAudio" + jwplayerCounter;

  String height = channel.getProperty("media.template.jwplayer-audio.height","25");
  String skin = channel.getProperty("media.template.jwplayer-audio.skin","");
  String licenseKey = channel.getProperty("media.template.jwplayer.license-key","");
  
  jcmsContext.addJavaScript("flash/lib/jwplayer.js");
%>
<div id="<%= divId %>"></div>
<jalios:javascript>
<% if (Util.notEmpty(licenseKey)) { %>
jwplayer.key = '<%= encodeForJavaScript(licenseKey) %>';
<% } %>
jwplayer('<%= divId %>').setup({
  base: "<%= encodeForJavaScript(ServletUtil.getBaseUrl(request)) %>flash/lib/",
  file:        "<%= encodeForJavaScript(ServletUtil.getBaseUrl(request) + mediaPath) %>",
  <% if (Util.notEmpty(skin)){ %>skin: '<%= ServletUtil.getBaseUrl(request) %><%= skin %>',<% } %>
  width: "100%",
  height: <%= height %>,
  controlbar: 'bottom',
  allowfullscreen: true
});
</jalios:javascript>