<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  
  int boxStatus = Util.toInt(request.getAttribute("query.facets.text"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  boolean options = getBooleanParameter("search_options", false);
  boolean advanced    = channel.getBooleanProperty("query.facets.advanced",false);
%>
<jalios:accordion-panel title="ui.work.search.tab.text" picture="textfield-rename" >
 <%
   String sSearchMode = qh.getMode(); // default is "all" 
   if (!QueryHandler.TEXT_MODE_ALL_WORDS.equals(sSearchMode)){
     options = true;
   }
   
   String searchedFieldsTitleInputId = FACET_PREFIX + "searchedFieldsTitle";
   boolean bSearchedFields = Util.arrayContains(qh.getSearchedFields(), com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD); 
 
   String searchedFieldsAbstractInputId = FACET_PREFIX + "searchedFieldsAbstract";
   boolean bSearchedAbstract = Util.arrayContains(qh.getSearchedFields(), com.jalios.jcms.search.LucenePublicationSearchEngine.ABSTRACT_FIELD);
   
   boolean fldChecked = !bSearchedFields && !bSearchedAbstract;
   if (!fldChecked){
     options = true;
   }
 %>
   <div id="facet-text-options" class='text-options stick stick-footer '>
     <h5><% /* %>Search with:<% */ %><%= glp("ui.work.search.text.s-with") %></h5>
     <% 
       
       String modeInputIdPrefix = FACET_PREFIX + "mode"; 
     %>
     <ul class="facet-list list-unstyled">
       <% boolean checked = QueryHandler.TEXT_MODE_ALL_WORDS.equals(sSearchMode); %>
	     <li <%=  checked ? "class='checked'" : "" %>>
	       <label for="<%= modeInputIdPrefix %>all">
	         <input id="<%= modeInputIdPrefix %>all"      type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_ALL_WORDS %>" <%=  checked ? "checked='checked'" : "" %> />
	         <jalios:icon src="textfield-rename" />
	         <% /* %>all words<% */ %><%= glp("ui.work.search.text.mode.all") %>
	       </label>
	     </li>
	     <% checked = QueryHandler.TEXT_MODE_ANY_WORD.equals(sSearchMode); %>
	     <li <%=  checked ? "class='checked'" : "" %>>
	       <label for="<%= modeInputIdPrefix %>any">
	         <input id="<%= modeInputIdPrefix %>any"      type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_ANY_WORD %>"  <%=  checked ? "checked='checked'" : "" %> />
	         <jalios:icon src="textfield-rename" />
	         <% /* %>any words<% */ %><%= glp("ui.work.search.text.mode.any") %>
	       </label>
	     </li>
	     <% checked = QueryHandler.TEXT_MODE_EXACT.equals(sSearchMode); %>
	     <li <%=  checked ? "class='checked'" : "" %>>
	       <label for="<%= modeInputIdPrefix %>exact">
	         <input id="<%= modeInputIdPrefix %>exact"    type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_EXACT %>"     <%=  checked ? "checked='checked'" : "" %> />
	         <jalios:icon src="textfield-rename" />
	         <% /* %>exact match<% */ %><%= glp("ui.work.search.text.mode.exact") %>
	       </label>
	     </li>
	     <% checked = QueryHandler.TEXT_MODE_ADVANCED.equals(sSearchMode); %>
	     <li <%=  checked ? "class='checked'" : "" %>>
	       <label for="<%= modeInputIdPrefix %>advanced">
	         <input id="<%= modeInputIdPrefix %>advanced" type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_ADVANCED %>"  <%=  checked ? "checked='checked'" : "" %> />
	         <jalios:icon src="textfield-rename" />
	         <% /* %>advanced match<% */ %><%= glp("ui.work.search.text.mode.adv") %>
	       </label>
	       <jalios:tooltip property="ui.work.search.text.mode.adv.h" />
	     </li>
     </ul>
   
     <h5><% /* %>Search in<% */ %><%= glp("ui.work.search.text.s-in") %></h5>
     <ul class="facet-list list-unstyled">
       <li class='exclusive <%= fldChecked ? "checked":"" %>'>
         <% String searchedAllFieldsInputId = FACET_PREFIX + "searchedAllFields"; %>
         <label for="<%= searchedAllFieldsInputId %>">
           <input id="<%= searchedAllFieldsInputId %>" type="checkbox" name="searchedAllFields" value="true" <%= fldChecked ? "checked='checked'" : "" %> />
           <jalios:icon src="textfield-rename" />
           <% /* %>All Fields<% */ %><%= glp("ui.work.search.text.all-fields") %>
         </label>
       </li>
       <li <%= bSearchedFields ? "class='checked'" : "" %>>
         <label for="<%= searchedFieldsTitleInputId %>">
           <input id="<%= searchedFieldsTitleInputId %>" type="checkbox" name="searchedFields" value="<%= com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD %>" <%= bSearchedFields ? "checked='checked'" : "" %> />
           <jalios:icon src="textfield-rename" />
           <% /* %>Titre<% */ %><%= glp("ui.work.search.text.title") %>
         </label>
       </li>
       <li <%= bSearchedAbstract ? "class='checked'" : "" %>>
         <label for="<%= searchedFieldsAbstractInputId %>">
           <input id="<%= searchedFieldsAbstractInputId %>" type="checkbox" name="searchedFields" value="<%= com.jalios.jcms.search.LucenePublicationSearchEngine.ABSTRACT_FIELD %>" <%= bSearchedAbstract ? "checked='checked'" : "" %> />
           <jalios:icon src="textfield-rename" />
           <% /* %>Abstract<% */ %><%= glp("ui.work.search.text.abstract") %>
         </label>
       </li>
     </ul>
     <ul class="facet-list list-unstyled">
       <% 
         String searchedFieldsCatInputId = FACET_PREFIX + "searchedFieldsCat";
         boolean bCatName = qh.getCatName();
       %>
       <li <%= bCatName ? "class='checked'" : "" %>>
         <label for="<%= searchedFieldsCatInputId %>">
           <% if (advanced) { %>
           <input id="<%= searchedFieldsCatInputId %>" type="checkbox" name="catNameUI" <% if (bCatName) { %>checked="checked"<% } %>
                  data-jalios-action="toggle:disabled toggle:disabled" data-jalios-target="#<%= searchedFieldsCatInputId %>HiddenTrue | #<%= searchedFieldsCatInputId %>HiddenFalse" />
           <% } else { %>
             <input id="<%= searchedFieldsCatInputId %>" type="checkbox" name="catName" value="<%= bCatName %>" checked="checked" class="boolean" />
           <% } %>
           <jalios:icon src="textfield-rename" />
           <% /* %>Category name<% */ %><%= glp("ui.work.search.text.cat") %>
         </label>
         <%
           if (advanced) {
             %><input id="<%= searchedFieldsCatInputId %>HiddenTrue" type="hidden" name="catName" value="true" <% if (!bCatName) { %>disabled="disabled"<% } %> /><%
             %><input id="<%= searchedFieldsCatInputId %>HiddenFalse" type="hidden" name="catName" value="false" <% if (bCatName) { %>disabled="disabled"<% } %> /><%
           }
         %>
       </li>
       <% 
         String searchedFieldsFilesInputId = FACET_PREFIX + "searchedFieldsFiles";
         boolean bSearchInFiles = qh.getSearchInFiles(); 
       %>
       <li <%= bSearchInFiles ? "class='checked'" : "" %>>
         <label for="<%= searchedFieldsFilesInputId %>">
           <% if (advanced) { %>
             <input id="<%= searchedFieldsFilesInputId %>" type="checkbox" name="searchInFilesUI" <% if (bSearchInFiles) { %>checked="checked"<% } %>
                    data-jalios-action="toggle:disabled toggle:disabled" data-jalios-target="#<%= searchedFieldsFilesInputId %>HiddenTrue | #<%= searchedFieldsFilesInputId %>HiddenFalse" />
           <% } else { %>
             <input id="<%= searchedFieldsFilesInputId %>" type="checkbox" name="searchInFiles" value="<%= bSearchInFiles %>" checked="checked" class="boolean" />
           <% } %>
           <jalios:icon src="textfield-rename" />
           <% /* %>Attached files<% */ %><%= glp("ui.work.search.text.file") %>
         </label>
         <%
           if (advanced) {
             %><input id="<%= searchedFieldsFilesInputId %>HiddenTrue" type="hidden" name="searchInFiles" value="true" <% if (!bSearchInFiles) { %>disabled="disabled"<% } %> /><%
             %><input id="<%= searchedFieldsFilesInputId %>HiddenFalse" type="hidden" name="searchInFiles" value="false" <% if (bSearchInFiles) { %>disabled="disabled"<% } %> /><%
           }
         %>
       </li>
     </ul>
   </div>
  
</jalios:accordion-panel>