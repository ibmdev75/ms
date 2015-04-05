<%@ page contentType="text/plain; charset=UTF-8"%><%
%><%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*, com.jalios.jcms.portlet.*" %><%
%><%@ taglib uri="jcms.tld" prefix="jalios" %><%

  request.setCharacterEncoding("UTF-8");
  Element   typeElt = (Element)session.getAttribute("typeElt");
  String className = typeElt.getAttributeValue("name");

%>[[%@ include file='/jcore/doInitPage.jspf' %]][[%
%]][[jsp:useBean id='formHandler' scope='page' class='generated.Edit<%= className %>Handler']][[%
  %]][[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]][[%
  %]][[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]][[%
  %]][[jsp:setProperty name='formHandler' property='*' /]][[%
%]][[/jsp:useBean]][[%
%]][[% request.setAttribute("<%= className %>.formHandler", formHandler); %]]