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

  if (!checkAccess("admin/monitoring/db-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("dbInfoSubAdminMenu", "true"); 

HibernateManager hibernateMgr = HibernateManager.getInstance();

List<Class> classList = new ArrayList();
classList.add(DBData.class);
classList.add(Data.class);
classList.add(Publication.class);
classList.add(UserContent.class);
classList.add(Form.class);
for(Iterator it = hibernateMgr.getConfiguration().getClassMappings(); it.hasNext();) {
  org.hibernate.mapping.PersistentClass itPersistentClass = (org.hibernate.mapping.PersistentClass)it.next();
  classList.add(itPersistentClass.getMappedClass());
}
DerbyManager derbyMgr = DerbyManager.getInstance();

int counter = 0;

%><%@ include file='/admin/doAdminHeader.jspf' %>
  <div class="page-header"><h1><%= glp("ui.adm.mn.info.db") %></h1></div>
           
  <div class="row">
    <div class="col-md-6">

         <%-- ** CONFIGURATION ********************************** --%>
         <% counter = 0; %>
         <table class="table-data table-condensed">
            <tr> 
              <th colspan="2"><% /* %>JCMS Info<% */ %><%= glp("ui.adm.dbinfo.conf") %></th>
            </tr>
            <%-- jcmsdb --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.rdbms") %></td>
              <td class="text-right">
                <% String jcmsdb = channel.getProperty("channel.jcmsdb", ""); %>
                <%= glp("ui.adm.prop.db.jcmsdb.rdbms." + jcmsdb) %><br/>
                <% if ("derby".equals(jcmsdb)) { %>
                <a href="admin/derbyInfo.jsp" onclick='return Popup.popupWindow(this.href, "Derby Info", 800, 600, "", true);'><%= glp("ui.adm.dbinfo.conf.derby.info") %></a>
                <% } %>
              </td>
            </tr>
            <% if (hibernateMgr.isJDBCConnection()) { %>
            <%-- URL --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.url") %></td>
              <td class="text-right">
                <jalios:truncate length="50" suffix="..."><%= hibernateMgr.getConnectionUrl() %></jalios:truncate>
              </td>
            </tr>
            <%-- Driver --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.driver") %></td>
              <td class="text-right"><%= hibernateMgr.getConnectionDriver() %></td>
            </tr>
            <%-- Connection pool --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.connection-pool") %></td>
              <td class="text-right"><%= hibernateMgr.isConnectionPoolEnabled() ? glp("ui.com.txt.enabled") : glp("ui.com.txt.disabled") %></td>
            </tr>
            <% } else { %>
            <%-- DataSource --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.datasource") %></td>
              <td class="text-right"><%= hibernateMgr.getConnectionDataSource() %></td>
            </tr>            
            <% } %>
            
            <%-- Dialect --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.dialect") %></td>
              <td class="text-right"><%= hibernateMgr.getDialect() %></td>
            </tr>

            <%-- 2nd Level Cache --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.second-level-cache") %></td>
              <td class="text-right"><%= hibernateMgr.isSecondLevelCacheEnabled() ? glp("ui.com.txt.enabled") : glp("ui.com.txt.disabled") %></td>
            </tr>

            <%-- Query Cache --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.query-cache") %></td>
              <td class="text-right"><%= hibernateMgr.isQueryCacheEnabled() ? glp("ui.com.txt.enabled") : glp("ui.com.txt.disabled") %></td>
            </tr>

            <% if (derbyMgr.isServerStarted()) { %>
            <%-- Derby > Port --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.derby.port") %></td>
              <td class="text-right"><%= derbyMgr.getServerPort() %></td>
            </tr>

            <%-- Derby > Backup --%>
            <tr> 
              <td nowrap="nowrap"><%= glp("ui.adm.dbinfo.conf.derby.backup") %></td>
              <td class="text-right">
                <% if (!derbyMgr.isBackupEnabled()) { %>
                <%= glp("ui.adm.dbinfo.conf.derby.no-backup") %>
                <% } else { %>
                <%= derbyMgr.getBackupSchedule() %>
                <% } %>
              </td>
            </tr>
            <% } %>

          </table>

</div><div class="col-md-6">

          <%-- ** DATABASE DATA ********************************** --%>
          <% counter = 0; %>
          <table class="table-data table-condensed">
           <tr> 
              <th colspan="2"><%= glp("ui.adm.dbinfo.data") %></th>
            </tr>
            
            
            <jalios:foreach collection="<%= classList %>" name="itClass" type="Class">
            <tr> 
              <td nowrap="nowrap"><%= channel.getTypeLabel(itClass, userLang) %></td>
              <td class="text-right"><%= HibernateUtil.queryCount(itClass) %></td>
            </tr>
            </jalios:foreach>
          </table>
          
  </div>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %> 