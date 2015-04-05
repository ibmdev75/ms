<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.author"),0);
  if (boxStatus == 0){ return; }
  if (loggedMember == null){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  String[] mids=  qh.getMids();
  if (Util.notEmpty(mids)){
    boxStatus = 1;
  }
%>
<jalios:accordion-panel title="ui.work.search.tab.group" picture="group" active="<%= boxStatus != 2 %>">

	<jalios:field resource="field-light" name='<%= "mids" %>' value='<%= mids %>' css='accountOnly'>
	  <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT).placeholder("ui.com.placeholder.member") %>' />
	</jalios:field>
	<br/>
	<jalios:field resource="field-light" name='<%= "gids" %>' value='<%= qh.getGids() %>'>
	  <jalios:control settings='<%= new GroupSettings().placeholder("ui.com.placeholder.group") %>' />
	</jalios:field>

</jalios:accordion-panel>
