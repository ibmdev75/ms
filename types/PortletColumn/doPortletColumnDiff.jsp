<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletColumn diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletColumn newObj = (generated.PortletColumn)request.getAttribute("newPub"); 
generated.PortletColumn oldObj = (generated.PortletColumn)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletColumn.class);
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
 
  <%-- ** colSpacing ***************** --%>
  <jalios:if predicate='<%= newObj.getColSpacing() != oldObj.getColSpacing() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletColumn.class, "colSpacing", userLang) %></td>
    <td><%= newObj.getColSpacing()  %></td>
    <td><%= oldObj.getColSpacing()  %></td>
  </tr>
  </jalios:if>
  <%-- ** alignHorizontal ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAlignHorizontal(), oldObj.getAlignHorizontal()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletColumn.class, "alignHorizontal", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getAlignHorizontal())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getAlignHorizontal() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getAlignHorizontal())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getAlignHorizontal() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** alignVertical ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAlignVertical(), oldObj.getAlignVertical()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletColumn.class, "alignVertical", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getAlignVertical())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getAlignVertical() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getAlignVertical())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getAlignVertical() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** backgroundColor ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBackgroundColor(), oldObj.getBackgroundColor()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletColumn.class, "backgroundColor", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getBackgroundColor())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getBackgroundColor() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getBackgroundColor())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getBackgroundColor() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** backgroundImage ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBackgroundImage(), oldObj.getBackgroundImage()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletColumn.class, "backgroundImage", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getBackgroundImage())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getBackgroundImage() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getBackgroundImage())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getBackgroundImage() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** backgroundRepeat ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBackgroundRepeat(), oldObj.getBackgroundRepeat()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletColumn.class, "backgroundRepeat", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getBackgroundRepeat())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getBackgroundRepeat() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getBackgroundRepeat())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getBackgroundRepeat() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
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
%><%-- kb8pnjshBw65QaPofPeriA== --%>