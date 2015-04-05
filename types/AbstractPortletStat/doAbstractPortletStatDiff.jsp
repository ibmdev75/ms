<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.AbstractPortletStat diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.AbstractPortletStat newObj = (generated.AbstractPortletStat)request.getAttribute("newPub"); 
generated.AbstractPortletStat oldObj = (generated.AbstractPortletStat)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.AbstractPortletStat.class);
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
 
  <%-- ** tabGroup ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTabGroup(itLang, false), oldObj.getTabGroup(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "tabGroupDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "tabGroup", userLang) %>
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
    String newTabGroup = newObj.getTabGroup(itLang, false) == null ? "" : Util.toWordLine(newObj.getTabGroup(itLang, false));
    String oldTabGroup = oldObj.getTabGroup(itLang, false) == null ? "" : Util.toWordLine(oldObj.getTabGroup(itLang, false));
    request.setAttribute("newField", newTabGroup);
    request.setAttribute("oldField", oldTabGroup);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newTabGroup));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTabGroup));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTabGroup));
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
  <%-- ** displayTimeChart ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayTimeChart() != oldObj.getDisplayTimeChart() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "displayTimeChart", userLang) %></td>
    <td><%= newObj.getDisplayTimeChartLabel(userLang) %></td>
    <td><%= oldObj.getDisplayTimeChartLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** displayWeekChart ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayWeekChart() != oldObj.getDisplayWeekChart() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "displayWeekChart", userLang) %></td>
    <td><%= newObj.getDisplayWeekChartLabel(userLang) %></td>
    <td><%= oldObj.getDisplayWeekChartLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** displayAverage ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayAverage() != oldObj.getDisplayAverage() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "displayAverage", userLang) %></td>
    <td><%= newObj.getDisplayAverageLabel(userLang) %></td>
    <td><%= oldObj.getDisplayAverageLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** regExpFilter ***************** --%>
  <jalios:if predicate='<%= newObj.getRegExpFilter() != oldObj.getRegExpFilter() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "regExpFilter", userLang) %></td>
    <td><%= newObj.getRegExpFilterLabel(userLang) %></td>
    <td><%= oldObj.getRegExpFilterLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** topTen ***************** --%>
  <jalios:if predicate='<%= newObj.getTopTen() != oldObj.getTopTen() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "topTen", userLang) %></td>
    <td><%= newObj.getTopTen()  %></td>
    <td><%= oldObj.getTopTen()  %></td>
  </tr>
  </jalios:if>
  <%-- ** filteredArea ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFilteredArea(), oldObj.getFilteredArea()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortletStat.class, "filteredArea", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getFilteredArea(), "") %></td>
    <td><%= Util.getString(oldObj.getFilteredArea(), "") %></td>
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
%><%-- fvoPZAF4y11szXjTf0sLnA== --%>