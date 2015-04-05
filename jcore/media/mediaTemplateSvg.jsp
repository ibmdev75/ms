<%--
  @Summary: Template used to display images
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><object data="<%= mediaPath %>" 
          width="<%= channel.getProperty("media.template.default.image/svg-xml.width", "100%") %>" 
          height="<%= channel.getProperty("media.template.default.image/svg-xml.height", "600") %>"
          type="image/svg+xml"></object>
