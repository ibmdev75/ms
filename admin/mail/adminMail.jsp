<%--
  @Summary: Mail editor
  @Category: Work / Mail
  @Author: Jp Encausse
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1
--%>
<%@ include file='/jcore/doInitPage.jspf' %><% 

if (!checkAccess("admin/users/admin-mail")) { 
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id="mailHandler" scope="page" class="com.jalios.jcms.handler.MailEditHandler"><%
  %><jsp:setProperty name="mailHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="mailHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="mailHandler" property="*" /><%
%></jsp:useBean><% 

if (mailHandler.validate()) {
  return;
}
request.setAttribute("mailSubAdminMenu", "true");
request.setAttribute("title", glp("ui.adm.edit-mail.title"));

Member member = mailHandler.getAvailableToMember();
Group  group  = mailHandler.getAvailableToGroup();
%>
<%@ include file='/admin/doAdminHeader.jspf' %>

<h1 class="boTitle icon iconMail"><% /* %>Send a Mail<% */ %><%= glp("ui.adm.edit-mail.title") %></h1>
<%@ include file='/jcore/doMessageBox.jspf' %>
<%
  // -- From -------------------------
  boolean fromWkspcEdit  = false;
  boolean fromEmail      = false;
  boolean fromMember     = true;
  boolean fromAck        = true;
  boolean fromBCC        = true;
  
  // -- To ---------------------------
  boolean toEmail        = member == null && group == null;
  boolean toMember       = member != null;
  boolean toMembers      = member == null && group == null;
  boolean toGroup        = group  != null;
  boolean toGroups       = member == null && group == null;
  
  // -- Hide -------------------------
  boolean hideSubject    = false;
  boolean hideContent    = false;
  boolean hideSendExample= false;
  boolean hideAttachements = false;
  
  // -- Content ----------------------
  String   subject            = mailHandler.getAvailableSubject();
  String[] content            = mailHandler.getAvailableContent();
  String[] contentTab         = new String[]{"ui.work.mail.lbl.text_plain" , "ui.work.mail.lbl.text_html"};
  boolean  useWysiwygEditor   = true;
  Member   selectedMember     = mailHandler.getAvailableToMember() == null ? member : mailHandler.getAvailableToMember();
  List     selectedMembers    = mailHandler.getAvailableToMembers();
  Group    selectedGroup      = mailHandler.getAvailableToGroup()  == null ? group : mailHandler.getAvailableToGroup();
  List     selectedGroups     = mailHandler.getAvailableToGroups();
  String   selectedEmail      = mailHandler.getAvailableToEmail();
  boolean  selectedBcc        = mailHandler.isAvailableFromBCC();
  boolean  selectedAck        = mailHandler.isAvailableFromAck();
  Member   selectedSender     = mailHandler.getAvailableFromMember() == null ? loggedMember : mailHandler.getAvailableFromMember();
  String   redirect           = Util.getString(mailHandler.getRedirect() , "admin/admin.jsp");
  boolean  filterWK           = false;
  String   selectedFromEmail  = null;
  FileDocument[] attachements = mailHandler.getAvailableAttachements();
  String   sendAllButton      = glp("ui.adm.mail.btn.send-all");
%>
<form class="form-horizontal" action="admin/mail/adminMail.jsp" method="post" name="editForm">
  <%@ include file='/admin/mail/doEditMail.jspf' %>
</form>

<%@ include file='/admin/doAdminFooter.jspf' %>