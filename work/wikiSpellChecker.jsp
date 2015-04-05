<%@page import="com.jalios.jcms.spellchecker.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%= ServletUtil.getBaseUrl(request) %>">
<title><%= glp("ui.wiki.spellcheck") %></title>
</head>
<%
List<String> langs = SpellCheckerManager.getLanguageList() ;
if ( langs.size() > 0 ) { 
 String lang = getAlphaNumParameter("lang", userLang);
 if ( ! langs.contains(lang) ) {
  lang = channel.getLanguage() ;
 }
 if ( ! langs.contains(lang) ) {
  lang = langs.get(0) ;
 } 
%>
<% String ti = Util.getString(getChooserParameter("targetInput"), "" ); %>
<% if (clientBrowser.isIE()) { %>
<body style="padding:0; margin:0">
<iframe src="work/wikiSpellChecking.jsp?lang=<%= lang %>&amp;ti=<%= encodeForURL(ti) %>" width="400" height="300" frameborder="0" style="padding:0; margin:0"/>
</body>
<% } else { %>
<frameset cols="*">
<frame src="work/wikiSpellChecking.jsp?lang=<%= lang %>&amp;ti=<%= encodeForURL(ti) %>" />
</frameset>
<% } %>
<% } else { %>
<body>
<script>
alert("<%= glp("ui.wiki.spellcheck.msg.no-dict") %>") ;
window.close() ;
</script>
</body>
<% } %>
</html>
