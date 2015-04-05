<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(isAdmin || isWSAdmin)) {
    sendForbidden(request, response);
    return;
  }
  
  request.setAttribute("title",glp("acl.acl-chooser.title"));
  request.setAttribute("zone","InternalUI");
  
  jcmsContext.addJavaScript("js/jalios/table.js");
  jcmsContext.addCSSHeader("css/jalios/acl.css");

  boolean showEditAcl = isAdmin;
  boolean showTitle = true;
  boolean showRadioInsert  = true;
  boolean showCheckInsert  = false;
  boolean showWorkspaceAclOnly = (isWSAdmin && !isAdmin) || getBooleanParameter("wsAcl", false);
  boolean showWorkspaceAclState = !showWorkspaceAclOnly;
  boolean showGroupCount  = true;
  boolean showMemberCount = true;
  boolean showDelete = false;
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<%@ include file='/work/doInsertLinkParams.jspf' %>
<%@ include file='/work/doInsertLinkPopup.jspf' %>
<div id='mainDiv' style='margin: 10px;'>

  <%@ include file='/admin/doAclList.jspf' %>
  
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
