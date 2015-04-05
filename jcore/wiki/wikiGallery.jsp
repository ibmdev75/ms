<%@ include file='/jcore/doInitPage.jspf' %>
<%
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");
    return;
  }
  
  String qs = getUntrustedStringParameter("query","");
  String cids = getStringParameter("cids", "", "^[a-zA-Z0-9_ ]*$");
  if (Util.notEmpty(cids)){
    qs = "cids=" + Util.join(Util.split(cids," "), "&cids=");
  }
  
  if (Util.isEmpty(qs)){
    return;
  }
  
  qs += "&types=com.jalios.jcms.FileDocument&documentKinds=image";
  
  com.jalios.jcms.handler.QueryHandler handler = new com.jalios.jcms.handler.QueryHandler(qs, request);
	handler.setAttribute(QueryFilter.PORTLET_QUERY, Boolean.TRUE); 
	handler.setLoggedMember(loggedMember);
	handler.setResponse(response);
  QueryResultSet qrSet = handler.getResultSet();
  
  int width  = getIntParameter("width",  108);
  int height = getIntParameter("height", 108);
%>
<table class='layout gallery' align="<%= getStringEnumParameter("align","center", new String[]{"left","center","right"}) %>">
<%
  // Split to rectangular table
  int count = qrSet.getTotalSize() > 16 ? qrSet.getTotalSize() : 16;
  int cols  = (int) Math.round(Math.sqrt(count+1)); 
  Iterator it = qrSet.iterator();
  for (int i = 0 ; (i < count || i%cols != 0) && it.hasNext(); i++) {
    Publication itPub = (Publication) it.next();
%><% if (i%cols == 0) { %><tr><% } %>
  <td class='text-center vTop' width='<%= Math.round(100/cols) %>%'><div style="width: <%= width %>px; height: <%= height %>px"><%
  if(Util.notEmpty(itPub.getDataImage())){
  %><a href="<%= itPub.getDataImage() %>" class="modal"><jalios:thumbnail path="<%= itPub.getDataImage() %>" width='<%= width %>' height='<%= height %>'><jalios:icon src="image" /></jalios:thumbnail></a><%
  } else {
    %><img src="s.gif" width='<%= width %>' height='<%= height %>' alt="" /><%
  }
  %></div></td>
<% if ((i+1)%cols == 0) { %></tr><% } %>
<% } %>
</table>