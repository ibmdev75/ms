<%@ include file='/jcore/doInitPage.jspf' %>
<% 
	Interview interview = (Interview)request.getAttribute("publication"); 
%>
<div class="fulldisplay interview">
  <%@ include file='/front/publication/doPublicationHeader.jspf' %>  
  
  <div class="interview-body row">
	  <div class="col-md-10">
      <div class="interview-intro intro">
	      <jalios:wiki data="<%= interview %>" field="intro"><%= interview.getIntro(userLang) != null ? interview.getIntro(userLang) : "" %></jalios:wiki>
      </div>		
        
		  <div class="interview-summary summary">
		  <jalios:wiki data="<%= interview %>" field="summary">
		  <%= interview.getSummary(userLang) %>
		  </jalios:wiki>
		  </div>
		  
		  <div class="interview-questions">
		  <% int answerSize =  interview.getAnswers(userLang) != null ? interview.getAnswers(userLang).length : 0 ;  %>
		  <jalios:foreach name="question" type="java.lang.String" array="<%=interview.getQuestions(userLang)%>" >
		    <jalios:wiki css="interview-question">
	      <% if (Util.notEmpty(interview.getQuestionPrefix())){ %><b class="question-prefix"><%= interview.getQuestionPrefix() %></b><% } %>
		    <%= question %></jalios:wiki>
		    
		  <jalios:if predicate="<%= itCounter.intValue() <= answerSize %>">
		    <jalios:wiki css="interview-answer">
	        <% if (Util.notEmpty(interview.getAnswerPrefix())){ %><b class="answer-prefix"><%= interview.getAnswerPrefix() %></b><% } %>
	        <%= interview.getAnswers(userLang)[itCounter.intValue() -1] %>
		    </jalios:wiki>
		  </jalios:if>
		  </jalios:foreach>		  
		  </div><%-- EOF .interview-questions  --%>
	  </div><%-- EOF .col-md-10 --%>
	  
	  <div class="col-md-2">
		  <jalios:if predicate="<%= Util.notEmpty(interview.getBio(userLang))%>">
		  <div class="interview-bio well well-small">
		    <div class="interview-bio-header">
		      <h3>Bio Express</h3>
		    </div>
		    <div class="interview-bio-body">
          <jalios:if predicate="<%= Util.notEmpty(interview.getPhoto()) %>">
	          <jalios:thumbnail css="thumbnail pull-right" path='<%= Util.encodeUrl(interview.getPhoto()) %>' width='140' />
          </jalios:if>		      
		      <jalios:wiki data="<%= interview %>" field="bio">
		      <%= interview.getBio(userLang) %>
		      </jalios:wiki>
		    </div>
		  </div>
		  </jalios:if>	  
	  </div>
  </div><%-- EOF .interview-body --%>
</div><%-- EOF .interview --%>