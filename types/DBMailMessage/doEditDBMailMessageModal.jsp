<%-- This file has been automatically generated. --%>
<%--
  @Summary: DBMailMessage modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditDBMailMessageHandler formHandler = (EditDBMailMessageHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.DBMailMessage.class);
%>
<ul class="nav nav-tabs">
<li class='active'><a href="#DBMailMessage_header_tab" onclick="return false;"><%= formHandler.getTabLabel("header") %></a></li>
<li ><a href="#DBMailMessage_headermbr_tab" onclick="return false;"><%= formHandler.getTabLabel("headermbr") %></a></li>
<li ><a href="#DBMailMessage_multipart_tab" onclick="return false;"><%= formHandler.getTabLabel("multipart") %></a></li>
<li ><a href="#DBMailMessage_meta_tab" onclick="return false;"><%= formHandler.getTabLabel("meta") %></a></li>
</ul>
<div class="tab-content jalios-tab-template clearfix"><div id="DBMailMessage_header_tab" class='tab-pane active'>
<%-- From ------------------------------------------------------------ --%>
<jalios:field name="from" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- To ------------------------------------------------------------ --%>
<jalios:field name="to" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Cc ------------------------------------------------------------ --%>
<jalios:field name="cc" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Bcc ------------------------------------------------------------ --%>
<jalios:field name="bcc" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ReplyTo ------------------------------------------------------------ --%>
<jalios:field name="replyTo" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="DBMailMessage_headermbr_tab" class='tab-pane '>
<%-- FromMember ------------------------------------------------------------ --%>
<jalios:field name="fromMember" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ToMember ------------------------------------------------------------ --%>
<jalios:field name="toMember" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CcMember ------------------------------------------------------------ --%>
<jalios:field name="ccMember" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BccMember ------------------------------------------------------------ --%>
<jalios:field name="bccMember" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ReplyToMember ------------------------------------------------------------ --%>
<jalios:field name="replyToMember" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="DBMailMessage_multipart_tab" class='tab-pane '>
<%-- ContentText ------------------------------------------------------------ --%>
<jalios:field name="contentText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ContentHtml ------------------------------------------------------------ --%>
<jalios:field name="contentHtml" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Attachements ------------------------------------------------------------ --%>
<jalios:field name="attachements" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="DBMailMessage_meta_tab" class='tab-pane '>
<%-- SentDate ------------------------------------------------------------ --%>
<jalios:field name="sentDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ReceivedDate ------------------------------------------------------------ --%>
<jalios:field name="receivedDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Priority ------------------------------------------------------------ --%>
<jalios:field name="priority" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Account ------------------------------------------------------------ --%>
<jalios:field name="account" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InReplyTo ------------------------------------------------------------ --%>
<jalios:field name="inReplyTo" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- References ------------------------------------------------------------ --%>
<jalios:field name="references" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- MessageId ------------------------------------------------------------ --%>
<jalios:field name="messageId" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Thread ------------------------------------------------------------ --%>
<jalios:field name="thread" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div></div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- TDqA2HAs7AwF9Wi2ePk1RQ== --%>