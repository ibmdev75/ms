<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/admin/doAdminHeader.jspf" %>
<%
WorkflowManager wfMgr = WorkflowManager.getInstance();
Workflow wf = wfMgr.getWorkflow(getStringParameter("wf", null, "\\w+"));
if (Util.isEmpty(wf)) {
  logger.info("Bad WF value");
  return;
}

int pstatus = getIntParameter("pstatus", Integer.MIN_VALUE);
if (pstatus == Integer.MIN_VALUE) {
  logger.info("Bad pstatus value");
  return;  
}

int newPstatus = getIntParameter("value", Integer.MIN_VALUE);
if (newPstatus == Integer.MIN_VALUE) {
  logger.info("Bad newPstatus value");
  return;  
}


logger.info("Convert wf=" + wf.getId() + " pstatus=" + pstatus + " newPstatus=" + newPstatus);
int count = wfMgr.convertPstatus(wf, pstatus, newPstatus, null);
String msg = count + " publications have been updated";
logger.info(msg);
jcmsContext.setInfoMsgSession(msg);

sendRedirect("admin/tools/checkWFVisibilityIssue.jsp");
%>
<%@ include file="/admin/doAdminFooter.jspf" %>
