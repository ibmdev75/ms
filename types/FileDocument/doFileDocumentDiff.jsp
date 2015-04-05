<%--
  @Summary: FileDocument diff page
  @Category: Customized
  @Author: Olivier Dedieu
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
{
FileDocument newObj = (FileDocument)request.getAttribute("newPub"); 
FileDocument oldObj = (FileDocument)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
%>
  <%-- ** title *****************  --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTitle(itLang, false), oldObj.getTitle(itLang, false)) %>'>
  <tr valign="top" class='<%= (fieldCount % 2 == 0) ? "listOddRow" :"listEvenRow"  %>'>
    <td><%= fieldCount++ %></td>
    <td><%= glp("ui.com.lbl.title") %>&nbsp;<jalios:lang lang='<%= itLang %>'/></td>
    <td align="left" colspan="2">
    <%
    String newTitle = newObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(newObj.getTitle(itLang, false));
    String oldTitle = oldObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(oldObj.getTitle(itLang, false));
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
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** description ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getDescription(itLang, false), oldObj.getDescription(itLang, false)) %>'>
  <tr valign="top" class='<%= (fieldCount % 2 == 0) ? "listOddRow" :"listEvenRow"  %>'>
    <td><%= fieldCount++ %></td>
    <td><%= glp("ui.com.lbl.description") %>&nbsp;<jalios:lang lang='<%= itLang %>'/></td>
    <td align="left" colspan="2">
    <%
    String newDescription = newObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(newObj.getDescription(itLang, false));
    String oldDescription = oldObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(oldObj.getDescription(itLang, false));
    BufferedReader newReader = new BufferedReader(new StringReader(newDescription));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldDescription));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldDescription));
    %>
    <jalios:wiki><%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %></jalios:wiki>
    <% oldReader.close(); %>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** filename ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFilename(), oldObj.getFilename()) %>'>
  <tr valign="top" class='<%= (fieldCount % 2 == 0) ? "listOddRow" :"listEvenRow"  %>'>
    <td><%= fieldCount++ %></td>
    <td><%= glp("ui.filedocument.lbl.filename") %></td>
    <td><jalios:fileicon doc='<%= newObj %>' /> <%= new File(newObj.getFilename()).getName() %></td>
    <td><jalios:fileicon doc='<%= oldObj %>' /> <%= new File(oldObj.getFilename()).getName() %></td>
  </tr>
  </jalios:if>
  <%-- ** originalFilename ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getOriginalFilename(), oldObj.getOriginalFilename()) %>'>
  <tr valign="top" class='<%= (fieldCount % 2 == 0) ? "listOddRow" :"listEvenRow"  %>'>
    <td><%= fieldCount++ %></td>
    <td><%= glp("ui.filedocument.lbl.ori-filename") %></td>
    <td><%= newObj.getOriginalFilename() %></td>
    <td><%= oldObj.getOriginalFilename() %></td>
  </tr>
  </jalios:if>
  <%-- ** contentType ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getContentType(), oldObj.getContentType()) %>'>
  <tr valign="top" class='<%= (fieldCount % 2 == 0) ? "listOddRow" :"listEvenRow"  %>'>
    <td><%= fieldCount++ %></td>
    <td><%= glp("ui.filedocument.lbl.ctnt-type") %></td>
    <td align="left" colspan="2">
    <%
    String newContentType = newObj.getContentType() == null ? "" : Util.toWordLine(newObj.getContentType());
    String oldContentType = oldObj.getContentType() == null ? "" : Util.toWordLine(oldObj.getContentType());
    BufferedReader newReader = new BufferedReader(new StringReader(newContentType));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldContentType));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldContentType));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% oldReader.close(); %>
    </td>
  </tr>
  </jalios:if>
  
  <%-- ** uploadDate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getUploadDate(), oldObj.getUploadDate()) %>'>
  <% String trClass = (fieldCount % 2 == 0) ? "listOddRow" :"listEvenRow"; %>
  <tr valign="top" class='<%= trClass %>' onmouseover="this.className='listOverRow';" onmouseout="this.className='<%= trClass %>';">
    <td align="right"><%= fieldCount++ %>.</td>
    <td nowrap='nowrap'><%= glp("ui.filedocument.lbl.upload-date") %></td>
    <td><jalios:date date='<%= newObj.getUploadDate() %>'/> <jalios:time date='<%= newObj.getUploadDate() %>'/></td>
    <td><jalios:date date='<%= newObj.getUploadDate() %>'/> <jalios:time date='<%= oldObj.getUploadDate() %>'/></td>
  </tr>
  </jalios:if>
<% 
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  request.setAttribute("fieldCount", new Integer(fieldCount));
%>  
<jsp:include page='<%= "/work/doCommonPubDiff.jsp" %>'/>
<% 
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
} 
%>
