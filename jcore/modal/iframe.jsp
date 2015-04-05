<% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%@ include file="/jcore/doInitPage.jspf" %>
<div>
	<div class='modal-body modal-iframe' style="width: 792px; height: 594px; overflow: hidden; padding: 0;">
	  <iframe src="<%= getUntrustedStringParameter("url","") %>" class="ajax-lazy-chunk" frameborder="0" width="100%" height="100%" style="align: center;"></iframe>
	</div>
	<div class='modal-footer'>
	  <input name='Ok' type='button' class='btn btn-primary' value="<%= glp("ui.com.btn.close") %>" data-dismiss="modal" />
	</div>
</div>