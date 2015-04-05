<%--
  @Summary: Publication Chooser
  @Category: Work Area / Publication
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }
  
  request.setAttribute("title",glp("ui.com.alt.pub-chooser"));
  request.setAttribute("zone","InternalUI");
  boolean showCategories = channel.getBooleanProperty("channel.pub-chooser.show-categories", false);
%>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.PubBrowserHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="loggedMember" value="<%= loggedMember %>"/>
  <jsp:setProperty name="formHandler" property="mode" value="all"/>
  <jsp:setProperty name="formHandler" property="showCategories" value="<%= showCategories %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (!formHandler.validate()){
    sendRedirect(formHandler.getRedirect(), request, response);  
    return;
  }

  boolean popupEdition       = true;
  String redirectRefresh     = ServletUtil.getAbsUrlWithUpdatedParam(request,"refreshAndClose","true");
  boolean showPreviewIcon    = false;
  boolean showDeepDuplicate  = false;
  boolean showDuplicate      = true;
  boolean showCaddy          = true;
  boolean showCSVExport      = false;
  boolean showDelete         = true;
  boolean showVersion        = false;
  boolean showWorkMerge      = false;
  boolean showRadioInsert    = true;
  boolean showCheckInsert    = false;
  boolean showWorkflow       = false;
  boolean workspaceFilter    = formHandler.isWorkspaceFilter();
  boolean showAddIcon        = formHandler.isWorkspaceFilter() || isAdmin;
  boolean showWorkspace      = !formHandler.isWorkspaceFilter();
  boolean showWorkspaceFilter= true;

  jcmsContext.forceEditIcon(true);
  request.setAttribute("plIsPopupEdition", Boolean.TRUE);
  request.setAttribute("jcms.pubbrowser.chooser.menu",true);
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
  <div id='mainDiv' class="pubchooser-wrapper">
    <jalios:include jsp='/work/doPubChooserHeader.jsp'/>  
    <%@ include file='/work/doPubBrowser.jspf' %>
  </div>
  <% request.removeAttribute("jcms.pubbrowser.chooser.menu"); %>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
