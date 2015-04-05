<%--
   @Summary: [Abstract] Portlet Stat content editor
   @Category: Generated
   @Author: JCMS Type Processor 
   @Customizable: True
   @Requestable: False 
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

 EditAbstractPortletStatHandler formHandler = (EditAbstractPortletStatHandler)request.getAttribute("formHandler"); 
 int formElementCount = ((Integer)request.getAttribute("formElementCount")).intValue();
 request.setAttribute("formElementCount", new Integer(formElementCount));
 request.setAttribute("formHandler", formHandler);%><%
 %><jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" /><%
 formElementCount = ((Integer)request.getAttribute("formElementCount")).intValue();
 request.setAttribute("formElementCount", new Integer(formElementCount));
 
%>