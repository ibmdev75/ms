<%--
  @Summary: Template used to display video using Windows Media Player (aka wmp)
--%><%@ page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

  int wmpPlayerCounter = Util.toInt(request.getSession().getAttribute("wmpPlayerCounter"),0) + 1;
  request.getSession().setAttribute("wmpPlayerCounter", String.valueOf(wmpPlayerCounter));
  String objectId = "wmpPlayer" + wmpPlayerCounter;
  
  int width = maxWidth;
  int height = (width * 3) / 4;
  // ensure multiple of 2 for correct handling of thumbnail by ffmpeg thumbnail generator : 
  width = (int) (Math.floor(width/2) * 2);
  height = (int) (Math.floor(height/2) * 2);
  
  String preview = "";
  if (fileDoc != null) {
    File previewImageFile = ThumbnailTag.createThumbnail(fileDoc, null, null, null, width, height);
    if (previewImageFile != null) {
      preview = ServletUtil.getBaseUrl(request) + channel.getRelativePath(previewImageFile);
    }
  }

  String wmpCLSID = channel.getProperty("media.template.wmp.clsid", "CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95");
  String wmpCodebase = channel.getProperty("media.template.wmp.codebase", "http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701");
  String wmpObjectType = channel.getProperty("media.template.wmp.object-type", "application/x-oleobject");
  String wmpObjectAttributes = channel.getProperty("media.template.wmp.object-attributes", "");
  String wmpObjectParams = channel.getProperty("media.template.wmp.object-params", "");
  String embedAttributes = channel.getProperty("media.template.wmp.embed.attributes", channel.getProperty("media.template.embed.attributes",""));
  String mediaUrl = ServletUtil.getBaseUrl(request) + mediaPath;
  boolean useAuthKey = (channel.isAuthenticationRequired() || !(fileDoc != null && fileDoc.isPublic())) && 
                       channel.getBooleanProperty("media.template.wmp.use-auth-key", true);
  if (useAuthKey) {
    mediaUrl = AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(mediaUrl, loggedMember);
  }

%>
<object classid="<%= wmpCLSID %>" codebase="<%= wmpCodebase %>" type="<%= wmpObjectType %>"  
        id="<%= objectId %>" height="<%= height %>" width="<%= width %>" <%= wmpObjectAttributes %>>
  <param name="Filename" value="<%= mediaUrl %>">
  <%= wmpObjectParams %>
  <embed src="<%= mediaUrl %>" width="<%= width %>" height="<%= height %>" <%= embedAttributes %> />
</object>