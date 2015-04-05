<%@ include file="/jcore/doInitPage.jspf" %><%

Publication pub = getPublicationParameter("id");
if (pub == null) {
  return;
}
String pubTitle = pub.getTitle(userLang);

int pstatus = getIntParameter("pstatus", 0);
String stateLabel = WorkflowManager.getInstance().getWFStateStateLabel(pub, pstatus, userLang);
String tmpRedirect = getValidHttpUrl("redirect");
int formElementCount = 0;

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.ValidateStateChangePublicationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='internalClass' value='<%=pub.getClass() %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
formHandler.setNoRedirect(true);
if(formHandler.validate()) {
  request.setAttribute("modal.redirect", null);
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}

// UNLOCKER
jcmsContext.addJavaScript("js/jalios/core/jalios-unlocker.js");
%>

<div class="unlocker" data-jalios-unlocker-url='<%=  encodeForHTMLAttribute(HttpUtil.getUrlWithCSRFToken("work/unlock.jsp?id="+ pub.getId(), request, false)) %>'>
<jalios:modal title="ui.com.lbl.prompt" 
              url="work/validateStateChange.jsp" 
              formHandler="<%= formHandler %>" >

  <%
  {
  Workflow internalWf = formHandler.getAvailableInternalWorkflow(); 
  Workflow wf = formHandler.getWorkflow(); 
  List wfNoteList = WorkflowManager.getInstance().getWFNoteList(pub);
  boolean hasAlreadyVoted = Util.notEmpty(wfNoteList) && WorkflowManager.getInstance().hasAlreadyVoted(pub, loggedMember);
  boolean isWFHistoryAvailable = Util.notEmpty(wfNoteList);
  int currentTabIndex = 0;
  %>
      
  <%@ include file="/work/doEditCommonPubAttribute_wf_state.jspf" %>
  
  <%-- WF / PDATE ------------------------------------------------------------ --%>
  <% if (formHandler.getAvailablePstatus() == WorkflowConstants.SCHEDULED_PSTATUS) { %>
  <jalios:field  name="pdate" label="ui.work.form.lbl.pdate" value='<%= formHandler.getAvailablePdate() %>'>
    <jalios:control settings='<%= new DateSettings().displayTime() %>' />
  </jalios:field>    
  <% } %>

  
  <%@ include file="/work/doEditCommonPubAttribute_wf_roles.jspf" %>
  <% } %>


  <input type="hidden" name="id"       value="<%= pub.getId() %>" />
  <input type="hidden" name="pstatus"  value="<%= pstatus %>"/>
  <input type="hidden" name="ws"  value="<%= pub.getWorkspaceId() %>"/>
  <input type="hidden" name="redirect"  value="<%= encodeForHTMLAttribute(tmpRedirect) %>"/>
  <%--
   Fix JCMS-3466 : Error message "Please, choose an expiry date in the future" when changing publication state from expired to publish
   When leaving the expired pstatus reset the edate to an empty value to ensure operation work as expected
  --%>
  <% if (pub.getPstatus()== WorkflowConstants.EXPIRED_PSTATUS) { %> 
    <input type="hidden" name="edate" value=""/>
  <% } %>

</jalios:modal>
</div>