<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.AbstractPortlet diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.AbstractPortlet newObj = (generated.AbstractPortlet)request.getAttribute("newPub"); 
generated.AbstractPortlet oldObj = (generated.AbstractPortlet)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.AbstractPortlet.class);
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
 
  <%-- ** description ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getDescription(itLang, false), oldObj.getDescription(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "descriptionDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "description", userLang) %>
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
    String newDescription = newObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(newObj.getDescription(itLang, false));
    String oldDescription = oldObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(oldObj.getDescription(itLang, false));
    request.setAttribute("newField", newDescription);
    request.setAttribute("oldField", oldDescription);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newDescription));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldDescription));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldDescription));
    %>
    <jalios:wiki><%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %></jalios:wiki>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** portletImage ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPortletImage(itLang, false), oldObj.getPortletImage(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "portletImage", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
    </td>
    <td><%= Util.getString(newObj.getPortletImage(itLang, false), "") %></td>
    <td><%= Util.getString(oldObj.getPortletImage(itLang, false), "") %></td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** cacheType ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCacheType(), oldObj.getCacheType()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "cacheType", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getCacheType(), "") %></td>
    <td><%= Util.getString(oldObj.getCacheType(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** cacheSensibility ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCacheSensibility(), oldObj.getCacheSensibility()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "cacheSensibility", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getCacheSensibility(), "") %></td>
    <td><%= Util.getString(oldObj.getCacheSensibility(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** invalidClass ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getInvalidClass(), oldObj.getInvalidClass()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "invalidClass", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getInvalidClass())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getInvalidClass() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getInvalidClass())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getInvalidClass() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** invalidTime ***************** --%>
  <jalios:if predicate='<%= newObj.getInvalidTime() != oldObj.getInvalidTime() %>'>
  <tr class="vTop" >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "invalidTime", userLang) %></td>
    <td><jalios:duration time='<%= newObj.getInvalidTime() * 1000 %>'/></td>
    <td><jalios:duration time='<%= oldObj.getInvalidTime() * 1000 %>'/></td>
  </tr>
  </jalios:if>
  <%-- ** displayCSS ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getDisplayCSS(), oldObj.getDisplayCSS()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "displayCSS", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getDisplayCSS(), "") %></td>
    <td><%= Util.getString(oldObj.getDisplayCSS(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** width ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getWidth(), oldObj.getWidth()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "widthDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "width", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newWidth = newObj.getWidth() == null ? "" : Util.toWordLine(newObj.getWidth());
    String oldWidth = oldObj.getWidth() == null ? "" : Util.toWordLine(oldObj.getWidth());
    request.setAttribute("newField", newWidth);
    request.setAttribute("oldField", oldWidth);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newWidth));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldWidth));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldWidth));
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
  <%-- ** insetLeft ***************** --%>
  <jalios:if predicate='<%= newObj.getInsetLeft() != oldObj.getInsetLeft() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "insetLeft", userLang) %></td>
    <td><%= newObj.getInsetLeft()  %></td>
    <td><%= oldObj.getInsetLeft()  %></td>
  </tr>
  </jalios:if>
  <%-- ** insetRight ***************** --%>
  <jalios:if predicate='<%= newObj.getInsetRight() != oldObj.getInsetRight() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "insetRight", userLang) %></td>
    <td><%= newObj.getInsetRight()  %></td>
    <td><%= oldObj.getInsetRight()  %></td>
  </tr>
  </jalios:if>
  <%-- ** insetTop ***************** --%>
  <jalios:if predicate='<%= newObj.getInsetTop() != oldObj.getInsetTop() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "insetTop", userLang) %></td>
    <td><%= newObj.getInsetTop()  %></td>
    <td><%= oldObj.getInsetTop()  %></td>
  </tr>
  </jalios:if>
  <%-- ** insetBottom ***************** --%>
  <jalios:if predicate='<%= newObj.getInsetBottom() != oldObj.getInsetBottom() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "insetBottom", userLang) %></td>
    <td><%= newObj.getInsetBottom()  %></td>
    <td><%= oldObj.getInsetBottom()  %></td>
  </tr>
  </jalios:if>
  <%-- ** cellPadding ***************** --%>
  <jalios:if predicate='<%= newObj.getCellPadding() != oldObj.getCellPadding() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "cellPadding", userLang) %></td>
    <td><%= newObj.getCellPadding()  %></td>
    <td><%= oldObj.getCellPadding()  %></td>
  </tr>
  </jalios:if>
  <%-- ** alignH ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAlignH(), oldObj.getAlignH()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "alignH", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getAlignH(), "") %></td>
    <td><%= Util.getString(oldObj.getAlignH(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** alignV ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAlignV(), oldObj.getAlignV()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "alignV", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getAlignV(), "") %></td>
    <td><%= Util.getString(oldObj.getAlignV(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** alignTable ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAlignTable(), oldObj.getAlignTable()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "alignTable", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getAlignTable(), "") %></td>
    <td><%= Util.getString(oldObj.getAlignTable(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** border ***************** --%>
  <jalios:if predicate='<%= newObj.getBorder() != oldObj.getBorder() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "border", userLang) %></td>
    <td><%= newObj.getBorder()  %></td>
    <td><%= oldObj.getBorder()  %></td>
  </tr>
  </jalios:if>
  <%-- ** borderColor ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBorderColor(), oldObj.getBorderColor()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "borderColor", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getBorderColor(), "") %></td>
    <td><%= Util.getString(oldObj.getBorderColor(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** backColor ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBackColor(), oldObj.getBackColor()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "backColor", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getBackColor(), "") %></td>
    <td><%= Util.getString(oldObj.getBackColor(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** backImage ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBackImage(), oldObj.getBackImage()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "backImage", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getBackImage(), "") %></td>
    <td><%= Util.getString(oldObj.getBackImage(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** behaviorCopy ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBehaviorCopy(), oldObj.getBehaviorCopy()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "behaviorCopy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getBehaviorCopy(), "") %></td>
    <td><%= Util.getString(oldObj.getBehaviorCopy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** originalPortlet ***************** --%>
  <jalios:if predicate='<%= newObj.getOriginalPortlet() != oldObj.getOriginalPortlet() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "originalPortlet", userLang) %></td>
    <td>
      <% Data newLink = newObj.getOriginalPortlet(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getOriginalPortlet(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** condition ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCondition(), oldObj.getCondition()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "condition", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getCondition())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getCondition() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getCondition())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getCondition() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** cssId ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCssId(), oldObj.getCssId()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "cssIdDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "cssId", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newCssId = newObj.getCssId() == null ? "" : Util.toWordLine(newObj.getCssId());
    String oldCssId = oldObj.getCssId() == null ? "" : Util.toWordLine(oldObj.getCssId());
    request.setAttribute("newField", newCssId);
    request.setAttribute("oldField", oldCssId);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newCssId));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldCssId));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldCssId));
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
  <%-- ** cssClasses ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCssClasses(), oldObj.getCssClasses()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "cssClassesDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.AbstractPortlet.class, "cssClasses", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newCssClasses = newObj.getCssClasses() == null ? "" : Util.toWordLine(newObj.getCssClasses());
    String oldCssClasses = oldObj.getCssClasses() == null ? "" : Util.toWordLine(oldObj.getCssClasses());
    request.setAttribute("newField", newCssClasses);
    request.setAttribute("oldField", oldCssClasses);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newCssClasses));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldCssClasses));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldCssClasses));
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
%><%-- whLudLeANsa1qSYhO/w/+w== --%>