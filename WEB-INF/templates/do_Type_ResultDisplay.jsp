<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%
  request.setCharacterEncoding("UTF-8");

  Element typeElt = (Element)session.getAttribute("typeElt");
  String className = typeElt.getAttributeValue("name");
  boolean isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
%>
[[%-- This file was automatically generated. --%]][[%
%]][[%--
  @Summary: <%= className %> result display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%]][[%
<% if (isFileDocument) { %>
%]][[%@ include file='/types/FileDocument/doFileDocumentResultDisplay.jsp' %]]
<% } else { %>
%]][[%@ include file='/custom/jcms/doResultDisplay.jsp' %]]
<% } %>