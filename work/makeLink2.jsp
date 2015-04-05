<%--
  @Summary: Invoked by "doEdit_Type.jsp" to link a publication that has just been created to an existing one.
  @Copyright: Jalios SA
  @Customizable: False
  @Deprecated: False
  @Since: jcms-4.0.2
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

   String fieldId    = getChooserParameter("fieldId");
   String formWidget = getChooserParameter("formWidget");
   String formName   = getChooserParameter("formName");
   String pos        = getChooserParameter("pos");
   Publication pub   = getPublicationParameter("id");   
   String id         = pub != null ? pub.getId() : "";
   String title      = pub != null ? pub.getTitle(userLang) : "";
   request.setAttribute("title","Make Links"); 
   request.setAttribute("zone","InternalUI");
   
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<jalios:javascript>
<% if (fieldId != null) { %>
  window.opener.jQuery('#<%= encodeForJavaScript(fieldId) %>').val('<%= encodeForJavaScript(title)%>')
   .next().val('<%= encodeForJavaScript(id) %>');
  window.close();
<% } else if (formWidget != null){ %>
  fillOpenerField(window, 
                  window.opener.document.<%= formName %>, 
                  "<%= encodeForJavaScript(formWidget) %>", 
                  <%= encodeForJavaScript(pos) %>, 
                  "<%= encodeForJavaScript(id) %>", 
                  "<%= encodeForJavaScript(title) %>");
<% } else { %>
  Popup.callback("<%= encodeForJavaScript(id) %>","<%= encodeForJavaScript(title) %>");
  window.close();
<% } %>
</jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>