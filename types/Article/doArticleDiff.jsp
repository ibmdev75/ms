<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.Article diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.Article newObj = (generated.Article)request.getAttribute("newPub"); 
generated.Article oldObj = (generated.Article)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.Article.class);
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
 
  <%-- ** summary ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSummary(itLang, false), oldObj.getSummary(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "summaryDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Article.class, "summary", userLang) %>
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
    String newSummary = newObj.getSummary(itLang, false) == null ? "" : Util.toWordLine(newObj.getSummary(itLang, false));
    String oldSummary = oldObj.getSummary(itLang, false) == null ? "" : Util.toWordLine(oldObj.getSummary(itLang, false));
    request.setAttribute("newField", newSummary);
    request.setAttribute("oldField", oldSummary);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newSummary));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldSummary));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldSummary));
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
  <%-- ** intro ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getIntro(itLang, false), oldObj.getIntro(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "introDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Article.class, "intro", userLang) %>
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
    String newIntro = newObj.getIntro(itLang, false) == null ? "" : Util.toWordLine(newObj.getIntro(itLang, false));
    String oldIntro = oldObj.getIntro(itLang, false) == null ? "" : Util.toWordLine(oldObj.getIntro(itLang, false));
    request.setAttribute("newField", newIntro);
    request.setAttribute("oldField", oldIntro);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newIntro));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldIntro));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldIntro));
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
  <%-- ** picture ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPicture(itLang, false), oldObj.getPicture(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Article.class, "picture", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
    </td>
    <td><%= Util.getString(newObj.getPicture(itLang, false), "") %></td>
    <td><%= Util.getString(oldObj.getPicture(itLang, false), "") %></td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** content ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getContent(itLang, false), oldObj.getContent(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "contentDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Article.class, "content", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    
    <div id='intro_content_<%= itLang %>'>
    <%= glp("ui.work.ver.diff.ww.change") %>. <a href='#' onclick="$('textHtmlView_content_<%= itLang %>').show(); $('intro_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.detail") %>.</a>
    </div>
    <div id='textHtmlView_content_<%= itLang %>' style="display: none;">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
      <div id='textView_content_<%= itLang %>'>
        <p>
    <%= glp("ui.work.ver.diff.ww.text") %>
    - <a href='#' onclick="$('htmlView_content_<%= itLang %>').show(); $('textView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.html") %></a>
    - <a href='#' onclick="$('intro_content_<%= itLang %>').show(); $('textHtmlView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newContent = newObj.getContent(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(newObj.getContent(itLang, false)));
    String oldContent = oldObj.getContent(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(oldObj.getContent(itLang, false)));
    request.setAttribute("newField", newContent);
    request.setAttribute("oldField", oldContent);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newContent));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldContent));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldContent));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %>
    <% 
    oldReader.close(); 
    }
    %>
    
        </div>
      </div>
    
      <div id='htmlView_content_<%= itLang %>' style='display: none;'>
        <p>
    <a href='#' onclick="$('textView_content_<%= itLang %>').show(); $('htmlView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.text") %></a>
    - <%= glp("ui.work.ver.diff.ww.html") %>
    - <a href='#' onclick="$('intro_content_<%= itLang %>').show(); $('textHtmlView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newContent = newObj.getContent(itLang, false) == null ? "" : Util.toWordLine(newObj.getContent(itLang, false));
    String oldContent = oldObj.getContent(itLang, false) == null ? "" : Util.toWordLine(oldObj.getContent(itLang, false));
    request.setAttribute("newField", newContent);
    request.setAttribute("oldField", oldContent);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
            <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newContent));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldContent));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldContent));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %>
    <% 
    oldReader.close(); 
    }
    %>
    
        </div>
      </div>
    </div>
    
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** relatedContents ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getRelatedContents(), oldObj.getRelatedContents()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Article.class, "relatedContents", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getRelatedContents())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getRelatedContents() %>">
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
      <% if (Util.notEmpty(oldObj.getRelatedContents())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getRelatedContents() %>">
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
%><%-- 3FPWnnHGWbXRJXOx6GKeVA== --%>