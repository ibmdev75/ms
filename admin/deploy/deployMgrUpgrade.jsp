<%@ page import="com.jalios.io.*, com.jalios.jstore.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!channel.isDeployManagerEnabled()) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.DeployManagerUpgradeHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

%><% request.setAttribute("deploySubAdminMenu", "true"); %><%
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.dm.u.title", formHandler.getWebAppInfo()) %></h1></div>

<%@ include file='/jcore/doMessageBox.jspf' %>


<%-- *** STEP 1 - UPLOAD FORM ************************************************************ --%>
<% if (formHandler.isUploadStep()) { %>

<h2 class="boTitle"><%= glp("ui.adm.dm.u.s1.title") %></h2>
<form action='admin/deploy/deployMgrUpgradeUpload.jsp' method='post' name='editForm' enctype="multipart/form-data">
  <table class="formBackground"> 
    <tr> 
      <td> 
        <table class='layout'>
            <tr> 
              <td colspan="2" class="formTitle"><%= glp("ui.adm.dm.u.s1.form") %></td>
            </tr>
          <tr> 
            <td class="formInput"><%= glp("ui.adm.dm.u.s1.txt") %></td>
          </tr>   
          <tr> 
            <td>
            <input class='formTextfield' type='file' name='file' size='50' />
            </td>
          </tr>
          <tr>
            <td>
              <input class='btn btn-primary' type='submit' value='<%= glp("ui.com.btn.upload") %>' />
              <input type='hidden' name='webappId' value='<%= formHandler.getWebAppInfo().getWebappId() %>'  />
            </td>
          </tr>
        </table> 
      </td>
    </tr>
  </table>
</form>


<%-- *** STEP 2 - CHECK ************************************************************ --%>
<% } else if (formHandler.isDiffStep()) { %>
<h2 class="boTitle"><%= glp("ui.adm.dm.u.s2.title") %></h2>

<form name="diffForm" action="admin/deploy/deployMgrUpgrade.jsp" method="post" >
<div class="tab-pane" id="upgradeMgr-tab">

  <%-- --- SUMMARY ----------------------------------- --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.adm.dm.u.s2.summ") %></h2>
    <table class="table-data table-condensed">
      <% int counter = 0; %>
      <tr> 
        <th><%= glp("ui.adm.dm.u.s2.summ.rsrc") %></th>
        <th><%= glp("ui.adm.dm.u.s2.summ.status") %></th>
      </td>
      <tr>
        <td><%= glp("ui.adm.dm.u.s2.summ.files") %></td>
        <td>
          <% int status = formHandler.getFilesStatus(); %>
          <jalios:icon src='<%= status == formHandler.CONFLICT ? "bullet-warn" : "bullet-check" %>'/>
          <%= glp("ui.adm.dm.u.s2.st." + formHandler.getFilesStatusMsg()) %>
        </td>
      </tr>
      <tr>
        <td><%= glp("ui.adm.dm.u.s2.summ.store") %></td>
        <td>
          <% status = formHandler.getStoreStatus(); %>
          <jalios:icon src='<%= status == formHandler.CONFLICT ? "bullet-warn" : "bullet-check" %>'/>
          <%= glp("ui.adm.dm.u.s2.st." + formHandler.getStoreStatusMsg()) %>
        </td>
      </tr>
    </table>
  </div>

  <%-- --- FILE CHANGES ----------------------------------- --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.adm.um.file-ch") %></h2>
    <% 
    request.setAttribute("parentDir", formHandler.getWebAppInfo().getDir());
    request.setAttribute("checkCanWrite", Boolean.TRUE); 
    request.setAttribute("useRelativeFile", Boolean.TRUE); 
    request.setAttribute("canSelectDeleted", Boolean.TRUE); 
    %>
    <%@ include file='/admin/deploy/doSignDiff3.jspf' %>
  </div>

  <%-- --- STORE CHANGES ----------------------------------- --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.adm.um.store-ch") %></h2>
    <% SyncManager srcSyncMgr = formHandler.getSrcSyncMgr(); %>
    <% if (srcSyncMgr == null || !srcSyncMgr.isAvailable()) { %>
    <%= glp("ui.adm.um.store-ch.txt1") %>
    <% } else { %>
    <%
    Map srcDataMap = srcSyncMgr.getDataMap(); 
    Stamp gcs = srcSyncMgr.getGreatestCommonStamp();
    SyncManager tgtSyncMgr = formHandler.getTgtSyncMgr();
    Map tgtDataMap = tgtSyncMgr.getDataMap(); 
    %>
      <input type='radio' name='replaceStore' value='false' checked /> <%= glp("ui.adm.dm.u.s2.store.merge") %> <input type='radio' name='replaceStore' value='true' /> <%= glp("ui.adm.dm.u.s2.store.repl") %>
      <li><%= glp("ui.adm.um.last-sync") %> <jalios:date date='<%= srcSyncMgr.getLastSyncDate() %>' format='<%= "full" %>'/> <jalios:time date='<%= srcSyncMgr.getLastSyncDate() %>' format='<%= "short" %>'/> (stamp: <%= srcSyncMgr.getLastSync().getStamp() %>)
      <li><%= glp("ui.adm.dm.u.s2.store.src_op") %> <%= srcSyncMgr.getOpCount() %>
      <li><%= glp("ui.adm.dm.u.s2.store.tgt_op") %> <%= tgtSyncMgr.getOpCount() %>
      <li><%= glp("ui.adm.um.gcs") %> <%= gcs %>
    <p><%= glp("ui.adm.dm.u.s2.store.txt") %></p>
    <table class="table-data table-condensed">	
      <tr>
        <th><%= glp("ui.com.lbl.id") %></th>
        <th><%= glp("ui.com.lbl.type") %></th>
        <th><%= glp("ui.adm.um.sign.src-ch") %></th>
        <th><%= glp("ui.adm.um.sign.tgt-ch") %></th>
      </tr>

    <jalios:foreach collection='<%= srcDataMap.keySet() %>' type='String' name='itID' counter='keyCounter'>
    <% 
    List srcOpList = (List)srcDataMap.get(itID);
    StorableLogEntry srcFirstOp = (StorableLogEntry)srcOpList.get(0);
    StorableLogEntry srcLastOp = (StorableLogEntry)srcOpList.get(srcOpList.size() - 1);
    String typeName = Util.getClassShortName(srcFirstOp.getName());
    boolean isSrcCreate = false;
    boolean isSrcUpdate = false;
    boolean isSrcDelete = false;
    if (srcLastOp.isDelete()) {
      isSrcDelete = true;
    } else if (srcFirstOp.isUpdate()) {
      isSrcUpdate = true;
    } else {
      isSrcCreate = true;
    }


    List tgtOpList = (List)tgtDataMap.get(itID); 
    boolean isConflict = tgtOpList != null;
    boolean isTgtCreate = false;
    boolean isTgtUpdate = false;
    boolean isTgtDelete = false;
    if (isConflict) {
      StorableLogEntry tgtFirstOp = (StorableLogEntry)tgtOpList.get(0);
      StorableLogEntry tgtLastOp  = (StorableLogEntry)tgtOpList.get(tgtOpList.size() - 1);
      if (tgtLastOp.isDelete()) {
        isTgtDelete = true;
      } else if (tgtFirstOp.isUpdate()) {
        isTgtUpdate = true;
      } else {
        isTgtCreate = true;
      }  
    }
    %>
    <% String trClass = isConflict ? "listConflictRow" : (isSrcCreate ? "listCreateRow" : (isSrcUpdate ? "listUpdateRow" : "listDeleteRow")); %>
    <tr class="<%= trClass %>">
      <td class='hover'><%= itID %></td>
      <td class='hover'><%= typeName %></td>
      <td class='hover' align='center'><%= isSrcCreate ? "C" : (isSrcUpdate ? "U" : "D") %></td>
      <td class='hover' align='center'><%= !isConflict ? "" : (isTgtCreate ? "C" : (isTgtUpdate ? "U" : "D")) %></td>
    </tr>
    </jalios:foreach>
    </table>
    C: Create - U: Update - D: Delete
    <input type='hidden' name='files' value='/<%= JcmsConstants.STORE_XML %>' />
    <% } %>
  </div>
</div>
<br />
<input type='hidden' name='webappId' value='<%= formHandler.getWebAppInfo().getWebappId() %>'  />
<input type='hidden' name='deltaDir' value='<%= formHandler.getDeltaDir() %>'  />
<input type="submit" name="opApply" value='<%= glp("ui.adm.dm.u.s2.btn.upgrade", formHandler.getWebAppInfo()) %>' class='btn btn-default' />
<input type="submit" name="opAbort" value='<%= glp("ui.adm.dm.u.s2.btn.abort") %>' class='btn btn-default' />
</form>



<%-- *** STEP 3 - VALIDATE ************************************************************ --%>
<% } else if (formHandler.isValidateStep()) { %>
<h2 class="boTitle"><%= glp("ui.adm.dm.u.s3.title") %></h2>


<form action='admin/deploy/deployMgrUpgrade.jsp' method='get' name='editForm'>
  <table class="formBackground"> 
    <tr> 
      <td> 
        <table class='layout'>
            <tr> 
              <td colspan="2" class="formTitle"><%= glp("ui.adm.dm.u.s3.form") %></td>
            </tr>
          <tr> 
            <td class="formInfo"><%= glp("ui.adm.dm.u.s3.txt", formHandler.getWebAppInfo()) %></p></td>
          </tr>   
          <tr>
            <td>
	      <input type="submit" class="btn btn-primary" name="opCommit" value="<%= glp("ui.adm.dm.u.s3.commit") %>" />
	      <input type="submit" class="btn btn-default" name="opRollback" value="<%= glp("ui.adm.dm.u.s3.rollback") %>" />
	      <input type='hidden' name='webappId' value='<%= formHandler.getWebAppInfo().getWebappId() %>'  />
	      <input type='hidden' name='deltaDir' value='<%= formHandler.getDeltaDir() %>'  />
            </td>
          </tr>
        </table> 
      </td>
    </tr>
  </table>
</form>

<h2 class="boTitle"><%= glp("ui.adm.dm.u.s3.report") %></h2>

<% request.setAttribute("diffSet", formHandler.getUpgradeDiffSet()); %>
<% request.setAttribute("hiddeCheckboxColumn", Boolean.TRUE); %>
<%@ include file='/admin/deploy/doSignDiff.jspf' %>


<%-- *** STEP 4a - COMMIT ************************************************************ --%>
<% } else if (formHandler.isCommitStep()) { %>
<p class='t2'><%= glp("ui.adm.dm.u.s4a.title") %></p>

<%-- *** STEP 4b - ROLLBACK ************************************************************ --%>
<% } else if (formHandler.isRollbackStep()) { %>
<p class='t2'><%= glp("ui.adm.dm.u.s4b.title") %></p>

<%   if (Util.notEmpty(formHandler.getRollbackDiffSet())) {  %>
<p class='t2'><%= glp("ui.adm.dm.u.s4b.txt1") %></p>
<p><%= glp("ui.adm.dm.u.s4b.txt2") %></p>
<% request.setAttribute("diffSet", formHandler.getRollbackDiffSet()); %>
<%@ include file='/admin/deploy/doSignDiff.jspf' %>
<%   } else { %>
<p><%= glp("ui.adm.dm.u.s4b.txt3") %></p>
<%   } %>
<% } %>
<br />
<%@ include file='/admin/doAdminFooter.jspf' %>
