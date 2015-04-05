<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%--  
--%><%@ include file="/front/vote/voteControl.jspf" %><%-- 
 --%>
<%  
    if (!canVote) {
        return;
    }
    String voteText = hasVoted && !existingVote.isPositive() || !hasVoted ? glp("ui.vote.like") : glp("ui.vote.unlike");
    int voteScore = pub.getVoteScore();
    String title = glp("ui.vote.pub-vote-count",voteScore);
    title += existingVote != null ? " - " + glp("ui.vote.pub-already-voted") : "";
%>
<% if (canVote){ %><a data-jalios-action="ajax-refresh" class="publication-vote" title="<%= title %>" href="front/vote/template/doVoteLikeText.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %><%= voteText %><% if (canVote){ %></a><% } %>