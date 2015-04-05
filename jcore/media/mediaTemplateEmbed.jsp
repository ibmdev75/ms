<%--
  @Summary: Template used to display flv video
--%><%@ page import="com.jalios.io.IOUtil" %><%
%><%@ page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

  String mediaContentType = FileDocument.getRealContentType(null, IOUtil.getExtension(mediaPath));

 String width = String.valueOf( maxWidth );
 String height = String.valueOf( (maxWidth * 3) / 4 );

 // Allow default MediaTag size to be overrided by properties, on a per mime type basis
 final boolean isDefaultTagSize = (maxWidth == 320 && maxHeight == 240);
 if (isDefaultTagSize) {
   width = channel.getProperty("media.template.default."+mediaContentType+".width", width);
   height = channel.getProperty("media.template.default."+mediaContentType+".height", height);
 }
 
 String mediaUrl = mediaPath;
 
 // Use "http://www.example.com/upload/doc/filename.ext" instead of just "upload/doc/filename.ext" ?
 boolean useAbsoluteUrl = channel.getBooleanProperty("media.template.embed.use-absolute-url", true);
 if (useAbsoluteUrl) {
   mediaUrl = ServletUtil.getBaseUrl(request) + mediaPath;
 }
 
 // Add authkey for private site or private document, to ensure plugin can download the file
 // without access to the browser session
 boolean useAuthKey = useAbsoluteUrl && (channel.isAuthenticationRequired() || !(fileDoc != null && fileDoc.isPublic())) && 
                      channel.getBooleanProperty("media.template.embed.use-auth-key", true);
 if (useAuthKey) {
   mediaUrl = AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(mediaUrl, loggedMember);
 }
 
 String embedAttributes = channel.getProperty("media.template.embed.attributes","");
 
%><object data="<%= mediaUrl %>" width="<%= width %>" height="<%= height %>" type="<%= mediaContentType %>">
  <embed src="<%= mediaUrl %>" width="<%= width %>" height="<%= height %>" <%= embedAttributes %>/>
</object>


