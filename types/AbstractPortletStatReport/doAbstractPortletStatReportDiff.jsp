<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.AbstractPortletStatReport diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.AbstractPortletStatReport newObj = (generated.AbstractPortletStatReport)request.getAttribute("newPub"); 
generated.AbstractPortletStatReport oldObj = (generated.AbstractPortletStatReport)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.AbstractPortletStatReport.class);
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
 
  <%-- ** scheduleDate ***************** --%>
  <jalios:if predicate='<%= newObj.getScheduleDate() != oldObj.getScheduleDate() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStatReport.class, "scheduleDate", userLang) %></td>
    <td><jalios:date date='<%= newObj.getScheduleDate() %>' /> <jalios:time date='<%= newObj.getScheduleDate() %>' /></td>
    <td><jalios:date date='<%= oldObj.getScheduleDate() %>' /> <jalios:time date='<%= oldObj.getScheduleDate() %>' /></td>
  </tr>
  </jalios:if>
  <%-- ** startingDate ***************** --%>
  <jalios:if predicate='<%= newObj.getStartingDate() != oldObj.getStartingDate() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStatReport.class, "startingDate", userLang) %></td>
    <td><jalios:date date='<%= newObj.getStartingDate() %>' /> <jalios:time date='<%= newObj.getStartingDate() %>' /></td>
    <td><jalios:date date='<%= oldObj.getStartingDate() %>' /> <jalios:time date='<%= oldObj.getStartingDate() %>' /></td>
  </tr>
  </jalios:if>
  <%-- ** endingDate ***************** --%>
  <jalios:if predicate='<%= newObj.getEndingDate() != oldObj.getEndingDate() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStatReport.class, "endingDate", userLang) %></td>
    <td><jalios:date date='<%= newObj.getEndingDate() %>' /> <jalios:time date='<%= newObj.getEndingDate() %>' /></td>
    <td><jalios:date date='<%= oldObj.getEndingDate() %>' /> <jalios:time date='<%= oldObj.getEndingDate() %>' /></td>
  </tr>
  </jalios:if>
  <%-- ** schedule ***************** --%>
  <jalios:if predicate='<%= newObj.getSchedule() != oldObj.getSchedule() %>'>
  <tr class="vTop" >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortletStatReport.class, "schedule", userLang) %></td>
    <td><jalios:duration time='<%= newObj.getSchedule() * 1000 %>'/></td>
    <td><jalios:duration time='<%= oldObj.getSchedule() * 1000 %>'/></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/AbstractCollection/doAbstractCollectionDiff.jsp"/>
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
%><%-- VpjWlaa+DLnH5zkLdyH5iw== --%>