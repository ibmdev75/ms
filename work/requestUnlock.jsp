<%@ include file="/jcore/doInitPage.jspf" %>

<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditPublicationHandler'>
<jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
<jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
<jsp:setProperty name='formHandler' property='*' />
<jsp:setProperty name='formHandler' property='checkMemberForRequestUnlock' value="true"/>
</jsp:useBean>
<%
formHandler.setNoRedirect(true);
boolean isValidate = formHandler.validate();
if(isValidate){
request.setAttribute("modal.redirect", null);
%><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
%>

<jalios:modal title="ui.work.request-unlock.title" 
              url="work/requestUnlock.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg request-unlock"
              picture=""
              op="opRequestUnlock"
              button="ui.com.btn.submit">

   <jalios:message msg='<%= glp("ui.work.request-unlock.info", formHandler.getPublication().getStrongLockMember().getFullName()) %>' title="" />
      
   <jalios:field name='<%= "requestUnlockMessage" %>' resource="field-inline">
     <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
   </jalios:field>
   
</jalios:modal>

