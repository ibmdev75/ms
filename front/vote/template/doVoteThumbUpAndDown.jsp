<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%--  
--%><%@ include file="/front/vote/voteControl.jspf" %><%-- 
 --%>
<%  
    String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? "images/jalios/icons/vote/thumbUp.png" : "images/jalios/icons/vote/thumbUpEnabled.png";
    String negativeVoteIconSrc = hasVoted && existingVote.isPositive() || !hasVoted ? "images/jalios/icons/vote/thumbDown.png" : "images/jalios/icons/vote/thumbDownEnabled.png";
%>
 <% if (canVote){ %><a title="<%= glp("ui.vote.like") %>" class="ajax-refresh ajax-action"  href="front/vote/template/doVoteThumbUpAndDown.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %><jalios:icon src="<%= positiveVoteIconSrc %>"  alt="Vote up" /><% if (canVote){ %></a><% } %>
 <% if (canVote){ %><a title="<%= glp("ui.vote.dislike") %>" class="ajax-refresh ajax-action ctxTooltipCard ID_ttLike LIKE-<%= pub.getId() %>"  href="front/vote/template/doVoteThumbUpAndDown.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=false&amp;vote=true" onclick="return false;"><% } %><jalios:icon src="<%= negativeVoteIconSrc %>"  alt="Vote down" /><% if (canVote){ %></a><% } %>