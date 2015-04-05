<%@page import="com.jalios.jcms.mention.MentionManager"%>
<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  if (Util.isEmpty(autocomplete)){
  
%><jsp:include page='<%= "/jcore/autocomplete/acscriptlet.jsp" %>' flush="true" /><% } 
else if (autocomplete.startsWith("@") && MentionManager.getInstance().isMentionEnabled()) { %><jsp:include page='<%= "/jcore/autocomplete/acmember.jsp" %>' flush="true" /><% } 
else if (autocomplete.startsWith("#")) { %><jsp:include page='<%= "/jcore/autocomplete/accategory.jsp" %>' flush="true" /><% }
else { %>
<ul class="dropdown-menu">
<li class="ajax-refresh active"><a href='jcore/autocomplete/acscriptlet.jsp?autocomplete=<%= encodeForURL(autocomplete) %>'><jalios:icon src='html-tag'  alt='<%= glp("ui.wiki.lbl.shortcode") %>' /> <%= glp("ui.wiki.lbl.shortcode") %> <br/><span class='info'><%= glp("ui.wiki.lbl.shortcode.h") %></span></a></li>
<li class="ajax-refresh"><a href='jcore/autocomplete/acpublication.jsp?autocomplete=<%= encodeForURL(autocomplete) %>'><jalios:icon src='publication'  alt='<%= glp("ui.com.lbl.publications") %>' /> <%= glp("ui.com.lbl.publications") %> <br/><span class='info'><%= glp("ui.wiki.alt.publink") %></span></a></li>
<li class="ajax-refresh"><a href='jcore/autocomplete/acmember.jsp?autocomplete=<%= encodeForURL(autocomplete) %>'><jalios:icon src='mbr-default'  alt='<%= glp("ui.com.lbl.members") %>' /> <%= glp("ui.com.lbl.members") %> <br/><span class='info'><%= glp("ui.wiki.alt.mbrlink") %></span></a></li>
<li class="ajax-refresh"><a href='jcore/autocomplete/accategory.jsp?autocomplete=<%= encodeForURL(autocomplete) %>'><jalios:icon src='categories'  alt='<%= glp("ui.com.lbl.categories") %>' /> <%= glp("ui.com.lbl.categories") %> <br/><span class='info'><%= glp("ui.wiki.alt.catlink") %></span></a></li>
<li class="ajax-refresh"><a href='jcore/autocomplete/acgroup.jsp?autocomplete=<%= encodeForURL(autocomplete) %>'><jalios:icon src='group'  alt='<%= glp("ui.com.lbl.groups") %>' /> <%= glp("ui.com.lbl.groups") %> <br/><span class='info'><%= glp("ui.wiki.alt.grplink") %></span></a></li>
</ul>
<% } %>