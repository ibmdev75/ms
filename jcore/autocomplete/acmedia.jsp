<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  String scUsage = "media";
%>
<ul class="dropdown-menu">
<li data-value="[flv path='<%= encodeForHTMLAttribute(autocomplete) %>' width='320' height='240' /]" class="active"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.lbl.flash") %> <br/><span class='info'><%= glp("ui.wiki.lbl.flash.h") %></a></span></li>
<li data-value="[mp3 path='<%= encodeForHTMLAttribute(autocomplete) %>' width='320' height='240' /]"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.lbl.mp3") %> <br/><span class='info'><%= glp("ui.wiki.lbl.mp3.h") %></span></a></li>
<li data-value="[media path='<%= encodeForHTMLAttribute(autocomplete) %>' /]"><a href='#'><jalios:icon src="html-tag"   /> <%= glp("ui.wiki.lbl.media") %> <br/><span class='info'><%= glp("ui.wiki.lbl.media.h") %></span></a></li>

<%@ include file="/jcore/autocomplete/doShortCode.jspf" %>
</ul>