<%--
	@Summary: Display list of archived publication, and allow search and delete
	@Category: Work Area / Content
	@Author: Oliver Jaquemet
	@Copyright: Jalios
	@Customizable: False
	@Requestable: True
	@Deprecated: False 
	@Since: jcms-4.1.1
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.archive.ArchiveBrowserHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
%><%

	if (formHandler.validate()) {
	  return;
	}

  // Set work area header attributes
  if ("form".equals(formHandler.getOriginalType())) {
	  request.setAttribute("title", glp("ui.work.mn.form.archived"));
	  request.setAttribute("formWAMenu", "true");
	  request.setAttribute("archivedFormWAMenu", "true");
  } else {
    request.setAttribute("title", glp("ui.work.mn.ctnt.archived"));
    request.setAttribute("contentWAMenu", "true");
    request.setAttribute("archivedContentWAMenu", "true");
  }
  
  PageResult<ArchivedPublication> pageResult = formHandler.getPageResult();
  
%><%
%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

%>
<jalios:pager name='abPagerHandler' declare='true' action='init' size='<%= pageResult.getTotalSize() %>'/>
<div class="page-header">
	<h1><%= request.getAttribute("title") %> <small>(<%= pageResult.getTotalSize() %>)</small></h1>
</div>
<div class="navbar navbar-default navbar-table-header">
<form action='work/archiveBrowser.jsp' name='searchForm' class='navbar-form navbar-left'>
	<input class='form-control' type="text" name="text" value="<%= encodeForHTMLAttribute(formHandler.getText()) %>" />
	<input type="hidden" name="originalType" value="<%= formHandler.getOriginalType() %>" />
	<input type="hidden" name="wrkspc" value="<%= formHandler.getWorkspace() != null ? formHandler.getWorkspace().getId() : "" %>" />
  <label for='archiveBrowserMode'><% /* %>Search with:<% */ %><%= glp("ui.work.search.text.s-with") %></label>
	<select id='archiveBrowserMode' class='form-control' name='mode'>
	  <option value="<%= QueryHandler.TEXT_MODE_ALL_WORDS %>" <%= formHandler.getMode().equals(QueryHandler.TEXT_MODE_ALL_WORDS) ? "selected" : "" %>>&nbsp;<% /* %>all words<% */ %><%= glp("ui.work.search.text.mode.all") %></option>
	  <option value="<%= QueryHandler.TEXT_MODE_ANY_WORD %>" <%= formHandler.getMode().equals(QueryHandler.TEXT_MODE_ANY_WORD) ? "selected" : "" %>>&nbsp;<% /* %>any words<% */ %><%= glp("ui.work.search.text.mode.any") %></option>
	  <option value="<%= QueryHandler.TEXT_MODE_EXACT %>" <%= formHandler.getMode().equals(QueryHandler.TEXT_MODE_EXACT) ? "selected" : "" %>>&nbsp;<% /* %>exact match<% */ %><%= glp("ui.work.search.text.mode.exact") %></option>
	  <option value="<%= QueryHandler.TEXT_MODE_ADVANCED %>" <%= formHandler.getMode().equals(QueryHandler.TEXT_MODE_ADVANCED) ? "selected" : "" %>>&nbsp;<% /* %>advanced<% */ %><%= glp("ui.work.search.text.mode.adv") %></option>
	</select>
	<input class='btn btn-primary' type="submit" value="<%=  glp("ui.work.pub.lbl.search-text")  %>"  />
	<a href="#" onclick="clearField(document.searchForm.text);document.searchForm.submit();return false;"><jalios:icon src="remove"  alt='<%= glp("ui.com.alt.clear") %>'  /></a>
</form>
</div>

	<%-- *** PUB LIST ************************************************************************************************************************************************ --%>
	<jalios:if predicate="<%= Util.notEmpty(pageResult.getResultList()) %>">
  <% int formElementCount  = 0; %>
  <form action='work/archiveBrowser.jsp' name='editForm' method='post'>
    <table id='pubTable' class="table-data table-condensed">
      <tr>
        <%-- --- Select All Ids checkbox --------------------------- --%>
        <td class='listHeader'>
          <input type='checkbox' title="<%= glp("ui.com.alt.check-all") %>" onclick='javascript:checkAllwithId(document.editForm, "ids", this)' /><% formElementCount++; %>
        </td>
        <%-- --- Numbers --------------------------- --%>
        <td class='listHeader'></td>
		    <%-- --- RIGHTS --------------------------- --%>
		    <td class='listHeader'>
		      <jalios:icon src='key-white' title='<%= glp("ui.com.lbl.rights") %>' />
		    </td>			
        <%-- --- TITLE --------------------------- --%>
       <th width='100%'>
          <%= glp("ui.com.lbl.title") %>
        </th>
        <%-- --- AUTHOR --------------------------- --%>
        <td class='listHeader'>
          <%= glp("ui.com.lbl.author") %>
          <jalios:pager name='abPagerHandler' action='showSort' sort='authorId'/>
        </td>
        <%-- --- WORKSPACE --------------------------- --%>
        <td class='listHeader'>
	    		<%= glp("ui.com.lbl.workspace") %>
          <jalios:pager name='abPagerHandler' action='showSort' sort='workspaceId'/>
        </td>
        <%-- --- ORIGINAL TYPE --------------------------- --%>
        <td class='listHeader'>
          <%= glp("ui.com.lbl.type") %>
          <jalios:pager name='abPagerHandler' action='showSort' sort='originalType'/>
        </td>
				<%-- --- CDATE of ArchivedPublication ==> "Archived" date of original publication --------------------------- --%>
				<td class='listHeader'>
				  <%= glp("ui.com.lbl.adate") %>
          <jalios:pager name='abPagerHandler' action='showSort' sort='cdate'/>
				</td>
        <%-- --- ID --------------------------- --%>
        <td class='listHeader'>
          <%= glp("ui.com.lbl.id") %>
          <jalios:pager name='abPagerHandler' action='showSort' sort='rowId'/>
        </td>
      </tr>
      
     <jalios:foreach name='itArchive'
 							    type='ArchivedPublication' collection='<%= pageResult.getResultList() %>'
                  max="<%= abPagerHandler.getPageSize() %>">
     
      <tr> 

        <%-- --- Select archive checkbox --------------------------- --%>
        <td align='center'>
         <% if (isLogged && itArchive.canBeUpdatedBy(loggedMember)) { %>
          <input type="checkbox" name="ids" value="<%= itArchive.getRowId() %>" /><% formElementCount++; %>
         <% } else { // output false checkbox just for GUI uniformity %>
          <input type="checkbox" name="" value="" disabled="disabled" /><% formElementCount++; %>
         <% } %>
        </td>
        <%-- --- Numbers --------------------------- --%>
				<td align='right nowrap'>
          <%= abPagerHandler.getStart() + itCounter.intValue() %>.
        </td>
		    <%-- --- RIGHTS --------------------------- --%>
        <td align='center'>
          <% if (itArchive.hasAnyReadRights()) { %>
          <jalios:icon src='key' title='<%= glp("ui.com.alt.restricted", itArchive.getReadRightsString(5)) %>' />
          <% } %>
        </td>
        <%-- --- TITLE --------------------------- --%>
        <td>
          <jalios:icon src='archive'  title='<%= glp("ui.com.lbl.archived") %>' />
          <a href='work/archiveDisplayWork.jsp?id=<%= itArchive.getRowId() %>'><%= itArchive.getTitle(userLang) %></a>
	      </td>
        <%-- --- AUTHOR --------------------------- --%>
        <td align='left nowrap'>
          <% if (itArchive.getAuthor() == loggedMember) { %><b><%= itArchive.getAuthor() %></b><% } else { %><%= itArchive.getAuthor() %><% } %>
        </td>
        <%-- --- WORKSPACE --------------------------- --%>
        <td class="text-overflow"><%= itArchive.getWorkspace() != null ? itArchive.getWorkspace().getTitle(userLang) : "" %></td>
        <%-- --- ORIGINAL TYPE --------------------------- --%>
        <td class='text-right'><%= Util.getString(itArchive.getOriginalTypeLabel(), "") %></td>
        <%-- --- CDATE --------------------------- --%>
        <td class='text-right'><jalios:date date='<%= itArchive.getCdate() %>' format='<%= "short" %>'/></td>
        <%-- --- ID --------------------------- --%>
        <td class='text-right'><%= itArchive.getRowId() %></td>
      </tr>
     </jalios:foreach>
     
    </table>
    <jalios:pager name='abPagerHandler'/>
    <br />
    
    <%-- --- Workspace Migration Button --------------------------- --%>
    <jalios:if predicate="<%= isAdmin && Workspace.getAllWorkspaceSetWithoutModel().size() > 1 %>">
    <select name="newWSId">
      <jalios:foreach collection="<%= Workspace.getAllWorkspaceSetWithoutModel() %>" name="itWS" type="Workspace">
        <option value="<%= itWS.getId() %>"><%= itWS.getTitle(userLang) %></option>
      </jalios:foreach>
    </select><% formElementCount++; %>
    <input class='btn btn-default' type='submit' name='opMigrateWS' value="<%= glp("ui.work.archive-browser.migrate") %>" />&nbsp;<% formElementCount++; %>
    </jalios:if>
    
    <%-- --- Delete Button  --------------------------- --%>                                                 
    <input class='btn btn-default' type='button' name='opDelete' value="<%= glp("ui.com.btn.delete") %>" onclick='javascript:confirmSubmitForm(window,document.editForm,"opDelete","<%= encodeForJavaScript(glp("ui.work.archive-browser.confirm-delete")) %>")' /><% formElementCount++; %>
    <input type='hidden' name='action' value='true' />
  </form>
    
	</jalios:if>

<%@ include file='/work/doWorkFooter.jspf' %> 
