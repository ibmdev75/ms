<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditDataIdHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%>
<% if (formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<% 
Data data = formHandler.getAvailableData(); 

String tableCSS = "table-data table-not-striped";
jcmsContext.addCSSHeader("css/jalios/data-inspector.css");
%>

<jalios:modal title="ui.adm.mn.dev.edit-data.title" 
              url="admin/editDataId.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg data-inspector"
              picture="inspect-modal-header"
              op="opInspect"
              button="ui.adm.data-inspector.btn.inspect">

  <jalios:field  name='<%= "dataId" %>' label='<%= glp("ui.adm.mn.dev.edit-data.id-info") %>' required='<%= true %>' value='<%= JcmsUtil.getId(data) %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    <% if (data != null) {  %>
    <span class="input-group-addon">          
    <jalios:edit data="<%= data %>" />
    </span>
    <% } %>
  </jalios:field>
      

   <% if (data != null) { %> 
   <div class="data-info">
     <%@ include file='/admin/editDataId_type.jspf' %>
     <%@ include file='/admin/editDataId_attributes.jspf' %>
     <%@ include file='/admin/editDataId_extraInfo.jspf' %>
     <%@ include file='/admin/editDataId_extraData.jspf' %>
     <%@ include file='/admin/editDataId_extraDBData.jspf' %>
     <%@ include file='/admin/editDataId_linkReferrers.jspf' %>
     <%@ include file='/admin/editDataId_weakReferrers.jspf' %>
     <%@ include file='/admin/editDataId_vids.jspf' %>           
     <jalios:include target="ADMIN_DATA_INSPECTOR" targetContext="div" />
   </div>
   <% } %>

<jalios:buffer name="MODAL_BUTTON">
        <% if (formHandler.showXml()) { %>
        <button type="submit" class="btn btn-default ajax-refresh" name="opXml" value="true">XML</button>
        <% } %>
        <% if (formHandler.showDisplay()) { %>
        <button type="submit" class="btn btn-default ajax-refresh" name="opDisplay" value="true"><%= glp("ui.com.btn.display") %></button>
        <% } %>
        <% if (formHandler.showEdit()) %>
        <button type="submit" class="btn btn-default ajax-refresh" name="opEdit" value="true" <%= channel.isDataWriteEnabled() ? "" : "disabled='disabled'" %>><%= glp("ui.com.alt.edit") %></button>
</jalios:buffer>    

      

</jalios:modal>