<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletMyLocks display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% 

PortletMyLocks box = (PortletMyLocks)portlet;
Set<Content> lockSet = StrongLockManager.getInstance().getLockedDataSet(Content.class, loggedMember);

DataSelector selector = null;
if (box.getRefineWorkspace()) {
  selector = Publication.getWorkspaceSelector(workspace);
}
lockSet = JcmsUtil.select(lockSet, selector, new ReverseComparator(Publication.getMdateComparator()));

%>

<div class="my-locks">
  <% if (Util.isEmpty(lockSet)) { %>
  <%= glp("ui.adm.data-report.doc.no-lock") %>
  <% } else { %>
  <jalios:pager name='pagerHandler' 
                  declare='true' 
                  action='init' 
                  pageSize='10' 
                  paramPrefix='<%= PortalManager.PORTAL_ACTION+"_"+box.getId()+"_" %>'
                  size='<%= lockSet.size() %>'/>
  
  <ul class="item-box">
  <jalios:foreach collection="<%= lockSet %>" 
                  type="Publication" 
                  name="itPub"
                  max="<%= pagerHandler.getPageSize() %>"
                  skip="<%= pagerHandler.getStart() %>"
                  >
    <li class="item">
    <div class="item-icons">
      <jalios:edit data="<%= itPub %>" />
    </div>
    <jalios:lock data="<%= itPub %>"/>
    <jalios:dataicon data="<%= itPub %>" />
    <jalios:link data="<%= itPub %>" />
    </li>
  </jalios:foreach>
  </ul>
  <jalios:pager name='pagerHandler' template='pqf' />
  <% } %>
</div>
