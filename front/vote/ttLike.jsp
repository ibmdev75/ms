<%@ include file="/jcore/doInitPage.jspf" %><jalios:include target="TOOLTIP_LIKE_TOP" targetContext="empty" />
<%@ page import="com.jalios.jcms.vote.VoteManager" %>
<%  
    VoteManager voteMgr = VoteManager.getInstance();

    String ttContext = getUntrustedStringParameter("ttContext","");
    
    Publication pub = channel.getPublication(voteMgr.getJcmsId(ttContext));

    if (pub == null) {
        return;
    }
    
    Set<Member> positiveVoterSet = voteMgr.getPublicationVoteMemberSet(pub,true);
    Set<Member> negativeVoterSet = voteMgr.getPublicationVoteMemberSet(pub,false);
%>
<div>
    <%= pub.getVoteCount() %> votes &middot; <%= pub.getVoteScore() %> pts<br/>
    <div style="overflow:hidden">
    <jalios:foreach collection="<%= positiveVoterSet %>" type="Member" name="itVoter">
		    <jalios:memberphoto member="<%= itVoter %>" size="<%= PhotoSize.TINY %>"/>
    </jalios:foreach>
    </div>
    <div style="overflow:hidden">
    <jalios:foreach collection="<%= negativeVoterSet %>" type="Member" name="itVoter">
		    <jalios:memberphoto member="<%= itVoter %>" size="<%= PhotoSize.TINY %>"/>
    </jalios:foreach>    
    </div>
</div>