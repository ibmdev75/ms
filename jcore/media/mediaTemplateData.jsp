<%--
  @Summary: Template used to display any Data preview
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

 String dataURL = fileDoc != null ? fileDoc.getFilename() : data.getDisplayUrl(userLocale);
 
 // Display something only if it has a change not to be the generic thumbnail
 if ((fileDoc == null && Util.notEmpty(data.getDataImage())) || (fileDoc != null && fileDoc.supportsThumbnail())) {
   %><a href="<%= dataURL %>" title="<%= HttpUtil.encodeForHTMLAttribute(data.getDataName(userLang)) %>"><%
    %><jalios:thumbnail data='<%= data %>' format='jpeg' css='img-thumbnail'
                       width='<%= maxWidth %>' height='<%= maxHeight %>' alt='<%= mediaDescription %>'><%
     %><jalios:icon src="<%= data.getGenericThumbnail() %>" alt='<%= encodeForHTMLAttribute(mediaDescription) %>' /><%
    %></jalios:thumbnail><%
   %></a><%
 }
%>