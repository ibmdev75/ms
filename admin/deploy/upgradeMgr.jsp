<%--
  @Summary: Login form for public channel
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page import="com.jalios.io.*, com.jalios.jstore.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/dev/upgrade-mgr")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.UpgradeManagerHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}
Set allSignatureSet    = UpgradeManager.getSignatureSet(); 
Set baseSignatureSet   = UpgradeManager.getSignatureSet("base"); 
Set sourceSignatureSet = UpgradeManager.getSignatureSet("source"); 
Set targetSignatureSet = UpgradeManager.getSignatureSet("target"); 

Map upgradeInfo = (Map)request.getSession().getAttribute("upgradeInfo");
boolean isDiff  = upgradeInfo != null && upgradeInfo.containsKey("diffSet");
boolean isDiff3 = upgradeInfo != null && upgradeInfo.containsKey("diff3Set");
boolean showDiff = isDiff || isDiff3;

File baseFile   = (File)(upgradeInfo == null ? null : upgradeInfo.get("base"));
File sourceFile = (File)(upgradeInfo == null ? null : upgradeInfo.get("source"));
File targetFile = (File)(upgradeInfo == null ? null : upgradeInfo.get("target"));

boolean isDiffEnabled = Util.notEmpty(sourceSignatureSet);
boolean isZipEnabled = isDiff || isDiff3;

request.setAttribute("title", glp("ui.adm.um.title"));  
request.setAttribute("upgradeSubAdminMenu", "true"); 
String deleteActionURL = contextPath + "/admin/deploy/upgradeMgr.jsp?opDelete=true&signFile=";

%><%@ include file='/admin/doAdminHeader.jspf' %>

<script type="text/javascript">
  function popupUpload() {
    w = 600;
    h = 300;
    win=window.open('<%= contextPath %>/admin/deploy/popupSignUpload.jsp?redirect=<%= contextPath %>/admin/deploy/upgradeMgr.jsp', 'popupSignatureUpload', 'status=no,width=' + w + ',height=' + h + ',menubar=no,resizable=yes,scrollbars=yes');
    win.focus(); 
  }
</script>

<div class="page-header"><h1><% /* %>Upgrade Manager<% */ %><%= glp("ui.adm.um.title") %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>



<div id="upgradeMgr-tab">

  <%-- TABS --%>
  <ul class="nav nav-tabs br">
    <li class="active"><a href="#file" onclick="return false;"><jalios:icon src="folder" /> <%= glp("ui.adm.um.file-ch") %></a></li>
    <li><a href="#store" onclick="return false;"><jalios:icon src="store" /> <%= glp("ui.adm.um.store-ch") %></a></li>
  </ul>
  
  
  <div class="tab-content responsive">
    <%-- FILE --%>
    <div class="tab-pane fade in active" id="file">
      <%@ include file='/admin/deploy/upgradeMgr_signForm.jspf' %> 
      <%@ include file='/admin/deploy/upgradeMgr_diff.jspf' %> 
    </div>
  
    <%-- STORE --%>
    <div class="tab-pane fade in" id="store">
      <%@ include file='/admin/deploy/upgradeMgr_store.jspf' %> 
    </div>
  </div>
  
</div>

<%@ include file='/admin/doAdminFooter.jspf' %> 
