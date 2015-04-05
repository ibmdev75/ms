<%--
  @Summary: Manage categories of the caddy
  @Category: Admin Area / Caddy
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.CategoryCaddyManagerHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
  request.setAttribute("caddyWAMenu", "true");
  request.setAttribute("caddyCategoryMenu", "true");
  request.setAttribute("title", glp("ui.work.cat-caddy.title", 0));
%>
<%@ include file='/work/doWorkHeader.jspf' %>
<div class="page-header">
  <h1 class='boTitle icon iconCategory'><% /* %>Caddy Manager<% */ %><%= glp("ui.work.cat-caddy.title", Caddy.getCaddy(request).getCategoryListSize()) %></h1>
</div>
<form action='work/caddy/categoryCaddyManager.jsp' name='editForm' method='post' class="form-horizontal">

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <div class="tab-pane" id="mainTab">

      <%-- *** GENERAL TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='edit'  alt='P'/> <% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>  
        <%@ include file='/work/caddy/doCommonCaddyManager.jspf' %>
      </div>

      <%-- *** READ RIGHT TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='read-right'  /> <% /* %>Read Rights<% */ %><%= glp("ui.work.form.lbl.read-rights") %></h2>
        
        
        <jalios:field name="noReadRight" label="ui.work.caddy.lbl.no-rr" 
                      value='<%= getBooleanParameter("noReadRight", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        
        <%-- AuthorizedGroupSet ------------------------------------------------------------ --%>
        <% Group[] authorizedGroupsValues = formHandler.getAvailableAuthorizedGroups(); %>
        <jalios:field  name='<%= "authorizedGroups" %>' required='<%= false %>' value='<%= authorizedGroupsValues %>' mv='<%= 2 %>'
                       label="ui.work.cat-caddy.lbl.grp-rr">   
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>
    
        <%-- AuthorizedMemberSet ------------------------------------------------------------ --%>
        <% Set authorizedMemberValues = formHandler.getAvailableAuthorizedMemberSet(); %>
        <jalios:field  name='<%= "authorizedMemberIds" %>' required='<%= false %>' value='<%= authorizedMemberValues %>' mv='<%= 2 %>'
                       label="ui.work.cat-caddy.lbl.mbr-rr">
          <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
        </jalios:field>
        
      </div>
      
      <%-- *** PARENT TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='folder'  /> <% /* %>Parent<% */ %><%= glp("ui.work.cat.tab.parent") %></h2>
        <jalios:field name='<%= "pid" %>'
                      label='<%= "ui.work.cat.tab.parent" %>'
                      value='<%= formHandler.isCommonParentAvailable() ? formHandler.getCommonParent() : null %>'>
          <p><%= glp("ui.work.cat.txt.parent") %></p>
          <jalios:control settings='<%= new CategorySettings().tree().filter(CategoryFilter.MANAGE) %>' />
        </jalios:field>
      </div>
       
       
      <%-- *** ADVANCED TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='advanced'  alt='A' title='<%= glp("ui.work.form.tab.adv") %>' /> <% /* %>Advanced<% */ %><%= glp("ui.work.form.tab.adv") %></h2>
        
        
        <jalios:field name="noSynonyms" label="ui.work.cat-caddy.lbl.no-synonyms" 
                      value='<%= getBooleanParameter("noSynonyms", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <jalios:field name="noIcon" label="ui.work.cat-caddy.lbl.no-icon" 
                      value='<%= getBooleanParameter("noSynonyms", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <jalios:field name="noImage" label="ui.work.cat-caddy.lbl.no-image" 
                      value='<%= getBooleanParameter("noSynonyms", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <jalios:field name="noColor" label="ui.work.cat-caddy.lbl.no-color" 
                      value='<%= getBooleanParameter("noSynonyms", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        
        <jalios:field name="selectable" label="ui.work.cat.lbl.selectable"  description="ui.work.cat.lbl.selectable.h"
                      value='<%= formHandler.isCommonSelectableAvailable() ? formHandler.getCommonSelectable() : "" %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        
        <jalios:field name="removeFriendlyURLs" label="ui.work.caddy.lbl.remove-friendly-url" 
                      value='<%= formHandler.getRemoveFriendlyURLs() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <jalios:field name="generateFriendlyURLs" label="ui.work.caddy.lbl.generate-friendly-url" 
                      value='<%= formHandler.getRemoveFriendlyURLs() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
      </div>
    </div>
  
  <% ArrayList categoryList = Caddy.getCaddy(request).getCategoryList(); %>
  <jalios:pager name='caddyPagerHandler' declare='true' action='init' size='<%= categoryList.size() %>'/>
  
  <p>  
  <%
   boolean showExportCSV = true;
   String dataType = "Category";
  %>
  <%@ include file='/work/caddy/doCommonCaddyManagerButton.jspf' %>
  </p>
  
  <%-- CATEGORY CADDY CONTENT --------------------------------------------------------------- --%> 
  <jalios:if predicate='<%= caddyPagerHandler.getItemsNbr() != 0 %>'>
    <div>
        <table id='catTable' class="table-data table-condensed">
          <tr>
            <th colspan="3">&nbsp;</th>
            <th nowrap="nowrap"><img src='s.gif' width='17' /></th>
            <th nowrap="nowrap"><%= glp("ui.com.lbl.name") %></th>
            <th nowrap="nowrap"><%= glp("ui.work.cat.lbl.sel") %></th>
            <th nowrap="nowrap">&nbsp;<jalios:icon src='key-white' title='<%= glp("ui.com.lbl.rights") %>' />&nbsp;</th>
            <th nowrap="nowrap"><%= glp("ui.work.cat.lbl.alpha") %></th>
            <th nowrap="nowrap"><%= glp("ui.com.lbl.pub-cnt") %></th>
            <th nowrap="nowrap"><%= glp("ui.work.cat.lbl.icon") %></th>
            <th nowrap="nowrap"><%= glp("ui.com.lbl.description") %> / <%= glp("ui.com.lbl.friendly-urls") %></th>
          </tr>
          
          <jalios:foreach collection='<%= categoryList %>' 
                          type='Category' 
                          name='itCat'
                          max='<%= caddyPagerHandler.getPageSize() %>'
                          skip='<%= caddyPagerHandler.getStart() %>'> 
          <tr> 
            <td class="text-right" nowrap="nowrap">
              <%= caddyPagerHandler.getStart() + itCounter.intValue() %>.
            </td>
            <td nowrap='nowrap'><jalios:edit id="<%= itCat.getId() %>" /></td>
            <td class="text-left" nowrap="nowrap">
              <a href="work/caddy/categoryCaddyManager.jsp?opRemoveCaddy=true&amp;removeIds=<%= itCat.getId() %>" onclick="this.href=JCMS.Security.getUrlWithCSRFToken(this.href); return true;" title="<%= glp("ui.com.alt.out-caddy") %>"><jalios:icon src="caddy-out"/></a>
            </td>
            <td nowrap="nowrap">
              <b><a href='work/editCat.jsp?pid=<%= itCat.getId() %>' style='text-decoration: none;color:#000000;'><%= itCat.getName(userLang) %></a></b>
              <% 
                if (formHandler.isPreviewing()) {
                  String previewedString = formHandler.previewSearchAndReplace(itCat.getName(userLang), userLang);
                  boolean previewedStringDiffers = !previewedString.equals(itCat.getName(userLang));
              %>
                <% if (previewedStringDiffers) { %><span style="color: red;"><% } %>
                <br /> ==> <%= previewedString %>
                <% if (previewedStringDiffers) { %></span><% } %>
              <% } %>
            </td>
            <td nowrap="nowrap">
              <% if (Util.notEmpty(itCat.getColor())) { %>
              <span style='background-color: <%= itCat.getColor() %>;' title='<%= itCat.getColor() %>'><img src="s.gif" width="10" /></span>
              <% } %>
            </td>
            <td class="text-center"><%= itCat.isSelectable() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
            <td class="text-center"><% if (itCat.hasAnyReadRights()) { %>&nbsp;<jalios:icon src='key' title='<%= glp("ui.com.alt.restrictcat",itCat.getReadRightsString(5)) %>' />&nbsp;<% } %></td>
            <td class="text-center"><%= itCat.isAlphabeticalOrder() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
            <td class="text-right"><a href="work/queryWork.jsp?cids=<%= itCat.getId() %>&amp;types=com.jalios.jcms.Publication"><%= itCat.getAllPublicationSet().size() %></a></td>
            <td class="text-center">
              <jalios:if predicate='<%= Util.notEmpty(itCat.getIcon(userLang)) %>'>
                <jalios:dataicon data='<%= itCat %>' />
              </jalios:if>
            </td>
            <td width='100%'>
              <jalios:truncate length="60" suffix="..."><%= Util.getString(itCat.getDescription(userLang), "") %></jalios:truncate>
              <% if (Util.notEmpty(itCat.getDescription(userLang)) && Util.notEmpty(itCat.getFriendlyURLSet())) { %><br /><% } %>
              <% String curBaseURL = ServletUtil.getBaseUrl(request); curBaseURL = curBaseURL.substring(0, curBaseURL.length()-1);%>
              <jalios:foreach name="friendlyURL" type="String" counter="fURlsCounter"
                              collection="<%= itCat.getFriendlyURLSet() %>">
               <jalios:icon src='www'  /> <a href="<%= curBaseURL %><%= friendlyURL %>"><%= friendlyURL %></a><% if (fURlsCounter.intValue() != itCat.getFriendlyURLSet().size()) { %><br /><% } %>
              </jalios:foreach>
            </td>
          </tr>
          </jalios:foreach>
        </table>

        <jalios:pager name='caddyPagerHandler'/>
    </div>
  </jalios:if>
  
</form>

<%@ include file='/work/doWorkFooter.jspf' %>