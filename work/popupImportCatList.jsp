<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  request.setAttribute("title",glp("ui.work.cat-imp.title")); 
  request.setAttribute("zone","InternalUI");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<jsp:useBean id="importHandler" scope="page" class="com.jalios.jcms.handler.ImportCatListHandler"> 
  <jsp:setProperty name="importHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="importHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name='importHandler' property='*' />
</jsp:useBean>

<% importHandler.doUpload(request); %>

<%-- IMPORT PERFORMED, CLOSE THE POPUP --%>
<% if (importHandler.isPerformed()) { %>
<script>
 opener.document.location = '<%= encodeForJavaScript(importHandler.getRedirect()) %>';
 close();
</script>

<%-- IMPORT FORM --%>
<% } else { %>
<div class="WorkArea work-popupImportCatList">
  <div class="page-header"><h1><%= glp("ui.work.cat-imp.title") %></h1></div>
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <form action='work/popupImportCatList.jsp' method='post' name='editForm' enctype="multipart/form-data">
   <div class='formBox'>
    <jalios:message msg="ui.work.cat-imp.txt.info" title="" />
    <div class='inputArea'>
      <div style="margin:8px 8px 8px 0">
        <span class="formLabel"><%= glp("ui.com.lbl.file-name") %></span>
        <span class="formLabel"><input class='formTextfield' type='file' name='file' size='50' /></span>
      </div>
      <input class='btn btn-primary' type='submit' value='<%= glp("ui.work.cat-imp.btn.import") %>' />
      <button class='btn btn-default' onclick='window.close();'><%= glp("ui.com.btn.cancel") %></button>
      <input type='hidden' name='pid' value='<%= importHandler.getPid() %>' />
      <input type='hidden' name='redirect' value='<%= importHandler.getRedirect() %>' />
      <input type='hidden' name='performImport' value='true' />
    </div>
   </div>
  </form>
</div>
<% } %>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
