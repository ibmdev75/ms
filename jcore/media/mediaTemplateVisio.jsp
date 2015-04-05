<%--
  @Summary: Template used to display images
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><object classid="clsid:279D6C9A-652E-4833-BEFC-312CA8887857" 
        id="VisioViewer" type="application/x-visio"
        width="<%= channel.getProperty("media.template.default.application/x-visio.width", "100%") %>" 
        height="<%= channel.getProperty("media.template.default.application/x-visio.height", "600") %>"
        >
  <param name="SRC"                   value="<%= channel.getUrl() %><%= mediaPath %>">
  <param name="AlertsEnabled"         value="1">
  <param name="ContextMenuEnabled"    value="1">
  <param name="GridVisible"           value="0">
  <param name="HighQualityRender"     value="1">
  <param name="PageVisible"           value="1">
  <param name="PropertyDialogEnabled" value="1">
  <param name="ScrollbarsVisible"     value="1">
  <param name="ToolbarVisible"        value="1">
  <param name="CurrentPageIndex"      value="1">
  <param name="Zoom"                  value="-1">
</object>
<%-- See http://msdn.microsoft.com/en-us/library/office/ff769945.aspx --%>