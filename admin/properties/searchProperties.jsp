<%@ include file="/admin/properties/doCommonProp.jspf" %>
<div class="row">
  <div class="col-md-6">
  <% boolean isChecked = false; int state = 0; %>

    <%-- SEARCH - FACETS --%>
    <fieldset class="col-md-12">
      <legend><jalios:icon src="facets" /> <%= glp("ui.com.lbl.search.faceted") %></legend>
      
      <% isChecked = Util.toBoolean(formHandler.getQuery_facets_advanced(), false); %>
      <jalios:field label="ui.adm.prop.srch.facets.advanced" name='query_facets_advanced' tooltip="ui.adm.prop.srch.facets.advanced.h" value='<%= isChecked %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
      <% isChecked = Util.toBoolean(formHandler.getQuery_facets_ajax(), true); %>
      <jalios:field label="ui.adm.prop.srch.facets.ajax" name='query_facets_ajax' tooltip="ui.adm.prop.srch.facets.ajax.h" value='<%= isChecked %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
    </fieldset>
  </div><div class="col-md-6">
    
      <%-- SEARCH - TEXT --%>
      <fieldset class="col-md-12">
        <legend><jalios:icon src="textfield-rename" /> <%= glp("ui.work.search.tab.text") %></legend>
        <p><%= glp("ui.work.search.text.text.h") %></p>
        
        <% isChecked = Util.toBoolean(formHandler.getQuery_facets_text_cat(), true); %>
        <jalios:field label="ui.work.search.text.cat" name='query_facets_text_cat' value='<%= isChecked %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        
        <% isChecked = Util.toBoolean(formHandler.getQuery_facets_text_file(), false); %>
        <jalios:field label="ui.work.search.text.file" name='query_facets_text_file' value='<%= isChecked %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        
      </fieldset>
      
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">

      <%-- SEARCH - CIDS --%>
      <fieldset class="col-md-12">
        <legend><jalios:icon src="category-tree" /> <%= glp("ui.adm.prop.srch.lgd.cat") %></legend>
        
        <jalios:field label="ui.com.lbl.facet" name='query_facets_categories' value='<%= formHandler.getQuery_facets_categories() %>'>
          <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
        </jalios:field>

        <jalios:field label="ui.adm.prop.srch.qsr" name="query_search_roots" description="ui.adm.prop.srch.qsr.h" value="<%= formHandler.getQuery_search_roots() %>" disabled='<%= formHandler.isDisabled("query.search.roots") %>'>
          <jalios:control settings='<%= new CategorySettings().multiple() %>' />
        </jalios:field>

      </fieldset>
    </div>
    <div class="col-md-6">
    
      <%-- SEARCH - TAGS --%>
      <fieldset class="col-md-12">
        <legend><jalios:icon src="tag" /> <%= glp("ui.com.lbl.tags") %></legend>
        
        <jalios:field label="ui.com.lbl.facet" name='query_facets_tags' value='<%= formHandler.getQuery_facets_tags() %>'>
          <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
        </jalios:field>

        <jalios:field label="ui.adm.prop.srch.tags" name="channel_tag_root" description="ui.adm.prop.srch.tags.h" value="<%= formHandler.getChannel_tag_root() %>" disabled='<%= formHandler.isDisabled("$channel.tag-root") %>'>
          <jalios:control type="<%= ControlType.CATEGORY %>" />
        </jalios:field>

      </fieldset>
    </div>
  </div>
  
  <%-- SEARCH - TYPES --%>
  <fieldset class="col-md-12">
    <legend><jalios:icon src="publication" /> <%= glp("ui.work.search.tab.type") %></legend>
    
    <jalios:field label="ui.com.lbl.facet" name='query_facets_types' value='<%= formHandler.getQuery_facets_types() %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
    </jalios:field>
    
    <% isChecked = Util.toBoolean(formHandler.getQuery_facets_ugcs(), false); %>
    <jalios:field label="ui.adm.prop.srch.types.ugcs" name='query_facets_ugcs' tooltip="ui.adm.prop.srch.types.ugcs.h" value='<%= isChecked %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    
    <div class="row">
      <div class="col-md-6">
      
    <% String[] typesFacetOff = formHandler.getTypeFacetOff(); %>    
    <% String[] typesOff = formHandler.getTypeOff(); %>  
    <table class="table-data table-condensed">
      <tr>
        <td class="text-center"><%= glp("ui.com.lbl.contents") %></td>
        <td class="text-center"><%= glp("ui.adm.prop.srch.types.typesoff") %>   <jalios:tooltip property="ui.adm.prop.srch.types.typesoff.h" /></td>
        <td class="text-center"><%= glp("ui.adm.prop.srch.types.searchable") %> <jalios:tooltip property="ui.adm.prop.srch.types.searchable.h" /></td>
      </tr>
      <%
        ArrayList<Class> typeList = new ArrayList<Class>();
        typeList.addAll(channel.getSubTypeList(Content.class, userLang));
        
        for (Class itType : typeList) {
          boolean isDBType  = DBData.class.isAssignableFrom(itType);
          boolean isTypeOff = false;
          String  typeIcon  = isDBType ? "images/jalios/icons/publicationdb.gif" : "images/jalios/icons/publication.gif";
          
          for (int i = 0 ; i < typesOff.length ; i++) { 
            if (typesOff[i].equals(itType.getName())) { isTypeOff = true; break; }
          }
          
          boolean isTypeFacetOff = isTypeOff;
          if (!isTypeOff){
            for (int i = 0 ; i < typesFacetOff.length ; i++) { 
              if (typesFacetOff[i].equals(itType.getName())) { isTypeFacetOff = true; break; }
            }
          }
      %>
      <tr>
        <td><jalios:dataicon class="<%= itType %>"/> <%= channel.getTypeLabel(itType, userLang) %></td>
        <td class="text-center">
        <%-- QueryHandler can't handle typesOff on DBObjects --%>
        <% if (isDBType) { %><jalios:icon src="bullet" /><% } else { %>
          <input type="checkbox" name="querytypes_<%= itType.getName() %>"  value="default" <%= !isTypeOff ? "checked=\"checked\"" : "" %> data-jalios-action="toggle:disabled" data-jalios-target='INPUT[name="searchtypes_<%= itType.getName() %>"]' />
        <% } %>
        </td>
        <td class="text-center"><input type="checkbox" name="searchtypes_<%= itType.getName() %>"  value="true" <%= !isTypeFacetOff ? "checked=\"checked\"" : (isTypeOff ? "disabled=\"disabled\" class=\"disabled\"" : "") %> /></td>
      </tr>
      <% } %>
    </table>
      
  </div><div class="col-md-6">
    
    <table class="table-data table-condensed">
      <tr>
        <td class="text-center"><%= glp("ui.com.lbl.ugcs") %></td>
        <td class="text-center"><%= glp("ui.adm.prop.srch.types.typesoff") %>   <jalios:tooltip property="ui.adm.prop.srch.types.typesoff.h" /></td>
        <td class="text-center"><%= glp("ui.adm.prop.srch.types.searchable") %> <jalios:tooltip property="ui.adm.prop.srch.types.searchable.h" /></td>
      </tr>
      <%
        typeList = new ArrayList<Class>();
        typeList.addAll(channel.getSubTypeList(UserContent.class, userLang));
        
        for (Class itType : typeList) {
          boolean isDBType  = DBData.class.isAssignableFrom(itType);
          boolean isTypeOff = false;
          String  typeIcon  = isDBType ? "images/jalios/icons/publicationdb.gif" : "images/jalios/icons/publication.gif";
          
          boolean isTypeFacetOff = isTypeOff;
          for (int i = 0 ; i < typesFacetOff.length ; i++) { 
            if (typesFacetOff[i].equals(itType.getName())) { isTypeFacetOff = true; break; }
          }
      %>
      <tr>
        <td><jalios:dataicon class="<%= itType %>"/>  <%= channel.getTypeLabel(itType, userLang) %></td>
        <td class="text-center">
        <%-- QueryHandler can't handle typesFacetOff on DBObjects --%>
        <% if (isDBType) { %><jalios:icon src="bullet" /><% } else { %>
          <input type="checkbox" name="querytypes_<%= itType.getName() %>" value="default" <%= !isTypeOff ? "checked=\"checked\"" : "" %> data-jalios-action="toggle:disabled" data-jalios-target='INPUT[name="searchtypes_<%= itType.getName() %>"]' />
        <% } %>
        </td>
        <td class="text-center"><input type="checkbox" name="searchtypes_<%= itType.getName() %>"  value="true" <%= !isTypeFacetOff ? "checked=\"checked\"" : (isTypeOff ? "disabled=\"disabled\" class=\"disabled\"" : "") %> /></td>
      </tr>
      <% } %>
      
    </table>
    
      </div>
    </div>
  </fieldset>
  
  <div class="row">
    <div class="col-md-6">
    
  <%-- SEARCH - DOCS --%>
  <fieldset class="col-md-12">
    <legend><jalios:icon src="pdf" /> <%= glp("ui.work.search.tab.kind") %></legend>
    
    <jalios:field label="ui.com.lbl.facet" name='query_facets_docs' value='<%= formHandler.getQuery_facets_docs() %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
    </jalios:field>
  </fieldset>
  
  <%-- SEARCH - DATES --%>
  <fieldset class="col-md-12">
    <legend><jalios:icon src="calendar" /> <%= glp("ui.work.search.tab.date") %></legend>
    
    <jalios:field label="ui.com.lbl.facet" name='query_facets_date' value='<%= formHandler.getQuery_facets_date() %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
    </jalios:field>

  </fieldset>
  
  <%-- SEARCH - LANGUAGE --%>
  <fieldset class="col-md-12">
    <legend><jalios:lang lang='<%= channel.getLanguage() %>' /> <%= glp("ui.work.search.tab.lang") %></legend>
    
    <jalios:field label="ui.com.lbl.facet" name='query_facets_lang' value='<%= formHandler.getQuery_facets_lang() %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
    </jalios:field>

  </fieldset>
  
  <%-- SEARCH - AUTHOR --%>
  <fieldset class="col-md-12">
    <legend><jalios:icon src="group" /> <%= glp("ui.work.search.tab.group") %></legend>
    
    <jalios:field label="ui.com.lbl.facet" name='query_facets_author' value='<%= formHandler.getQuery_facets_author() %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
    </jalios:field>

  </fieldset>
  
  </div><div class="col-md-6">
  
  <%-- SEARCH - PSTATUS --%>
  <fieldset class="col-md-12">
    <legend><jalios:icon src="workflow-green" /> <%= glp("ui.work.search.tab.state") %></legend>
    
    <jalios:field label="ui.com.lbl.facet" name='query_facets_pstatus' value='<%= formHandler.getQuery_facets_pstatus() %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("1","2","0").enumLabels("ui.com.lbl.show", "ui.com.lbl.collapse", "ui.com.lbl.hide") %>' />
    </jalios:field>


  </fieldset>
  
  <%-- SEARCH - SORT --%>
  <%! String[] sortOrders = { "pstatus", "title", "author", "relevance", "cdate", "udate", "pdate", "mdate", "edate", "adate", "sdate" }; %>
  <fieldset class="col-md-12">
    <legend><jalios:icon src="orderby" /> <%= glp("ui.adm.prop.srch.sort-order") %></legend>
    
    <table class='table'>
      <tr>
        <td><%= glp("ui.com.lbl.fo") %></td>
        <td><%= glp("ui.com.lbl.bo") %></td>
      </tr>
      <tr>
        <td><ul class="list-unstyled">
          <% for (int i = 0; i < sortOrders.length; i++) { %>
          <li>
            <label for="<%= sortOrders[i] %>_idfo">
            <input type="radio" id="<%= sortOrders[i] %>_idfo"  name="query_sort_fo" value="<%= sortOrders[i] %>" <% if (sortOrders[i].equals(formHandler.getQuery_sort_fo())) { %>checked="checked"<%}%> />
            <%= glp("ui.pager.sort.text." + sortOrders[i]) %></label>
          </li>
          <% } %>
        </ul></td>
        <td><ul class="list-unstyled">
          <% for (int i = 0; i < sortOrders.length; i++) { %>
          <li>
            <label for="<%= sortOrders[i] %>_idbo">
            <input type="radio" id="<%= sortOrders[i] %>_idbo" name="query_sort_bo" value="<%= sortOrders[i] %>" <% if (sortOrders[i].equals(formHandler.getQuery_sort_bo())) { %>checked="checked"<%}%> />
            <%= glp("ui.pager.sort.text." + sortOrders[i]) %></label>
          </li>
          <% } %>
        </ul></td>
      </tr>
    </table>
  </fieldset>


  </div>
</div>