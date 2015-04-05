<%--
 Dump the XML export of the last Publication that was submitted for creation, but for which creation was NOT performed.
 
 Setting the 'doNotStore=true' parameter when submitting a Data creation will automatically trigger the following behavior : 
   - Data is validated as usual,
   - when validation is successful, create operation is NOT be performed, (DO_NOT_STORE attribute added to context param)  
   - a session attribute is set with the Data 
   
 Accessing this JSP will dump the XML export of this Data will remove the attribute.
  
--%><%

  request.setAttribute("ContentType", "text/xml; charset=UTF-8");

%><%@ include file="/jcore/doInitPage.jspf" %><%

  Publication pub = (Publication) session.getAttribute(com.jalios.jcms.handler.EditPublicationHandler.LAST_PUBLICATION_NOT_STORED);
  if (pub != null) {
    session.removeAttribute(com.jalios.jcms.handler.EditPublicationHandler.LAST_PUBLICATION_NOT_STORED);
    %><%= XmlUtil.XML_HEADER %><%= pub.exportXml() %><%
  }
  
%>