<%@ include file='/jcore/doInitPage.jspf' %><% 

  String lang = getAlphaNumParameter("lang", userLang);
  // Ensure language exists, otherwise use default site language 
  if (channel.getProperty(lang + ".lang", null) == null) {
    lang = channel.getLanguage();
  }

  String ti = Util.getString(getChooserParameter("ti"), "" );
  
  
  jcmsContext.setPageTitle(glp("ui.wiki.spellcheck"));
  request.setAttribute("zone","InternalUI");
  jcmsContext.addCustomHeader("<style>\n BODY { font:12px Arial; background: #c0c0c0;}\n #spell { display: none; }\n </style>");

%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<div>
<jalios:lang lang='<%= lang %>'/><br /><br />
<jalios:icon src="wait" />
<%= glp("ui.wiki.spellcheck.txt.process") %>
</div>

<form id="spell" action="work/wikiSpellCorrecting.jsp" method="post">
<input type="text" name="lang" value="<%= encodeForHTMLAttribute(lang) %>" />
<input type="text" name="ti" value="<%= encodeForHTMLAttribute(ti) %>" />
<textarea id="text" name="text">
</textarea>
<input type="submit" value="SpellCheck" />
</form>

<%
 jcmsContext.addJavaScript("js/wikispell.js");
%>
<jalios:javascript>
	<% if (Util.isEmpty(ti)) { // IE showModelessDialog %>
	var target = window.dialogArguments ;
	<% } else { %>
	var target = top.opener.<%= ti %> ;
	<% } %>
	//document.getElementById('text').value = getSelectionText(target) ;
	if ( document.getElementById('text').value.length == 0 ) {
	 document.getElementById('text').value = target.value ;
	}
	setTimeout("document.getElementById('spell').submit()", 1) ;
</jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>