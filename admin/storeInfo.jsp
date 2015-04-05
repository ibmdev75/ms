<%--
  @Summary: Display information about the store
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

  if (!checkAccess("admin/monitoring/store-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("storeInfoSubAdminMenu", "true"); 

com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 
int counter = 0;

%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>
<div class="page-header"><h1><%= glp("ui.adm.mn.info.store") %></h1></div>
<div class="tab-pane" id="channel-status-tab">

  <%-- ** STORE INFO ********************************** --%>
  <% counter = 0; %>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Store Info<% */ %><%= glp("ui.adm.ch-status.tab.st") %></h2>
    <div class="row">
      <div class="col-md-4">
    
    
          <table id='pubTable' class="table-data table-condensed">
            <tr> 
              <th colspan="2"><% /* %>Store Info<% */ %><%= glp("ui.adm.ch-status.st.title") %></th>
            </tr>
            <tr class='vTop'> 
              <td><% /* %>Load duration<% */ %><%= glp("ui.adm.ch-status.st.load") %></td>
              <td class="text-right" nowrap="nowrap">
                <jalios:duration time="<%= loadReport.getDuration() %>"/>
              </td>
            </tr>
            <tr class='vTop'> 
              <td><% /* %>Memory used<% */ %><%= glp("ui.adm.ch-status.st.mem") %></td>
              <td class="text-right" nowrap="nowrap">
                <jalios:filesize size="<%= loadReport.getMemoryUsed() %>"/>
              </td>
            </tr>
            <tr class='vTop'> 
              <td><% /* %>Load Errors<% */ %><%= glp("ui.adm.ch-status.st.load-err") %></td>
              <td class="text-right"> 
                <b><a href="admin/loadReport.jsp" style='<%= loadReport.getErrorCount() > 0 ? "text-decoration: none; color: red" : "" %>'><%= glp("ui.adm.ch-status.st.errors", loadReport.getErrorCount()) %></b>
              </td>
            </tr>
            <tr class='vTop'> 
              <td ><% /* %>#objects<% */ %><%= glp("ui.adm.ch-status.st.obj") %></td>
              <td class="text-right">
                 <%= channel.getStoreSize() %><br /><br />
                 <%= glp("ui.com.lbl.workspaces") %> : <%= Util.getSize(channel.getDataSet(Workspace.class)) %><br />
                 <%= glp("ui.com.lbl.groups") %> : <%= Util.getSize(channel.getDataSet(Group.class)) %><br />
                 <%= glp("ui.com.lbl.members") %> : <%= Util.getSize(channel.getDataSet(Member.class)) %><br />
                 <%= glp("ui.com.lbl.categories") %> : <%= Util.getSize(channel.getDataSet(Category.class)) %><br />
                 <%= glp("ui.com.lbl.publications") %> : <%= Util.getSize(channel.getDataSet(Publication.class)) %><br />
                 <%= glp("ui.com.lbl.contents") %> : <%= Util.getSize(channel.getDataSet(Content.class)) %><br />
                 <%= glp("ui.com.lbl.ugcs") %> : <%= Util.getSize(channel.getDataSet(UserContent.class)) %><br />
                 <%= glp("ui.com.lbl.portalelements") %> : <%= Util.getSize(channel.getDataSet(PortalElement.class)) %><br />
                 <%= glp("ui.com.lbl.forms") %> : <%= Util.getSize(channel.getDataSet(Form.class)) %><br />
              </td>
            </tr>
            <tr class='vTop'> 
              <td><% /* %>#create<% */ %><%= glp("ui.adm.ch-status.st.create") %></td>
              <td class="text-right">
                <%= channel.getStoreCreateCount() %> (+<%= channel.getStoreCreateCount() - loadReport.getCreateCount()%>)
              </td>
            </tr>
            <tr class='vTop'> 
              <td><% /* %>#update<% */ %><%= glp("ui.adm.ch-status.st.update") %></td>
              <td class="text-right">
                <%= channel.getStoreUpdateCount() %> (+<%= channel.getStoreUpdateCount() - loadReport.getUpdateCount() %>)
              </td>
            </tr>
            <tr class='vTop'> 
              <td><% /* %>#delete<% */ %><%= glp("ui.adm.ch-status.st.delete") %></td>
              <td class="text-right">
                <%= channel.getStoreDeleteCount() %> (+<%= channel.getStoreDeleteCount() - loadReport.getDeleteCount() %>)
              </td>
            </tr>
          </table>
          <% if (channel.getBooleanProperty("channel.dev-tools.enabled", true)){ %>
          <p class="text-left">
            <jalios:icon src='store-cleaner'  />&nbsp;<a href="admin/storeCleaner.jsp"><%= glp("ui.adm.mn.dev.store-cleaner") %></a>
          </p>
          <% } %>
        </td>
        
      </div><div class="col-md-8">
       
          <table id='pubTable' class="table-data table-condensed">
            <%-- MILESTONE ---------------------------------------------------------------- --%>
            <tr> 
             <th  >
                <% /* %>Milestone<% */ %><%= glp("ui.adm.ch-status.st.ms") %>
              </th>
            </tr>
            <tr > 
              <td>
                <jalios:message msg="ui.adm.ch-status.st.ms.txt" dismissable="true" />
                
                <%-- ADD A MILESTONE --%>
                <div class="navbar navbar-default navbar-table-header">
                  <div class="navbar-header">
                    <span class="navbar-brand"><%= glp("ui.adm.ch-status.st.ms.list") %></span>
                  </div>
                  
                  <form action="admin/appendMilestone.jsp" class="navbar-form navbar-left" name="msForm" method="post">
                     <div class="form-group">               
                       <input type="text" name="text" class="form-control" style="width: 300px;" placeholder="<%= glp("ui.adm.ch-status.st.ms.placeholder") %>">
                       <button class='btn btn-danger modal confirm' type="submit" name="opMilestone" value='true' ><%= glp("ui.adm.ch-status.st.ms.btn") %></button>
                     </div>
                  </form>
                </div>
                
                <%-- MILESTONE LIST --%>
                <% 
                List milestoneList = new ArrayList(channel.getStore().getMilestoneList());
                Collections.reverse(milestoneList);
                %>
                <% if (Util.notEmpty(milestoneList)) { %>   
                <table class="table-data">
                  <tr>
                    <th class="fit nowrap"></th>
                    <th class="fit nowrap"><%= glp("ui.com.lbl.date") %></th>
                    <th width='100%'><%= glp("ui.com.lbl.title") %></th>
                    <th class="fit nowrap"><%= glp("ui.com.lbl.stamp") %></th>
                  </tr>
                  <jalios:pager name="pager" declare="true" action="init" size="<%= milestoneList.size() %>"/>    
                  <jalios:foreach collection='<%= milestoneList %>' 
                                  name='itEntry' 
                                  type='com.jalios.jstore.LogEntry'
                                  max="<%= pager.getPageSize() %>"
                                  skip="<%= pager.getStart() %>"> 
                    <tr >
                      <td class="fit"><jalios:icon src='milestone' alt='milestone' /></td>
                      <td class="fit nowrap"><%= itEntry.getAttributes().get("date") %></td>
                      <td width='100%'><%= itEntry.getAttributes().get("text") %></td>
                      <td class="fit"><code><%= itEntry.getStamp() %></code></td>
                    </tr>
                  </jalios:foreach>
                </table>
                <jalios:pager name="pager"/>
                
                <% } %>
              </td>
            </tr>
          </table>
          
      </div>
    </div>
  </div>

  <%-- ** LOAD REPORT ********************************** --%>
        <% counter = 0; %>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Store Info<% */ %><%= glp("ui.adm.ch-status.tab.lr") %></h2>
    <b><font face="Arial, Helvetica, sans-serif">Load info</font></b><br />
    Store file: <%= loadReport.getStoreFile() %><br />
      #op: <%= loadReport.getOpCount() %><br />
      #create: <%= loadReport.getCreateCount() %><br />
      #update: <%= loadReport.getUpdateCount() %><br />
      #delete: <%= loadReport.getDeleteCount() %><br />
      Progress table: <%= loadReport.getProgressTable() %><br />
      Load duration: <%= loadReport.getDuration() %> ms<br />
      Memory used: <jalios:filesize size='<%= loadReport.getMemoryUsed() %>' /> (<%= loadReport.getMemoryUsed() %> bytes) <br />
      Store size: <jalios:filesize size='<%= loadReport.getStoreSize() %>' /> (<%= loadReport.getStoreSize() %> bytes) <br />
      Load errors: <%= loadReport.getErrorCount() %> errors</p>
    
    <% if (loadReport.getErrorCount() > 0) { %>
    <hr size="1" noshade="noshade"/>
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getClassErrorList().size() %> class error(s)</font></b><br />
    A class error occurs when the corresponding class cannot be loaded or instanciated from the operation tag name.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getClassErrorList() %>">
    <ul>
      <li><font color="#FF0000">Class Error at line <%= itLogEntry.getLineNumber() %> - Cannot instanciate class <b><%= itLogEntry.getName() %></b></font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getCreateErrorList().size() %> create error(s)</font></b><br />
    A create error occurs when the ID of this operation is already used.<br />
    <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getCreateErrorList() %>">
    <ul>
      <li><font color="#FF0000">Create Error at </font><font color="#FF0000">line <%= itLogEntry.getLineNumber() %> - ID <b><a href="edit.jsp?id=<%= itLogEntry.getID() %>" style="text-decoration: none"><%= itLogEntry.getID() %></a></b> already used (<%= channel.getData(itLogEntry.getID()) != null ? channel.getData(itLogEntry.getID()).getClass().getName() : "null" %>).</font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getMutationErrorList().size() %> mutation error(s)</font></b><br />
    A mutation error occurs on update or delete operations if there is no data bound on the ID.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getMutationErrorList() %>">
    <ul>
      <li><font color="#FF0000">Mutation Error at </font><font color="#FF0000">line <%= itLogEntry.getLineNumber() %></font><font color="#FF0000"> - No object bound on ID <%= itLogEntry.getID() %>.</font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getStampErrorList().size() %> stamp error(s)</font></b><br />
    A stamp error occurs if the current stamp is lower that the previous one.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getStampErrorList() %>">
    <ul>
      <li><font color="#FF0000">Stamp Error at line <%= itLogEntry.getLineNumber() %> - Decreasing </font><font color="#FF0000"> stamp <%= itLogEntry.getStamp() %> for operation on ID <b><a href="edit.jsp?id=<%= itLogEntry.getID() %>" style="text-decoration: none"><%= itLogEntry.getID() %></a></b> (<%= channel.getData(itLogEntry.getID()) != null ? channel.getData(itLogEntry.getID()).getClass().getName() : "null" %>)</font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getJavaErrorList().size() %> Java error(s)</font></b><br />
    A Java error occurs if an exception is raised when a log entry is processed.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getJavaErrorList() %>">
    <ul>
      <li><font color="#FF0000">Java Error at line <%= itLogEntry.getLineNumber() %> - <%= itLogEntry.getException().getClass().getName() %>: <%= itLogEntry.getException().getMessage() %></font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate><br />
      Exception:
      <% 
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw, true);
        itLogEntry.getException().printStackTrace(pw); 
      %>  
      <pre><%= sw %></pre>
    </ul>
    </jalios:foreach>
    <% } %>
    <hr size="1" noshade="noshade"/>
    <br />
  </div>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %> 