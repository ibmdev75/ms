<%@ include file="/jcore/doInitPage.jspf" %>
<jalios:javascript>
 'JCMS.Version'._namespace({
     showFieldsMerged   : function(element) { 
       element.getElementsBySelector('.show_fields').each(Element.show);
       element.getElementsBySelector('.merge_fields').each(Element.hide);
     },
     showFieldsCompared : function(element) { 
       element.getElementsBySelector('.show_fields').each(Element.hide);
       element.getElementsBySelector('.merge_fields').each(Element.show);
     }
 });
</jalios:javascript>
<%@ include file="/work/doWorkHeader.jspf" %>

<% 
Publication workCopy = getPublicationParameter("workCopy");
Publication original = workCopy == null || !workCopy.isWorkCopy() ? null : workCopy.getMainInstance();
%>

<%-- *** INVALIDE WORK COPY ****************************** --%>
<% if (original == null) { %>
<div class="page-header"><h1><%= glp("ui.work.workcopy-diff.title1") %></h1></div>

<% setWarningMsg(glp("ui.work.workcopy-diff.bad-id"), request); %>
<%@ include file='/jcore/doMessageBox.jspf' %>

<%-- *** VALIDE WORK COPY ****************************** --%>
<% } else { %>
<div class="page-header"><h1><%= glp("ui.work.workcopy-diff.title2", original.getTitle(userLang)) %></h1></div>
 
<%
request.setAttribute("newPub", workCopy);
request.setAttribute("oldPub", original);

String classShortName = Util.getClassShortName(workCopy.getClass());
String diffJSP = "/types/" + classShortName + "/do" + classShortName + "Diff.jsp"; 
%>
 
<table id='versionTable' class="table-data table-condensed">
  <tr>
    <td class='listHeader fit'>&nbsp;</td>
    <td class='listHeader text-overflow'><%= glp("ui.work.ver.lbl.field") %></td>
    <td class='listHeader text-overflow' style="width:49%;"><jalios:link data='<%= workCopy %>' css='listHeader'><%= glp("ui.com.lbl.workcopy") %></jalios:link> <jalios:edit data='<%= workCopy %>' /></td>
    <td class='listHeader text-overflow' style="width:49%;"><jalios:link data='<%= original %>' css='listHeader'><%= glp("ui.com.lbl.original") %></jalios:link> <jalios:edit data='<%= original %>' /></td>
  </tr>
<jsp:include page="<%= diffJSP %>"/>
</table>
<% } %>

<%@ include file="/work/doWorkFooter.jspf" %>
