<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import='com.jalios.jcms.alert.*' %><%

  Alert alert = (Alert) request.getAttribute("jcms.alertlist.alert");
  if (alert == null) {
    return;
  }
  
  boolean isDataWriteEnabled = channel.isDataWriteEnabled();
  
  String commonParams = (String) request.getAttribute("jcms.alertlist.params");
  String params = "&amp;alert=" + alert.getId() + commonParams;

  Data data = alert.getData();  
  Member author = alert.getAuthor();  
%>
<div class="alert-entry alert-level-border-<%= alert.getLevel().getKey() %> <%= alert.isRead() ? "alert-read" : "alert-not-read" %>">
  <jalios:memberphoto css="pull-left" size="<%= PhotoSize.TINY %>" member="<%= alert.getAuthor() %>" />
  <div class="alert-container">
    <div class="description br">
      <% if (isDataWriteEnabled) { %>
      <div class="icons pull-right">
        <% if (!alert.isRead()) { %>
          <a class="btn" href="jcore/alert/alertList.jsp?opMarkAsRead=true<%= params %>" data-jalios-action="ajax-refresh" title="<%= glp("alert.list.lbl.mark-as-read") %>"><jalios:icon src="remove-small" alt='<%= glp("alert.list.lbl.mark-as-read") %>' /></a>
        <% } else { %>
          <a class="btn" href="jcore/alert/alertList.jsp?opMarkAsNotRead=true<%= params %>" data-jalios-action="ajax-refresh" title="<%= glp("alert.list.lbl.mark-as-not-read") %>"><jalios:icon src="remove-small" alt='<%= glp("alert.list.lbl.mark-as-not-read") %>' /></a>
        <% } %>        
      </div>
      <% } %>       
      <%= alert.getDescription() %>
    </div>      
      
      
    <% if (alert.hasMessage()) { %>
      <div class="message br">
        <span class="tail"><img src="images/jalios/layout/balloonTail.png" alt="" /></span>
        <% String messageMarkup = alert.getMessageMarkup(); %>
        <% if (AlertBuilder.HTML_MARKUP.equals(messageMarkup)) { %>
            <%= alert.getMessage() %>
        <% } else if (AlertBuilder.WIKI_MARKUP.equals(messageMarkup)) { %>
            <jalios:wiki><%= alert.getMessage() %></jalios:wiki>
        <% } else { %>
            <p><%= alert.getMessage() %></p>
        <% } %>
      </div>
    <% } %>  
  
    <div class="metadata">
      <span class="badge alert-level alert-level-<%= alert.getLevel().getKey() %>"><%= alert.getLevel().getLabel(userLang) %></span>
      <span class="date"><jalios:date format="timeDateOrTime" date="<%= alert.getCdate() %>"/></span>
      <% if (data instanceof Publication) { %>
      &middot; <span class="workspace"><%= ((Publication)data).getWorkspace().getTitle(userLang) %></span>
      <% } %>
      &middot; <span class="author"><%= author != null ? author : channel.getName() %></span>
      <% if (alert.hasExpiration()) { %>
      &middot; <span class="expiration"><%= glp("alert.send-alert.lbl.alert-expiration") %> : <jalios:date format="timeDateOrTime" date="<%= alert.getExpiration() %>"/></span>
      <% } %>
    </div><%-- EOF .metadata --%>
  </div><%-- EOF .alert-container --%>     
</div><%-- EOF .alert-entry --%>