<%@ include file='/jcore/doInitPage.jspf'%>
<%
  String msg = getIncludeString("msg", null);
  String title = (String) getIncludeObject("title", null); // Call getIncludeObject instead of getIncludeString to allow empty string
  MessageLevel level = (MessageLevel) getIncludeObject("level", MessageLevel.INFO);
  boolean dismissable = Util.toBoolean(getIncludeObject("dismissable", true), true);

  String titleString;
  StringBuilder classesStringBuilder = new StringBuilder("jcms-message alert no-focus ");
  switch (level) {
    case SUCCESS:
      classesStringBuilder.append("alert-success");
      titleString = "msg.message-box.success";
      break;
    case INFO:
      classesStringBuilder.append("alert-info");
      titleString = "msg.message-box.info";
      break;
    case WARN:
      classesStringBuilder.append("alert-warning");
      titleString = "msg.message-box.warning";
      break;
    case ERROR:
      classesStringBuilder.append("alert-danger");
      titleString = "msg.message-box.error";
      break;
    default:
      classesStringBuilder.append("alert-info");
      titleString = "msg.message-box.info";
      break;
  }
  
  classesStringBuilder.append(" ").append(getIncludeString("css", ""));

  // String closeButton = "<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>";
  String closeButton = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>";
  
  title = title != null ? title : titleString;
%>
<div class="<%= classesStringBuilder.toString() %>">
  <%= dismissable ? closeButton : "" %>
  <% if (!title.isEmpty()) { %>
  <div class="jcms-message-title"><%= glp(title) %></div>
  <% } %>
  <% if(msg != null) { %>
    <p class="jcms-message-body"><%= glp(msg) %></p>
  <% } else { %>
    <%= getIncludeBody() %>
  <% } %>
  <%= getIncludeString("MESSAGE_APPEND", "") %>
</div>