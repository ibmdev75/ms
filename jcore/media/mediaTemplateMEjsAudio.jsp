<%--
  @Summary: Template used to display any audio file through MediaElement.js Player
--%><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

  int mejsplayerCounter = Util.toInt(request.getSession().getAttribute("mejsplayerAudioCounter"),0) + 1;
  request.getSession().setAttribute("mejsplayerAudioCounter", String.valueOf(mejsplayerCounter));
  String playerId = "mejsplayerAudio" + mejsplayerCounter;
  
  String options = channel.getProperty("media.template.mejs-audio.options", "");
  options = Util.getString(options, "{ pluginPath: '" + ServletUtil.getBaseUrl(request) + "js/lib/mejs/' }"); // absolute path required for fix JCMS-4419

  jcmsContext.addJavaScript("js/lib/mejs/mediaelement-and-player.js");
  jcmsContext.addCSSHeader("js/lib/mejs/mediaelementplayer.css");
%>
<div class="mejs-responsive-wrapper">
<audio id="<%= playerId %>" src="<%= mediaPath %>"
       style="width:100%;height:100%;" width="100%" height="100%"></audio>
</div>
<jalios:javascript>
jQuery('#<%= playerId %>').mediaelementplayer(<%= options %>);
</jalios:javascript>