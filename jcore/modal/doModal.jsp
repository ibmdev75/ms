<%@ include file='/jcore/doInitPage.jspf' %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url='<%= getIncludeString("url","#") %>' <%= getIncludeString("htmlAttributes", "") %>>
  <div class='modal-dialog <%= getIncludeString("css","modal-lg") %>'>
    <div class="modal-content">
      <% if (Util.notEmpty(getIncludeString("title",""))) { %>
      <div class="modal-header">
        <div class="modal-title" id="modalLabel">
          <%= glp(getIncludeString("title","")) %>
          <jalios:icon src='<%= getIncludeString("picture", null) %>' css="modal-picture pull-right"/>
        </div>
      </div>
      <% } %>
      <% if (Util.notEmpty(getIncludeString("MODAL_CONTENT", null))) { %>
        <%= getIncludeString("MODAL_CONTENT", null) %>
      <% } else { %>
        <div class="modal-body">
          <%@ include file='/jcore/doMessageBox.jspf' %>
          <%= getIncludeBody() %>
        </div>
        <div class="modal-footer">
          <% if (Util.notEmpty(getIncludeString("MODAL_BUTTONS", null))) { %>
            <%= getIncludeString("MODAL_BUTTONS", null) %>
          <% } else { %>
            <% String onClose = Util.notEmpty(getIncludeString("button", null)) ? "onclick=\"jQuery.jalios.ui.Modal.closeAndFollow(false);\"" : "data-dismiss=\"modal\""; %>
            <button type="button" class="btn btn-default" <%= onClose %>><%= glp("ui.com.btn.close") %></button>            
            
            <%= getIncludeString("MODAL_BUTTON", "") %>
            
            <% if (Util.notEmpty(getIncludeString("button",null))) { %>
            <button type="button" class="btn btn-default" onclick="jQuery.jalios.ui.Modal.closeAndFollow(true);" value="true"><%= glp(getIncludeString("button", null)) %></button>
            <% } %>
        </div>
      <% } %>
    <% } %>
    </div>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>