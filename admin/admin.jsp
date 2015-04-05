<%--
  @Summary: Admin index page
  @Category: Admin / Presentation
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0 
--%><%
%><%@ page import="com.jalios.jcms.rss.RssManager" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
jcmsContext.addCSSHeader("css/jalios/warnlogsbox.css", "all");
request.setAttribute("boMenuOff","true");
%><%@ include file="/admin/doAdminHeader.jspf" %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="row">
  <div class="col-md-9">

    
    <% if (checkAccess("admin/users/") || checkAccess("admin/work/") || checkAccess("admin/reporting/")) { %>
		<div class="page-header">
		  <h1><jalios:icon src="admin-func"/> <%= glp("ui.adm.mn.func") %></h1>
		</div>    
    <div id="adminFunc" class="row">
      <div class="col-md-6">
            
         <% if (checkAccess("admin/users/")) { %>
           <jalios:panel title="ui.adm.mn.users" css="panel-default" id="users">
            <div class="list-group sticky">
             <% if (checkAccess("admin/users/member")) { %>
              <a class="list-group-item" href="admin/memberList.jsp"><jalios:icon src="<%= ResourceHelper.getMemberDefaultIcon() %>" /> <%= glp("ui.adm.mn.users.members") %></a>
             <% } %>
             <% if (checkAccess("admin/users/dbmember")) { %>
              <a class="list-group-item" href="admin/dbmemberList.jsp"><jalios:icon src="<%= ResourceHelper.getDBMemberDefaultIcon() %>"   /> <%= glp("ui.adm.mn.users.dbmembers") %></a>
             <% } %>
             <% if (checkAccess("admin/users/group")) { %>
              <a class="list-group-item" href="admin/groupList.jsp"><jalios:icon src='group'  /> <%= glp("ui.adm.mn.users.groups") %></a>
             <% } %>
             <% if (isAdmin /* ADMIN ONLY! */) { %>
              <a class="list-group-item" href="admin/accessManager.jsp"><jalios:icon src='key'  /> <%= glp("accesscontrol.manager") %></a>
             <% } %>
             <% if (checkAccess("admin/users/admin-mail")) { %>
              <a class="list-group-item modal" href="jcore/alert/sendAlert.jsp" onclick="return false;"><jalios:icon src="email-error" /> <%= glp("alert.send-alert.lbl.title") %></a>
             <% } %>
              <jalios:include target="ADMIN_USERS" targetContext="li" />
            </div>
           </jalios:panel>
         <% } %>
              
         <% if (checkAccess("admin/work/")) { %>
         <jalios:panel title="ui.adm.mn.work" css="panel-default" id="workManagement">
            <div class="list-group sticky">
             <% if (checkAccess("admin/work/workspace")) { %>
              <a class="list-group-item" href="work/workspace/workspaceList.jsp"><jalios:icon src='<%= Workspace.WORKSPACE_ICON %>'   /> <%= glp("ui.adm.mn.work.ws") %></a>
             <% } %>
             <% if (checkAccess("admin/work/workflow")) { %>
              <a class="list-group-item" href="admin/wfList.jsp"><jalios:icon src='wf'  /> <%= glp("ui.adm.mn.work.wf") %></a>
             <% } %>
             <jalios:include target="ADMIN_WORK" targetContext="li" />                 
            </div>
           </jalios:panel>
         <% } %>  

      </div><div class="col-md-6">

		     <% if (checkAccess("admin/reporting/")) { %>
		     <jalios:panel title="ui.adm.mn.reporting" css="panel-default" id="reporting">
		       <div class="list-group sticky">
		         <% if (checkAccess("admin/reporting/analytics")) { %>
		          <a class="list-group-item" href='admin/analytics/report/index.jsp'><jalios:icon src="analytics"  /> <%= glp("ui.adm.mn.files.analytics-report") %></a>                  
		         <% } %>
		         <% if (checkAccess("admin/reporting/data-report")) { %>
		         <a class="list-group-item" href="admin/dataReport.jsp"><jalios:icon src='list'  /> <%= glp("ui.adm.mn.reporting.data") %></a>
		         <% } %>
		         <% if (checkAccess("admin/reporting/friendly-urls")) { %>
		         <a class="list-group-item" href="admin/friendlyURLs.jsp"><jalios:icon src='www'  /> <%= glp("ui.com.lbl.friendly-urls") %></a>
		         <% } %>
		         <% if (checkAccess("admin/reporting/file-size")) { %>
		         <a class="list-group-item" href='admin/fileSizeMap.jsp'><jalios:icon src="drive"  /> <%= glp("ui.adm.mn.files.file-size-map") %></a>                  
		         <% } %>
		         <% if (QuotaManager.getInstance().isQuotaEnabled() && checkAccess("admin/reporting/quota")) { %>
		         <a class="list-group-item" href='admin/viewQuota.jsp'><jalios:icon src="drive"  /> <%= glp("ui.adm.mn.files.view-quota") %></a>                  
		         <% } %>
		         <jalios:include target="ADMIN_REPORTING" targetContext="li" />
		       </div>
		     </jalios:panel>
		     <% } %>
             
         <jalios:panel title="ui.adm.mn.files" css="panel-default" id="files">
	         <div class="list-group sticky">
	           <%
	             int mbWidth = channel.getIntegerProperty("js.data-chooser.mediabrowser.width", channel.getIntegerProperty("js.data-chooser.width", 950));
	             int mbHeight = channel.getIntegerProperty("js.data-chooser.mediabrowser.height", channel.getIntegerProperty("js.data-chooser.height", 570));
	           %>
	           <a class="list-group-item" href='work/mediaBrowser.jsp' onclick='popupWindow(this.href, "mediaBrowser", <%= mbWidth %>, <%= mbHeight %>, "", true, true); return false;'><jalios:icon src="mediabrowser" alt="MediaBrowser" title=''  /> <%= glp("ui.work.mediabrowser.title") %></a>
	           <% if (Channel.getChannel().isWebdavEnabled() && FileWebdavTag.Webdav.canUseWebdavFolderIcon()){ %>
	           <div class="list-group-item"><jalios:webdav showRoot='true' title='<%= glp("ui.work.mediabrowser.webdav") %>' /></div>
	           <% } %>
	           <jalios:include target="ADMIN_FILE" targetContext="li" />
	         </div>
         </jalios:panel>
         
       </div>
     </div>
     <% } // if (checkAccess("admin/users/") || checkAccess("admin/work/") || checkAccess("admin/reporting/")) %>

     <% if (checkAccess("admin/monitoring/") || checkAccess("admin/operation/")) { %>
		<div class="page-header">
		  <h1><jalios:icon src="admin-tech"/> <%= glp("ui.adm.mn.tech") %></h1>
		</div>         
     <div id="adminTech" class="row">
       <div class="col-md-6">

         <% if (checkAccess("admin/monitoring/")) { %>
         <jalios:panel title="ui.adm.mn.info" css="panel-default" id="monitoring">
             <div class="list-group sticky">
             <% if (checkAccess("admin/monitoring/site-info")) { %>
              <a class="list-group-item" href="admin/siteInfo.jsp"><jalios:icon src='status'  /> <%= glp("ui.adm.mn.info.site") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/monitoring")) { %>
              <a class="list-group-item" href="admin/monitoring.jsp"><jalios:icon src="monitoring"  /> <%= glp("ui.adm.mn.info.monitoring") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/store-info")) { %>
              <a class="list-group-item" href="admin/storeInfo.jsp"><jalios:icon src="store"  /> <%= glp("ui.adm.mn.info.store") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/db-info")) { %>
              <a class="list-group-item" href="admin/dbInfo.jsp"><jalios:icon src="db"  /> <%= glp("ui.adm.mn.info.db") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/mail-info")) { %>
              <a class="list-group-item" href="admin/mailInfo.jsp"><jalios:icon src="mail-open"  /> <%= glp("ui.adm.mn.info.mail") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/check-integrity")) { %>
              <a class="list-group-item" href="admin/checkIntegrity.jsp"><jalios:icon src="check-integrity"  /> <%= glp("ui.adm.dic.title") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/lib-info")) { %>
              <a class="list-group-item" href="admin/libInfo.jsp"><jalios:icon src="jar"  /> <%= glp("ui.adm.mn.info.lib") %></a>
             <% } %>
             <% if (checkAccess("admin/monitoring/logs")) { %>
              <a class="list-group-item" href="admin/logs.jsp"><jalios:icon src="log-icon"  /> <%= glp("ui.adm.logs.title") %></a>
             <% } %>
              <jalios:include target="ADMIN_MONITORING" targetContext="li" />
             </div>
         </jalios:panel>
         <% } %>

       </div><div class="col-md-6">
  
        
         <% if (checkAccess("admin/operation/")) { %>
         <jalios:panel title="ui.adm.mn.op" css="panel-default" id="operation">	           
	           <div class="list-group sticky">
	           <% if (checkAccess("admin/operation/properties")) { %>
	             <a class="list-group-item" href="admin/adminProperties.jsp"><jalios:icon src='properties'  /> <%= glp("ui.adm.mn.conf.prop") %></a>
	           <% } %>
	           <% if (checkAccess("admin/operation/deploy-mgr")) { %>
	           <% if (channel.isDeployManagerEnabled()) { %>
	             <a class="list-group-item" href="admin/deploy/deployMgr.jsp"><jalios:icon src="deploy"  /> <%= glp("ui.adm.mn.op.deploy-mgr") %></a>
	           <% } %>
	           <% } %>
	           <% if (checkAccess("admin/operation/search-engines")) { %>
	             <a class="list-group-item" href="admin/adminSearchEngines.jsp"><jalios:icon src="search" /> <%= glp("ui.adm.mn.op.index-mgr") %></a>
	           <% } %>
	           <% if (checkAccess("admin/operation/cache-mgr")) { %>
	             <a class="list-group-item" href="admin/cacheManager.jsp"><jalios:icon src="caches" /> <%= glp("ui.adm.mn.op.cache-mgr") %></a>
	           <% } %>
	           <% if (checkAccess("admin/operation/jsync")) { %>
	           <% if (channel.isJSyncEnabled()) { %>
	             <a class="list-group-item" href='admin/jsync.jsp'><jalios:icon src="replica-lone" /> <%= glp("ui.adm.mn.op.jsync") %></a>
	           <% } %>
	           <% } %>
	           <% if (checkAccess("admin/operation/auth-key")) { %>
	             <a class="list-group-item" href='admin/createAuthKey.jsp'><jalios:icon src="auth-key" /> <%= glp("ui.adm.mn.op.authkey") %></a>
	           <% } %>
	           <% if (checkAccess("admin/operation/plugin-mgr")) { %>
	             <a class="list-group-item" href='admin/pluginManager.jsp'><jalios:icon src="plugin" /> <%= glp("ui.adm.mn.op.plugin-mgr") %></a>
	           <% } %>
	           <% if (checkAccess("admin/operation/import-mgr")) { %>
	           <% if (com.jalios.jcms.mashup.ImportManager.getInstance().isEnabled()) { %>
	             <a class="list-group-item" href='admin/importManager.jsp'><jalios:icon src="import-mgr" /> <%= glp("ui.adm.mn.op.import-mgr") %></a>
	           <% } %>
	           <% } %>
	           <% if (checkAccess("admin/operation/file-processor")) { %>
	             <a class="list-group-item" href="admin/fileprocessor/adminFileProcessor.jsp"><jalios:icon src="fp-icon" /> <%= glp("fileprocessor.adminlink") %></a>
	           <% } %>
	           <% if (checkAccess("admin/operation/admin-custom")) { %>
	           <% if (Util.toBoolean(channel.getProperty("adm.custom.menu.enabled"), false)) { %>
	             <a class="list-group-item" href="custom/jcms/adminCustom.jsp"><jalios:icon src='<%= channel.getProperty("adm.custom.menu.icon") %>' /> <%= glp("ui.adm.custom.menu") %></a>
	           <% } %>
	           <% } %>
	           <% if (checkAccess("admin/operation/analytics")) { %>
	              <a class="list-group-item" href='admin/analytics/index.jsp'><jalios:icon src="analytics"  /> <%= glp("ui.adm.mn.files.analytics-admin") %></a>
	           <% } %>
	           <jalios:include target="ADMIN_OPERATION"/>
             <% if (isAdmin) { %>
	             <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
	             <% if (channel.isDataWriteEnabled()) { %>
                 <span class="list-group-item">
                 <a href="<%= HttpUtil.getUrlWithCSRFToken("admin/disableDataWrite.jsp?disable=true", request, true) %>"
                    class="modal prompt btn btn-warning" 
                    data-jalios-text='<%= glp("ui.adm.data-write.prompt")%>' 
                    data-jalios-modal-default='<%= glp("ui.adm.data-write.default-msg")%>' >
                    <%= glp("ui.adm.mn.op.edit-off") %>
                 </a>
                 </span>
	             <% } else { %>
               <span class="list-group-item">
	             <button class="btn btn-success <%=channel.isFailSafeMode()?"disabledButton":""%>"  value="true" type="button" <%=channel.isFailSafeMode()?"disabled='disabled'":"" %> onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/disableDataWrite.jsp?disable=false")' ><%= glp("ui.adm.mn.op.edit-on") %></button></li>
               </span>
	             <% } %>
	           <% } %> 
             </div>
	           </jalios:panel>
           <% } %>
        </div>
      </div>
     <% } // if (checkAccess("admin/monitoring/") || checkAccess("admin/operation/")) %>

</div><div class="col-md-3">

     <%-- Add Pack Expiration warning --%>
     <% 
       Date addPackExpirationDate = channel.getJcmsInfo().getAddPackExpirationDate();
       Date oneMonthFromNow = new Date(System.currentTimeMillis() + JcmsConstants.MILLIS_IN_ONE_MONTH); 
       if (addPackExpirationDate != null && addPackExpirationDate.before(oneMonthFromNow)) { %> 
        <jalios:panel title="ui.adm.mn.addpack" css="panel-warning">
          <%= glp("ui.adm.mn.addpack.expire-msg", channel.getProperty("channel.add-pack"), JcmsUtil.getFriendlyDate(addPackExpirationDate, DateFormat.SHORT, false, userLocale)) %>
        </jalios:panel>
     <% } %>
     
     <% if (checkAccess("admin/monitoring/logs")) { %>
       <jalios:include jsp="admin/doWarnLogsBox.jsp" />
     <% } %>
    
     <% if (checkAccess("admin/dev/")) { %>
      <% if (channel.getBooleanProperty("channel.dev-tools.enabled", true)){ %>
        <jalios:panel title="ui.adm.mn.dev">
	        <% if (checkAccess("admin/dev/types")) { %>
	          <div class="list-group sticky">
	          	<div class="list-group-item"><h4 class="list-group-item-heading"><%= glp("ui.adm.mn.dev.data-model") %></h4></div>
	            <a class="list-group-item" href="admin/typeListEditor.jsp?rootClass=com.jalios.jcms.Content"><jalios:icon src='form'  /> <%= glp("ui.adm.mn.dev.content-types") %></a>
	            <a class="list-group-item" href="admin/typeListEditor.jsp?rootClass=com.jalios.jcms.UserContent"><jalios:icon src='form'  /> <%= glp("ui.adm.mn.dev.ugc-types") %></a>
	            <a class="list-group-item" href="admin/typeListEditor.jsp?rootClass=com.jalios.jcms.portlet.PortalElement"><jalios:icon src='form'  /> <%= glp("ui.adm.mn.dev.portlet-types") %></a>
	            <a class="list-group-item" href="admin/typeListEditor.jsp?rootClass=com.jalios.jcms.Form"><jalios:icon src='form'  /> <%= glp("ui.adm.mn.dev.form-types") %></a>
	            <jalios:include target="ADMIN_DATAMODEL" targetContext="li" />
	        <% } else { %>
	          <div class="list-group sticky-bottom">
	        <% } %>
	          	<div class="list-group-item"><h4 class="list-group-item-heading"><%= glp("ui.adm.mn.dev.tools") %></h4></div>
	           <% if (checkAccess("admin/dev/upgrade-mgr")) { %>
	            <a class="list-group-item" href="admin/deploy/upgradeMgr.jsp"><jalios:icon src="diff"  /> <%= glp("ui.adm.mn.dev.upgrade-mgr") %></a>
	           <% } %>
	           <% if (checkAccess("admin/dev/store-cleaner")) { %>
	            <a class="list-group-item" href="admin/storeCleaner.jsp"><jalios:icon src="store-cleaner"  /> <%= glp("ui.adm.mn.dev.store-cleaner") %></a>
	           <% } %>
	           <% if (checkAccess("admin/dev/portal-profiler")) { %>
	            <a class="list-group-item" href="admin/portalProfiler.jsp"><jalios:icon src="gauge"  /> <%= glp("ui.profiler.title") %></a>
	           <% } %>
	           <% if (checkAccess("admin/dev/")) { %>
	             <a class="list-group-item modal" href="admin/editDataId.jsp"><jalios:icon src="inspect" /> <%= glp("ui.adm.mn.dev.edit-data") %></a>
	           <% } %>
	            <% String showTargetsProp = Util.toBoolean(request.getSession().getAttribute("channel.dev-tools.targets"), false) ? "ui.adm.mn.dev.target.hide" : "ui.adm.mn.dev.target.show"; %>
	            <a class="list-group-item" href="admin/showTargets.jsp"><jalios:icon src="includetarget"  /> <%= glp(showTargetsProp) %></a>
	            <jalios:include target="ADMIN_TOOLS" targetContext="li" />
	          </div>
          <jalios:buffer name="PANEL_HEADING_BTN">
            <small><%= glp("ui.adm.mn.dev.not-in-prod") %></small>
          </jalios:buffer>              
      </jalios:panel>
      <% } %>
     <% } %>
     
    <jalios:panel title="ui.adm.mn.docs" css="panel-info">
      <%-- Users doc --%>
      <div class="list-group sticky">
        <a class="list-group-item" href="http://community.jalios.com/" target="_blank"><jalios:icon src="world-link" /> Jalios Community</a>
        <a class="list-group-item" href="http://community.jalios.com/jcms9" target="_blank"><jalios:icon src="world-link" /> JCMS 9</a>
        <a class="list-group-item" href="http://community.jalios.com/howto/administrator/" target="_blank"><jalios:icon src="world-link" /> <%= glp("ui.adm.mn.docs.jx.admin") %></a>
        <a class="list-group-item" href="http://community.jalios.com/documentations/faq/" target="_blank"><jalios:icon src="world-link" /> <%= glp("ui.adm.mn.docs.jx.faq") %></a>
        <jalios:include target="ADMIN_DOCUMENTATION" targetContext="li" />
      </div>
    </jalios:panel>
	
    <%-- Technical doc --%>
    <% if (Util.toBoolean(channel.getProperty("channel.dev-tools.enabled"), true)) { %>
    <jalios:panel title="ui.adm.mn.docs.tech" css="panel-info">
      <div class="list-group sticky">
        <a class="list-group-item" href="docs/javadoc/index.html" target="_blank"><jalios:icon src="book-closed" /> <%= glp("ui.adm.mn.docs.api") %></a>
        <% if (checkAccess("admin/dev/")) { %>
        <a class="list-group-item" href="docs/jcms/index.jsp"><jalios:icon src="book-closed" /> <%= glp("ui.adm.mn.docs.css") %></a>
        <a class="list-group-item" href="docs/jcms/taglib.jsp" target="taglib"><jalios:icon src="book-closed" /> <%= glp("ui.adm.mn.docs.tag") %></a>
        <% } %>
        <a class="list-group-item" href="admin/restDoc.jsp" target="rest"><jalios:icon src="book-closed" /> <%= glp("ui.adm.mn.docs.rest") %></a>
        <a class="list-group-item" href="http://community.jalios.com/howto/designer/" target="_blank"><jalios:icon src="world-link" /> <%= glp("ui.adm.mn.docs.jx.design") %></a>
        <a class="list-group-item" href="http://community.jalios.com/howto/developer/" target="_blank"><jalios:icon src="world-link" /> <%= glp("ui.adm.mn.docs.jx.dev") %></a>
        <jalios:include target="ADMIN_TECHDOC" targetContext="li"  />
      </div>
    </jalios:panel>
    <% } %>
    
    <jalios:panel title="ui.adm.mn.docs.copyrights" css="panel-info">
      <%-- Copyrights --%>
      <div class="list-group sticky">
        <a class="list-group-item" href="admin/copyright.jsp" onclick='popupWindow(this.href, "copyrights", 600, 600); return false;'>&copy; <%= glp("ui.adm.mn.docs.copyrights.jcms") %></a>
        <jalios:include target="ADMIN_COPYRIGHTS" targetContext="li" />
      </div>
    </jalios:panel>
     
  </div>
</div>

<%@ include file="/admin/doAdminFooter.jspf" %>
 
