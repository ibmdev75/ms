<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcms.recommendation.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
} 

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.recommendation.RecommendationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% 
  RecommendationManager recoMgr = RecommendationManager.getInstance();
  
  Recommendation recoTrack = getDataParameter("recommendationId",Recommendation.class);
  
  String recommendationTab = getAlphaNumParameter("recommendationTab","formTab");
  boolean isRecommendationFormTab = Util.toBoolean(recommendationTab.equals("formTab"),false);
  boolean isSentRecommendationTab = Util.toBoolean(recommendationTab.equals("sentRecommendationTab"),false);
  boolean isReceivedRecommendationTab = Util.toBoolean(recommendationTab.equals("receivedRecommendationTab"),false);
  boolean isReaderTrackingTab = Util.toBoolean(recommendationTab.equals("readerTrackingTab"),false) && recoTrack != null;
  
  boolean displayRecommendationOn = false;
  boolean displayReaderTracking = false;
  boolean isMultiplePage = false;
  
  Data recommendedData = getDataParameter("recommendedDataId"); 
  
  if (recommendedData == null) {
    return;
  }
  
  int sentRecommendationCount = recoMgr.getSentRecommendationCount(recommendedData,loggedMember);
  int receivedRecommendationCount = recoMgr.getReceivedRecommendationCount(recommendedData,loggedMember);
  String modalUrl = "front/recommendation/recommendationModal.jsp"; 
  boolean displayPubLink = false;
  boolean displayPager = false;
  
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-recommendation.css");
  
  if (formHandler.validate()) { 
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal formHandler="<%= formHandler %>" title="ui.recommendation.modal.title" css="recommendation-modal modal-lg" url="front/recommendation/recommendationModal.jsp">
  <jalios:buffer name="MODAL_CONTENT">
		<% if (sentRecommendationCount > 0 || receivedRecommendationCount > 0){ %>    
		<ul class="nav nav-tabs nobr">
		  <li<%= isRecommendationFormTab ? " class=\"active\" " : "" %>>
      <a href="#recommendation-form" onclick="return false;"><%= glp("ui.recommendation") %></a></li>
		  <% if (sentRecommendationCount > 0){ %>
  		  <li<%= isSentRecommendationTab ? " class=\"active\" " : "" %>>
          <a href="#recommendation-sent" onclick="return false;"><%= glp("ui.recommendation.sent") %> <span class="badge badge-small"><%= sentRecommendationCount %></span></a>
        </li>
		  <% } %>
			<% if (receivedRecommendationCount > 0){ %>
  		  <li<%= isReceivedRecommendationTab ? " class=\"active\" " : "" %>>
          <a href="#recommendation-received" onclick="return false;"><%= glp("ui.recommendation.received") %> <span class="badge badge-small"><%= receivedRecommendationCount %></span></a>
        </li>
		  <% } %>
		  <% if (recoTrack != null) { %>
  		  <li<%= isReaderTrackingTab ? " class=\"active\" " : "" %>>
  	      <a href="#recommendation-tracking" onclick="return false;"><%= recoMgr.isDataTracked(recoTrack) ? glp("ui.recommendation.modal.lbl.reader-track-tab") : glp("ui.recommendation.modal.lbl.detail-tab") %></a>
  		  </li>               
		  <% } %>
		</ul>
		<% } %>		
		
		<div class="tab-content">
		  <div class="tab-pane fade in<%= isRecommendationFormTab ? " active" : "" %>" id="recommendation-form">
				 <div class="modal-body">
				     <%@ include file="/front/recommendation/recommendationForm.jspf" %>
		     </div>
				 <div class="modal-footer">
					<div class="buttons">
						<input type="hidden" name="recommendationTab" value="formTab"/>
						<a class="btn btn-default" data-dismiss="modal"><%=  glp("ui.com.btn.cancel") %></a>
						<input type="submit" class="ajax-refresh btn btn-primary" name="opSend" value="<%= glp("ui.com.btn.submit") %>"/>
						<% if (isReaderTrackingForm) { %>
						<input type="hidden" name="trackedPubId" value="<%= recommendedData.getId() %>" />
						<input type="hidden" name="readerTrackingTab" value="recommendTab" />
						<% } %>
						<% if (hasAlreadyRecommended) { %>
						<input type="submit" class="ajax-refresh btn btn-primary" name="opForceSend" value="<%= glp("ui.recommendation.modal.lbl.force-send") %>"/>
						<% } %>
						<input type="hidden" name="recommendedDataId" value="<%= recommendedData.getId() %>" />
				  </div>
		     </div>	
		  </div>
      <% if (sentRecommendationCount > 0) { %> 
  		  <div class="tab-pane fade in<%= isSentRecommendationTab ? " active" : "" %>" id="recommendation-sent">
          <%@ include file="/front/recommendation/recommendationSent.jspf" %>
  		  </div>
		  <% } %>
	    <% if (receivedRecommendationCount > 0) { %>
  		  <div class="tab-pane fade in<%= isReceivedRecommendationTab ? " active" : "" %>" id="recommendation-received">
  	      <%@ include file="/front/recommendation/recommendationReceived.jspf" %>      
  		  </div>
		  <% } %>
		  <% if (isReaderTrackingTab && recoTrack != null ) { %>
		  <div class="tab-pane fade in<%= isReaderTrackingTab ? " active" : "" %>" id="recommendation-tracking">
  			<% 
  		    boolean isLast = true; 
  		    Recommendation recommendation = recoTrack;
  		    displayReaderTracking = true;
  			%>    
        <%@ page import="com.jalios.jcms.tracking.*" %><% 
          
          int itRowCounter = 1; 
          
          List<ReaderTracker> readerTrackerSet = recoMgr.getRecommendationReaderTrackingMemberSet(recoTrack);
          Set<Member> readerMemberSet = new java.util.HashSet<Member>();
          for (ReaderTracker itReaderTracker : readerTrackerSet) {
            readerMemberSet.add(itReaderTracker.getAuthor());
          }
          
          Set<Member> unreadMemberSet = Util.subSet(recoTrack.getRecipientAndGroupMemberSet(),readerMemberSet);
          int readCount = Util.getSize(readerMemberSet);
          int unreadCount = Util.getSize(unreadMemberSet); 
          int memberCount = readCount + unreadCount;  
          
          Map trackingPagerMap = new HashMap();
          trackingPagerMap.put("recommendationTab","readerTrackingTab");
          trackingPagerMap.put("recommendationId",recoTrack.getId());
          
          jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
        %>
        <div class="recommendation-tracking">
          <div class="modal-body">
            <%@ include file="/front/recommendation/recommendation.jspf" %>
            
            <h3>
              <%= glp("ui.recommendation.modal.lbl.reader-tracking") %>
            </h3>
            
            <div class="content">
              <% if (readCount > 0) { %>        
                <% itRowCounter = 1; %>
                <div class="member-tracking br">
                  <div class="br">
                    <b><%= glp("ui.recommendation.modal.lbl.mbr.read") %> </b><span class="badge badge-small badge-success"><%= readCount > memberCount ? memberCount : readCount  %> / <%= memberCount %></span>
                  </div>
                  <jalios:pager name='readerTrackerPagerHandler' action='init' declare='true' pageSize='9' size='<%= readCount %>' parameterMap="<%= trackingPagerMap %>" />
                  <div class="row">
                  <jalios:foreach collection="<%= readerMemberSet %>" type="Member" name="itReaderTracker" max="<%= readerTrackerPagerHandler.getPageSize() %>" skip='<%= readerTrackerPagerHandler.getStart() %>'>
                    <jalios:buffer name="cardContent">
                      <div class="date"><%= glp("ui.recommendation.modal.lbl.read") %> <%= JcmsUtil.getFriendlyDate(itReaderTracker.getMdate(), DateFormat.SHORT, true, userLocale) %></div>
                    </jalios:buffer>
                    <%
                    Member itMember = itReaderTracker.getAuthor();
                    request.setAttribute("card-member-no-back-card", Boolean.TRUE);
                    request.setAttribute("card-member-content", cardContent.toString());
                    %>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                      <%@ include file="/front/card/member/doMemberCard.jspf" %>
                    </div>
                  </jalios:foreach>
                  <%
                  request.removeAttribute("card-member-no-back-card");
                  request.removeAttribute("card-member-content");
                  %>
                  </div>
                </div>          
                <jalios:pager name='readerTrackerPagerHandler' />
                <% if (unreadCount > 0) { %><hr/><% } %>
              <% } %>
              <% if(isAuthor && unreadCount > 0) { %>
                <% itRowCounter = 1; %>
                <div class="member-tracking br">
                  <div class="br">
                    <b><%= glp("ui.recommendation.modal.lbl.mbr.unread") %></b> <span class="badge badge-small badge-important"><%= unreadCount %> / <%= memberCount %></span>
                  </div>  
                  <jalios:pager name='unreadMemberPagerHandler' action='init' declare='true' size='<%= unreadCount %>' pageSize='9'/>
                  <div class="row">
                  <jalios:foreach collection="<%= unreadMemberSet %>" type="Member" name="itMember" max="<%= unreadMemberPagerHandler.getPageSize() %>" skip='<%= unreadMemberPagerHandler.getStart() %>'>
                    <jalios:buffer name="cardContent">
                      <% if (!itMember.canRead((Publication) recoTrack.getData(),true)){ %><div class="mbr-card-name"><%= glp("ui.recommendation.modal.lbl.cannot-read") %></div><% } %>
                    </jalios:buffer>
                    <%
                    request.setAttribute("card-member-no-back-card", Boolean.TRUE);
                    request.setAttribute("card-member-content", Util.getString(cardContent.toString(), ""));
                    %>
                    <div class="col-md-4 col-sm-6 col-xs-12">
                      <%@ include file="/front/card/member/doMemberCard.jspf" %>
                    </div>
                  </jalios:foreach>
                  <%
                  request.removeAttribute("card-member-no-back-card");
                  request.removeAttribute("card-member-content");
                  %>
                  </div>
                </div>          
                <jalios:pager name='unreadMemberPagerHandler' />
              </div>
              <% } %>    
            </div><!-- EOF .content -->
          </div>
          <div class="modal-footer">
            <div class="buttons">
              <a class="btn btn-primary" data-dismiss="modal"><%=  glp("ui.com.btn.close") %></a>
            </div> 
          </div>                  
          
        </div><!-- EOF .recommendation-tracking -->
			</div>     
		  <% } %>
		  
		</div><%-- EOF .tab-content --%>
	</jalios:buffer>
</jalios:modal>