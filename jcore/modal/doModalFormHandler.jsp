<%@ include file='/jcore/doInitPage.jspf' %><%@page import="com.jalios.jcms.handler.*"%><%
  JcmsFormHandler formHandler = (JcmsFormHandler) getIncludeObject("formHandler", null);

%><div class="ajax-refresh-div" data-jalios-ajax-refresh-url='<%= getIncludeString("url", ServletUtil.getUrlWithUpdatedParam(request,"csrftoken",null)) %>' <%= getIncludeString("htmlAttributes", "") %>>
	<form class="form-horizontal noSingleSubmitButton lang-trigger" name='modalForm' lang="<%= formHandler.getAvailableMainLanguage() %>" action='<%= getIncludeString("url","#") %>' method="post" role="form" accept-charset="UTF-8"  enctype="multipart/form-data">
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
		  <% if (Util.notEmpty(getIncludeString("MODAL_STEPS", null))){ %>
		    <%= getIncludeString("MODAL_STEPS", null) %>
	    <% } else { %>
		    <%@ include file='/jcore/doSteps.jspf' %>
	    <% } %>	    
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
	    	<% if (formHandler.getFormStepCount() < 2) { %>
	      <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
				<% } %>
	      <%-- TARGET --%>
	      <%= getIncludeString("MODAL_BUTTON", "") %><%
	      
	      %><%-- STEPS --%><%
	      %><%@ include file='/jcore/doStepButtons.jspf' %><%
	      %><%= formHandler.getFormStepHiddenFields() %>
	      
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