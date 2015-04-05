<%@ include file="/jcore/doInitPage.jspf" %><%
  if (!isLogged){ return; }

  Publication itPub = getPublicationParameter("id");
  if (itPub == null || !itPub.hasAnyReadRights() || !itPub.canBeReadBy(loggedMember)){ return; }
  
  Set authGrpSet = itPub.getAuthorizedGroupSet();
  Set authMrbSet = itPub.getAuthorizedMemberSet();
  String style = Util.notEmpty(authGrpSet) && Util.notEmpty(authMrbSet) ? "style='width: 48%; float: left;'" : "";
%>
<div class="ajax-refresh-div"> 
<h5><%= glp("ui.work.form.lbl.read-rights") %></h5>

<% if (Util.notEmpty(authGrpSet)) { %>
<div <%= style %>>
	<strong><%= glp("ui.com.lbl.groups") %></strong>
	<ol>
	<jalios:foreach collection="<%= itPub.getAuthorizedGroupSet() %>" name="itGroup" type="Group" max="16">
	  <li>
	  <jalios:edit data="<%= itGroup %>"/>
	  <%
	    Workspace ws = itGroup.getWorkspace();
	    if (ws != null && ws.isAdmin(loggedMember)){ %><a href="work/workspace/workspaceGroupList.jsp?gid=<%= itGroup.getId() %>&amp;ws=<%= ws.getId() %>"><%= itGroup.getName(userLang) %></a><% 
	    } else if (isAdmin){                         %><a href="admin/groupList.jsp?gid=<%= itGroup.getId() %>"><%= itGroup.getName(userLang) %></a><%
	    } else {                                     %><%= itGroup.getName(userLang) %><% } 
	  %>
	  </li>
	</jalios:foreach>
	<% if (authGrpSet.size() > 16) {%><li>...</li><% } %>
	</ol>
</div>
<% } %>

<% if (Util.notEmpty(authMrbSet)) { %>
<div <%= style %>>
	<strong><%= glp("ui.com.lbl.members") %></strong>
	<ol>
	<jalios:foreach collection="<%= itPub.getAuthorizedMemberSet() %>" name="itMember" type="Member" max="16">
	  <li>
	    <jalios:edit data="<%= itMember %>"/>
	    <jalios:link data="<%= itMember %>"><%= itMember.getFullName() %></jalios:link>
	  </li>
	</jalios:foreach>
	<% if (authMrbSet.size() > 16) {%><li>...</li><% } %>
	</ol>
</div>
<% } %>
</div>