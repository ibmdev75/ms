<%@ include file='/jcore/doInitPage.jspf' %>
<%
  GlossaryEntry obj = (GlossaryEntry)request.getAttribute("publication");
  Glossary glossary = obj.getGlossary();
  if (glossary != null && glossary.isInVisibleState()) {
    sendRedirect(ServletUtil.getAbsUrlWithUpdatedParam(request, "id", glossary.getId()) + "&#" + obj.getId(), request, response);
    return;
  }
%>
<div class="fullDisplay GlossaryEntry">
<p class='title'>

<% /* %>Title<% */ %><%= obj.getTitle(userLang) %>

</p>
<table class="fieldList">
  <tr class="field definition textareaEditor abstract <%= Util.isEmpty(obj.getDefinition(userLang)) ? "empty" : "" %>">
    <td class='label'>Definition</td>
    <td class='data'>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDefinition(userLang)) %>'>
            
            <jalios:wiki data="<%= obj %>" field="definition"><% /* %>Definition<% */ %><%= obj.getDefinition(userLang) %></jalios:wiki>
            
            </jalios:if>
    </td>
  </tr>
  <tr class="field seeAlso linkEditor  <%= Util.isEmpty(obj.getSeeAlso()) ? "empty" : "" %>">
    <td class='label'>See also</td>
    <td class='data'>
    <% if (Util.notEmpty(obj.getSeeAlso())) { %>
            <ol>
              <jalios:foreach name="itData" type="generated.GlossaryEntry" array="<%= obj.getSeeAlso() %>">
              <li>
              <jalios:if predicate='<%= itData != null && itData.canBeReadBy(loggedMember) %>'>
              <jalios:link data='<%= itData %>'/>
              </jalios:if>
              </li>
              </jalios:foreach>
            </ol>
    <% } %>
    </td>
  </tr>
  <tr class="field glossary linkEditor  <%= Util.isEmpty(obj.getGlossary()) ? "empty" : "" %>">
    <td class='label'>Glossary</td>
    <td class='data'>
      <jalios:if predicate='<%= obj.getGlossary() != null && obj.getGlossary().canBeReadBy(loggedMember) %>'>
        <jalios:link data='<%= obj.getGlossary() %>'/>
      </jalios:if>
    </td>
  </tr>
 
</table>
<table class="fieldList commonFields">
 <jalios:if predicate='<%= isAdmin %>'>
  <jalios:if predicate='<%= obj.getAuthor() != null %>'>
  <tr class="field author member">
    <td class='label'>
      <% /* %>Author<% */ %><%= glp("ui.com.lbl.author") %>
    </td>
    <td class='data'>
      <a href="<%= ResourceHelper.getQuery() %>?mids=<%=  obj.getAuthor().getId() %>"><% /* %>John Smith<% */ %><%= obj.getAuthor() %></a>
    </td>
  </tr>
  </jalios:if>
  <tr class="field cdate date">
    <td class='label'>
      <% /* %>CDate<% */ %><%= glp("ui.com.lbl.cdate") %>
    </td>
    <td class='data'>
      <jalios:date date='<%= obj.getCdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getCdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
  <tr class="field mdate date">
    <td class='label'>
      <% /* %>MDate<% */ %><%= glp("ui.com.lbl.mdate") %>
    </td>
    <td class='data'>
      <jalios:date date='<%= obj.getMdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getMdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
 </jalios:if>
</table>
</div>