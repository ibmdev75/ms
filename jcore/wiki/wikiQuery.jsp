<%@ include file='/jcore/doInitPage.jspf' %>
<%
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");  return; // No links because there is no link's name
  }

  String qs = getUntrustedStringParameter("params",null); // ENCODE !!
  if (Util.isEmpty(qs)){
    return;
  }
  
  com.jalios.jcms.handler.QueryHandler handler = new com.jalios.jcms.handler.QueryHandler(qs, request);
  handler.setAttribute(QueryFilter.PORTLET_QUERY, Boolean.TRUE); 
  handler.setLoggedMember(loggedMember);
  handler.setResponse(response);
  QueryResultSet qrSet = handler.getResultSet();
  if (qrSet == null){
    return;
  }
  
  Set<Publication> resultSet = qrSet;
  String sort = getAlphaNumParameter("sort", null);
  if (sort != null){
    resultSet = qrSet.getAsSortedSet(sort, false);
  }

  String cssClass = getUntrustedStringParameter("class", null);
  String cssStyle = getUntrustedStringParameter("style", null);
  
  cssClass = cssClass != null ? "class=\"query "+encodeForHTMLAttribute(cssClass)+"\""   : "class=\"query\"";
  cssStyle = cssStyle != null ? "style=\""+encodeForHTMLAttribute(cssStyle)+"\""   : "";
%>
<ul <%= cssClass %> <%= cssStyle %>><%
  int qfeIdx = getIntParameter("max", 5);
  for (Iterator<Publication> it = resultSet.iterator() ; it.hasNext() && qfeIdx > 0; qfeIdx--) {
    Publication itPub = it.next();
%><li><jalios:link data="<%= itPub  %>"/></li>
<% } %>
</ul>