<%--
  @Summary: Channel's properties editor
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="org.apache.oro.text.perl.Perl5Util" %><%

  if (!checkAccess("admin/operation/properties")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.PropertiesHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }
 
request.setAttribute("title", glp("ui.adm.prop.title")); 
request.setAttribute("propertiesSubAdminMenu", "true");  
request.setAttribute("formHandler", formHandler);
jcmsContext.addJavaScript("js/jalios/ux/jalios-admin-properties.js");


%><%@ include file='/admin/doAdminHeader.jspf' %><%@ include file='/jcore/doMessageBox.jspf' %>

<form class="form-horizontal" action='<%= channel.getSecuredBaseUrl(request) %>admin/adminProperties.jsp' method='post' name='editForm' id='editForm'>
  
<div class="navbar navbar-default">
  <div class="navbar-brand"><%= glp("ui.adm.prop.title") %></div>
  <div class="navbar-form">
    <div class="navbar-right">
      <button name='opUpdate' value='true' type='submit' class="btn btn-primary pull-right"><%= glp("ui.com.btn.save") %></button>
    </div>
  </div>
</div>
 <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" /> 

<div class="tabbable tabs-left tabs-gray" style="min-height: 640px">
  <ul class="nav nav-tabs no-tab-drop">
	  <li class="active"><a href="#ch" onclick="return false;"><jalios:icon src='status' /> <%= glp("ui.adm.prop.tab.ch") %></a></li>
	  <li><a href="#db" onclick="return false;">    <jalios:icon src='db' />            <%= glp("ui.adm.prop.tab.db") %></a></li>
	  <li><a href="#mail" onclick="return false;">  <jalios:icon src='mail' />          <%= glp("ui.adm.prop.tab.mail") %></a></li>
	  <li><a href="#access" onclick="return false;"><jalios:icon src='login' />         <%= glp("ui.adm.prop.tab.access") %></a></li>
	  <li><a href="#ldap" onclick="return false;">  <jalios:icon src='ldap' />          <%= glp("ui.adm.prop.tab.ldap") %></a></li>
	  <li><a href="#proxy" onclick="return false;"> <jalios:icon src='proxy' />         <%= glp("ui.adm.prop.tab.proxy") %></a></li>
	  <li><a href="#vote" onclick="return false;">  <jalios:icon src='thumb-up' />  <%= glp("ui.adm.prop.tab.vote") %></a></li>
	  <li><a href="#stat" onclick="return false;">  <jalios:icon src='stats' />         <%= glp("ui.adm.prop.tab.stat") %></a></li>
	  <li><a href="#portal"><jalios:icon src='portal' /> <%= glp("ui.portalihm.title") %></a></li>
	  <li><a href="#srch" onclick="return false;">  <jalios:icon src='search' />        <%= glp("ui.adm.prop.tab.srch") %></a></li>
	  <li><a href="#mbr" onclick="return false;">   <jalios:icon src='group' />         <%= glp("ui.adm.prop.tab.mbr") %></a></li>
	  <li><a href="#jsync" onclick="return false;"> <jalios:icon src='server' />        <%= glp("ui.adm.prop.tab.jsync") %></a></li>
	  <li><a href="#mashup" onclick="return false;"><jalios:icon src='import-mgr' />     <%= glp("ui.adm.prop.tab.mashup") %></a></li>
	  <li><a href="#adv" onclick="return false;">   <jalios:icon src='advanced-gray' /> <%= glp("ui.adm.prop.tab.adv") %></a></li>
	</ul>

  <div class="tab-content responsive">
    <div class="tab-pane fade in active" id="ch"><jalios:include jsp="admin/properties/siteProperties.jsp" /></div>
    <div class="tab-pane fade" id="db"><jalios:include jsp="admin/properties/dbProperties.jsp" /></div>
    <div class="tab-pane fade" id="mail"><jalios:include jsp="admin/properties/mailProperties.jsp" /></div>
    <div class="tab-pane fade" id="access"><jalios:include jsp="admin/properties/accessProperties.jsp" /></div>
    <div class="tab-pane fade" id="ldap"><jalios:include jsp="admin/properties/ldapProperties.jsp" /></div>
    <div class="tab-pane fade" id="proxy"><jalios:include jsp="admin/properties/proxyProperties.jsp" /></div>
    <div class="tab-pane fade" id="vote"><jalios:include jsp="admin/properties/voteProperties.jsp" /></div>
    <div class="tab-pane fade" id="stat"><jalios:include jsp="admin/properties/statProperties.jsp" /></div>
    <div class="tab-pane fade" id="portal"><jalios:include jsp="admin/properties/portalProperties.jsp" /></div>
    <div class="tab-pane fade" id="srch"><jalios:include jsp="admin/properties/searchProperties.jsp" /></div>
    <div class="tab-pane fade" id="mbr"><jalios:include jsp="admin/properties/userProperties.jsp" /></div>
    <div class="tab-pane fade" id="jsync"><jalios:include jsp="admin/properties/jsyncProperties.jsp" /></div>
    <div class="tab-pane fade" id="mashup"><jalios:include jsp="admin/properties/webServiceProperties.jsp" /></div>
    <div class="tab-pane fade" id="adv"><jalios:include jsp="admin/properties/advancedProperties.jsp" /></div>
  </div>
</div>

</form>
<%@ include file='/admin/doAdminFooter.jspf' %> 
