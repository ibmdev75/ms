<%@ include file='/jcore/doInitPage.jspf' %><%
	Publication pub = getPublicationParameter("pubId");
	List wfNoteList = WorkflowManager.getInstance().getWFNoteList(pub);
%>
<jalios:modal css="modal-lg wf-note-list" title="ui.work.dpl.wf-validation-hist" url="work/workflow/wfNoteListModal.jsp">
	<%@ include file='/work/workflow/doDisplayWFNoteList.jspf' %>
</jalios:modal>