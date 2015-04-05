<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import="com.jalios.io.IOUtil,com.jalios.jcms.fileprocessor.*,com.jalios.jcms.fileprocessor.repository.*,com.jalios.jcms.fileprocessor.processingmanagement.*,com.jalios.jcms.fileprocessor.ui.*" %><%--
--%><%

Publication pub = getPublicationParameter("id");
if (pub == null || !pub.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}

Set<Data> referrerSet = JcmsUtil.select(pub.getReferrerSet(), Publication.getAuthorizedSelector(loggedMember), Publication.getTitleComparator(userLang));;
Set weakReferrerSet =  JcmsUtil.select(pub.getWeakReferrerSet(), Publication.getAuthorizedSelector(loggedMember), Publication.getTitleComparator(userLang));;

boolean showFileProcessor = pub instanceof FileDocument;
%>


<jalios:modal title="ui.com.lbl.infos" 
              url="work/pubMetadata.jsp" 
              css="modal-lg pub-metadata data-inspector">


<!-- Nav tabs -->
<ul class="nav nav-pills" role="tablist">
  <li class="active"><a href="#general" role="tab" data-toggle="tab"><%= glp("ui.com.tab.general") %></a></li>
  <% if (Util.notEmpty(referrerSet)) { %>
  <li><a href="#link" role="tab" data-toggle="tab"><%= glp("ui.work.form.lbl.link-ref") %></a></li>
  <% } %>
  <% if (Util.notEmpty(weakReferrerSet)) { %>
  <li><a href="#weak" role="tab" data-toggle="tab"><%= glp("ui.work.form.lbl.weak-ref") %></a></li>
  <% } %>
  <li><a href="#advanced" role="tab" data-toggle="tab"><%= glp("ui.work.form.tab.adv") %></a></li>
  <% if (showFileProcessor) { %>
  <li><a href="#fileprocessor" role="tab" data-toggle="tab"><%= glp("fileprocessor.ctxmenu.section") %></a></li>
  <% } %>
  
</ul>

<!-- Tab panes -->
<div class="tab-content">
   <%@ include file='/work/pubMetadata_general.jspf' %>
   <%@ include file='/work/pubMetadata_linkReferrer.jspf' %>
   <%@ include file='/work/pubMetadata_weakReferrer.jspf' %>
   <%@ include file='/work/pubMetadata_advanced.jspf' %>
   <%@ include file='/work/pubMetadata_fileprocessor.jspf' %>
</div>


</jalios:modal>

<%--
  Not Yet Displayed 

  protected String[] templates = null;
  protected Publication mainInstance;
  protected TreeSet<String> friendlyURLSet;
  protected HashMap<String, TreeSet<Member>> roleMap;
  protected String workflowId = null;

  transient protected AlarmEntry wfExpressAlarmEntry;
  transient protected AlarmEntry wfReminderAlarmEntry;

  // Hibernate collections mapping fields
  protected transient int voteScore = 0;
  protected transient int voteCount = 0;  
 --%>

