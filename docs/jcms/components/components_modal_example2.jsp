<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<jsp:useBean id="formHandler" scope="page" class="generated.EditArticleHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>" />
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>" />
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<% 
	//formHandler set as attribute for jalios:field tags
	request.setAttribute("formHandler", formHandler);
	if (formHandler.validate()) {
	  //Modal redirect if formHandler has been validated
	  request.setAttribute("modal.redirect", "path/to/redirect.jsp"); %>
		<%@ include file="/jcore/modal/modalRedirect.jspf" %>
	<% 
		return; 
	} 
	formHandler.prepare(); 
%>
<jalios:modal formHandler="<%= formHandler %>" url="docs/jcms/jcms-migration-modalEx2.jsp">
	<%-- Summary Edition ------------------------------------------------------------ --%>
	<jalios:field name="summary" formHandler="<%= formHandler %>">
	  <jalios:control />
	</jalios:field>
</jalios:modal>