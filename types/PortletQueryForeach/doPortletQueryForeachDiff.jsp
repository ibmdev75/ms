<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletQueryForeach diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletQueryForeach newObj = (generated.PortletQueryForeach)request.getAttribute("newPub"); 
generated.PortletQueryForeach oldObj = (generated.PortletQueryForeach)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletQueryForeach.class);
boolean isSuperTypeIncluded = Boolean.TRUE.equals((Boolean)request.getAttribute("isSuperTypeIncluded")); 
{
  Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
  if (superFieldCount != null) { 
    fieldCount = superFieldCount.intValue();
  }
}
String fieldDomId = "";
%>
<% if (!isSuperTypeIncluded) { %>
  <%-- ** title *****************  --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTitle(itLang, false), oldObj.getTitle(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td>
      <%= typeEntry.getTitleLabel(userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
    </td>
    <% 
      fieldDomId = "titleDiffDomId_" + itLang ; 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
		<jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    String newTitle = newObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(newObj.getTitle(itLang, false));
    String oldTitle = oldObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(oldObj.getTitle(itLang, false));
    request.setAttribute("newField", newTitle);
    request.setAttribute("oldField", oldTitle);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newTitle));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTitle));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTitle));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% oldReader.close(); %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
<% } %>
 
  <%-- ** searchInDB ***************** --%>
  <jalios:if predicate='<%= newObj.getSearchInDB() != oldObj.getSearchInDB() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "searchInDB", userLang) %></td>
    <td><%= newObj.getSearchInDBLabel(userLang) %></td>
    <td><%= oldObj.getSearchInDBLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** queries ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getQueries(), oldObj.getQueries()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "queries", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getQueries())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getQueries() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getQueries())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getQueries() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** refineQueries ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getRefineQueries(), oldObj.getRefineQueries()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "refineQueries", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getRefineQueries(), "") %></td>
    <td><%= Util.getString(oldObj.getRefineQueries(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** refineWithContextualCategories ***************** --%>
  <jalios:if predicate='<%= newObj.getRefineWithContextualCategories() != oldObj.getRefineWithContextualCategories() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "refineWithContextualCategories", userLang) %></td>
    <td><%= newObj.getRefineWithContextualCategoriesLabel(userLang) %></td>
    <td><%= oldObj.getRefineWithContextualCategoriesLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** orderBy ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getOrderBy(), oldObj.getOrderBy()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "orderBy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getOrderBy(), "") %></td>
    <td><%= Util.getString(oldObj.getOrderBy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** reverseOrder ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getReverseOrder(), oldObj.getReverseOrder()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "reverseOrder", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getReverseOrder(), "") %></td>
    <td><%= Util.getString(oldObj.getReverseOrder(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** maxResults ***************** --%>
  <jalios:if predicate='<%= newObj.getMaxResults() != oldObj.getMaxResults() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "maxResults", userLang) %></td>
    <td><%= newObj.getMaxResults()  %></td>
    <td><%= oldObj.getMaxResults()  %></td>
  </tr>
  </jalios:if>
  <%-- ** skipFirstResults ***************** --%>
  <jalios:if predicate='<%= newObj.getSkipFirstResults() != oldObj.getSkipFirstResults() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "skipFirstResults", userLang) %></td>
    <td><%= newObj.getSkipFirstResults()  %></td>
    <td><%= oldObj.getSkipFirstResults()  %></td>
  </tr>
  </jalios:if>
  <%-- ** showPager ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getShowPager(), oldObj.getShowPager()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "showPager", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getShowPager(), "") %></td>
    <td><%= Util.getString(oldObj.getShowPager(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** pagerLabel ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPagerLabel(itLang, false), oldObj.getPagerLabel(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "pagerLabelDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "pagerLabel", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newPagerLabel = newObj.getPagerLabel(itLang, false) == null ? "" : Util.toWordLine(newObj.getPagerLabel(itLang, false));
    String oldPagerLabel = oldObj.getPagerLabel(itLang, false) == null ? "" : Util.toWordLine(oldObj.getPagerLabel(itLang, false));
    request.setAttribute("newField", newPagerLabel);
    request.setAttribute("oldField", oldPagerLabel);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newPagerLabel));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldPagerLabel));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldPagerLabel));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** pageSizes ***************** --%>
  <%-- ** pagerAllLimit ***************** --%>
  <jalios:if predicate='<%= newObj.getPagerAllLimit() != oldObj.getPagerAllLimit() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "pagerAllLimit", userLang) %></td>
    <td><%= newObj.getPagerAllLimit()  %></td>
    <td><%= oldObj.getPagerAllLimit()  %></td>
  </tr>
  </jalios:if>
  <%-- ** hideWhenNoResults ***************** --%>
  <jalios:if predicate='<%= newObj.getHideWhenNoResults() != oldObj.getHideWhenNoResults() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "hideWhenNoResults", userLang) %></td>
    <td><%= newObj.getHideWhenNoResultsLabel(userLang) %></td>
    <td><%= oldObj.getHideWhenNoResultsLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** firstPublications ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFirstPublications(), oldObj.getFirstPublications()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "firstPublications", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getFirstPublications())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getFirstPublications() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getFirstPublications())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getFirstPublications() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** showInCurrentPortal ***************** --%>
  <jalios:if predicate='<%= newObj.getShowInCurrentPortal() != oldObj.getShowInCurrentPortal() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "showInCurrentPortal", userLang) %></td>
    <td><%= newObj.getShowInCurrentPortalLabel(userLang) %></td>
    <td><%= oldObj.getShowInCurrentPortalLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** contextCategory ***************** --%>
  <jalios:if predicate='<%= newObj.getContextCategory() != oldObj.getContextCategory() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeach.class, "contextCategory", userLang) %></td>
    <td><%= newObj.getContextCategoryLabel(userLang) %></td>
    <td><%= oldObj.getContextCategoryLabel(userLang) %></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/AbstractPortletSkinable/doAbstractPortletSkinableDiff.jsp"/>
<%
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
  ServletUtil.restoreAttribute(pageContext, "isSuperTypeIncluded");
%>
<% if (!isSuperTypeIncluded) { 
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  request.setAttribute("fieldCount", new Integer(fieldCount));
%>  
<jsp:include page="/work/doCommonPubDiff.jsp"/>
<% 
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
 } else {
     request.setAttribute("fieldCount", new Integer(fieldCount));
 } %>
<% } %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 0xe/cfs9SPJXqWXw01W4yw== --%>