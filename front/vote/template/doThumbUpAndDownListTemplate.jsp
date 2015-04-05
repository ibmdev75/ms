<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%--  
--%><% request.setAttribute("jcms.vote.reopenTransaction",true); %>
<%@ include file="/front/vote/voteControl.jspf" %><%-- 
 --%>
<%  
    String positiveVoteIconSrc = hasVoted && !existingVote.isPositive() || !hasVoted ? "images/jalios/icons/vote/thumbUp.png" : "images/jalios/icons/vote/thumbUpEnabled.png";
    String negativeVoteIconSrc = hasVoted && existingVote.isPositive() || !hasVoted ? "images/jalios/icons/vote/thumbDown.png" : "images/jalios/icons/vote/thumbDownEnabled.png";
%>
<%  
	List<Vote> positiveVoteList = voteMgr.getPositiveVoteList(pub);
	List<Vote> negativeVoteList = voteMgr.getNegativeVoteList(pub);
	
	boolean displayPositiveAll = getBooleanParameter("votePositiveDisplayAll",false);
	boolean displayNegativeAll = getBooleanParameter("voteNegativeDisplayAll",false);
	int maxMembers = channel.getIntegerProperty("vote.template.votelist.max",5); 
	
	request.removeAttribute("jcms.vote.pub");
%>
<div class="positive-vote">
	<% if (canVote){ %><a title="<%= glp("ui.vote.dislike") %>" class="ajax-refresh ajax-action ctxTooltipCard ID_ttLike LIKE-<%= pub.getId() %>"  href="front/vote/template/doThumbUpAndDownListTemplate.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=true&amp;vote=true" onclick="return false;"><% } %><img src="<%= positiveVoteIconSrc %>" class="icon" alt="Vote up" /><% if (canVote){ %></a><% } %>
	<% if (Util.notEmpty(positiveVoteList)) { %>
	<%= glp("ui.vote.pub-vote-count",Util.getSize(positiveVoteList)) %> : 
	<jalios:foreach collection="<%= positiveVoteList %>" name="itVote" type="Vote" max="<%= displayPositiveAll ? positiveVoteList.size() : maxMembers %>">
		<% String voterCss = itVote.isPositive() ? "voter-positive" : "voter-negative"; %>
    <jalios:memberphoto css="<%= voterCss %>" member="<%= itVote.getAuthor() %>" size="<%= PhotoSize.ICON %>" /> 
	</jalios:foreach>
	<% if(positiveVoteList.size() > maxMembers && !displayPositiveAll) {%>
    <a title="<%= glp("ui.vote.see-all-voters") %>" data-jalios-action="ajax-refresh" href="front/vote/template/doThumbUpAndDownListTemplate.jsp?pubId=<%= pub.getId() %>&amp;votePositiveDisplayAll=true<%= displayNegativeAll ? "&amp;voteNegativeDisplayAll=true" : "" %>"> <jalios:icon src="plus" /></a>
	<% } %>
	<% } %>
</div>
<div class="negative-vote">
	<% if (canVote){ %><a title="<%= glp("ui.vote.dislike") %>" class="ajax-refresh ajax-action ctxTooltipCard ID_ttLike LIKE-<%= pub.getId() %>"  href="front/vote/template/doThumbUpAndDownListTemplate.jsp?pubId=<%= pub.getId() %>&amp;positiveVote=false&amp;vote=true" onclick="return false;"><% } %><img src="<%= negativeVoteIconSrc %>" class="icon" alt="Vote down" /><% if (canVote){ %></a><% } %>
	<% if (Util.notEmpty(negativeVoteList)) { %>
	<%= glp("ui.vote.pub-vote-count",Util.getSize(negativeVoteList)) %> : 
	<jalios:foreach collection="<%= negativeVoteList %>" name="itVote" type="Vote" max="<%= displayNegativeAll ? negativeVoteList.size() : maxMembers %>">
		<% String voterCss = itVote.isPositive() ? "voter-positive" : "voter-negative"; %>
		<jalios:memberphoto css="<%= voterCss %>" member="<%= itVote.getAuthor() %>" size="<%= PhotoSize.ICON %>" /> 
	</jalios:foreach>
	<% if(negativeVoteList.size() > maxMembers && !displayNegativeAll) {%>
		<a title="<%= glp("ui.vote.see-all-voters") %>" data-jalios-action="ajax-refresh" href="front/vote/template/doThumbUpAndDownListTemplate.jsp?pubId=<%= pub.getId() %>&amp;voteNegativeDisplayAll=true<%= displayPositiveAll ? "&amp;votePositiveDisplayAll=true" : "" %>"> <jalios:icon src="plus" /></a>
	<% } %>
	<% } %>
</div>