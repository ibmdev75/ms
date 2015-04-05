<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcms.tracking.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import="com.jalios.jcms.recommendation.*" %><%--
--%><%
	ReaderTrackerManager readerMgr = ReaderTrackerManager.getInstance();
  RecommendationManager recoMgr = RecommendationManager.getInstance();

	Publication trackedPub = getPublicationParameter("trackedPubId");
  boolean isPubTracked = readerMgr.isTracked(trackedPub);
  String modalUrl = "front/readerTracking/readerTrackingModal.jsp"; 
   
  if (!readerMgr.canAccessReaderTracker(trackedPub,loggedMember)) {
	  sendForbidden(request, response);
	  return;
  }
   
  boolean readerTrackerAnonymized = readerMgr.isReaderTrackerAnonymized();
	boolean canDelete = readerMgr.canDeleteReaderTracker(trackedPub,loggedMember);
	boolean hasPerformDelete = false;
	boolean isDownloadTracked = trackedPub instanceof FileDocument;
  boolean canBeRecommendBy = recoMgr.canBeRecommendedBy(trackedPub,loggedMember);
  
  if (hasParameter("opDeleteTracking") && canDelete) {
    trackedPub.removeAllReaderTracker(loggedMember);
    hasPerformDelete = true;
    setInfoMsg(glp("ui.work.rdr.no-tracking-deleted"),request);
	  HibernateUtil.commitTransaction();
	  HibernateUtil.beginTransaction();
  }
	
	//Inner tabs
	String readerTrackingTab = getAlphaNumParameter("readerTrackingTab","readerTab");
	boolean isReaderTab = Util.toBoolean(readerTrackingTab.equals("readerTab"),false);
	boolean isDownloadTab = isDownloadTracked && Util.toBoolean(readerTrackingTab.equals("downloadTab"),false);
  boolean isRecommendTab = canBeRecommendBy && (Util.toBoolean(readerTrackingTab.equals("recommendTab"),false) || Util.toBoolean(getAlphaNumParameter("recommendationTab","readerTab").equals("formTab"),false));
	if (Util.toBoolean(readerTrackingTab.equals("recommendTab"),false) && !canBeRecommendBy) {
	   isReaderTab = true;
	}
	
	int readerCount = isPubTracked && !hasParameter("opDeleteTracking") ? readerMgr.getReaderCount(trackedPub) : 0;
  int downloadCount = isDownloadTracked && isPubTracked && !hasParameter("opDeleteTracking") ? readerMgr.getDownloadCount(trackedPub) : 0;
  
  if (readerCount < 1 && downloadCount > 0) {
    isReaderTab = false;
    isDownloadTab = true;
  }
  
  int accessType = isReaderTab ? ReaderTracker.ACCESS_TYPE_READER : ReaderTracker.ACCESS_TYPE_DOWNLOAD;
  
  boolean displayInnerTabs = (!readerTrackerAnonymized && isPubTracked && (readerCount > 0 && downloadCount > 0)) || (isRecommendTab);

  //Recommendation
	Set<Member> recipientSet = new HashSet<Member>();
	if (isRecommendTab) {
	    accessType = getIntParameter("accessType",0);
	    List<ReaderTracker> recommendationMemberList = readerMgr.getReaderTrackerList(trackedPub,accessType); 
	    for (ReaderTracker itReaderTracker : recommendationMemberList) {
	        recipientSet.add(itReaderTracker.getAuthor());
	    }
	    request.setAttribute("jcms.readertracking.recommendation",true);
	}
	
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.recommendation.RecommendationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='members' value='<%= Util.isEmpty(recipientSet) || hasParameter("opSend") || hasParameter("opForceSend") ? getStringParameterValues("members", HttpUtil.DATAID_REGEX) : JcmsUtil.dataCollectionToIdList(recipientSet).toArray(new String[0]) %>' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean> 
<% 
	com.jalios.jcms.recommendation.RecommendationHandler modalHandler = isRecommendTab ? formHandler : null;

if (isRecommendTab && formHandler.validate()) { %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal css="modal-lg readerTracking-modal" title="ui.work.rdr.title1" url="<%= modalUrl %>" formHandler="<%= modalHandler %>">
	<% if (displayInnerTabs) { %>
	<ul class="nav nav-tabs">
		<% if (readerCount > 0) { %>
		<li class="sort<%= isReaderTab ? " active" : "" %>" >
		    <a href="<%= modalUrl %>?readerTrackingTab=readerTab&amp;trackedPubId=<%= trackedPub.getId() %>" onclick="return false;" class="ajax-refresh"><%= glp("ui.work.rdr.tab.reader") %> <span class="badge badge-small"><%= readerCount %></span></a>
		</li>  
		<% } %>
		<% if (isDownloadTracked && downloadCount > 0) { %>
		<li class="sort<%= isDownloadTab ? " active" : "" %>">
		    <a href="<%= modalUrl %>?readerTrackingTab=downloadTab&amp;trackedPubId=<%= trackedPub.getId() %>" onclick="return false;" class="ajax-refresh"><%= glp("ui.work.rdr.tab.download") %> <span class="badge badge-small"><%= downloadCount %></span></a>
		</li>
		<% } %>
		<% if (isRecommendTab) { %>
		<li class="sort<%= isRecommendTab ? " active" : "" %>">
		    <a href="<%= modalUrl %>?readerTrackingTab=recommendTab&amp;trackedPubId=<%= trackedPub.getId() %>&amp;accessType=<%= accessType %>" onclick="return false;" class="ajax-refresh"><%= glp("ui.recommendation") %></a>
		</li>
		<% } %>	        
	</ul>
	<% } %> 
		 
  <% if (isRecommendTab) { %>
    <% Publication recommendedData = trackedPub; %>
	    <%@ include file="/front/recommendation/recommendationForm.jspf" %>	
	<% } else { %>
      <% if (readerTrackerAnonymized   && (readerCount > 0 || downloadCount > 0)) { %>
		    <%@ include file="/front/readerTracking/readerTrackingAnonymous.jspf" %>
      <% } else if (isPubTracked && (readerCount > 0 || downloadCount > 0)) { %>
		    <%@ include file="/front/readerTracking/readerTracking.jspf" %>
      <% } else if (readerCount < 1 && downloadCount < 1){ %>
        <%= glp("ui.work.rdr.no-tracking-yet") %>
	    <% } else { %>
	      <%= glp("ui.work.rdr.no-tracking-enabled") %> <jalios:edit data="<%= trackedPub %>" />
	    <% } %>
	<% } %>
	
	  <jalios:buffer name="MODAL_BUTTONS"> 
	  <% if (isRecommendTab) { %>
					<input type="hidden" name="recommendationTab" value="formTab"/>
					<a class="btn btn-default" data-dismiss="modal"><%=  glp("ui.com.btn.cancel") %></a>
					<input type="submit" class="ajax-refresh btn btn-primary" name="opSend" value="<%= glp("ui.com.btn.submit") %>"/>
					<input type="hidden" name="readerTrackingTab" value="recommendTab" />
					<input type="hidden" name="recommendedDataId" value="<%= trackedPub.getId() %>" />
					<input type="hidden" name="trackedPubId" value="<%= trackedPub.getId() %>" />
	  <% } else { %>
	  <div class="button"> 
	    <% if (canDelete && (readerCount > 0 || downloadCount > 0)) { %>
		    <a class='btn btn-default ajax-refresh confirm' href="<%= modalUrl %>?opDeleteTracking=true&amp;trackedPubId=<%= trackedPub.getId() %>">
		    <jalios:icon src="trash-empty" alt='<%= glp("ui.work.rdr.btn.delete") %>' /> <%= glp("ui.work.rdr.btn.delete") %>
		    </a>
	    <% } %>  	    
	    <% if ((readerCount > 0 || downloadCount > 0) && !readerTrackerAnonymized) { %>
		    <a class='btn btn-default' title="<%= glp("ui.work.rdr.csv.btn.title") %>" href="front/readerTracking/readerTrackingExportCsv.jsp?trackedPubId=<%= trackedPub.getId() %>">
		      <jalios:icon src="csv" alt='<%= glp("ui.work.rdr.csv")%>' /> <%= glp("ui.work.rdr.csv")%>
		    </a>
	    <% } %>
	    <% if (!readerTrackerAnonymized && canBeRecommendBy && ((isReaderTab && readerCount > 0) || (isDownloadTab && downloadCount > 0))) { %>
		    <a class='btn btn-default ajax-refresh' title="<%= isReaderTab ? glp("ui.work.rdr.recommend.reader.btn.title") : glp("ui.work.rdr.recommend.download.btn.title")%>" href="<%= modalUrl %>?trackedPubId=<%= trackedPub.getId() %>&amp;recommendedDataId=<%= trackedPub.getId() %>&amp;readerTrackingTab=recommendTab&amp;trackedPubId=<%= trackedPub.getId() %>&amp;accessType=<%= accessType %>">
		      <jalios:icon src="recommendation"  /> <%= glp("ui.recommendation") %>
		    </a>
	    <% } %>
	   <input type="button" class="btn btn-primary" name="opCancel" onclick="return JCMS.window.Modal.close(false)" value="<%=  glp("ui.com.btn.close") %>"/>
	  </div>  
	  <% } %>
	  
	  </jalios:buffer>
	  
</jalios:modal>
