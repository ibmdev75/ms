<%--
  @Summary: Wiki preview popup
  @Category: Presentation / Popup
  @Requestable: True
  @Customizable: False
  @Deprecated: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><% 

  request.setAttribute("title","Preview"); 
  request.setAttribute("zone","InternalUI");

 String theBodyContent = "";
 String targetInput = getChooserParameter("targetInput");

 // first step/request: retrieve content to preview in JavaScript and POST a form with it.
 if (Util.notEmpty(targetInput)) {
  %>
 <jalios:buffer name='redirectBuffer'>
  <form name="editForm" action="work/wikiPopup.jsp" method="post">
    <input type="hidden" name="hiddenContent" value="" />
  </form>
  <script language="javascript">
    document.editForm.hiddenContent.value = window.opener.<%= targetInput %>;
    document.editForm.submit();
  </script>
 </jalios:buffer>
  <%
  theBodyContent = redirectBuffer;
  
 // second step/request: retrieve content to preview from POST
 } else {  
  String hiddenContent = getUntrustedStringParameter("hiddenContent", null); // ENCODE !!
  request.setAttribute("com.jalios.jcms.WIKI_PREVIEW", Boolean.TRUE);
  if (Util.notEmpty(hiddenContent)) {
    %>
   <jalios:buffer name='wikiBuffer'>
    <table class="text-center">
      <tr> 
        <td bgcolor="#FFFFFF">
          <jalios:wiki><%= Util.encodeHtmlBasicEntities(hiddenContent) %></jalios:wiki>
        </td>
      </tr>
    </table>
   </jalios:buffer>
    <%
    theBodyContent = wikiBuffer;
   }
 }

%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
%><%= theBodyContent %><%
%><%@ include file='/jcore/doEmptyFooter.jspf' %>