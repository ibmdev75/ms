<%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.MergeCategoryHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
if (formHandler.validate()) { %>
<%
if (Util.notEmpty(formHandler.getRedirect())) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
}
%>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>


<jalios:modal title="ui.work.cat.merge.title" 
              url="work/mergeCategory.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg merge-category"
              picture=""
              op="opMerge"
              button="ui.work.cat.merge.btn.merge">

  <jalios:message msg='<%= glp("ui.work.cat.merge.intro", formHandler.getAvailableSrcCat()) %>' title="" />
  
  <jalios:field name="tgtCat" resource="field-inline">
    <jalios:control settings='<%= new CategorySettings().tree().multiple().filter(CategoryFilter.MANAGE) %>' />
  </jalios:field>

  <input type="hidden" name="srcCat" value="<%= formHandler.getAvailableSrcCat().getId() %>" />
  <input type="hidden" name="redirect" value="<%= formHandler.getRedirect() %>" />
  
  <jalios:buffer name="MODAL_BUTTONS">
   <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
   <button type="submit" class="btn btn-primary ajax-refresh plupload-submit confirm" name='opMerge' value="true"><%= glp("ui.work.cat.merge.btn.merge") %></button>
  </jalios:buffer>  
  
</jalios:modal>
