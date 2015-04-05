<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcms.tracking.*" %>
<%
  request.setAttribute("title", glp("ui.work.rdr.title1"));
  request.setAttribute("contentWAMenu", "true");
  Publication pub = getPublicationParameter("id"); 
  boolean canDelete = loggedMember == pub.getAuthor() || pub.getWorkspace().isAdmin(loggedMember);  
  if (!Workspace.getAllWorkspaceSet(loggedMember).contains(workspace) && pub.canBeReadBy(loggedMember)) {
    sendForbidden(request, response);
    return;
  }
  if (hasParameter("opDelete") && canDelete) {
    pub.removeAllReaderTracker(null);

    sendRedirect(ServletUtil.getAbsUrlWithUpdatedParam(request, "opDelete", null), request, response);
    return;
  }
  List readerTrackerList = pub == null ? null : pub.getReaderTrackerList();
  int readerCount = readerTrackerList == null ? 0 : readerTrackerList.size();
%>
<%@ include file='/work/doWorkHeader.jspf' %>

<div class="page-header"><h1><% /* %>Reader List<% */ %><%= glp("ui.work.rdr.title1") %></h1></div>

<%-- ** No Pub Selected **************************** --%>
<% if (pub == null) { %>

<% /* %>Select a publication...<% */ %><%= glp("ui.work.rdr.lbl.select") %>

<form action='work/readerList.jsp' name='editForm'>
  <jalios:field  name='<%= "id" %>'>
    <jalios:control settings='<%= new PublicationSettings().superType(Content.class) %>' />
  </jalios:field>

  <input type='submit' class="btn btn-primary" value='<%= glp("ui.work.rdr.btn.list") %>' />
</form>

<% } else { %>

<h2 class='boTitle'><% /* %>n readers for ...<% */ %><%= JcmsUtil.glp(userLang, "ui.work.rdr.title2", new Object[] {new Integer(readerCount), JcmsUtil.getDisplayUrl(pub, userLocale), pub.getTitle(userLang)}) %>&nbsp;<jalios:edit pub='<%= pub %>'/></h2>

<%-- ** Not Tracked **************************** --%>
<%   if (!pub.isTracked()) { %>


<% /* %>This publication is not tracked<% */ %><%= glp("ui.work.rdr.lbl.nottracked") %>

<%-- ** No Reader **************************** --%>
<%   } else if (readerCount == 0) { %>

<% /* %>This publication is not tracked<% */ %><%= glp("ui.work.rdr.lbl.none") %>

<%-- ** List Readers **************************** --%>
<%   } else {
     int totalAccess = 0;
%>

<%-- -- List --------------------------- --%>
<table id='pubTable' class="table-data table-condensed">
  <tr> 
    <th>&nbsp;</th>
    <th><%= glp("ui.work.rdr.reader") %></th>
    <th><%= glp("ui.work.rdr.fdate") %></th>
    <th><%= glp("ui.work.rdr.ldate") %></th>
    <th><%= glp("ui.work.rdr.access") %></th>
  </tr>   
<jalios:foreach collection='<%= readerTrackerList %>' name='itReaderTracker' type='ReaderTracker'>
  <tr> 
    <td class="text-right"><%= itCounter %>.</td>
    <td class="vMiddle">
      <% 
      int accessCount = itReaderTracker.getAccessCount();
      totalAccess += accessCount;
      Member itMember = itReaderTracker.getAuthor(); 
      %>
      <% if (itMember == null) { %>
      <%= glp("ui.work.rdr.lbl.anonymous") %>
      <% } else { %>
	    <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>"/>
      <jalios:link data='<%= itMember%>' />
      <% } %>
    </td>
    <td><jalios:date date='<%= itReaderTracker.getCdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= itReaderTracker.getCdate() %>' format='<%= "short" %>'/> </td>
    <td><jalios:date date='<%= itReaderTracker.getMdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= itReaderTracker.getMdate() %>' format='<%= "short" %>'/> </td>
    <td class="text-right"><%= accessCount %></td>
  </tr>
</jalios:foreach>
  <tr> 
    <td colspan="4"></td>
    <td class="text-right">Total: <strong><%= totalAccess %></strong></td>
  </tr>
</table>


    
<%-- -- Delete --------------------------- --%>
<jalios:if predicate='<%= canDelete %>'>
<p>
<form action='work/readerList.jsp' name='editForm' method='get'>  
  <input class='btn btn-default modal confirm' type='button' name='opDelete' value='<%= glp("ui.work.rdr.btn.delete") %>' title="<%= encodeForHTMLAttribute(glp("msg.js.confirm")) %>"/>
  <input type='hidden' name='action' value='true' />
  <input type='hidden' name='id' value='<%= pub.getId() %>'  />
</form>
</p>
</jalios:if>

<%   } %>
<% } %>

<p>

<%@ include file='/work/doWorkFooter.jspf' %>
