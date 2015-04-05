<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ include file="/jcore/doInitPage.jspf" %>
<jalios:modal css="modal-md">
  <form class="form-horizontal" role="form">
  
    <p><%= getUntrustedStringParameter("msg","") %></p>
    <div id='prompt-value'>
		  <jalios:field  name='<%= "value" %>' required='<%= true %>' value='<%= getUntrustedStringParameter("defValue","") %>' resource='field-vertical'>
		    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
		  </jalios:field>
	  </div>
	  
    <%-- <jalios:include jsp="debug/debugFormField.jsp" />  --%>

	  <jalios:buffer name='MODAL_BUTTONS'>
	    <button type="button" class="btn btn-default" onclick="jQuery.jalios.ui.Modal.close(false);"><%= glp("ui.com.btn.close") %></button>
	    <button type="button" class="btn btn-primary" onclick="jQuery.jalios.ui.Modal.closeAndFollow(jQuery('#prompt-value INPUT').val());"><%= glp("ui.com.btn.ok") %></button>
	  </jalios:buffer>
  </form>
</jalios:modal>