<%@ include file='/jcore/doInitPage.jspf' %>

  <% com.jalios.jcms.handler.TypeEditorHandler formHandler = (com.jalios.jcms.handler.TypeEditorHandler)request.getAttribute("formHandler"); %>
  <script type="text/JavaScript" language="JavaScript">
    function clearTabsInput(id) {
      $A($(id).getElementsByTagName("input")).each(function(elm, idx) { elm.value = ""; }); 
    }
   </script>
  
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.adm.type-edit.tabs.tab") %></h2>
    
    <form method="post" action="admin/typeEditor.jsp" name="editFormTabs">
      <p><%= glp("ui.adm.type-edit.tabs.tab-list") %>
      <% if (channel.isMultilingual()) { %>
      <a href="#" class="ctxLangForm ctxmenu langStatus icon"><jalios:lang lang="<%= channel.getLanguage() %>" /></a>
	 	  <% } %>
	 	  </p>
	 	  <jalios:foreach collection='<%= formHandler.getTabMap().entrySet() %>' name='itEntry' type='Map.Entry' counter='c1'>
		    <input type='hidden' name='typeTabIds' value='<%= itEntry.getKey() %>' />
		    <% Map labelMap = (Map)itEntry.getValue(); %>
		   <jalios:field  name='<%= "typeTabLabels" %>' ml='<%= true && channel.isMultilingual() %>' value='<%= labelMap %>' resource="field-vertical">
         <jalios:control type="<%= ControlType.TEXTFIELD %>" />
       </jalios:field>

		  </jalios:foreach>
		  
		  <% for(int i=0; i < 2; i++) { %>
		 <jalios:field  name='<%= "typeTabLabels" %>' ml='<%= true && channel.isMultilingual() %>'  resource="field-vertical">
       <jalios:control type="<%= ControlType.TEXTFIELD %>" />
     </jalios:field>

		  <% } %>
      <input type="hidden" name="type" value="<%= formHandler.getTypeName() %>" />
      <input class='btn btn-primary' type="submit" name="opUpdateTabs" value='<%= glp("ui.com.btn.update") %>' />
	  </form>
  </div>
