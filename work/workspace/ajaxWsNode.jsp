<%@ include file='/jcore/doInitPage.jspf' %><%
  if (loggedMember == null) {
    sendForbidden(request, response);
    return;
  }
  Workspace ws = getWorkspaceParameter("wsnode");
  if (Util.isEmpty(ws)) {
    return;
  }
  
  TreeHelper.WSTreeMemo treeMemo = (TreeHelper.WSTreeMemo)jcmsContext.getAjaxRequestAttribute(TreeHelper.AJAXATTRIBUTEKEY_WSTREEMEMO);
  if (treeMemo == null) {
    logger.info("ajaxWsNode.jsp is called and treeMemo is null. Check that body id attribute is used by AjaxRequestId");
    return;
  }  
  
  Workspace selectedWorkspace = treeMemo.getSelectedWorkspace();
  boolean isAncestorOfSelectedWS = false;
  if (selectedWorkspace != null) {
    Set<Workspace> allSubWorkspace = ws.getAllSubWorkspaces();
    isAncestorOfSelectedWS = Util.notEmpty(selectedWorkspace) &&  ( selectedWorkspace.equals(ws) || 
        (Util.notEmpty(allSubWorkspace) && allSubWorkspace.contains(selectedWorkspace)));
  }
  boolean open = getBooleanParameter("open", isAncestorOfSelectedWS);
  TreeHelper.printWSNodeContent(ws, treeMemo, jcmsContext, out, open); 
%><%@ include file='/jcore/doAjaxFooter.jspf' %>