<%@ include file="/jcore/doInitPage.jspf" %><jalios:include target="TOOLTIP_RECO_GROUP_TOP" targetContext="empty" />
<%@ page import="com.jalios.jcms.recommendation.*" %>
<%  
    String ttContext = getUntrustedStringParameter("ttContext","");
    
    String groupId = Util.getMatch(RecommendationConstants.TTCARD_GROUP_REGEXP, ttContext, 1);
    
    Group group = channel.getGroup(groupId);

    if (group == null) {
        return;
    }
    if (!group.canBeReadBy(loggedMember)) {
      return;
    }
%>
<div class="ttRecoGroup">
<b><%= group.getName(userLang) %></b>
<div>
<jalios:foreach collection="<%= group.getMemberSet() %>" type="Member" name="itMember" max="100">
    <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>"/>
</jalios:foreach>
</div>
</div>