<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/dev/store-cleaner")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.StoreCleanerHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

request.setAttribute("title", glp("ui.adm.mn.dev.store-cleaner"));  
request.setAttribute("cleanerSubAdminMenu", "true"); 

%><%@ include file="/admin/doAdminHeader.jspf" %>
<div class="page-header"><h1><%= glp("ui.adm.mn.dev.store-cleaner") %></h1></div>
<%
 if (channel.isJSyncEnabled()) { 
  setWarningMsg(glp("msg.adm.cleaner.forbidden"), request);
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
 } else {
%>
<%@ include file='/jcore/doMessageBox.jspf' %>

<form name="editForm" action="admin/storeCleaner.jsp" method="post">
  <jalios:message msg="ui.adm.cleaner.info" title="" />
  
  <jalios:accordion multiOpen="true">
  <%@ include file='/admin/storeCleaner_scope.jspf' %>
  <%@ include file='/admin/storeCleaner_rules.jspf' %>
  </jalios:accordion>

  <%-- ** BUTTONS ********************** --%>
  <input type='hidden' name='action' value='true' />
  <input class='btn btn-danger confirm modal' 
         type="submit" 
         name="opClean" 
         value='<%= glp("ui.adm.cleaner.btn.clean") %>' 
         <%= channel.isJSyncEnabled() ? "disabled='disabled'" : "" %>  
         />

</form>
<% } %>
<%@ include file="/admin/doAdminFooter.jspf" %>