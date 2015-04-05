<%-- 
  @Summary: Portlet Notification
  @Category: FO
  @Author: Olivier Jaquemet
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%
PortletNotification box = (PortletNotification) portlet; 

if (!isLogged) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}
int[]   periods = NotificationManager.getAvailablePeriods();
TreeSet  pubSet = new TreeSet(Data.getMdateComparator());

// For each available periods
for (int i = 0; i < periods.length; i++) {
  // retrieve publications set
  NotificationQuery nq = new NotificationQuery(periods[i]);
  Set<Publication> mbrNotifiedPubSet = nq.getMemberPublicationSet(loggedMember);
  // and add publications to the TreeSet
  if (Util.notEmpty(mbrNotifiedPubSet)) {
    pubSet.addAll(mbrNotifiedPubSet);
  }
}
if (Util.isEmpty(pubSet)) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}

boolean showFileSize = !channel.getBooleanProperty("accessibility.feature.fileinformation.enabled", false);

%>
<jalios:pager name='pager' declare='true' action='init'
              size='<%= Util.getSize(pubSet) %>'
              paramPrefix='<%= PortalManager.PORTAL_ACTION+"_"+box.getId()+"_" %>'
              pageSize='<%= box.getMaxResults() %>'/>
<div class="portletnotification">
  <jalios:if predicate='<%= Util.notEmpty(pubSet) %>'>
    <ul class="item-box" style="padding-left: 15px; margin: 3px 0;">
    <jalios:foreach name='itPub' 
                    type='Publication' 
                    collection='<%= pubSet %>' 
                    max='<%= pager.getPageSize() %>'
                    skip='<%= pager.getStart() %>'>
      <li style="margin: 2px 0; padding: 0;">
        <jalios:edit pub='<%= itPub %>' popup='<%= true %>' />
        <% if (itPub instanceof FileDocument) { %><jalios:link data='<%= itPub %>' params="details=true"><jalios:fileicon doc='<%= (FileDocument)itPub %>'/></jalios:link><% } %>
        <jalios:link data='<%= itPub %>'/>
        <% if (showFileSize && itPub instanceof FileDocument) { %>(<jalios:filesize doc='<%= (FileDocument)itPub %>' />)<% } %>
      </li>
    </jalios:foreach>
    </ul>
  </jalios:if>
  <jalios:pager name="pager" template="pqf" />
</div>