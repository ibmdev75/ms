<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletQueryForeachDetail diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletQueryForeachDetail newObj = (generated.PortletQueryForeachDetail)request.getAttribute("newPub"); 
generated.PortletQueryForeachDetail oldObj = (generated.PortletQueryForeachDetail)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletQueryForeachDetail.class);
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
 
  <%-- ** showTitle ***************** --%>
  <jalios:if predicate='<%= newObj.getShowTitle() != oldObj.getShowTitle() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showTitle", userLang) %></td>
    <td><%= newObj.getShowTitleLabel(userLang) %></td>
    <td><%= oldObj.getShowTitleLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showAbstract ***************** --%>
  <jalios:if predicate='<%= newObj.getShowAbstract() != oldObj.getShowAbstract() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showAbstract", userLang) %></td>
    <td><%= newObj.getShowAbstractLabel(userLang) %></td>
    <td><%= oldObj.getShowAbstractLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showAuthor ***************** --%>
  <jalios:if predicate='<%= newObj.getShowAuthor() != oldObj.getShowAuthor() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showAuthor", userLang) %></td>
    <td><%= newObj.getShowAuthorLabel(userLang) %></td>
    <td><%= oldObj.getShowAuthorLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showCategories ***************** --%>
  <jalios:if predicate='<%= newObj.getShowCategories() != oldObj.getShowCategories() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showCategories", userLang) %></td>
    <td><%= newObj.getShowCategoriesLabel(userLang) %></td>
    <td><%= oldObj.getShowCategoriesLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showDate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getShowDate(), oldObj.getShowDate()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showDate", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getShowDate(), "") %></td>
    <td><%= Util.getString(oldObj.getShowDate(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** showStatus ***************** --%>
  <jalios:if predicate='<%= newObj.getShowStatus() != oldObj.getShowStatus() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showStatus", userLang) %></td>
    <td><%= newObj.getShowStatusLabel(userLang) %></td>
    <td><%= oldObj.getShowStatusLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showType ***************** --%>
  <jalios:if predicate='<%= newObj.getShowType() != oldObj.getShowType() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showType", userLang) %></td>
    <td><%= newObj.getShowTypeLabel(userLang) %></td>
    <td><%= oldObj.getShowTypeLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showRights ***************** --%>
  <jalios:if predicate='<%= newObj.getShowRights() != oldObj.getShowRights() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showRights", userLang) %></td>
    <td><%= newObj.getShowRightsLabel(userLang) %></td>
    <td><%= oldObj.getShowRightsLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showId ***************** --%>
  <jalios:if predicate='<%= newObj.getShowId() != oldObj.getShowId() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletQueryForeachDetail.class, "showId", userLang) %></td>
    <td><%= newObj.getShowIdLabel(userLang) %></td>
    <td><%= oldObj.getShowIdLabel(userLang) %></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/PortletQueryForeach/doPortletQueryForeachDiff.jsp"/>
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
%><%-- Bj2zMwm6jaNkfev2Mu6xbw== --%>