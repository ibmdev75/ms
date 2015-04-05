<%
  // Kludge workardound to check if this JSP is invoked for the logout message
  // in this case, do not perform CSRF check to prevent failure if session has expired
  final String logoutMsg = JcmsUtil.glp(Util.getString(request.getAttribute("userLang"), channel.getLanguage()),"ui.com.alt.logout.confirm");
  String msg = getUntrustedStringParameter("msg","");
  boolean isLogout = msg != null && msg.equals(logoutMsg);
  if (!isLogout) {
    request.setAttribute("CheckCSRF", Boolean.TRUE);
  }
  
  // untranslatedZoneAttribute
  
%><%@ include file="/jcore/doInitPage.jspf" %>
<jalios:modal css="modal-md modal-confirm">
  <h3><%= glp("ui.com.lbl.confirm") %></h3>
  <p><%= getUntrustedStringParameter("msg",Util.getString(request.getAttribute("msg"),glp("js.msg.js.confirm"))) %></p>
  
  <jalios:buffer name="MODAL_BUTTONS">
    <button type="button" class="btn btn-default" onclick="jQuery.jalios.ui.Modal.close(false);"><%= glp("ui.com.btn.close") %></button>
    <button type="button" class="btn btn-primary" onclick="jQuery.jalios.ui.Modal.closeAndFollow(true);"><%= glp("ui.com.btn.ok") %></button>
  </jalios:buffer>  
</jalios:modal>