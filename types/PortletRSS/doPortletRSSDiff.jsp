<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletRSS diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletRSS newObj = (generated.PortletRSS)request.getAttribute("newPub"); 
generated.PortletRSS oldObj = (generated.PortletRSS)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletRSS.class);
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
 
  <%-- ** source ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSource(), oldObj.getSource()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletRSS.class, "source", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getSource(), "") %></td>
    <td><%= Util.getString(oldObj.getSource(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** showTitle ***************** --%>
  <jalios:if predicate='<%= newObj.getShowTitle() != oldObj.getShowTitle() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "showTitle", userLang) %></td>
    <td><%= newObj.getShowTitleLabel(userLang) %></td>
    <td><%= oldObj.getShowTitleLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showDescription ***************** --%>
  <jalios:if predicate='<%= newObj.getShowDescription() != oldObj.getShowDescription() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "showDescription", userLang) %></td>
    <td><%= newObj.getShowDescriptionLabel(userLang) %></td>
    <td><%= oldObj.getShowDescriptionLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showImage ***************** --%>
  <jalios:if predicate='<%= newObj.getShowImage() != oldObj.getShowImage() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "showImage", userLang) %></td>
    <td><%= newObj.getShowImageLabel(userLang) %></td>
    <td><%= oldObj.getShowImageLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showWebMastersEmail ***************** --%>
  <jalios:if predicate='<%= newObj.getShowWebMastersEmail() != oldObj.getShowWebMastersEmail() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "showWebMastersEmail", userLang) %></td>
    <td><%= newObj.getShowWebMastersEmailLabel(userLang) %></td>
    <td><%= oldObj.getShowWebMastersEmailLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showItemsDescription ***************** --%>
  <jalios:if predicate='<%= newObj.getShowItemsDescription() != oldObj.getShowItemsDescription() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "showItemsDescription", userLang) %></td>
    <td><%= newObj.getShowItemsDescriptionLabel(userLang) %></td>
    <td><%= oldObj.getShowItemsDescriptionLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** openLinksInNewWindow ***************** --%>
  <jalios:if predicate='<%= newObj.getOpenLinksInNewWindow() != oldObj.getOpenLinksInNewWindow() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "openLinksInNewWindow", userLang) %></td>
    <td><%= newObj.getOpenLinksInNewWindowLabel(userLang) %></td>
    <td><%= oldObj.getOpenLinksInNewWindowLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** trackingEnabled ***************** --%>
  <jalios:if predicate='<%= newObj.getTrackingEnabled() != oldObj.getTrackingEnabled() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "trackingEnabled", userLang) %></td>
    <td><%= newObj.getTrackingEnabledLabel(userLang) %></td>
    <td><%= oldObj.getTrackingEnabledLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** refresh ***************** --%>
  <jalios:if predicate='<%= newObj.getRefresh() != oldObj.getRefresh() %>'>
  <tr class="vTop" >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "refresh", userLang) %></td>
    <td><jalios:duration time='<%= newObj.getRefresh() * 1000 %>'/></td>
    <td><jalios:duration time='<%= oldObj.getRefresh() * 1000 %>'/></td>
  </tr>
  </jalios:if>
  <%-- ** maxItems ***************** --%>
  <jalios:if predicate='<%= newObj.getMaxItems() != oldObj.getMaxItems() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "maxItems", userLang) %></td>
    <td><%= newObj.getMaxItems()  %></td>
    <td><%= oldObj.getMaxItems()  %></td>
  </tr>
  </jalios:if>
  <%-- ** skipFirstItems ***************** --%>
  <jalios:if predicate='<%= newObj.getSkipFirstItems() != oldObj.getSkipFirstItems() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletRSS.class, "skipFirstItems", userLang) %></td>
    <td><%= newObj.getSkipFirstItems()  %></td>
    <td><%= oldObj.getSkipFirstItems()  %></td>
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
%><%-- Zpu7cORfcxe1SEW6z7YeMw== --%>