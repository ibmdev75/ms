<%@page import="java.io.*"%><%
%><%@page import="com.jalios.jcms.handler.*"%><%
// inform doInitPage to set the proper content type
Member mbr = getMemberParameter("mbrId");
String extension = getUntrustedStringParameter("extension","jpg");

if (mbr == null) {
	return;
}

File file = EditMemberPhotoHandler.getTempImage(mbr,extension);

if (file == null) {
	return;
}

response.setContentLength((int)file.length());
request.setAttribute("ContentType", "image/jpeg");
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
	return;
}

out.clear();
EditMemberPhotoHandler.displayImage(response.getOutputStream(),file);
%>