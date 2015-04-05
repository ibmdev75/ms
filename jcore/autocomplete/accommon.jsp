<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  String autocompleteEncodedForHTMLAttribute = encodeForHTMLAttribute(autocomplete);
  String scUsage = "common";
%>
<ul class="dropdown-menu">
<% /* %>
<% if (Util.notEmpty(autocomplete)){ %>
<li data-value="*<%= autocompleteEncodedForHTMLAttribute %>*"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.alt.bold") %><br/><span class='info'><%= glp("ui.wiki.alt.bold") %></span></a></li>
<li data-value="_<%= autocompleteEncodedForHTMLAttribute %>_"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.alt.italic") %><br/><span class='info'><%= glp("ui.wiki.alt.italic") %></span></a></li>
<li data-value="__<%= autocompleteEncodedForHTMLAttribute %>__"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.alt.bolditalic") %><br/><span class='info'><%= glp("ui.wiki.alt.bolditalic") %></span></a></li>
<li data-value="=<%= autocompleteEncodedForHTMLAttribute %>="><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.alt.fixed") %><br/><span class='info'><%= glp("ui.wiki.alt.fixed") %></span></a></li>
<li data-value="==<%= autocompleteEncodedForHTMLAttribute %>=="><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.alt.boldfixed") %><br/><span class='info'><%= glp("ui.wiki.alt.boldfixed") %></span></a></li>
<% } else { %>
<li data-value="-------"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.lbl.hr") %><br/><span class='info'><%= glp("ui.wiki.alt.inserthorizontalrule") %></span></a></li>
<% } %>
<% */ %>
 
<li data-value="[quote]<%= autocompleteEncodedForHTMLAttribute %>[/quote]" class="active"><a href='#'><jalios:icon src='quote' /> <%= glp("ui.wiki.lbl.quote") %><br/><span class='info'><%= glp("ui.wiki.lbl.quote.h") %></span></a></li>
<li data-value="[verbatim]<%= autocompleteEncodedForHTMLAttribute %>[/verbatim]"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.lbl.verbatim") %><br/><span class='info'><%= glp("ui.wiki.lbl.verbatim.h") %></span></a></li>
<li data-value="[note]<%= autocompleteEncodedForHTMLAttribute %>[/note]"><a href='#'><jalios:icon src='postit'  /> <%= glp("ui.wiki.lbl.note") %><br/><span class='info'><%= glp("ui.wiki.lbl.note.h") %></span></a></li>
<li data-value="[info]<%= autocompleteEncodedForHTMLAttribute %>[/info]"><a href='#'><jalios:icon src='info'  /> <%= glp("ui.wiki.lbl.info") %><br/><span class='info'><%= glp("ui.wiki.lbl.info.h") %></span></a></li>
<li data-value="[disclaimer]<%= autocompleteEncodedForHTMLAttribute %>[/disclaimer]"><a href='#'><jalios:icon src='warning'  /> <%= glp("ui.wiki.lbl.disclaimer") %><br/><span class='info'><%= glp("ui.wiki.lbl.disclaimer.h") %></span></a></li>
<li data-value="[error]<%= autocompleteEncodedForHTMLAttribute %>[/error]"><a href='#'><jalios:icon src='menu-delete'  /> <%= glp("ui.wiki.lbl.error") %><br/><span class='info'><%= glp("ui.wiki.lbl.error.h") %></span></a></li>
<li data-value="Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."><a href='#'><jalios:icon src='abstract'  /> <%= glp("ui.wiki.lbl.lorem") %> <br/><span class='info'><%= glp("ui.wiki.lbl.lorem.h") %></span></a></li>

<%@ include file="/jcore/autocomplete/doShortCode.jspf" %>
</ul>
