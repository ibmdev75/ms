<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="java.util.regex.*" %><%
  DBMailMessage msg = getDataParameter("id", DBMailMessage.class);
  if (msg == null || !msg.canBeReadBy(loggedMember)){
    return;
  }
  
  String contentHtml = msg.getContentHtml(userLang);
  if (Util.isEmpty(contentHtml)){
    return;
  }
  
  // FIXME: Improve perfs
  Pattern htmltag = Pattern.compile("<html>", Pattern.CASE_INSENSITIVE);
  Matcher m = htmltag.matcher(contentHtml);
  boolean isHtmlPage = m.find();
  
%><jalios:if predicate="<%= !isHtmlPage %>"><%
%><html>
  <head>
    <base href="<%= ServletUtil.getBaseUrl(request) %>" />
    <title>Mail Message Wrapper</title><%
    for (Iterator it = jcmsContext.getFinalCSSMap().entrySet().iterator() ; it.hasNext() ; ) { 
      Map.Entry itHeader = (Map.Entry) it.next();
      String css   = Util.getString(itHeader.getKey(),"");
      String media = Util.getString(itHeader.getValue(), "all");
      // FIXME: StartsWith CSSPacker
      String rel   = css.endsWith(".less") ? "stylesheet/less" : "stylesheet";
    %>
    <link rel="<%= rel %>" href="<%= css %>" type="text/css" media="<%= media %>" /><% } %>
  </head>
  <body>
</jalios:if><%

%><style>
  .highlight { background-color: #FFFF70; }
</style>
<%= contentHtml %><%

%><jalios:if predicate="<%= !isHtmlPage %>">
  </body>
</html><%
%></jalios:if>