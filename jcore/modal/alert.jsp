<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ include file="/jcore/doInitPage.jspf" %>
<jalios:modal css="modal-sm">
  <h3><jalios:icon src="error" /><%= glp("ui.com.lbl.alert") %></h3>
  <p><%= getUntrustedStringParameter("msg","") %></p>
</jalios:modal>