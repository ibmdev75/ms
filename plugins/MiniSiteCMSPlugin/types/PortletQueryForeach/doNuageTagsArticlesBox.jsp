<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>

<%
List<Tag> lstTags = new ArrayList<Tag>();
%>

<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>

<%
ArticleMS ams = (ArticleMS) itPub;
Tag[] tags = ams.getTag();
for(int i=0;i<tags.length;i++) {
	Tag t = tags[i];
	if(!lstTags.contains(t)) {
		t.setCompteur(1);
		lstTags.add(lstTags.size(), t);
	}
	else {
		t.setCompteur(t.getCompteur()+1);
	}
}

%>
<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<div class="tags">
<%
jcmsContext.addCSSHeader("plugins/MiniSiteCMSPlugin/css/Tag/tagfull.css");
for(Iterator iterator = lstTags.iterator(); iterator.hasNext();) {
	Tag obj = (Tag)iterator.next();
	String style="color:"+obj.getCouleurTexte()+"; background:"+obj.getCouleurFond();
	String styleCounter="color:"+obj.getCouleurFond();

%>
<a href="<%=obj.getUrl().getDisplayUrl(Locale.FRANCE)+"?tag="+obj.getId()%>" style="<%=style %>"><%=obj.getDescription() %><span style="<%=styleCounter%>"><%=obj.getCompteur() %></span></a>
<%} %>
</div>
<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>