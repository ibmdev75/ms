<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcms.recenthistory.*" %><%
%><%
	if (!isLogged) {
		request.setAttribute("ShowPortalElement",Boolean.FALSE); //hide the box
		return;
	} 
	
	PortletRecentHistory historyBox = (PortletRecentHistory) portlet;
	int pagerSize = historyBox.getPageSize();
	int historySize = historyBox.getHistorySize();
	boolean isFilterByWorkspace = Util.toBoolean(historyBox.getFilterOnCurrentWorkspace(), false);
	
	RecentHistoryManager rhMgr = RecentHistoryManager.getInstance();
	
	String recentHistoryWsId = isFilterByWorkspace && workspace != null ? workspace.getId() : null;
	boolean opClearHistory = getBooleanParameter("opClearHistory",false);
	
	if (opClearHistory) {
		rhMgr.clearHistory(loggedMember,recentHistoryWsId);
	}
	
	Publication recentPubToDelete = getPublicationParameter("recentPubId");
	if (getBooleanParameter("opHistoryDelete",false) && recentPubToDelete != null) {
		rhMgr.removeHistory(loggedMember,recentPubToDelete.getWorkspace().getId(),recentPubToDelete.getId());
	}
	
	Collection recentMemberPubCollection = rhMgr.getPubRecentHistory(loggedMember,recentHistoryWsId,historySize);

%>
<% if (opClearHistory) { %>
<jalios:message msg="ui.recenthistory.msg.remove-all.info" title="" />
<% } %>
<% if (Util.notEmpty(recentMemberPubCollection)) { %>
<jalios:pager name="pager" declare='true' action="init" size='<%=recentMemberPubCollection.size()%>' pageSize='<%= pagerSize %>' />
<ul class="item-box">
<jalios:foreach collection='<%= recentMemberPubCollection %>' type='Publication' name='itPub' max='<%=pager.getPageSize() %>' skip='<%=pager.getStart() %>' >
  <% if (itPub != null) { %>
	<li class="item">
		<div class="item-icons">
      <jalios:edit data='<%= itPub %>' />
      <a class="ajax-refresh ajax-action" href='<%= com.jalios.util.ServletUtil.getResourcePath(request) %>?opHistoryDelete=true&amp;recentPubId=<%= itPub.getId() %>' title='<%= glp("ui.com.alt.remove") %>'><jalios:icon src="remove-small"/></a>
    </div>
    <jalios:link data='<%= itPub %>'>
      <jalios:dataicon data='<%= itPub %>'/>
      <% if(itPub instanceof FileDocument) {%>
  	    <jalios:lock data='<%= itPub %>' />
      <% } %>
      <%= itPub.getTitle(userLang,true) %>
    </jalios:link>
  </li>
  <% } %>
  </jalios:foreach>
</ul>
<jalios:pager name="pager" />
<div class="item-box-footer">
  <% String suppressWarningMsg = glp("ui.recenthistory.msg.remove-all"); %>
  <jalios:icon src="trash-empty" alt="-"/> <a class="ajax-refresh confirm ajax-action" title="<%= suppressWarningMsg %>" href='<%= com.jalios.util.ServletUtil.getResourcePath(request) %>?opClearHistory=true' ><%= glp("ui.recenthistory.lbl.clear") %></a>
</div>

<% } %>