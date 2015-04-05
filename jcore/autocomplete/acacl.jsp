<%@ page import="java.util.regex.Pattern" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (!(isAdmin || isWSAdmin)) {
    return;
  }

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
    
  Collection resultCollection = channel.getDataSet(AccessControlList.class);
  resultCollection = (resultCollection != null) ? resultCollection : new TreeSet<AccessControlList>(); // Fix bug JCMS-2926
    
  DataSelector selector = new AccessControlList.NameSelector(autocomplete);
  String pattern  = "s#("+Pattern.quote(autocomplete)+")#<span class='match'>$1</span>#gi";
  
  boolean showWorkspaceAclOnly = (isWSAdmin && !isAdmin) || getBooleanParameter("wsAcl", false);
  if (showWorkspaceAclOnly) {
    selector = new AndDataSelector(selector, AccessControlList.getWorkspaceAclSelector());
  }
  
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.acl", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        10));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
%>
<jalios:include target="AC_ACL" targetContext="empty"/>
<%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  selector = (DataSelector) request.getAttribute("ACSelector");
  resultCollection = (Collection) request.getAttribute("ACResultCollection");
%><ul class="dropdown-menu"><% 
  int i = proposedResults; boolean match = false; boolean first = true;
  for(Iterator it = resultCollection.iterator(); it.hasNext() && i > 0; ){
    AccessControlList itAcl = (AccessControlList) it.next();
    if (!selector.isSelected(itAcl)){ continue; }
    match = true;
  %><li <%= first ? "class='active'" : "" %> data-value='<%= itAcl.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(itAcl.getName(), true) %>"><a href="#"><%= Util.replace(encodeForHTML(itAcl.getName()), pattern) %></a></li>
  <% i--; first = false; } if (!match){ out.println("<li class='nomatch'><a href='#'>"+glp("ui.com.lbl.no-result")+"</a></li>"); } 
       else if (i == 0){ out.println("<li class='info'><a href='#'>"+glp("ui.com.lbl.more-result")+"</a></li>"); } %></ul>