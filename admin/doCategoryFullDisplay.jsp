<%@include file='/jcore/doInitPage.jspf' %>
<% { %>
<% 
Category category = getCategoryParameter("cid");
if (category == null) {
  category = (Category) request.getAttribute("category");
}
Category obj = category; // for doCategoryExtensionFullDisplay.jsp

if (category == null) {
  return;
}

if (!category.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}

%>
<div class="fullDisplay Category"> 
<p class='title'>
  <jalios:dataicon data='<%= category %>' />
  <%= category.getName() %>
  <jalios:edit data='<%= category %>' />
</p>

<table class="fieldList">

  <%-- Name ------------------------------------------------------------ --%> 
  <tr class="field name textareaEditor"> 
    <td class="label">
      <% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %>
    </td>
    <td class='data'> 
      <%= category.getAncestorString(" > ", true, userLang) %>
    </td>
  </tr>

  <%-- Description ------------------------------------------------------------ --%> 
  <jalios:if predicate="<%= Util.notEmpty(category.getDescription(userLang)) %>"> 
  <tr class="field description textareaEditor  <%= Util.isEmpty(category.getDescription(userLang)) ? "empty" : "" %>"> 
    <td class="label">
      <% /* %>Description<% */ %><%= glp("ui.com.lbl.description") %>
    </td>
    <td class='data'> 
      <%= category.getDescription(userLang) %>
    </td>
  </tr>
  </jalios:if>
   
  <%-- Synonym ---------------------------------------- --%> 
  <jalios:if predicate="<%= Util.notEmpty(category.getSynonyms()) %>"> 
  <tr class="field synonym textfieldEditor  <%= Util.isEmpty(category.getSynonyms()) ? "empty" : "" %>"> 
    <td class="label">
      <% /* %>Synonyms<% */ %><%= glp("ui.work.cat.lbl.synonyms") %>
    </td>
    <td class='data'> 
      <%= Util.join(category.getSynonyms(), ", ") %>
    </td>
  </tr>
  </jalios:if>
  
  <%-- Icon ---------------------------------------- --%> 
  <jalios:if predicate="<%= Util.notEmpty(category.getIcon()) %>"> 
  <tr class="field icon imageEditor  <%= Util.isEmpty(category.getIcon()) ? "empty" : "" %>"> 
    <td class="label">
      <% /* %>Image<% */ %><%= glp("ui.work.cat.lbl.icon") %>
    </td>
    <td class='data'> 
      <jalios:dataicon data="<%= category %>"/>
    </td>
  </tr>
  </jalios:if>
  
  <%-- Image ---------------------------------------- --%> 
  <jalios:if predicate="<%= Util.notEmpty(category.getImage()) %>"> 
  <tr class="field image imageEditor  <%= Util.isEmpty(category.getImage()) ? "empty" : "" %>"> 
    <td class="label">
      <% /* %>Image<% */ %><%= glp("ui.work.cat.lbl.image") %>
    </td>
    <td class='data'> 
      <img src="<%= contextPath %>/<%= category.getImage() %>" />
    </td>
  </tr>
  </jalios:if>
  
  <%-- Color ---------------------------------------- --%> 
  <jalios:if predicate="<%= Util.notEmpty(category.getImage()) %>"> 
  <tr class="field color colorEditor  <%= Util.isEmpty(category.getImage()) ? "empty" : "" %>"> 
    <td class="label">
      <% /* %>Color<% */ %><%= glp("ui.work.cat.lbl.color") %>
    </td>
    <td class='data'> 
      <span style='background-color: <%= category.getColor() %>;' title='<%= category.getColor() %>'><img src="s.gif" width="10" /></span>
    </td>
  </tr>
  </jalios:if>

  <%-- EXTENSION ------------------------------------------------------- --%> 
  <%@ include file='/types/CategoryExtension/doCategoryExtensionFullDisplay.jspf' %>
</table> 
</div>
<% } %>
