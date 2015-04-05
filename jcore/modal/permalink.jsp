<% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%
%><%@ include file="/jcore/doInitPage.jspf" %>
<jalios:modal css="modal-lg" title="ui.modal.permalink.title">
  <form role="form">
  
    <p><%= glp("ui.modal.permalink.intro","") %></p>
    
    <div id="permalink-value">
		  <jalios:field name="url" value='<%= getUntrustedStringParameter("defValue","") %>' resource="field-vertical">
		    <jalios:control type="<%= ControlType.URL %>" />
		  </jalios:field>
      <jalios:javascript>
        jQuery('#permalink-value INPUT[name=url]').select();
      </jalios:javascript>
	  </div>
  </form>
</jalios:modal>