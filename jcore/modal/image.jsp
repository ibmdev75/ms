<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ include file="/jcore/doInitPage.jspf" %>
<jalios:modal css="modal-lg text-center">
	<img src="<%= encodeForHTMLAttribute(getUntrustedStringParameter("url","")) %>" class="ajax-lazy-chunk" style="max-width: 100%; max-height: 100%;" alt="" />
</jalios:modal>