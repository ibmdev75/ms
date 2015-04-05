<%@ page import="java.util.regex.Pattern" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (loggedMember == null || !loggedMember.isWorker()){
    return;
  }

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  int    skip         = getIntParameter("skip", 0);
  
  Collection tmp = Workspace.getAllWorkspaceSet(loggedMember);
  Collection resultCollection = new TreeSet(Workspace.getNameComparator(userLang));
  resultCollection.addAll(tmp); 
  
  DataSelector selector = new Workspace.TitleSelector(autocomplete, userLang);
  autocomplete = autocomplete.replaceAll("\\(","\\\\(").replaceAll("\\)","\\\\)");
  String pattern  = "s#("+Pattern.quote(autocomplete)+")#<span class='match'>$1</span>#gi";
  
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.workspace", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
%>
<jalios:include target="AC_WORKSPACE" />
<%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  selector = (DataSelector) request.getAttribute("ACSelector");
  resultCollection = (Collection) request.getAttribute("ACResultCollection");
  int more = skip + proposedResults;
%><ul class="dropdown-menu"><%
  if (skip > 0){ out.println("<li class='info results'><a href='#'>"+glp("ui.com.lbl.count-result",skip,(skip+proposedResults))+"</a></li>"); }
  if (skip > 0){ out.println("<li class='ajax-refresh previous'><a href='jcore/autocomplete/acworkspace.jsp?skip="+(skip - proposedResults)+"&autocomplete="+encodeForURL(autocomplete)+"'>"+glp("ui.com.lbl.prev-result")+"</a></li>"); }
 
  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator it = null;
  for(it = resultCollection.iterator(); it.hasNext() && i > 0; ){
    Workspace itWorkspace = (Workspace) it.next();
    if (!selector.isSelected(itWorkspace)){ continue; }
    if (skip > 0){ skip--; continue; }
    match = true;
  %><li <%= first ? "class='active'" : "" %> data-value='<%= itWorkspace.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(itWorkspace.getTitle(userLang), true) %>"><a href="#"><%= Util.replace(encodeForHTML(itWorkspace.getTitle(userLang)), pattern) %></a></li>
  <% i--; first = false; } if (!match){ out.println("<li class='nomatch'><a href='#'>"+glp("ui.com.lbl.no-result")+"</a></li>"); } 
       else if (i == 0 && it.hasNext()){ out.println("<li class='ajax-refresh next'><a href='jcore/autocomplete/acworkspace.jsp?skip="+more+"&autocomplete="+encodeForURL(autocomplete)+"'>"+glp("ui.com.lbl.next-result")+"</a></li>"); } %></ul>
       
       
       
       