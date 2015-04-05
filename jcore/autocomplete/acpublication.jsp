<%@ page import="java.util.regex.Pattern" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (loggedMember == null || !loggedMember.isWorker()) {
    return;
  }

  String autocomplete = getUntrustedStringParameter("autocomplete", ""); // ENCODE !!
  
  String[] types = getStringParameterValues("super", HttpUtil.CLASSNAME_REGEX);
  if(types == null) {
    types = new String[]{"Publication"};
  }
  int skip = getIntParameter("skip", 0);
  
  request.setAttribute("AC_PUBLICATION", Boolean.TRUE); // Clue for the QueryFilter
  
  com.jalios.jcms.handler.QueryHandler handler = new com.jalios.jcms.handler.QueryHandler();
  handler.setRequest(request);
  handler.setText(autocomplete);
  // handler.setMode(com.jalios.jcms.handler.QueryHandler.TEXT_MODE_ADVANCED);
  handler.setTypes(types);
  handler.setSearchedFields(new String[]{ com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD });
  handler.setLoggedMember(loggedMember);
  handler.setWorkspace(null);
  handler.setCheckPstatus(true);
  handler.setSort("title");
  
  Set resultSet = handler.getResultSet();
      resultSet = ((QueryResultSet)resultSet).getAsSortedSet(Publication.getTitleComparator());
  autocomplete = autocomplete.replaceAll("\\(","\\\\(").replaceAll("\\)","\\\\)");
  String pattern  = "s#("+Pattern.quote(autocomplete)+")#<span class='match'>$1</span>#gi";
  
  request.setAttribute("ACResultCollection", resultSet);
  
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.publication", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
  String acurl = "jcore/autocomplete/acpublication.jsp?autocomplete=" + encodeForURL(autocomplete) + "&super=" + Util.join(types, "&super=") + "&skip=";
%>
<jalios:include target="AC_PUBLICATION" targetContext="empty" />
<%
resultSet = (Set) request.getAttribute("ACResultCollection");
proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
int more = skip + proposedResults;
%>
<ul class="dropdown-menu typeahead-photo">
<% 
  if (skip > 0) {
    out.println("<li class='info results'><a href='#'>" + glp("ui.com.lbl.count-result", skip, (skip + proposedResults)) + "</a></li>");
    out.println("<li class='ajax-refresh previous'><a href='" + acurl + (skip - proposedResults) + "'>" + glp("ui.com.lbl.prev-result") + "</a></li>");
  }

  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator it = null;
  for(it = resultSet.iterator(); it.hasNext() && i > 0;){
    Publication itPub = (Publication) it.next();
    if (skip > 0){ skip--; continue; }

    match = true;    
  %><li <%= first ? "class='active'" : "" %> data-value='<%= itPub.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(itPub.getTitle(userLang)) %>"><a href="#">
  <span class='thumb'>
    <jalios:thumbnail data='<%= itPub %>'
                      width="26"
                      height="26"
                      alt="" 
                      css="photo"><img src="s.gif" alt="" width="26" height="26"/></jalios:thumbnail>
  </span>
  <% i--; first = false; %>
  <jalios:dataicon data="<%= itPub %>" /> <%= Util.replace(itPub.getTitle(userLang), pattern) %>
  <br/><span class='info'>(<%= itPub.getTypeLabel(userLang) %> - <%= itPub.getWorkspace().getTitle(userLang) %>)</span></a></li>
  <% } if (!match){ out.println("<li class='nomatch'><a href='#'>" + glp("ui.com.lbl.no-result")+"</a></li>"); } 
  else if (i == 0 && it.hasNext()){ out.println("<li class='ajax-refresh next'><a href='" + acurl + more + "'>" + glp("ui.com.lbl.next-result") + "</a></li>"); } %></ul>