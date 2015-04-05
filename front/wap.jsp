<?xml version="1.0"?>
<%--
	@Summary: Returns a WML representation of the latest publications 
	@Category: Web Service
	@Author: Oliver Dedieu
	@Copyright: Jalios SA
	@Customizable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
org.apache.oro.text.regex.PatternMatcher matcher = new org.apache.oro.text.regex.Perl5Matcher();
org.apache.oro.text.regex.PatternCompiler compiler = new org.apache.oro.text.regex.Perl5Compiler();
org.apache.oro.text.regex.Pattern removePattern = compiler.compile("(</?[^>]+>)|([ \t]{2,})");
response.setContentType("text/vnd.wap.wml");
%>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>

<%-- *** Index ******************************************  --%>
<card id="index" title="<%= XmlUtil.normalize(channel.getName()) %>">
<p align="center">
<img src="images/jalios/logos/jalios.wbmp" alt="Powered by Jalios"/>
</p>
<p class="text-left">
<jalios:query name="newsSet" dataset="<%= channel.getPublicationSet(SmallNews.class, loggedMember) %>" comparator="<%= Data.getCdateComparator() %>" />
<% if (!newsSet.isEmpty()) { %>
<a href="#news"><%= channel.getTypeLabel(SmallNews.class, workspace, userLang) %></a><br/>
<% } %>
</p>
</card>

<%-- *** News ****************************************** --%>
<card id="news" title="<%= channel.getTypeLabel(SmallNews.class, workspace, userLang) %>"> 
<do type="prev">
  <go href="#index" />
</do>
<p class="text-left">
<jalios:foreach max="3" name="itNews" type="SmallNews" collection="<%= newsSet %>">
<%= itCounter %>. <a href="#news<%= itCounter %>"><%= itNews.getTitle() %></a><br/>
</jalios:foreach>
</p> 
</card>

<%-- *** News Detailed cards ********************************** --%>

<jalios:foreach max="3" name="itNews" type="SmallNews" collection="<%= newsSet %>">
<% 
  String content = itNews.getIntro();
  if (Util.isEmpty(content)) {
    content = itNews.getContent();
  }
  String summary = org.apache.oro.text.regex.Util.substitute(matcher, removePattern, new org.apache.oro.text.regex.StringSubstitution("- "), content, 
                                                  org.apache.oro.text.regex.Util.SUBSTITUTE_ALL);
%>
<card id="news<%= itCounter %>" title="<%= XmlUtil.normalize(itNews.getTitle()) %>">
<do type="prev">
  <go href="#news" />
</do>
<p class="text-left">
<jalios:truncate length="100" suffix="..."><%= summary %></jalios:truncate><br/>
</p>
</card>
</jalios:foreach>

</wml>
