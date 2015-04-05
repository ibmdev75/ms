<%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.Member"%><%
%><%@page import="com.jalios.jcms.JcmsConstants"%><%
%><%@page import="com.jalios.jcms.Size"%><%
%><%@page import="com.jalios.jcms.PhotoSize"%><%
%><%@page import="com.jalios.jcms.taglib.MemberPhotoTag"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Member photoMember = (Member) getIncludeObject("member", null);

//Photo wrapper attributes
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
Data linkData = (Data) getIncludeObject("linkData", null);
String title = "";
if(!photoMember.isPersisted()) {
  title = " title=\"" + encodeForHTMLAttribute(photoMember.getName() + " (" + photoMember.getEmail() + ")") + "\"";
}

//Size
Size size = (Size) getIncludeObject("size", null);
PhotoSize photoSize = (PhotoSize) getIncludeObject("photoSize", null);
String sizeProperty = getIncludeString("sizeProperty", null);
int width = Util.toInt(getIncludeString("width",null),-1);
int height = Util.toInt(getIncludeString("height",null),-1);

int thumbnailWidth = size != null ? size.getWidth() : width;
int thumbnailHeight = size != null ? size.getHeight() : height;

if  (thumbnailWidth < 10 || thumbnailHeight < 10 || thumbnailWidth > 2000 || thumbnailHeight > 2000) {
	//The maximum width and maximum height attributes of the thumbnail tag cannot be below 10 pixel or above 2000.
	return;
}

//Css
String classes = Util.notEmpty(css) ? " " + css.trim() : "";

// Fix JCMS-4040 : invalid display of member photo if image file is missing from filesystem
String memberPhotoRelativePath = "images/jalios/layout/silhouette.jpg";
if (Util.notEmpty(photoMember.getPhoto()) && (new File(channel.getRealPath(photoMember.getPhoto()))).exists()) {
  memberPhotoRelativePath = photoMember.getPhoto();
}

%>
<div class="<%= classes %>"<%= Util.notEmpty(title) ? title : "" %><%= Util.notEmpty(htmlAttributes) ? " " + htmlAttributes : "" %>>
	<jalios:thumbnail path='<%= memberPhotoRelativePath %>' width='<%= thumbnailWidth %>' height='<%= thumbnailHeight %>' alt='<%= photoMember.getFullName() %>' />
</div>