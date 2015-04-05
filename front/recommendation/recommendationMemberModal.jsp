<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcms.recommendation.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
} 

RecommendationManager recoMgr = RecommendationManager.getInstance();

Recommendation recoTrack = getDataParameter("recommendationId",Recommendation.class);

boolean displayRecommendationOn = true;
boolean displayReaderTracking = false;

int sentRecommendationCount = recoMgr.getSentRecommendationCount(loggedMember);
int receivedRecommendationCount = recoMgr.getReceivedRecommendationCount(loggedMember);

String recommendationTab = getAlphaNumParameter("recommendationTab",sentRecommendationCount > 0 ? "sentRecommendationTab" : "receivedRecommendationTab");
boolean isSentRecommendationTab = Util.toBoolean(recommendationTab.equals("sentRecommendationTab"),false);
boolean isReceivedRecommendationTab = Util.toBoolean(recommendationTab.equals("receivedRecommendationTab"),false);
boolean isReaderTrackingTab = Util.toBoolean(recommendationTab.equals("readerTrackingTab"),false) && recoTrack != null;    

boolean displayPubLink = true;
boolean displayPager = false;

jcmsContext.addCSSHeader("css/jalios/ux/jalios-recommendation.css");

String modalUrl = "front/recommendation/recommendationMemberModal.jsp"; 

request.setAttribute("jcms.recommendation.modal-type","member");
%>
<jalios:modal css="modal-lg recommendation-modal" url="front/recommendation/recommendationMemberModal.jsp" title="ui.recommendation.modal.title-all">
	
	<% if (sentRecommendationCount > 0 || receivedRecommendationCount > 0) { %>
	<ul class="nav nav-tabs">
		<% if (sentRecommendationCount > 0){ %>
		<li class="sort <%= isSentRecommendationTab ? "active" : "" %>">
			<a href="<%= modalUrl %>?recommendationTab=sentRecommendationTab" onclick="return false;" class="ajax-refresh"><%= glp("ui.recommendation.sent") %></a>
		</li>
		<% } %>
		<% if (receivedRecommendationCount > 0){ %>
		<li class="sort <%= isReceivedRecommendationTab ? "active" : "" %>">
			<a href="<%= modalUrl %>?recommendationTab=receivedRecommendationTab" onclick="return false;" class="ajax-refresh"><%= glp("ui.recommendation.received") %></a>
		</li>        
		<% } %>   
		<% if (isReaderTrackingTab && recoTrack != null) { %>
		<li class="sort <%= isReaderTrackingTab ? "active" : "" %>">
			<a href="<%= modalUrl %>?recommendationTab=readerTrackingTab&amp;recommendationId=<%= recoTrack.getId() %>" onclick="return false;" class="ajax-refresh"><%= recoMgr.isDataTracked(recoTrack) ? glp("ui.recommendation.modal.lbl.reader-track-tab") : glp("ui.recommendation.modal.lbl.detail-tab") %></a>
		</li>               
		<% } %>
	</ul>
	<% } %>
	
	<% if (sentRecommendationCount == 0 && receivedRecommendationCount == 0) { %>
    <jalios:message msg="ui.recommendation.modal.lbl.empty" title="" /> 
  <% } else if (isSentRecommendationTab) { %>		
		<% List<Recommendation> sentRecommendationList = recoMgr.getSentRecommendationList(loggedMember); %>  
		<jalios:pager name='sentRecommendationPagerHandler' action='init' declare='true' size='<%= Util.getSize(sentRecommendationList) %>' pageSize='2'/>
    <jalios:foreach collection="<%= sentRecommendationList %>" type="Recommendation" name="itRecommendation" max='<%= sentRecommendationPagerHandler.getPageSize() %>' skip='<%= sentRecommendationPagerHandler.getStart() %>'>
			<% 
		    boolean isLast = sentRecommendationPagerHandler.getItemsNbr() == itCounter || sentRecommendationPagerHandler.getPageSize() + sentRecommendationPagerHandler.getStart() == itCounter; 
		    Recommendation recommendation = itRecommendation;
		    displayPager = sentRecommendationPagerHandler.getItemsNbr() > 1;
	    %>
	    <%@ include file="/front/recommendation/recommendation.jspf" %>
    </jalios:foreach>
    <jalios:pager name='sentRecommendationPagerHandler' linkCss="br"  />   	
  <% } else if(isReceivedRecommendationTab){ %>
		<% Set<Recommendation> receivedRecommendationList = recoMgr.getReceivedRecommendationSet(loggedMember); %>
	  <% if (Util.isEmpty(receivedRecommendationList)) { %>
      <jalios:message msg="ui.recommendation.modal.lbl.empty" title="" />
    <% } else { %>
	    <jalios:pager name='receivedRecommendationPagerHandler' action='init' declare='true' size='<%= Util.getSize(receivedRecommendationList) %>' pageSize='2'/>
			<jalios:foreach collection="<%= receivedRecommendationList %>" type="Recommendation" name="itRecommendation" max='<%= receivedRecommendationPagerHandler.getPageSize() %>' skip='<%= receivedRecommendationPagerHandler.getStart() %>'>
		    <% 
			    boolean isLast = receivedRecommendationPagerHandler.getItemsNbr() == itCounter || receivedRecommendationPagerHandler.getPageSize() + receivedRecommendationPagerHandler.getStart() == itCounter;
			    Recommendation recommendation = itRecommendation;
	        displayPager = receivedRecommendationPagerHandler.getItemsNbr() > 1;
		    %>
		    <%@ include file="/front/recommendation/recommendation.jspf" %>
	    </jalios:foreach>
	    <jalios:pager name='receivedRecommendationPagerHandler' linkCss="br" />
    <% } %>  
    
	<% } else if(isReaderTrackingTab && recoTrack != null){ %>
	<% 
    boolean isLast = true; 
    Recommendation recommendation = recoTrack;
    displayReaderTracking = true;
	%>
	<%@ include file="/front/recommendation/recommendationTracking.jspf" %>
<% } %>
</jalios:modal>
