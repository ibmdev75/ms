<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!

%><ul class="dropdown-menu"><%
  boolean first = true;
  Map<String,String> props = new TreeMap(channel.getProperties("wiki.usage.shortcode."));
  for (Map.Entry<String, String> itProp : props.entrySet()){
    String value    = Util.getString(itProp.getValue(),"");
    String key      = Util.getString(itProp.getKey(),"");
    String shortkey = key.substring("wiki.usage.shortcode.".length());
%>
<li class='ajax-refresh <%= first ? "active" : "" %>'><a href='jcore/autocomplete/ac<%= shortkey %>.jsp?autocomplete=<%= encodeForURL(autocomplete) %>'><jalios:icon src='<%= value %>'   /> <%= glp(key) %> <br/><span class='info'><%= glp(key+".h") %></span></a></li>
<% first = false; } %>
</ul>