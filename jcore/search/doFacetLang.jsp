<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.lang"),0);
  if (boxStatus == 0){ return; }
  
	if (Util.getSize(channel.getLanguageList()) <= 1){
	  return;
	}
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  boolean dslUserLang = Util.toBoolean((String) request.getAttribute("dslUserLang"),false);
  String[] dslLangs = qh.getLangs();
  Set langSet = new HashSet();
	if (Util.notEmpty(dslLangs)) {
	  langSet.addAll(Arrays.asList(dslLangs));
	  boxStatus = 1;
	}
%>
<jalios:accordion-panel title='<%= glp(lblPrefix + "lang") %>' picture="ml" active="<%= boxStatus != 2 %>">
 
    <p class="facet-info"><%= glp("ui.work.search.lang.intro") %></p>
    <ul class="facet-list list-unstyled">
    <jalios:if predicate='<%= dslUserLang %>'>
	    
	    <% 
	      String langUserInputId = FACET_PREFIX + "langUser";
	      boolean checked = dslLangs != null && langSet.contains("user");
	    %>
		  <li class='exclusive <%= checked ? "checked" : "" %>'>
		    <label for="<%= langUserInputId %>" >
		      <input id="<%= langUserInputId %>" type='checkbox' name='langs' value='user' <%= checked ? "checked='checked'" : "" %> />
		      <% /* %>User lang<% */ %><%= glp("ui.work.search.lang.user") %>
		    </label>
	    </li>
	  </jalios:if>
    
    <jalios:foreach collection="<%= channel.getLanguageList() %>" name="itLang" type="String"> 
		  <% 
		    String langInputId = FACET_PREFIX + "lang" + itLang;
		    boolean checked =  langSet.contains(itLang);
		  %>
		  <li <%= checked ? "class='checked'" : "" %>>
		    <label for="<%= langInputId %>">
		      <input id="<%= langInputId %>" type='checkbox' name='langs' value='<%= itLang %>' <%= checked ? "checked='checked'" : "" %> />
		      <jalios:lang lang='<%= itLang %>' /> <%= glp("lang." + itLang) %>
		    </label>
	    </li>
	  </jalios:foreach>
    </ul>
    
</jalios:accordion-panel>