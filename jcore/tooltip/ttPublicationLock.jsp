<%@ include file="/jcore/doInitPage.jspf" %><%
  Publication data = getPublicationParameter("id");
  if (data == null || !isLogged || !loggedMember.isWorker()){
    return;
  }
  
  StrongLock strongLock = data.getStrongLock();
  boolean isStrongLock = strongLock != null;
  
  // Check rights
  if (!data.isLocked() && !isStrongLock) {
    return;
  }

  // Get lock info  
  String info = data.getLockInfo(userLang, userLocale, false);
  Member owner = data.getLockMember();
	if (isStrongLock) {
	  owner = strongLock.getAuthor();
	}

  String htmlAttr = "style='float: left;'";
  String redirect = ServletUtil.getUrl(request);
%>
<div class="tt-publication-lock tip-content media popover-large">
    <jalios:memberphoto css="pull-left" size="<%= PhotoSize.TINY %>" member="<%= owner %>" />
    <div class="media-body">
      <p><%= info %></p>
      <div>
      <%
        if (data.canRequestUnlock(loggedMember)) {
          String icon    = "mail-lock";
          String label   = "ui.work.alt.unlock-request";
          String url     = "work/requestUnlock.jsp?id=" + data.getId();
      %><a class="modal btn btn-sm btn-primary br" href="<%= url %>"><%= glp(label) %></a><% } %>
      <%
        if (loggedMember.canUnlock(data)){
          String icon    = "unlock-strong";
          String label   = "ui.com.alt.unlock";
          String url     = contextPath+"/edit.jsp?opUnlock=true&amp;id=" + data.getId() + "&amp;redirect=" + ServletUtil.encodeURL(redirect);
          String confirm = encodeForJavaScript(glp("msg.js.confirm-unlock", data.getDataName(userLang)));     
      %><a class="btn btn-sm btn-default" href='#' onclick='confirmAction("<%= confirm %>","<%= url %>"); return false;'>
        <%= glp(label) %></a>
      <% } %>
      </div>
      <%
        // TODO: Unlock the soft lock
      %>    
    
  </div>
  
</div>
