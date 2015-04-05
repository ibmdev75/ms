<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.mashup.ImportConflictHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<% 
if (formHandler.validate()) {
  return;
}

Publication pub = formHandler.getPublication() ;
Publication conflictPub = pub.getImportConflictCopy();
String confirmMerged  = encodeForJavaScript(glp("ui.work.import-conflict.msg.merged"));
String confirmUpdated = encodeForJavaScript(glp("ui.work.import-conflict.msg.update"));
%>

<%@ include file='/work/doWorkHeader.jspf' %>

<div class="page-header"><h1><%= glp("ui.work.import-conflict.title", pub.getTitle(userLang)) %> <jalios:edit pub='<%= pub %>' /></h1></div>

<%@ include file='/jcore/doMessageBox.jspf' %>

<% if (conflictPub != null) { %>
<%-- *** Buttons ************************************************** --%>
<div style="margin-top: 20px; margin-bottom: 20px;">
<%= glp("ui.work.import-conflict.info") %>
</div>

<%-- *** Diff ************************************************** --%>
<%
request.setAttribute("newPub", conflictPub);
request.setAttribute("oldPub", pub);

String classShortName = Util.getClassShortName(conflictPub.getClass());
String diffJSP = "/types/" + classShortName + "/do" + classShortName + "Diff.jsp"; 
%>
 
<table id='versionTable' class="table-data table-condensed">
  <tr>
    <td class='listHeader fit'>&nbsp;</td>
    <td class='listHeader text-overflow' ><%= glp("ui.work.ver.lbl.field") %></td>
    <td class='listHeader text-overflow' style="width:49%;"><jalios:link data='<%= conflictPub %>' css='listHeader'><%= glp("ui.work.import-conflict.lbl.new") %></jalios:link> <jalios:edit data='<%= conflictPub %>' /></td>
    <td class='listHeader text-overflow' style="width:49%;"><jalios:link data='<%= pub %>' css='listHeader'><%= glp("ui.work.import-conflict.lbl.prev") %></jalios:link> <jalios:edit data='<%= pub %>' /></td>
  </tr>
  <jsp:include page="<%= diffJSP %>"/>
  <tr style='background-color: #FFFFFF;'>
    <td></td>
    <td></td>
    <td align='center'><button class='btn btn-default' onclick='confirmAction("<%= confirmUpdated %>", "<%= contextPath %>/work/importConflict.jsp?opOverrideAndUpdate=true&redirect=work/pubBrowser.jsp&id=<%= pub.getId() %>");'><%= glp("ui.work.import-conflict.update") %></button></td>
    <td align='center'><button class='btn btn-primary' onclick='confirmAction("<%= confirmMerged %>", "<%= contextPath %>/work/importConflict.jsp?opMarkAsMerged=true&redirect=work/pubBrowser.jsp&id=<%= pub.getId() %>");'><%= glp("ui.work.import-conflict.merged") %></button></td>
  </tr>
</table>
<br /><%= glp("ui.work.ver.txt.legend") %> <span class='diff-add'><%= glp("ui.work.ver.txt.add") %></span> - <span class='diff-remove'><%= glp("ui.work.ver.txt.remove") %></span></font>
<% } %>
<%@ include file='/work/doWorkFooter.jspf' %> 
