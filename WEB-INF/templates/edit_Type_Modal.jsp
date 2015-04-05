<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page buffer="none" autoFlush="true" %>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");

Element typeElt = (Element)session.getAttribute("typeElt");
List extendedTypeList = (List)session.getAttribute("extendedTypeList");
String className = typeElt.getAttributeValue("name");
Attribute categorizable = typeElt.getAttribute("categorizable");
boolean classCategorizable = categorizable != null && categorizable.getBooleanValue();

// Get the fields (and the inherited fields)                             
ArrayList fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);
String customFormHandler = Util.getString(typeElt.getAttributeValue("customformhandler"), "");
String formHandler = Util.getString(customFormHandler, "generated.Edit" + className + "Handler");

%>
[[%-- This file was automatically generated. --%]][[%
%]][[%--
  @Summary: <%= className %> editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%]][[%
%]][[%@ page contentType="text/html; charset=UTF-8" %]][[%
%]][[%@ include file='/jcore/doInitPage.jspf' %]][[%

<jalios:if predicate='<%= extendedTypeList.contains(className) %>'>
%]][[jsp:useBean id="extFormHandler" scope="page" class="generated.Edit<%= className %>ExtensionHandler"]][[%
  %]][[jsp:setProperty name="extFormHandler" property="request" value="[[%= request %]]"/]][[%
  %]][[jsp:setProperty name="extFormHandler" property="response" value="[[%= response %]]"/]][[%
  %]][[jsp:setProperty name="extFormHandler" property="noRedirect" value="true" /]][[%
  %]][[jsp:setProperty name="extFormHandler" property="*" /]][[%
%]][[/jsp:useBean]][[%
</jalios:if>
%]][[jsp:useBean id='formHandler' scope='page' class='<%= formHandler %>']][[%
  %]][[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]][[%
  %]][[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]][[%
<jalios:if predicate='<%= extendedTypeList.contains(className) %>'>
  %]][[jsp:setProperty name='formHandler' property='extFormHandler' value='[[%= extFormHandler %]]'/]][[%
</jalios:if>
  %]][[jsp:setProperty name="extFormHandler" property="noRedirect" value="true" /]][[%
  %]][[jsp:setProperty name='formHandler' property='*' /]][[%
%]][[/jsp:useBean]][[%

%]][[% request.setAttribute("formHandler", formHandler); %]][[%
<jalios:if predicate='<%= extendedTypeList.contains(className) %>'>
%]][[% request.setAttribute("extFormHandler", extFormHandler); %]][[%
</jalios:if>

<%-- VALIDATE --%>
%]][[% if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getPublication().getDisplayUrl(userLocale)); %]][[%
%]][[%@ include file="/jcore/modal/modalRedirect.jspf" %]][[% return; } %]][[%
%]][[% formHandler.prepare(); %]]

<%-- MODAL --%>
[[jalios:modal formHandler="[[%= formHandler %]]" url="types/<%= className %>/edit<%= className %>Modal.jsp"]]
<div class="row <%= className %>">
	[[%-- Title ------------------------------------------------------------ --%]]
	[[% if (formHandler.isFieldEdition("title")) { %]]

	<% Element titleElt = typeElt.getChild("title"); %>
    [[% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %]]
    [[jalios:field name="title" formHandler="[[%= formHandler %]]"]]
      [[jalios:control /]] 
    [[/jalios:field]]

	[[% } %]]
	[[jalios:include jsp="types/<%= className %>/doEdit<%= className %>Modal.jsp" /]]
</div>
[[/jalios:modal]]

<%-- -- COMPUTE SOME DATA STRUCTURE -------------------------------------------- --%>
<%
HashSet wysiwygSet = new HashSet();
HashSet wysiwygArraySet = new HashSet();
TreeSet catIdSet = new TreeSet();
%>
<jalios:foreach collection="<%= fieldList %>" name="itField" type="org.jdom.Element">
<%
  String type   = itField.getAttributeValue("type");
  String editor = itField.getAttributeValue("editor");
  if (editor.equals("wysiwyg")) {
    if (type.equals("String[]")) {
      wysiwygArraySet.add(itField);	
    } else {
      wysiwygSet.add(itField);
    }
  } else if (editor.equals("category")) {
    catIdSet.add(itField.getAttributeValue("root"));
  }
%>
</jalios:foreach>

[[% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
<jalios:foreach collection='<%= catIdSet %>' type='String' name='itCatId'>
  itRemoveCat = channel.getCategory("<%= itCatId %>");
  if (itRemoveCat != null){	removedCatSet.add(itRemoveCat);  }
</jalios:foreach>
  request.setAttribute("removedCatSet", removedCatSet);
%]]
  
<% out.flush(); %>
