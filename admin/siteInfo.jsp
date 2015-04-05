<%--
  @Summary: Display information about the site
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jstore.jsync.*" %><%

  if (!checkAccess("admin/monitoring/site-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("siteInfoSubAdminMenu", "true"); 

com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 
int counter = 0;

long freeMemory = Runtime.getRuntime().freeMemory();
long totalMemory = Runtime.getRuntime().totalMemory();
String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, userLocale); 
String totalMemoryStr = Util.formatFileSize(totalMemory, userLocale); 
int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);
boolean showCSLimit = PluginManager.getPluginManager().getPlugin("CollaborativeSpacePlugin") != null;
LimitController limitController = channel.getLimitController();
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.mn.info.site") %></h1></div>

         <%-- ** System INFO ********************************** --%>
         <% counter = 0; %>
         <table class="table-data table-condensed">
            <tr>
              <th colspan="2"><% /* %>System Info<% */ %><%= glp("ui.adm.ch-status.ch.system.title") %></th>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>JCMS Version<% */ %><%= glp("ui.adm.ch-status.ch.jcms.ver") %></td>
              <td class="text-left"><b><%= channel.getJcmsInfo().getVersion() %></b></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>App. Server<% */ %><%= glp("ui.adm.ch-status.ch.system.appsrv") %></td>
              <td class="text-left"><i><%= getServletConfig().getServletContext().getServerInfo() %></i></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>JVM<% */ %><%= glp("ui.adm.ch-status.ch.system.jvm") %></td>
              <td class="text-left">
                 <%= System.getProperty("java.vm.name") %> (<%= System.getProperty("java.vm.version") %>)<br />
                 <%= System.getProperty("java.vm.vendor") %><br />
                 <%= glp("ui.adm.ch-status.mem.total") %> <%= totalMemoryStr %> - 
                 <%= glp("ui.adm.ch-status.mem.used") %> <%= usedMemoryStr %> (<%= percentMemory %>%)
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>Operating System<% */ %><%= glp("ui.adm.ch-status.ch.system.os") %></td>
              <td class="text-left">
                <%= System.getProperty("os.name") %> <%= System.getProperty("os.version") %> (<%= System.getProperty("os.arch") %>)<br />
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>Java Home<% */ %><%= glp("ui.adm.ch-status.ch.paths.java") %></td>
              <td class="text-left"><%= System.getProperty("java.home") %></td>
            </tr>
            <tr> 
              <td nowrap><% /* %>Temporary file directory<% */ %><%= glp("ui.adm.ch-status.ch.paths.tmpdir") %></td>
              <td class="text-left"><%= System.getProperty("java.io.tmpdir") %></td>
            </tr>
            <tr> 
              <td nowrap><% /* %>WebApp Path<% */ %><%= glp("ui.adm.ch-status.ch.paths.webapp") %></td>
              <td class="text-left"><%= channel.getWebappPath() %></td>
            </tr>
            <tr> 
              <td nowrap><% /* %>Network Interfaces<% */ %><%= glp("ui.adm.ch-status.ch.system.net") %></td>
              <td class="text-left">
						    <%
						      for (Enumeration niEnum = NetworkInterface.getNetworkInterfaces(); niEnum.hasMoreElements() ;) {
						        NetworkInterface ni = (NetworkInterface) niEnum.nextElement();
						    %>
						      <%= ni.getName() %> : <%
						         for (Enumeration inetAddrEnum = ni.getInetAddresses(); inetAddrEnum.hasMoreElements() ;) {
						           InetAddress inetAddr = (InetAddress) inetAddrEnum.nextElement();
						         %><%= inetAddr.getHostAddress() %><%= inetAddrEnum.hasMoreElements() ? ", " : "" %>
						      <% } %>
						      <%= niEnum.hasMoreElements() ? "<br />" : "" %>
						    <% } %>
              <br />
              </td>
            </tr>
          </table>  
          
    <table    style="margin-top: 10px;">  
      <tr>
        <td class='vTop' width="50%" style="padding-right: 10px;">

         <%-- ** JCMS INFO ********************************** --%>
         <% counter = 0; %>
         <table class="table-data table-condensed">
            <tr> 
              <th colspan="2"><% /* %>JCMS Info<% */ %><%= glp("ui.adm.ch-status.ch.jcms.title") %></th>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>Last restart<% */ %><%= glp("ui.adm.ch-status.ch.jcms.last") %></td>
              <td class="text-right">
                <% Date lastRestartDate = (Date)getServletConfig().getServletContext().getAttribute("channelLastRestart"); %> 
                <jalios:date date='<%= lastRestartDate %>'/> - <jalios:time date='<%= lastRestartDate %>'/><br>
                (<jalios:duration begin='<%= lastRestartDate%>' end='<%= new Date() %>'/>) 
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>Database<% */ %><%= glp("ui.adm.ch-status.ch.jcms.database") %></td>
              <td class="text-right">
                <% String jcmsdb = channel.getProperty("channel.jcmsdb", ""); %>
                <%= glp("ui.adm.prop.db.jcmsdb.rdbms." + jcmsdb) %><br/>
                <% HibernateManager hibernateMgr = HibernateManager.getInstance(); %>
                <% if (hibernateMgr.isJDBCConnection()) { %>
                <jalios:truncate length="50" suffix="..."><%= hibernateMgr.getConnectionUrl() %></jalios:truncate>
                <% } else { %>
                <jalios:truncate length="50" suffix="..."><%= hibernateMgr.getConnectionDataSource() %></jalios:truncate>
                <% } %>
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>SMTP Server<% */ %><%= glp("ui.adm.ch-status.ch.jcms.smtp") %></td>
              <td class="text-right">
                <% if (!channel.isMailEnabled()) { %>
                  <strong><%= glp("ui.com.txt.disabled") %></strong>
                <% } else { %>
                  <%= channel.getProperty("mail.smtp.host", "") %>
                <% } %>
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>LDAP Server<% */ %><%= glp("ui.adm.ch-status.ch.jcms.ldap") %></td>
              <td class="text-right">
                <% if (!channel.isLdapEnabled()) { %>
                  <%= glp("ui.com.txt.disabled") %>
                <% } else { %>
                  <%= channel.getProperty("ldap.server.hostname", "") %>
                <% } %>
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>JSync<% */ %><%= glp("ui.adm.ch-status.ch.jcms.jsync") %></td>
              <td class="text-right">
                <% if (!channel.isJSyncEnabled()) { %>
                <%= glp("ui.com.txt.disabled") %>
                <% } else { %>
                  <% JSyncReplica replica = channel.getJSyncReplica(); %>
                  URID: <%= channel.getUrid() %><br />
                  <% if (replica.isLeader()) { %>
                  JSync Leader (<%= replica.getReplicaMap().size() %> replicas connected)<br />
                  <% } %>
                  <% if (replica.isJoined()) { %>
                  Connected to JSync Leader <%= replica.getLeader().getUrid() %><br />
                  (<%= replica.getLeader().getUrl() %>)
                  <% } else { %>
                  Not yet connected to a JSync Leader
                  <% } %>  
                  <br /><a href='admin/jsync.jsp'><%= glp("ui.com.txt.details") %></a>
                <% } %>
              </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.com.lbl.datasource") %></td>
              <td class="text-right">
					      <jalios:foreach collection='<%= DBUtil.getDataSourceMap().keySet() %>' type='String' name='itDataSource'>
					      <%= itDataSource %><br/>
					      </jalios:foreach>
		          </td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.ch-status.ch.jcms.workspace") %></td>
              <td class="text-right"><%= WorkspaceManager.getNonCollaborativeWorkspaceCount() %> / <%= limitController.getWorkspaceLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getWorkspaceLimit()) %></td>
            </tr>
            <% if (showCSLimit) { %>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.ch-status.ch.jcms.cs") %></td>
              <td class="text-right"><%= WorkspaceManager.getCollaborativeSpaceCount() %> / <%= limitController.getCollaborativeSpaceLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getCollaborativeSpaceLimit()) %></td>
            </tr>
            <% } %>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.ch-status.ch.jcms.member") %></td>
              <td class="text-right"><%= limitController.getActiveMemberCount() %> / <%= limitController.getMemberLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getMemberLimit()) %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.ch-status.ch.jcms.dbmember") %></td>
              <td class="text-right"><%= limitController.getActiveDBMemberCount() %> / <%= limitController.getDBMemberLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getDBMemberLimit()) %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.ch-status.ch.jcms.document") %></td>
              <td class="text-right"><%= channel.getDataCount(DBFileDocument.class) %> / <%= limitController.getDBFileDocumentLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getDBFileDocumentLimit()) %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.ch-status.ch.jcms.lang") %></td>
              <td class="text-right"><%= channel.getLanguageList().size() %> / <%= limitController.getLanguageLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getLanguageLimit()) %></td>
            </tr>
<% 
	QuotaManager mgr = QuotaManager.getInstance();
	Map<Workspace, QuotaElement> elements = mgr.getElements();
	QuotaElement siteElement = elements.get(null);
	long size = 0L;
	long maxQuotaValue = 0L;
	if(siteElement != null){
	  size = siteElement.getQuota();
	  maxQuotaValue = siteElement.getQuotaMaxValue();
	}	
	int nbWorkspaces = Util.getSize(elements) -1;
	int nbWorkspaceInAlert = 0;
	if(elements  != null){
	  for(QuotaElement elt : elements.values()){
	    if(elt == null || elt.getWorkspace() == null){
	      continue;
	    }
	    if(elt.isAlert()){
	      nbWorkspaceInAlert ++;
	    }
	  }
	}
%>
            <tr> 
              <td nowrap="nowrap"><% /* %>Site quota<% */ %><%= glp("ui.adm.ch-status.ch.jcms.site-quota") %></td>
              <% if( siteElement == null ){%>
               <td class="text-right"><%=glp("ui.adm.data-report.inprogress") %></td>
              <%}else{ %>
              <td class="text-right"><%= Util.formatFileSize(size, userLocale) +" / "+Util.formatFileSize(maxQuotaValue, userLocale)%></td>
              <%} %>
            </tr>          
            <tr> 
              <td nowrap="nowrap"><% /* %>WorkspacesQuota<% */ %><%= glp("ui.adm.ch-status.ch.jcms.workspaces-quota") %></td>
              <td class="text-right"><%= nbWorkspaceInAlert %> / <%= nbWorkspaces %></td>
            </tr>          
          </table>
        </td>
        <td class='vTop'>
          <%-- ** SESSION INFO ********************************** --%>
          <% counter = 0; %>
          <table class="table-data table-condensed">
            <tr> 
              <th colspan="2"><% /* %>Session Info<% */ %><%= glp("ui.adm.ch-status.ch.st.title") %></th>
            </tr>
            <tr> 
              <td nowrap="nowrap"><a href="admin/memberList.jsp?sort=session" ><% /* %>#Logged members<% */ %><%= glp("ui.adm.ch-status.ch.st.logged") %></a></td>
              <td class="text-right"><%= JcmsSessionTracker.getLoggedMemberSet().size() %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>#Sessions<% */ %><%= glp("ui.adm.ch-status.ch.st.sess") %></td>
              <td class="text-right"><%= JcmsSessionTracker.getAllSessionCount() %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap">&nbsp;&nbsp;<% /* %>#Logged Sessions<% */ %><%= glp("ui.adm.ch-status.ch.st.log-sess") %></td>
              <td class="text-right"><%= JcmsSessionTracker.getLoggedSessionCount()%></td>
            </tr>
            <tr> 
              <td nowrap="nowrap">&nbsp;&nbsp;<% /* %>#Not logged Sessions<% */ %><%= glp("ui.adm.ch-status.ch.st.unk-sess") %></td>
              <td class="text-right"><%= JcmsSessionTracker.getUnauthenticatedCount() %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap">&nbsp;&nbsp;&nbsp;&nbsp;<% /* %>#Non robot<% */ %><%= glp("ui.adm.ch-status.ch.st.unk-sess-nonrobot") %></td>
              <td class="text-right"><%= JcmsSessionTracker.getUnauthenticatedNonRobotCount() %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap">&nbsp;&nbsp;&nbsp;&nbsp;<% /* %>#Robot (Web Crawler)<% */ %><%= glp("ui.adm.ch-status.ch.st.unk-sess-robot") %></td>
              <td class="text-right"><%= JcmsSessionTracker.getUnauthenticatedRobotCount() %></td>
            </tr>
            <tr> 
              <td nowrap="nowrap"><% /* %>Session Timout<% */ %><%= glp("ui.adm.ch-status.ch.st.timeout") %></td>
              <td class="text-right"><jalios:duration time="<%= request.getSession().getMaxInactiveInterval() * 1000 %>"/></td>
            </tr>
          </table>
          
        </td>
      </tr>
      <tr width='100%'>
        <td class='vTop' colspan='2'>  
          <p class="text-left">
            <% if (channel.getAppServerInfo().isRestartSupported()) { %> 
             <button class="btn btn-danger" 
                     onclick="confirmAction('<%= encodeForJavaScript(glp("msg.js.confirm")) %>', '<%= contextPath %>/admin/restart.jsp?redirect=admin/siteInfo.jsp');" 
                     type="button"><%= glp("ui.com.btn.restart") %></button>
            <% } %>
            <% if (JcmsUtil.isAuthorizedToAccessStatusInfo(getServletConfig().getServletContext(), request)) {  %>  
            <span style="padding-left: 10px;"><jalios:icon src="xml" />&nbsp<a href="admin/statusXml.jsp"><%= glp("ui.adm.ch-status.xml") %></a></span>
            <% } %>
          </p>
        </td>
      </tr>
    </table>
<%@ include file='/admin/doAdminFooter.jspf' %> 