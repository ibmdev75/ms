<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page buffer="none" autoFlush="true" %>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");
String author = Util.getString(typeElt.getAttributeValue("formAuthor"), "j_2");
String ws = Util.getString(typeElt.getAttributeValue("formWorkspace"), "");
String formRedirectMode = Util.getString(typeElt.getAttributeValue("formRedirectMode"), "display");
String formRedirectValue = Util.getString(typeElt.getAttributeValue("formRedirectValue"), "");
String customFormHandler = Util.getString(typeElt.getAttributeValue("customformhandler"), "");
String formHandler = Util.getString(customFormHandler, "generated.Edit" + className + "Handler");

%>
[[%-- This file was automatically generated. --%]]
[[%--
  @Summary: <%= className %> editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%]][[%
%]][[%@ page contentType="text/html; charset=UTF-8" %]][[%
%]][[%@ include file='/jcore/doInitPage.jspf' %]]

[[% String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(<%= className %>.class).getLabelMap()); %]]
[[jsp:useBean id='formHandler' scope='page' class='<%= formHandler %>']]
  [[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]]
  [[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]]
  [[jsp:setProperty name='formHandler' property='*' /]]
  [[jsp:setProperty name='formHandler' property='author' value='<%= author %>'/]]
  [[jsp:setProperty name='formHandler' property='title' value='[[%= formTitles %]]'/]]
[[/jsp:useBean]]
[[%
  if (formHandler.validate()) {
    return;
  }
  boolean formInPortal = jcmsContext.isInFrontOffice(); 
%]]   

[[jalios:if predicate='[[%= !formInPortal %]]']]
[[%@ include file='/jcore/doHeader.jspf' %]]
[[/jalios:if]]

[[jalios:if predicate='[[%= formHandler.isOneSubmit() && formHandler.isSubmitted() %]]']]
  [[% setWarningMsg(glp("msg.edit.already-one-submit"), request); %]]
[[/jalios:if]]

[[%@ include file='/jcore/doMessageBox.jspf' %]]
[[jalios:if predicate='[[%= channel.isDataWriteEnabled() %]]']]

[[%@ include file='/work/doEditPubFormHeader.jspf' %]]

[[jsp:include page="doEdit<%= className %>.jsp" /]]

<tr>
  <td style='display: none;'>
    <jalios:select>
    <%-- HOME REDIRECT --%>
    <jalios:if predicate='<%= formRedirectMode.equals("home") %>'>
    <input type='hidden' name='redirect' value='index.jsp' />
    </jalios:if>
    <%-- URL REDIRECT --%>
    <jalios:if predicate='<%= formRedirectMode.equals("url") %>'>
    <input type='hidden' name='redirect' value='<%= formRedirectValue %>' />
    </jalios:if>
    <%-- CONTENT/CATEGORY REDIRECT --%>
    <jalios:if predicate='<%= formRedirectMode.equals("content") || formRedirectMode.equals("category") %>'>
    <input type='hidden' name='redirect' value='[[jalios:url data='[[%= channel.getData("<%= formRedirectValue %>") %]]'/]]' />
    </jalios:if>
    <%-- CURRENT CATEGORY REDIRECT --%>
    <jalios:if predicate='<%= formRedirectMode.equals("currentCategory") %>'>
    <input type='hidden' name='redirect' value='[[jalios:url data='[[%= currentCategory %]]'/]]' />
    </jalios:if>
    <%-- DISPLAY REDIRECT --%>
    <jalios:if predicate='<%= formRedirectMode.equals("display") %>'>
    <input type='hidden' name='redirect' value='$DISPLAY_URL$?portal=[[%= jcmsContext.getPortal().getId() %]]' />
    </jalios:if>
    </jalios:select>
    
    <input type='hidden' name='ws' value='<%= Util.notEmpty(ws) ? ws : ("<"+"%= workspace.getId() %"+">") %>' />
  </td>
</tr>

[[%@ include file='/work/doEditPubFormFooter.jspf' %]]

[[/jalios:if]]

[[jalios:if predicate='[[%= !formInPortal %]]']]
[[%@ include file='/jcore/doFooter.jspf' %]]
[[/jalios:if]]

<% out.flush(); %>
