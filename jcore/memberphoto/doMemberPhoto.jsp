<%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.Member"%><%
%><%@page import="com.jalios.jcms.JcmsConstants"%><%
%><%@page import="com.jalios.jcms.Size"%><%
%><%@page import="com.jalios.jcms.PhotoSize"%><%
%><%@page import="com.jalios.jcms.taglib.MemberPhotoTag"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Member photoMember = (Member) getIncludeObject("member", null);

// Photo wrapper attributes
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
Data linkData = (Data) getIncludeObject("linkData", null);

// Size
Size size = (Size) getIncludeObject("size", null);
PhotoSize photoSize = (PhotoSize) getIncludeObject("photoSize", null);
String sizeProperty = getIncludeString("sizeProperty", null);
int width = Util.toInt(getIncludeString("width",null),-1);
int height = Util.toInt(getIncludeString("height",null),-1);

int thumbnailWidth = size != null ? size.getWidth() : width;
int thumbnailHeight = size != null ? size.getHeight() : height;

if (thumbnailWidth < 10 || thumbnailHeight < 10 || thumbnailWidth > 2000 || thumbnailHeight > 2000) {
	// The maximum width and maximum height attributes of the thumbnail tag cannot be below 10 pixel or above 2000.
	return;
}

String title = "";
boolean hasStatus = false;
int mbrStatus = -1;
// Css
StringBuilder classes = new StringBuilder();
classes.append("wrapper-photo ");
classes.append(Util.notEmpty(sizeProperty) ? sizeProperty + "-photo" : Util.getString(photoSize,"custom").toLowerCase() +"-photo");
if (photoMember.isContact()) {
  classes.append(" contact");
} else {
  classes.append(" account");
  // Status
  if (photoMember.isPersisted()) {
    hasStatus = true;
    mbrStatus = photoMember.getStatus();
    classes.append(" mbr-status mbr-status-" + mbrStatus);
  }
}
if (!photoMember.isPersisted()) {
  title = encodeForHTMLAttribute(photoMember.getName() + " (" + photoMember.getEmail() + ")");
  classes.append(" not-persisted");
}
// Add additional css classes
classes.append(Util.notEmpty(css) ? " " + css.trim() : "");

boolean link = Util.toBoolean(getIncludeObject("link",""),true);

// Fix JCMS-4040 : invalid display of member photo if image file is missing from filesystem
String memberPhotoRelativePath = "images/jalios/layout/silhouette.jpg";
if (Util.notEmpty(photoMember.getPhoto()) && (new File(channel.getRealPath(photoMember.getPhoto()))).exists()) {
  memberPhotoRelativePath = photoMember.getPhoto();
}
request.setAttribute("member-photo.member", photoMember);
request.setAttribute("member-photo.photo-size", photoSize);

%><jalios:buffer name="photoThumbnail"><%
  %><jalios:thumbnail path='<%= memberPhotoRelativePath %>'
                  width='<%= thumbnailWidth %>'
                  height='<%= thumbnailHeight %>'
                  alt='<%= photoMember.getFullName() %>' css='photo' /><%
%></jalios:buffer><%

%><div class="<%= classes %>"<%= Util.notEmpty(title) ? " title=\"" + title + "\"" : "" %><%= Util.notEmpty(htmlAttributes) ? " " + htmlAttributes : "" %>><%
if (photoMember.isPersisted() && link) {
  %><jalios:link data='<%= linkData != null ? linkData : photoMember %>'><%= photoThumbnail %></jalios:link><% 
} else { // Not persisted 
  %><%= photoThumbnail %><%
}
// Display additional image (contact icon, status icon) if the photo size isn't ICON
if (!PhotoSize.ICON.equals(photoSize)) {
  %><div class="photo-anchor"><%
    // Contact icon
    if (photoMember.isContact()) {
      %><jalios:icon css="jalios-icon contact-icon photo-icon-bottom-right" src='<%= PhotoSize.TINY.equals(photoSize) ? "mbr-contact" : "contact32" %>' /><%
    }
    // Target
    %><jalios:include target="MBR_PHOTO_ANCHOR" targetContext="inline" /><%
    
    // Status: account only + PhotoSize > TINY
    if (!PhotoSize.TINY.equals(photoSize) && hasStatus && Util.toBoolean(getIncludeObject("showStatus",null),true)) {
      %><jalios:icon src='<%= "mbr-status-" + mbrStatus %>' css="photo-icon-bottom-right mbr-status" title='<%= encodeForHTMLAttribute(glp("ui.com.alt.mbr.status." + mbrStatus)) %>' /><%
    }
  %></div><% 
}
%></div><%
request.removeAttribute("member-photo.photo-size");
request.removeAttribute("member-photo.member");
%>