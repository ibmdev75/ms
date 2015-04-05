<%
 request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

Publication pub = getPublicationParameter("id");
if (pub != null && pub.getLockDate() != null) {
  // unlock only if lock is older than 1 s (to avoid 
  // stange behavior in load order on some browser)
  if (System.currentTimeMillis() - pub.getLockDate().getTime() > 1000) { 
    pub.unlock(loggedMember);
  } 
}
%>
<html><script>top.close()</script></html>
