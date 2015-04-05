<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Display a printable page with the content of the caddy
  @Category: Internal
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

 request.setAttribute("printView", Boolean.TRUE);
 request.setAttribute("title", glp("ui.work.mn.caddy"));  
 request.setAttribute("portal", PortalManager.getPrintPortal());

%><%@ include file='/jcore/doHeader.jspf' %><%
%><%!

  public boolean isPrintable(Publication pub) {
    Class pubClass = pub.getClass();
    if (generated.FaqEntry.class.isAssignableFrom(pubClass) ||
        generated.GlossaryEntry.class.isAssignableFrom(pubClass)) {
      return false;
    }
    if (com.jalios.jcms.Content.class.isAssignableFrom(pubClass) ||
        com.jalios.jcms.Form.class.isAssignableFrom(pubClass)) {
      return true;
    }
    return false;
  }

%><%

  final String dataType = getAlphaNumParameter("dataType", "");
  Caddy caddy = Caddy.getCaddy(request); 
  int dataCounter = 0;
  String dataStyle = "";
  String breakPageStyle = "page-break-before: always;";

%>

<%-- *** PUBLICATION ************************************** --%>
<% if ("Publication".equals(dataType) || Util.isEmpty(dataType)) { %>
<jalios:foreach name='itPub' type='Publication' collection='<%= caddy.getPublicationList() %>'>
<%
  // Check class inside foreach instead of using a query (bug-jcms-5.0.2-490) 
  if (isPrintable(itPub)) { 
    dataCounter++;
    dataStyle = dataCounter>1 && clientBrowser.isIE5() ? breakPageStyle : "";
%>
<div class="caddyPage" style="<%= dataStyle %>">
  <div class="caddyTitle">
    <span class="caddyCounter"><%= dataCounter %>.</span>
    <%= itPub %>
  </div>
  <div class="caddyContent">
			<%
        String classShortName = Util.getClassShortName(itPub.getClass());
		    request.setAttribute(PortalManager.PORTAL_PUBLICATION, itPub);
		    request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
		    String displayTemplate = "/" +itPub.getTemplatePath(jcmsContext);
		    request.removeAttribute("isInContentFullDisplay");
			%>
		  <jsp:include page="<%= displayTemplate %>" flush="true"/>
  </div>
</div>
<% } // end if isPrintable() %>
</jalios:foreach>
<% } %>

<%-- *** CATEGORY ************************************** --%>
<% if ("Category".equals(dataType) || Util.isEmpty(dataType)) { %>
<jalios:foreach name='itCat' type='Category' collection='<%= caddy.getCategoryList() %>'>
<%
  dataCounter++;
  dataStyle = dataCounter>1 && clientBrowser.isIE5() ? breakPageStyle : "";
%>
<div class="caddyPage">
  <div class="caddyTitle">
    <span class="caddyCounter"><%= dataCounter %>.</span>
    <%= itCat.getName(userLang) %>
  </div>
  <div class="caddyContent">
				<% request.setAttribute("category", itCat); %>
				<jsp:include page="/admin/doCategoryFullDisplay.jsp" flush="true"/>
  </div>
</div>
</jalios:foreach>
<% } %>

<%-- *** WORKSPACE ************************************** --%>
<% if ("Workspace".equals(dataType) || Util.isEmpty(dataType)) { %>
<jalios:foreach name='itWs' type='Workspace' collection='<%= caddy.getWorkspaceList() %>'>
<%
  dataCounter++;
  dataStyle = dataCounter>1 && clientBrowser.isIE5() ? breakPageStyle : "";
%>
<div class="caddyPage">
  <div class="caddyTitle">
    <span class="caddyCounter"><%= dataCounter %>.</span>
    <%= itWs.getTitle(userLang) %>
  </div>
  <div class="caddyContent">
        <% request.setAttribute("ws", itWs); %>
        <jsp:include page="/admin/doWorkspaceFullDisplay.jsp" flush="true"/>
  </div>
</div>
</jalios:foreach>
<% } %>

<%-- *** GROUP ************************************** --%>
<% if ("Group".equals(dataType) || Util.isEmpty(dataType)) { %>
<jalios:foreach name='itGrp' type='Group' collection='<%= caddy.getGroupList() %>'>
<%
  dataCounter++;
  dataStyle = dataCounter>1 && clientBrowser.isIE5() ? breakPageStyle : "";
%>
<div class="caddyPage">
  <div class="caddyTitle">
    <span class="caddyCounter"><%= dataCounter %>.</span>
    <%= itGrp.getName(userLang) %>
  </div>
  <div class="caddyContent">
        <% request.setAttribute("group", itGrp); %>
        <jsp:include page="/admin/doGroupFullDisplay.jsp" flush="true"/>
   </div>
</div>
</jalios:foreach>
<% } %>

<%-- *** MEMBER ************************************** --%>
<% if ("Member".equals(dataType) || Util.isEmpty(dataType)) { %>
<jalios:foreach name='itMbr' type='Member' collection='<%= caddy.getMemberList() %>'>
<%
  dataCounter++;
  dataStyle = dataCounter>1 && clientBrowser.isIE5() ? breakPageStyle : "";
%>
<div class="caddyPage">
  <div class="caddyTitle">
    <span class="caddyCounter"><%= dataCounter %>.</span>
    <%= itMbr.getFullName() %>
  </div>
  <div class="caddyContent">
				<% request.setAttribute("member", itMbr); %>
				<jsp:include page='<%= "/" + ResourceHelper.getMemberDisplay() %>' flush='true'/>
  </div>
</div>
</jalios:foreach>
<% } %>

<%@ include file='/jcore/doFooter.jspf' %> 
