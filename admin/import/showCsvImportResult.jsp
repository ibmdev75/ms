<%--
  @Summary: Member CSV import : result modal
  @since: jcms-8
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcms.handler.MembersCsvImportHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

List<String> createdIds = (List<String>) request.getSession().getAttribute(MembersCsvImportHandler.CREATED_IDS_REQ_ATTR);
List<String> updatedIds = (List<String>) request.getSession().getAttribute(MembersCsvImportHandler.UPDATED_IDS_REQ_ATTR);

request.getSession().removeAttribute(MembersCsvImportHandler.IMPORT_DONE_REQ_ATTR);
request.getSession().removeAttribute(MembersCsvImportHandler.CREATED_IDS_REQ_ATTR);
request.getSession().removeAttribute(MembersCsvImportHandler.UPDATED_IDS_REQ_ATTR);

boolean didSendEmail = Util.toBoolean(request.getSession().getAttribute(MembersCsvImportHandler.EMAIL_SENT_REQ_ATTR), Boolean.FALSE);

List<Member> createdMbrList = JcmsUtil.idCollectionToDataList(createdIds, Member.class);
List<Member> updatedMbrList = JcmsUtil.idCollectionToDataList(updatedIds, Member.class);

boolean anyCreatedMbr = createdMbrList != null && createdMbrList.size() > 0;
boolean anyUpdatedMbr = updatedMbrList != null && updatedMbrList.size() > 0;
jcmsContext.addCSSHeader("css/jalios/member-csv-import.css");
%>
<jalios:modal title="ui.member.csv-import.result-modal.title" url="admin/import/showCsvImportResult.jsp" picture="images/jalios/icons/checkmark.gif">
<%
  if (anyCreatedMbr) {
    String title = didSendEmail ? glp("ui.member.csv-import.result-modal.created-emailed-label", createdIds.size()) : glp("ui.member.csv-import.result-modal.created-label", createdIds.size());
    %>
    <h4><%= title %></h4>
    <ol><%
    for (Member itMbr : createdMbrList) {
      %><li><%= itMbr.getFullName() %> "<%= itMbr.getEmail() %>"</li><%
    }
    %></ol><%
      }
  
      if (anyUpdatedMbr) {
        %>
    <h4><%= glp("ui.member.csv-import.result-modal.updated-label", updatedIds.size()) %></h4>
    <ol><%
    for (Member itMbr : updatedMbrList) {
      %><li><%= itMbr.getFullName() %> "<%= itMbr.getEmail() %>"</li><%
    }
    %></ol><%
  }
%>
</jalios:modal>