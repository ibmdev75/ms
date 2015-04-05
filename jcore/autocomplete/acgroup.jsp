<%@ page import="java.util.regex.Pattern" %><%
 // request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (loggedMember == null){
    return;
  }
  
  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  Set<Group> parentSet    = getDataSetParameterValues("acgids", Group.class);
  int      skip       = getIntParameter("skip", 0);
  
  Collection resultCollection = null;
  if (Util.isEmpty(parentSet)){
    resultCollection = channel.getDataSet(Group.class);
  } 
  else if (parentSet.size() == 1){
    Group itGroup = (Group) parentSet.iterator().next();
    resultCollection = itGroup.getDescendantSet();
  } 
  else {
    resultCollection = new TreeSet(Group.getNameComparator(userLang));
    for (Iterator it = parentSet.iterator() ; it.hasNext() ; ){
      Group itGroup = (Group) it.next();
      resultCollection.addAll(itGroup.getDescendantSet());
    }
  }
  
  // Sort by name
  Collection tmp = resultCollection;
  resultCollection = new TreeSet(Group.getNameComparator(userLang));
  resultCollection.addAll(tmp);
  
  DataSelector selector = new AndDataSelector(new Group.NameSelector(autocomplete), new Group.MemberSelector(loggedMember));
  Map<String,String[]> requestMap  = jcmsContext.isAjaxRequest() ? ((AjaxRequestWrapper)request).getOriginalParameterMap() : request.getParameterMap(); // JspChecker.VERIFIED_FOR_SECURITY
  Workspace wsFilter = channel.getWorkspace(Util.getString(requestMap.get("ws"),0,null));
  
  Workspace wsid = getDataParameter("wsid", Workspace.class);
  if (wsid != null){
    wsFilter = wsid;
  }
  
  if (wsFilter != null) {
    selector = new AndDataSelector(selector, new Group.WorkspaceSelector(wsFilter.getId()));
  }
  autocomplete = autocomplete.replaceAll("\\(","\\\\(").replaceAll("\\)","\\\\)");
  String pattern  = "s#("+Pattern.quote(autocomplete)+")#<span class='match'>$1</span>#gi";
  
  
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.group", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
  String acurl = "jcore/autocomplete/acgroup.jsp?autocomplete="+encodeForURL(autocomplete);
  if (Util.notEmpty(parentSet)){ acurl += "&acgids="+Util.join(parentSet,"&acgids="); }
  acurl += "&skip=";
%>
<jalios:include target="AC_GROUP" targetContext="empty"/>
<%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  selector = (DataSelector) request.getAttribute("ACSelector");
  resultCollection = (Collection) request.getAttribute("ACResultCollection");
  int more = skip + proposedResults;
%><ul class="dropdown-menu"><%
  if (skip > 0){ out.println("<li class='info results'><a href='#'>"+glp("ui.com.lbl.count-result",skip,(skip+proposedResults))+"</a></li>"); }
  if (skip > 0){ out.println("<li class='ajax-refresh previous'><a href='"+acurl+(skip - proposedResults)+"'>"+glp("ui.com.lbl.prev-result")+"</a></li>"); }

  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator it = null;
  for(it = resultCollection.iterator(); it.hasNext() && i > 0; ){
    Group itGroup = (Group) it.next();
    if (!selector.isSelected(itGroup)){ continue; }
    if (skip > 0){ skip--; continue; }
    
    String photos = "";
    Set<Member> mbrSet = itGroup.getMemberSet();
    
    if (Util.notEmpty(mbrSet)){
      Set<Member> tmpSet = new TreeSet(Member.getNameComparator()) ;
      tmpSet.addAll(mbrSet);
%>
<jalios:buffer name="photoBuffer">
  <jalios:foreach collection="<%= tmpSet %>" name="itMbr" type="Member" max="<%= 5 %>">
    <jalios:memberphoto size="<%= PhotoSize.ICON %>" member="<%= itMbr %>" link="false"/>
  </jalios:foreach>
</jalios:buffer> 
<% 
      photos = photoBuffer;
    }
    String info   = "<br/> <span class='info'>";
           info  += itGroup.getWorkspace() != null ? itGroup.getWorkspace()+ " " : "";
           info  += "("+glp("ui.com.lbl.n-member", Util.getSize(mbrSet))+") ";
           info  += "</span>";
           info  += photos;

    match = true;
  %><li <%= first ? "class='active'" : "" %> data-value='<%= itGroup.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(itGroup.getName(userLang), true) %>"><a href="#"><%= Util.replace(encodeForHTML(itGroup.getName(userLang)), pattern) %> <%= info %></a></li>
  <% i--; first = false; } if (!match){ out.println("<li class='nomatch'><a href='#'>"+glp("ui.com.lbl.no-result")+"</a></li>"); } 
       else if (i == 0 && it.hasNext()){ out.println("<li class='ajax-refresh next'><a href='"+acurl+more+"'>"+glp("ui.com.lbl.next-result")+"</a></li>"); } %></ul>