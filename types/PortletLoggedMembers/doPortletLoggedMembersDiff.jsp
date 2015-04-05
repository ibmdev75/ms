<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletLoggedMembers diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletLoggedMembers newObj = (generated.PortletLoggedMembers)request.getAttribute("newPub"); 
generated.PortletLoggedMembers oldObj = (generated.PortletLoggedMembers)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletLoggedMembers.class);
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
 
  <%-- ** limitPortletAccess ***************** --%>
  <jalios:if predicate='<%= newObj.getLimitPortletAccess() != oldObj.getLimitPortletAccess() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletLoggedMembers.class, "limitPortletAccess", userLang) %></td>
    <td><%= newObj.getLimitPortletAccessLabel(userLang) %></td>
    <td><%= oldObj.getLimitPortletAccessLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** displayNumbers ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayNumbers() != oldObj.getDisplayNumbers() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletLoggedMembers.class, "displayNumbers", userLang) %></td>
    <td><%= newObj.getDisplayNumbersLabel(userLang) %></td>
    <td><%= oldObj.getDisplayNumbersLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** displayMembers ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getDisplayMembers(), oldObj.getDisplayMembers()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletLoggedMembers.class, "displayMembers", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getDisplayMembers(), "") %></td>
    <td><%= Util.getString(oldObj.getDisplayMembers(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** displayLinkToMembersProfile ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayLinkToMembersProfile() != oldObj.getDisplayLinkToMembersProfile() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletLoggedMembers.class, "displayLinkToMembersProfile", userLang) %></td>
    <td><%= newObj.getDisplayLinkToMembersProfileLabel(userLang) %></td>
    <td><%= oldObj.getDisplayLinkToMembersProfileLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** maximumMembers ***************** --%>
  <jalios:if predicate='<%= newObj.getMaximumMembers() != oldObj.getMaximumMembers() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletLoggedMembers.class, "maximumMembers", userLang) %></td>
    <td><%= newObj.getMaximumMembers()  %></td>
    <td><%= oldObj.getMaximumMembers()  %></td>
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
%><%-- 1JNt1hUWnC8dtAocfaGeaA== --%>