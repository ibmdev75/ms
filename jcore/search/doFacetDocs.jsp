<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.docs"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  String[] dskTypes = qh.getDocumentKinds();
  Set<String> kindSet = new HashSet<String>();
  if (dskTypes != null){
    kindSet.addAll(Arrays.asList(dskTypes));
    boxStatus = 1;
  }
%>
<jalios:accordion-panel title='<%= glp(lblPrefix + "kind") %>' picture="pdf" active="<%= boxStatus != 2 %>">

    <%-- <p class="facet-info"><%= glp("ui.work.search.kind.intro") %></p> --%>
    
    <%
      // Retrieve map of the "kind group name" to "document kind group label"
      Map<String,String> kindGroupMap = QueryHandler.getDocumentKindsGroupMap(userLang);
      for (Map.Entry<String,String> groupEntry : kindGroupMap.entrySet()) {
        String kindGroupName = groupEntry.getKey();
        String kindGroupLabel = groupEntry.getValue();
    %>
    
    <strong><%= kindGroupLabel %></strong>
    <ul class="facet-list  list-unstyled">
	    <% 
	      Map<String,String> kindMap = QueryHandler.getDocumentKindsMap(userLang, kindGroupName);
	      for (Map.Entry<String,String> kindEntry : kindMap.entrySet()) {
	        String kindName = kindEntry.getKey();
	        String kindLabel = kindEntry.getValue();
	        String kindHelp = "file-document.kinds." + kindName + ".h";
	        String kindIcon = channel.getProperty("file-document.kinds." + kindName + ".icon", "s.gif"); 
	        String kindUserInputId = FACET_PREFIX + "kind" + kindName; 
	        boolean checked = kindSet.contains(kindName);
	    %>
	    <li <%= checked ? "class='checked'" : "" %>>
	      <label for="<%= kindUserInputId %>">
	        <input id="<%= kindUserInputId %>" type="checkbox" name="documentKinds" value="<%= kindName %>" <%= checked ? "checked='checked'" : "" %> />
	        <jalios:icon src="<%= kindIcon %>" alt='<%= kindName %>' /> <%= kindLabel %>
	      </label>
	      <jalios:tooltip property="<%= kindHelp %>"/>
	    </li>
	    <% } %>
    </ul>
    <% } %>
    
</jalios:accordion-panel>