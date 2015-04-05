<%--
  @Summary: Display the work report
  @Category: Work Area / Workflow
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.WorkReportHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="loggedMember" value="<%= loggedMember %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  request.setAttribute("title", glp("ui.work.mn.wf.wr"));
  request.setAttribute("workReportWAMenu", "true");
  
%><%@ include file='/work/doWorkHeader.jspf' %>

<h1><%= glp("ui.work.mn.wf.wr") %></h1>
<%@ include file='/jcore/doMessageBox.jspf' %><%

  Workspace theWorkspace = formHandler.getSelectedWorkspace();
  boolean workspaceFilter = formHandler.isWorkspaceFilter();
  Workflow wf = formHandler.getWorkflow();
  String wfId = formHandler.getWfId();
  Class classFilter = formHandler.getClassFilter();
  Map[] mapArray = formHandler.getPubMap();
  Map wfStateMap = mapArray[0];
  Map wfRoleMap = mapArray[1];
  Set wsTypeSet = formHandler.getWorkspaceTypeSet();
  boolean isStateView = formHandler.isStateView();
%>

		<div class="navbar navbar-default">  
      <div class="container-fluid">
		    <form name='refineForm' id="workflow-navbar" class="navbar-form navbar-left">
          <%-- *** WF SELECTION ******************************************** --%>
    	    <select class='form-control' name='wfId' onchange='javascript:document.refineForm.submit();'>
    	      <option value=''><%/*%>All Workflow<%*/%><%= glp("ui.wrkspc-edit.allwf") %></option>
    	      <option value=''>----------</option>
    	      <jalios:foreach collection='<%= workspace.getWorkflowSet() %>' type='Workflow' name='itWorkflow'>
    	      <% if (itWorkflow != WorkflowManager.DEFAULT_WORKFLOW && !itWorkflow.getId().equals("filedocument")) { %>
    	      <option value='<%= itWorkflow.getId() %>' <%= itWorkflow.getId().equals(wfId) ? "selected" : "" %>  ><%= itWorkflow.getLabel(userLang) %></option>
    	      <% } %>
    	      </jalios:foreach>
    	    </select>
    		
    		
    			<%-- *** TYPE SELECTION ******************************************** --%>
    	    <select class='form-control' name='classname' onchange='javascript:refineForm.submit()'>
    	      <option value=''><%= glp("ui.work.pub.lbl.all-type") %></option>
    	      <option value=''>--------------------</option>
    	      <option value='com.jalios.jcms.Content' <%= Content.class == classFilter ? "selected" : "" %>><%= glp("ui.work.wr.types.content") %></option>
    	      <jalios:foreach collection="<%= JcmsUtil.getSortedClass(channel.getSubTypeList(Content.class), workspace, userLang) %>" name="itClass" type="Class">	
    	      <% if (wsTypeSet == null || (wsTypeSet.contains(itClass) && (wf == null || wf == workspace.getWorkflow(itClass, false))) && !UserContent.class.isAssignableFrom(itClass)) { %>
    	      <option value='<%= itClass.getName() %>' <%= itClass == classFilter ? "selected" : "" %>>&nbsp;&nbsp;&nbsp;- <%= channel.getTypeLabel(itClass,workspace, userLang) %></option>		
    	      <% } %>
    	      </jalios:foreach>
    	      <option value=''>--------------------</option>
    	      <option value='com.jalios.jcms.UserContent' <%= Form.class == classFilter ? "selected" : "" %>><%= glp("ui.work.wr.types.ugc") %></option>
    	      <jalios:foreach collection="<%= JcmsUtil.getSortedClass(channel.getSubTypeList(UserContent.class), workspace, userLang) %>" name="itClass" type="Class"> 
    	      <% if (wsTypeSet == null || (wsTypeSet.contains(itClass) && (wf == null || wf == workspace.getWorkflow(itClass, false)))) { %>
    	      <option value='<%= itClass.getName() %>' <%= itClass == classFilter ? "selected" : "" %>>&nbsp;&nbsp;&nbsp;- <%= channel.getTypeLabel(itClass,workspace, userLang) %></option>    
    	      <% } %>
    	      </jalios:foreach>
    	      <option value=''>--------------------</option>
    	      <option value='com.jalios.jcms.Form' <%= Form.class == classFilter ? "selected" : "" %>><%= glp("ui.work.wr.types.form") %></option>
    	      <jalios:foreach collection="<%= JcmsUtil.getSortedClass(channel.getSubTypeList(Form.class), workspace, userLang) %>" name="itClass" type="Class">	
    	      <% if (wsTypeSet == null || (wsTypeSet.contains(itClass) && (wf == null || wf == workspace.getWorkflow(itClass, false)))) { %>
    	      <option value='<%= itClass.getName() %>' <%= itClass == classFilter ? "selected" : "" %>>&nbsp;&nbsp;&nbsp;- <%= channel.getTypeLabel(itClass,workspace, userLang) %></option>		
    	      <% } %>
    	      </jalios:foreach>
    	    </select>			 
    	    <%-- *** VIEW SELECTION ******************************************** --%>
    	    <select class='form-control' name='stateView' onchange='javascript:refineForm.submit()'>
    	      <option value='false' <%= isStateView ? "" : "selected" %>><%= glp("ui.work.wr.role-view") %></option>
    	      <option value='true' <%= !isStateView ? "" : "selected" %>><%= glp("ui.work.wr.state-view") %></option>
    	    </select>		
			    <input type='hidden' name='workspaceFilter' value='<%= workspaceFilter %>' />
			</form>			
		</div>
		</div>



<%-- *** STATE VIEW *********************************************** --%>
<% if (isStateView) { %>
<% int counter = 1; %>
<jalios:foreach collection='<%= wfStateMap.entrySet() %>' type='Map.Entry' name='itEntry'>
<% 
  Workflow itWF = (Workflow)itEntry.getKey();
  Map subMap = (Map)itEntry.getValue(); 
%>
  <jalios:foreach collection='<%= subMap.entrySet() %>' type='Map.Entry' name='itSubEntry' counter='itCounter2'>
<% 
  WFState itState = (WFState)itSubEntry.getKey();
  String paramPrefix = Util.buildID(itState.getLabel(userLang));
%>
<jalios:pager name='plPagerHandler' declare='true' action='init'
              sort='mdate' paramPrefix="<%= paramPrefix %>" pageSize="<%= 3 %>"/>
<%
  Comparator<? super Publication>   comparator = ComparatorManager.getComparator(Publication.class, plPagerHandler.getSort(), plPagerHandler.isReverse());
  Set pubSet = channel.select((Set)itSubEntry.getValue(), null, comparator);;
%>
<h3>
  <jalios:icon src='wf'  />
  <%= wf == null ? itWF.getLabel(userLang) + " / " : "" %>
  <%= itState.getLabelHtml(userLang) %> 
  (<%= Util.join(itState.getRoleSet(), ", ") %>
  <% if (itState.hasReminder()) { %>
  -
  <% String reminder = DateUtil.formatDuration(itState.getReminder() * JcmsConstants.MILLIS_IN_ONE_MINUTE, userLocale); %>
	<jalios:icon src='bell'  title='<%= glp("ui.adm.wf-edit.st.alt.reminder", reminder) %>' />
  <% } %>
	<% if (itState.isExpress()) { %>
  -
	  <% String wfeDuration = DateUtil.formatDuration(itState.getDuration() * JcmsConstants.MILLIS_IN_ONE_MINUTE, userLocale); %>
	  <% String wfeTarget = itWF.getStateLabel(itState.getTargetPstatus(), userLang); %>
	  <jalios:icon src='timer'  title='<%= glp("ui.adm.wf-edit.st.alt.wfe", wfeDuration, wfeTarget) %>' />
	<% } %>
  ) 
  - <%= glp("ui.com.lbl.n-pub", pubSet.size()) %>
</h3>
<% 
  request.setAttribute("plPubSet",             pubSet); 
  request.setAttribute("plShowEditIcon",       Boolean.FALSE); 
  request.setAttribute("plShowValidateIcon",   Boolean.TRUE); 
  request.setAttribute("plShowState",          Boolean.FALSE); 
  request.setAttribute("plShowRole",           Boolean.TRUE); 
  request.setAttribute("plShowReminderStatus", Boolean.TRUE); 
  request.setAttribute("plShowReminderIcon",   Boolean.TRUE); 
  request.setAttribute("plShowWorkspace",      Boolean.valueOf(!workspaceFilter));
 
%>
<jsp:include page='/work/doPubList.jsp'/>

  </jalios:foreach>
</jalios:foreach>

<%-- *** ROLE VIEW *********************************************** --%>
<% } else { %>
<% int counter = 1; %>
<jalios:foreach collection='<%= wfRoleMap.entrySet() %>' type='Map.Entry' name='itEntry'>
<% 
  Workflow itWF = (Workflow)itEntry.getKey();
  Map subMap = (Map)itEntry.getValue(); 
%>
  <jalios:foreach collection='<%= subMap.entrySet() %>' type='Map.Entry' name='itSubEntry' counter='itCounter2'>
<% 
  WFRole itRole = (WFRole)itSubEntry.getKey();
  String paramPrefix = itRole.getId();
%>
<jalios:pager name='plPagerHandler' declare='true' action='init'
              sort='mdate' paramPrefix="<%= paramPrefix %>" pageSize="<%= 3 %>"/>
<%
  Comparator<? super Publication>   comparator = ComparatorManager.getComparator(Publication.class, plPagerHandler.getSort(), plPagerHandler.isReverse());
  Set pubSet = channel.select((Set)itSubEntry.getValue(), null, comparator);;
%>
<h3>
  <jalios:icon src='role'  />
  <%= wf == null ? itWF.getLabel(userLang) + " / " : "" %>
  <%= itRole.getName(userLang) %> 
  - <%= glp("ui.com.lbl.n-pub", pubSet.size()) %>
</h3>
<% 
  request.setAttribute("plPubSet",             pubSet); 
  request.setAttribute("plShowEditIcon",       Boolean.FALSE); 
  request.setAttribute("plShowValidateIcon",   Boolean.TRUE); 
  request.setAttribute("plShowState",          Boolean.TRUE); 
  request.setAttribute("plShowRole",           Boolean.TRUE); 
  request.setAttribute("plShowReminderStatus", Boolean.TRUE); 
  request.setAttribute("plShowReminderIcon",   Boolean.TRUE); 
  request.setAttribute("plShowWorkspace",      Boolean.valueOf(!workspaceFilter));
 
%>
<jsp:include page='/work/doPubList.jsp'/>

  </jalios:foreach>
</jalios:foreach>
<% } %>

<%-- ** WORKFLOW RENDERING ******************************* --%>
<% if (wf != null) { 
  String xmlFileURL = ServletUtil.encodeURL("work/workflow.jsp");
  String xmlWFId    = wf.getId();
  String xmlWFLabel = wf.getLabel(userLang);
%>
<%@ include file='/admin/doWFFlash.jspf' %>
<% } %>

<%@ include file='/work/doWorkFooter.jspf' %> 