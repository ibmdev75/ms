<%@ page import="java.util.regex.Pattern" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  String   autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
	int      skip         = getIntParameter("skip", 0);
	
  final List<String> countryList = Util.splitToList(channel.getProperty("iso-3166-1-codes").toUpperCase(), ", ");
  
  String highlightPattern  = "s#("+Pattern.quote(autocomplete)+")#<span class='match'>$1</span>#gi";
  Pattern matchPattern = Pattern.compile(".*"+Pattern.quote(autocomplete)+".*", Pattern.CASE_INSENSITIVE);
  
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.country", 
                          channel.getIntegerProperty("autocomplete.proposedresults", 10));
  int more = skip + proposedResults;
  
  String acurl = "jcore/autocomplete/accountry.jsp?autocomplete="+autocomplete+"&skip=";
%><ul class="dropdown-menu"><%
  if (skip > 0){ out.println("<li class='info results'><a href='#'>"+glp("ui.com.lbl.count-result",skip,(skip+proposedResults))+"</a></li>"); }
  if (skip > 0){ out.println("<li class='ajax-refresh previous'><a href='"+acurl+(skip - proposedResults)+"'>"+glp("ui.com.lbl.prev-result")+"</a></li>"); }
  
  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator it = null;
  for(it = countryList.iterator(); it.hasNext() && i > 0;){
    String countryCode = (String) it.next();
    String userCountryName = glp("country." + countryCode);
    String nativeCountryName = channel.getProperty("country." + countryCode);
    
    if (!(countryCode.equalsIgnoreCase(autocomplete) || 
        matchPattern.matcher(userCountryName).matches() || 
        matchPattern.matcher(nativeCountryName).matches())) {
      continue;
    }
    if (skip > 0){ skip--; continue; }
    String highlightedUserCountryName   = Util.replace(userCountryName, highlightPattern);
    String highlightedNativeCountryName = Util.replace(nativeCountryName, highlightPattern);
    match = true;
    
  %><li <%= first ? "class='active'" : "" %> data-value='<%= countryCode %>' data-placeholder="<%= encodeForHTMLAttribute(userCountryName) %>"><a href="#"><%
   %><jalios:country country='<%= countryCode %>'/> <%= highlightedUserCountryName %><br/><%
   %><span class='info'><%= highlightedNativeCountryName %></span><%
  %></a></li><%
    i--; first = false;
  } 
  if (!match) { out.println("<li class='nomatch'><a href='#'>"+glp("ui.com.lbl.no-result")+"</a></li>"); } 
  else if (i == 0 && it.hasNext()){ out.println("<li class='ajax-refresh next'><a href='"+acurl+more+"'>"+glp("ui.com.lbl.next-result")+"</a></li>"); }
%></ul>
