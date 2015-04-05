<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.Interview diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.Interview newObj = (generated.Interview)request.getAttribute("newPub"); 
generated.Interview oldObj = (generated.Interview)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.Interview.class);
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
      <%= channel.getTypeFieldLabel(generated.Interview.class, "summary", userLang) %>
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
      <%= channel.getTypeFieldLabel(generated.Interview.class, "intro", userLang) %>
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
  <%-- ** bio ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getBio(itLang, false), oldObj.getBio(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "bioDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Interview.class, "bio", userLang) %>
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
    String newBio = newObj.getBio(itLang, false) == null ? "" : Util.toWordLine(newObj.getBio(itLang, false));
    String oldBio = oldObj.getBio(itLang, false) == null ? "" : Util.toWordLine(oldObj.getBio(itLang, false));
    request.setAttribute("newField", newBio);
    request.setAttribute("oldField", oldBio);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newBio));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldBio));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldBio));
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
  <%-- ** questions ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getQuestions(itLang, false), oldObj.getQuestions(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Interview.class, "questions", userLang) %>
      
        <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      
    </td>
    <td class="text-left" colspan="2">
      <table>
    <% String[] array0 = newObj.getQuestions(itLang, false) == null ? new String[0] : newObj.getQuestions(itLang, false); %>
    <% String[] array1 = oldObj.getQuestions(itLang, false) == null ? new String[0] : oldObj.getQuestions(itLang, false); %>
    <% int maxLength  = Math.max(array0.length, array1.length); %>
    <% for(int i = 0; i < maxLength; i++) { %>
    <%   String newItem = (i < array0.length && array0[i] != null ? Util.toWordLine(array0[i]) : ""); %>
    <%   String oldItem = (i < array1.length && array1[i] != null ? Util.toWordLine(array1[i]) : ""); %>
    <%   if (newItem.equals(oldItem)) { %>
        <tr>
          <td class="vTop text-right fit"><%= i + 1 %>.</td>
          <td><em><%= glp("ui.work.ver.diff.item") %></em></td>
        </tr>
    
    <%   } else { %>
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newItem));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldItem));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldItem));
    %>
        <tr>
          <td class="vTop text-right"><%= i + 1 %>.</td>
          <td width='100%'>
          <jalios:wiki><%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %></jalios:wiki>
          </td>
        </tr>
    <% oldReader.close(); %>
    <%  } %>
    <% } // for %>
      </table>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** answers ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAnswers(), oldObj.getAnswers()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Interview.class, "answers", userLang) %>
      
    </td>
    <td class="text-left" colspan="2">
      <table>
    <% String[] array0 = newObj.getAnswers() == null ? new String[0] : newObj.getAnswers(); %>
    <% String[] array1 = oldObj.getAnswers() == null ? new String[0] : oldObj.getAnswers(); %>
    <% int maxLength  = Math.max(array0.length, array1.length); %>
    <% for(int i = 0; i < maxLength; i++) { %>
    <%   String newItem = (i < array0.length && array0[i] != null ? Util.toWordLine(array0[i]) : ""); %>
    <%   String oldItem = (i < array1.length && array1[i] != null ? Util.toWordLine(array1[i]) : ""); %>
    <%   if (newItem.equals(oldItem)) { %>
        <tr>
          <td class="vTop text-right fit"><%= i + 1 %>.</td>
          <td><em><%= glp("ui.work.ver.diff.item") %></em></td>
        </tr>
    
    <%   } else { %>
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newItem));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldItem));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldItem));
    %>
        <tr>
          <td class="vTop text-right"><%= i + 1 %>.</td>
          <td width='100%'>
          <jalios:wiki><%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %></jalios:wiki>
          </td>
        </tr>
    <% oldReader.close(); %>
    <%  } %>
    <% } // for %>
      </table>
    </td>
  </tr>
  </jalios:if>
  <%-- ** questionPrefix ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getQuestionPrefix(), oldObj.getQuestionPrefix()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "questionPrefixDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Interview.class, "questionPrefix", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newQuestionPrefix = newObj.getQuestionPrefix() == null ? "" : Util.toWordLine(newObj.getQuestionPrefix());
    String oldQuestionPrefix = oldObj.getQuestionPrefix() == null ? "" : Util.toWordLine(oldObj.getQuestionPrefix());
    request.setAttribute("newField", newQuestionPrefix);
    request.setAttribute("oldField", oldQuestionPrefix);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newQuestionPrefix));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldQuestionPrefix));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldQuestionPrefix));
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
  <%-- ** answerPrefix ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAnswerPrefix(), oldObj.getAnswerPrefix()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "answerPrefixDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Interview.class, "answerPrefix", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newAnswerPrefix = newObj.getAnswerPrefix() == null ? "" : Util.toWordLine(newObj.getAnswerPrefix());
    String oldAnswerPrefix = oldObj.getAnswerPrefix() == null ? "" : Util.toWordLine(oldObj.getAnswerPrefix());
    request.setAttribute("newField", newAnswerPrefix);
    request.setAttribute("oldField", oldAnswerPrefix);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newAnswerPrefix));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldAnswerPrefix));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldAnswerPrefix));
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
  <%-- ** photo ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPhoto(), oldObj.getPhoto()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Interview.class, "photo", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getPhoto(), "") %></td>
    <td><%= Util.getString(oldObj.getPhoto(), "") %></td>
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
%><%-- w+luCTweAHE0fwyIc23CmQ== --%>