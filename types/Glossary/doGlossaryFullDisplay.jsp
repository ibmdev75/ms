<%--
  @Summary: Glossary display template
  @Category: Core Type / Glossary
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.recommendation.RecommendationManager" %><%

Glossary obj = (Glossary)request.getAttribute("publication");
boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView")); 
boolean canEdit = !printView && channel.isDataWriteEnabled() && jcmsContext.isEditIcon() && loggedMember.canPublish(GlossaryEntry.class, workspace);
%>
<jsp:useBean id="formHandler" scope="page" class="generated.EditGlossaryEntryHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="id" value="<%= null %>" />
  <jsp:setProperty name="formHandler" property="glossary" value="<%= obj.getId() %>" />
</jsp:useBean>
<% 

if (canEdit && formHandler.validate()) {
  request.setAttribute("redirect", obj.getDisplayUrl(userLocale)); // TODO OD generalize
  return;
}

boolean isPreview = getBooleanParameter("preview", false);
DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
DataSelector selector = isPreview ? authorizedSelector : new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
%>
<jalios:query name="entrySet" 
              dataset="<%= obj.getLinkIndexedDataSet(GlossaryEntry.class) %>" 
              comparator="<%= Publication.getTitleComparator(userLang) %>" 
              selector="<%= selector %>"/> 

<%
SortedSet alphaIndex = new TreeSet();
for(Iterator it = entrySet.iterator(); it.hasNext();) {
  GlossaryEntry entry = (GlossaryEntry)it.next();
  alphaIndex.add(Util.unaccentuate(entry.getTitle(userLang)).substring(0,1).toUpperCase());
}
%>
<div class="fullDisplay glossary">
  <%@ include file="/front/publication/doPublicationHeader.jspf" %>  
  <% Publication pub = obj;%>
  
  <% if (Util.notEmpty(obj.getDescription())) { %>
    <div class="description abstract">
      <jalios:wiki data="<%= obj %>" field="description"><%= obj.getDescription(userLang) %></jalios:wiki>
    </div>
  <% } %>
  
  <%-- *** FORM ************************************************** --%>
  <% if (canEdit) { %>
  
    <div class='newEntry editArea <%= jcmsContext.showEditIcon() ? "" : "hidden" %>'>
      <a href="#add" data-jalios-action="toggle:hide" data-jalios-target=".glossary .glossary-add" class="btn btn-default"><jalios:icon src="add"  alt="+" /> <%= glp("ui.glossary.lbl.add-entry") %></a>
    </div>
    
    <% int formElementCount = 0; %>
    <form class="glossary-add<%= hasParameter("opCreate") ? "" : " hide" %>" action="<%= JcmsUtil.getDisplayUrl() %>" method="post" name="editForm">
      <br>
      <%@ include file="/jcore/doMessageBox.jspf" %>
      
      <jalios:field name="title" label="ui.glossary.lbl.term" required="true" ml="<%= channel.isMultilingual() %>" value="<%= formHandler.getAllAvailableTitleML() %>" resource="field-vertical">
        <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
      </jalios:field>
      
      <jalios:field name="definition" label="ui.glossary.lbl.definition" ml="<%= channel.isMultilingual() %>" value="<%= formHandler.getAllAvailableDefinitionML() %>" resource="field-vertical">
        <jalios:control settings='<%= new WikiAreaSettings().rows(10) %>' />
      </jalios:field>

      <button class="btn btn-primary" type="submit" name="opCreate" value="true"><%= glp("ui.com.btn.save") %></button>
      <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" />
      <input type="hidden" name="ws" value="<%= workspace.getId() %>" />
      <% 
      ArrayList paramList = new ArrayList(); 
      paramList.add("title");
      paramList.add("definition");
      paramList.add("glossary");
      paramList.add("opCreate");
      paramList.add("ws");
      paramList.add("redirect");
      %><%= printDisabledHiddenParams(request, paramList) %>
      <hr>
    </form>
  <% } %>

  <%-- *** INDEX ************************************************** --%>
  <div class="index">
    <ul class="pagination pagination-lg nobr">
    <% for(char letter = 'A'; letter <= 'Z'; letter++) { %>
      <li class="<%= alphaIndex.contains("" + letter) ? "" : "disabled" %>">
        <a href="<%= ServletUtil.getUrl(request) %>#<%= letter %>"><%= letter %></a>
      </li>
    <% } %>
    </ul>
  </div>
  
  
  <%-- *** ENTRIES ******************************************************** --%>
  <% 
  char prevLetter = ' '; 
  boolean isNewLetter = false;
  %> 
  <jalios:foreach name="itEntry" type="GlossaryEntry" collection="<%= entrySet %>">
    <% 
    char currLetter = Character.toUpperCase(Util.unaccentuate(itEntry.getTitle(userLang)).charAt(0));
    if (currLetter != prevLetter) {
      isNewLetter = true;
      prevLetter = currLetter;
    } else {
      isNewLetter = false;
    }
    %>
    <% if (isNewLetter) { %> 
      <a id="<%= currLetter %>" class="anchor"></a>
      <h2 class="well well-sm"><%= currLetter %></h2>
    <% } %> 
    
      <div class='entry <%= itEntry.isInVisibleState() ? "pub-state" : "work-state" %>'>
      <a id="<%= itEntry.getId() %>"></a>
      <%-- TERM ------------------------------------------------------------ --%> 
      <div class="term">
        <h3>
          <%= itEntry.getTitle(userLang) %>
          <jalios:edit id="<%= itEntry.getId() %>" fields="title,definition,seeAlso" />
          <jalios:recommendation data="<%= itEntry %>"><jalios:icon title='<%= glp("ui.recommendation") %>' src="recommendation" alt='<%= glp("ui.recommendation") %>'  /></jalios:recommendation>
        </h3>
      </div>
      
      <%-- DEFINITION ------------------------------------------------------------ --%> 
      <div class="definition">
        <jalios:wiki data="<%= itEntry %>" field="definition"><%= itEntry.getDefinition(userLang) %></jalios:wiki>
      </div>
      
      <%-- SEE ALSO ------------------------------------------------------------ --%> 
      <% if (Util.notEmpty(itEntry.getSeeAlso())) { %>
        <div class="seealso">
          <span class="glossary-label"><%= glp("ui.glossary.txt.see-also") %></span>
          <jalios:foreach counter="c2" array="<%= itEntry.getSeeAlso() %>" name="itRelated" type="GlossaryEntry">
            <span class="glossary-value"><%= c2.intValue() > 1 ? "&middot; " : "" %><jalios:link data="<%= itRelated %>" /></span>
          </jalios:foreach>
        </div>
      <% } %>
      
      <%-- MULTILINGUAL TERM ------------------------------------------------------------ --%> 
      <% if (channel.isMultilingual()) { %>
        <jalios:buffer name="translationLine">
          <jalios:foreach counter="c2" collection="<%= channel.getLanguageList() %>" name="itLang" type="String">
            <% if (!itLang.equals(userLang) && Util.notEmpty(itEntry.getTitle(itLang, false))) { %>
              <jalios:lang lang="<%= itLang %>"/> <%= itEntry.getTitle(itLang, false) %> &middot; 
            <% } %>
          </jalios:foreach>
        </jalios:buffer>
        
        <% if (Util.notEmpty(translationLine)) { %>
          <div class="translation">
            <span class="glossary-label"><%= glp("ui.glossary.txt.trans") %></span>
            <span class="glossary-value"><%= translationLine %></span>
          </div>
        <% } %>
      <% } %>
    </div>
  </jalios:foreach>
</div>