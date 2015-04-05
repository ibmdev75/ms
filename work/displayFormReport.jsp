<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Generic display page for form report
  @Category: Internal
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

 request.setAttribute("formWAMenu", "true");
      
 String typeName = getAlphaNumParameter("type", null);
 if (typeName == null) {
   return;
 }
 
 // Validate type is a Form
 Class formClazz = null;
 try { formClazz = channel.getClass(typeName);} catch (Exception ex){/*EMPTY*/} 
 if (formClazz == null || !Form.class.isAssignableFrom(formClazz)) {
   return;
 }
 
 String formReport ="/types/" + typeName + "/do" + typeName + "Report.jsp"; 

%><%@ include file='/work/doWorkHeader.jspf' %><% 
%><jsp:include page="<%= formReport %>" flush="true"/><%
%><%@ include file='/work/doWorkFooter.jspf' %>