<%@ include file="/jcore/doInitPage.jspf" %>
<%@ page import="com.jalios.jcms.vote.*" %>
<% 
Publication publication = jcmsContext.getPublication(); 
VoteManager voteManager = VoteManager.getInstance();
boolean skipVoteFooter = Util.toBoolean(request.getAttribute("skipVoteFooter"),false);
boolean showVoteFooter = !skipVoteFooter && voteManager.isVoteEnabled() && voteManager.isVotable(publication);
%>
<% if (showVoteFooter) { %>
  <div class="vote-footer">
	<jalios:vote pub="<%= publication %>" templateProperty="vote.template.vote-and-list"  />
  </div>
<% } %>