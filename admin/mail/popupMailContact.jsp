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
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
	if ((!isLogged) || (Util.isEmpty(loggedMember.getEmail()))) { 
	  sendForbidden(request, response);
	  return;
	}
%>
<jsp:useBean id="mailHandler" scope="page" class="com.jalios.jcms.handler.MailEditHandler">
  <jsp:setProperty name="mailHandler" property="request"       value="<%= request %>"/>
  <jsp:setProperty name="mailHandler" property="response"      value="<%= response %>"/>
  <jsp:setProperty name="mailHandler" property="loggedMember"  value="<%= channel.getDefaultAdmin() %>"/>
  <jsp:setProperty name="mailHandler" property="*" />
  <jsp:setProperty name="mailHandler" property="fromEmail"     value="<%= loggedMember.getEmail() %>"/>
  <jsp:setProperty name="mailHandler" property="toEmail"       value="<%= null %>"/>
</jsp:useBean>
<% 
  if (mailHandler.validate()) {
    return;
  }
%>
<jalios:if predicate='<%= getBooleanParameter("closeWindow",false) %>'>
  <script language='javascript'>
    window.close();
  </script>
</jalios:if>

<%
  request.setAttribute("mailSubAdminMenu", "true");
  request.setAttribute("title", glp("ui.adm.edit-mail.title"));
  
  Member availableToMember = mailHandler.getAvailableToMember();
  Group  availableToGroup  = mailHandler.getAvailableToGroup();
  
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<div style='margin: 10px'>
<h1 class="boTitle icon iconMail"><% /* %>Send a Mail<% */ %><%= glp("ui.adm.edit-mail.title") %></h1>
<%@ include file='/jcore/doMessageBox.jspf' %>
<%
  // -- From -------------------------
  boolean fromWkspcEdit  = false;
  boolean fromEmail      = false;
  boolean fromMember     = false;
  boolean fromAck        = false;
  boolean fromBCC        = false;
  
  // -- To ---------------------------
  boolean toEmail        = false; //availableToMember == null && availableToGroup == null;
  boolean toMember       = false;
  boolean toMembers      = false;
  boolean toGroup        = false;
  boolean toGroups       = false;
  
  // -- Hide -------------------------
  boolean hideSubject      = false;
  boolean hideContent      = false;
  boolean hideSendExample  = true;
  boolean hideAttachements = true;

  // -- Content ----------------------
  String   subject            = mailHandler.getAvailableSubject();
  String[] content            = mailHandler.getAvailableContent();
  String[] contentTab         = new String[]{"ui.work.mail.lbl.text_html"};
  boolean  useWysiwygEditor   = true;
  Member   selectedMember     = mailHandler.getAvailableToMember();
  List     selectedMembers    = mailHandler.getAvailableToMembers();
  Group    selectedGroup      = mailHandler.getAvailableToGroup();
  List     selectedGroups     = mailHandler.getAvailableToGroups();
  String   selectedEmail      = null;
  boolean  selectedBcc        = mailHandler.isAvailableFromBCC();
  boolean  selectedAck        = mailHandler.isAvailableFromAck();
  Member   selectedSender     = loggedMember;
  String   redirect           = ServletUtil.getUrlWithUpdatedParam(request,"closeWindow","true");
  boolean  filterWK           = true;
  String   selectedFromEmail  = loggedMember.getEmail();
  FileDocument[] attachements = mailHandler.getAvailableAttachements();
  String   sendAllButton      = glp("ui.adm.mail.btn.send-all");
  
  FileDocument docRequestedForUnlock = getDataParameter("requestForUnlock", FileDocument.class);
  if (docRequestedForUnlock != null && docRequestedForUnlock.isStrongLocked()) {
    String msgLang = selectedMember != null ? selectedMember.getLanguage() : userLang;
    Locale msgLocale = selectedMember != null ? selectedMember.getLocale() : userLocale;
    subject = JcmsUtil.glp(msgLang, "ui.work.form.unlock-mail-subject");
    content = new String[] {JcmsUtil.glp(msgLang, "ui.work.form.unlock-mail-content", 
                                                  new Object[] {  
                                                    docRequestedForUnlock.getStrongLockMember().getFriendlyName(), 
                                                    docRequestedForUnlock.getTitle(msgLang), 
                                                    DateFormat.getDateInstance(DateFormat.SHORT, msgLocale).format(docRequestedForUnlock.getStrongLockDate()), 
                                                    DateFormat.getTimeInstance(DateFormat.SHORT, msgLocale).format(docRequestedForUnlock.getStrongLockDate()),
                                                    loggedMember.getFullName()})};
  }
  
%>
<form class="form-horizontal" action="admin/mail/popupMailContact.jsp" method="post" name="editForm">
  <%@ include file='/admin/mail/doEditMail.jspf' %>
  <% if (availableToMember!=null) { %>
    <input type='hidden' name='toMember' value='<%= availableToMember.getId() %>'/>
  <% } %>
</form>
</div>

<%@ include file='/jcore/doEmptyFooter.jspf' %>