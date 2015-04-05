<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%--  
--%><%  
	VoteManager voteMgr = VoteManager.getInstance();
	Publication pub = (Publication) request.getAttribute("jcms.vote.pub");
	
	if (voteMgr.isVoteAnonymized()) {
		return;
	}
	
	if (pub == null) {
	    pub = getPublicationParameter("pubId");
	}
	
	if (pub == null || !pub.canBeReadBy(loggedMember)) {
	    return;
	}  
	
	List<Vote> voteList = voteMgr.isDownVoteAnonymized() ? voteMgr.getPositiveVoteList(pub) : voteMgr.getVoteList(pub);
    
	if (Util.isEmpty(voteList)) {
	    return;
	}
	
	boolean displayAll = getBooleanParameter("voteDisplayAll",false);
	int maxMembers = channel.getIntegerProperty("vote.template.votelist.max",5); 
	
	request.removeAttribute("jcms.vote.pub");
%>
<div class="activity-vote">
<%= glp("ui.vote.pub-vote-count",voteMgr.getVoteCount(pub)) %> : 
<jalios:foreach collection="<%= voteList %>" name="itVote" type="Vote" max="<%= displayAll ? voteList.size() : maxMembers %>">
    <jalios:memberphoto member="<%= itVote.getAuthor() %>" size="<%= PhotoSize.ICON %>"/>
</jalios:foreach>
<% if(voteList.size() > maxMembers && !displayAll) {%>
    <a data-jalios-action="ajax-refresh" href="front/vote/template/doVoteListDefaultTemplate.jsp?pubId=<%= pub.getId() %>&amp;voteDisplayAll=true"> <jalios:icon src="vote-show-all" /></a>
<% } %>
</div>