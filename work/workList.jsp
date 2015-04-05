<%--
  @Summary: Display the work list of the logged member
  @Category: Work Area / Workflow
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.1
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  request.setAttribute("title", glp("ui.work.wl.title"));
  request.setAttribute("workListWAMenu", "true");
  final boolean showSpecial = (hasParameter("special"));
  String redirectJS        = ServletUtil.getUrl(request);
  String redirect          = ServletUtil.encodeURL(redirectJS); 

%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>
<h1 class="boTitle icon iconWork"><% /* %>Work list<% */ %><%= glp("ui.work.wl.title") %></h1>
<jalios:pager name='plPagerHandler' declare='true' action='init' sort='mdate'/>
<%
DataSelector specialStateSelector = new DataSelector() {
  public boolean isSelected(Data data) {
    if (! (data instanceof Publication)) {
      return false;
    }
    Publication pub = (Publication)data;
    if (!showSpecial && pub.getWFState() != null && pub.getWFState().isSpecialState()) {
      return false;
    }
    return true;
  }
};

Comparator<? super Publication> comparator = ComparatorManager.getComparator(Publication.class, plPagerHandler.getSort(), plPagerHandler.isReverse());
DataSelector selector   = new AndDataSelector(new AndDataSelector(Publication.getCanWorkOnSelector(loggedMember), specialStateSelector), new ReverseDataSelector(FileDocument.getHiddenSelector()));
Set          pubSet     = channel.getPublicationSet(Publication.class, loggedMember, false, wkspcFilter ? workspace : null, true);
%>


<p>
<% if (showSpecial) { %>
<input class='btn btn-default' type='button' value='<%= glp("ui.work.wl.txt.hide") %>' onclick='javascript:location="<%= ServletUtil.getAbsUrlWithUpdatedParam(request, "special", null) %>";' />
<% } else { %>
<input class='btn btn-default' type='button' value='<%= glp("ui.work.wl.txt.show") %>' onclick='javascript:location="<%= ServletUtil.getAbsUrlWithUpdatedParam(request, "special", "true") %>";' />
<% } %>
</p>

<jalios:query name='resultSet' dataset='<%= pubSet %>' comparator='<%= comparator %>' selector="<%= selector %>"/>
<% if (Util.isEmpty(resultSet)) { %>
<% /* %>You have no publication to process.<% */ %><%= glp("ui.work.wl.txt.no-work") %>
<p>&nbsp;</p>
<% } else { %>
<% 
request.setAttribute("plPubSet",           resultSet); 
request.setAttribute("plShowWorkflow",     Boolean.TRUE); 
request.setAttribute("plShowWorkspace",    Boolean.valueOf(!wkspcFilter));
request.setAttribute("plShowEditIcon",     Boolean.FALSE); 
request.setAttribute("plShowValidateIcon", Boolean.TRUE); 
request.setAttribute("plShowPdate",        Boolean.TRUE); 
%>
<jsp:include page="/work/doPubList.jsp" />

<% } %>

<%@ include file='/work/doWorkFooter.jspf' %> 
