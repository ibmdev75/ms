<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.PubBrowserHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="loggedMember" value="<%= loggedMember %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><% 

	if (!formHandler.validate()){
		return;
	}

	boolean popupEdition       = false;
	String  redirectRefresh    = ServletUtil.getUrl(request, false);
	boolean workspaceFilter    = formHandler.isWorkspaceFilter();
	boolean showPreviewIcon    = true;
	boolean showDeepDuplicate  = true;
	boolean showDuplicate      = true;
	boolean showCaddy          = formHandler.showCaddy();
	boolean showCSVExport      = true;
	boolean showDelete         = true;
	boolean showVersion        = true;
	boolean showWorkMerge      = formHandler.isWorkspaceFilter();
	boolean showRadioInsert    = false;
	boolean showCheckInsert    = false;
	boolean showWorkflow       = true;
	boolean showAddIcon        = formHandler.isWorkspaceFilter() || isAdmin;
	boolean showWorkspace      = !workspaceFilter;
	boolean showWorkspaceFilter= false;

  String whSuffix = formHandler.isContentMode() ? "c" : (formHandler.isPortletMode() ? "p" : "f");
  whSuffix += "." + (formHandler.isMineMode() ? "m" : (formHandler.isAllMode() ? "a" : "d")); 
  request.setAttribute("whSuffix", whSuffix);
  request.setAttribute("boHeaderCSS","sticky-display");
  
%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/work/doPubBrowser.jspf' %><%
%><%@ include file='/work/doWorkFooter.jspf' %><%

%>