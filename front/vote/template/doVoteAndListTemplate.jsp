<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%--  
--%><% request.setAttribute("jcms.vote.reopenTransaction",true); %>
<%@ include file="/front/vote/voteControl.jspf" %><%-- 
 --%>
<%  
    String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? voteMgr.getDefaultPositiveVoteIcon() : voteMgr.getDefaultPositiveVoteHighlightIcon();
    int voteScore = pub.getVoteScore();
    String title = isPointMode ? glp("ui.vote.pub-vote-points",voteScore) : glp("ui.vote.pub-vote-count",voteScore);
    title += existingVote != null ? " - " + glp("ui.vote.pub-already-voted") : "";
%><%--  
--%><% if (canVote){ %><a class="ajax-refresh ajax-action  ID_ttLike LIKE-<%= pub.getId() %>" title="<%= title %>" href="front/vote/template/doVoteAndListTemplate.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %>
<img src="<%= positiveVoteIconSrc %>" class="icon"<%= !canVote ? " title=\"" + title +"\"" : "" %> alt="+1" /><% if (canVote){ %></a><% } %>

<%  
	List<Vote> voteList = voteMgr.isDownVoteAnonymized() ? voteMgr.getPositiveVoteList(pub) : voteMgr.getVoteList(pub);
	
	if (Util.isEmpty(voteList)) {
%>
<%= glp("ui.vote.pub-vote-count", 0) %>
<% } else {
	boolean displayAll = getBooleanParameter("voteDisplayAll",false);
	int maxMembers = channel.getIntegerProperty("vote.template.votelist.max",5); 
	
	request.removeAttribute("jcms.vote.pub");
%>
<%= glp("ui.vote.pub-vote-count",voteMgr.getVoteCount(pub)) %> : 
<jalios:foreach collection="<%= voteList %>" name="itVote" type="Vote" max="<%= displayAll ? voteList.size() : maxMembers %>">
		<jalios:memberphoto member="<%= itVote.getAuthor() %>" size="<%= PhotoSize.ICON %>"/>
</jalios:foreach>
<% if(voteList.size() > maxMembers && !displayAll) {%>
    <a title="<%= glp("ui.vote.see-all-voters") %>" data-jalios-action="ajax-refresh" href="front/vote/template/doVoteAndListTemplate.jsp?pubId=<%= pub.getId() %>&amp;voteDisplayAll=true"> <jalios:icon src="vote-show-all" /></a>
<% } %>
<% } %>