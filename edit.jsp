<%--
  @Summary: Generic Editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
String id = getDataIdParameter("id");
Data data = channel.getData(id);
if (data != null) {
  String target = null;
  
  String queryString = ServletUtil.getQueryString(request, false);
  target = ResourceHelper.getSpecificEdit(data);
  target = (target != null) ? target + "?" + queryString : null; 
  if (target != null) {
    sendRedirect(target, request, response);
    return;
  }
}

if (data != null) {

  // Delete
  if (hasParameter("opDelete")) {
    ControllerStatus status = data.checkDelete(loggedMember);
    if (status.hasFailed()) {
      setWarningMsg(status.getMessage(userLang), request);
    } else {
      data.performDelete(loggedMember);
      String redirect = getValidHttpUrl("redirect");
      if (Util.notEmpty(redirect)) {
        sendRedirect(ServletUtil.decodeURL(redirect), request, response);
      }
      else {
        setInfoMsg("Object " + id + "(" + data +  ") has been deleted.", request);
      }
    }
    
  }
  setWarningMsg("There is no editor for the data bound to ID '" + id + "' (class=" + data.getClass().getName() +").", request);
} else {
  setWarningMsg("There is no data bound to ID '" + id + "'.", request);
}
%>
<%@ include file='/work/doWorkHeader.jspf' %>
<p>&nbsp;</p>
<%@ include file='/jcore/doMessageBox.jspf' %>
<p>&nbsp;</p>
<%@ include file='/work/doWorkFooter.jspf' %>

