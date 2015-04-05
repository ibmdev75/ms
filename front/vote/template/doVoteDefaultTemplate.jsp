<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%--  
--%><%@ include file="/front/vote/voteControl.jspf" %><%-- 
 --%>
<%  
    String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultPositiveVoteIcon() : voteMgr.getDefaultPositiveVoteHighlightIcon();
    int voteScore = pub.getVoteScore();
    String title = isPointMode ? glp("ui.vote.pub-vote-points",voteScore) : glp("ui.vote.pub-vote-count",voteScore);
    title += existingVote != null ? " - " + glp("ui.vote.pub-already-voted") : "";
%><%--  
--%><% if (canVote){ %><a class="ajax-refresh ajax-action  ID_ttLike LIKE-<%= pub.getId() %>" title="<%= title %>" href="front/vote/template/doVoteDefaultTemplate.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %>
<jalios:icon src="<%= positiveVoteIconSrc %>" title='<%= !canVote ? title : "" %>' alt="+1" /><% if (canVote){ %></a><% } %>