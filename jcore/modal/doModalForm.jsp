<%@ include file='/jcore/doInitPage.jspf' %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url='<%= getIncludeString("url", ServletUtil.getUrlWithUpdatedParam(request,"csrftoken",null)) %>' <%= getIncludeString("htmlAttributes", "") %>>
	<form class="form-horizontal noSingleSubmitButton lang-trigger" name='modalForm' action='<%= getIncludeString("url","#") %>' method="post" role="form" accept-charset="UTF-8"  enctype="multipart/form-data">
	<div class='modal-dialog <%= getIncludeString("css","modal-lg") %>'>
	  <div class="modal-content">
	  <% if (Util.notEmpty(getIncludeString("title",""))){ %>
	    <div class="modal-header">
		    <jalios:icon src='<%= getIncludeString("picture", null) %>' css="modal-picture pull-right"/>
		    <div class="modal-title" id="modalLabel"><%= glp(getIncludeString("title","")) %></div>
	    </div>
	    <% } %>
	    <% if (Util.notEmpty(getIncludeString("MODAL_CONTENT", null))){ %>
	      <%= getIncludeString("MODAL_CONTENT", null) %>
	    <% } else { %>
	    <% if (Util.notEmpty(getIncludeString("MODAL_MENU", null))){ %>
	      <%= getIncludeString("MODAL_MENU", null) %>
	    <% } %>
	    <div class="modal-body container-fluid">
	      <%@ include file='/jcore/doMessageBox.jspf' %>
	      <%= getIncludeBody() %>
	    </div>
	    <div class="modal-footer">
	    <% if (Util.notEmpty(getIncludeString("MODAL_BUTTONS", null))){ %>
	      <%= getIncludeString("MODAL_BUTTONS", null) %>
	    <% } else { %>
          <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
          
	      <%-- TARGET --%>
	      <%= getIncludeString("MODAL_BUTTON", "") %>

	      <%-- DEFAULT --%>
	      <% if (Util.notEmpty(getIncludeString("op", null))) { %>
	      <button type="submit" class="btn btn-primary ajax-refresh plupload-submit" name='<%= getIncludeString("op","") %>' value="true"><%= glp(getIncludeString("button", null)) %></button>
	      <% } %>
	    <% } %>
	    </div>
	    <% } %>
	  </div>
	</div>
	</form>
	<%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>