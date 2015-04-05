<%--
  @Summary: Portlet Menu Full Display
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% PortletMenu box = (PortletMenu) portlet;  
  String separator = Util.isEmpty(box.getItemSeparaor()) ? "|" : "<img src='"+box.getItemSeparaor()+"' alt='' />"; 
  boolean itemOK = true; %>
<jalios:foreach array='<%= box.getItems() %>' name='itElement' type='java.lang.String' counter='itCounter'>
	<% if (Util.isEmpty(itElement)) { 
%><% } else if (itElement.equals("LoggedMember") && loggedMember != null) { %><%= glp("ui.com.foot.hello") %> <% String memberProfile = ResourceHelper.getMemberProfile(); if ("front/memberProfile.jsp".equals(memberProfile)) { %><a href='front/memberProfile.jsp?emptyheader=true' onclick='popupWindow(this.href, "MemberProfile", 1000, 600); return false;'><% } else { %><a href="<%= memberProfile %>"><% } %><%= loggedMember.getFullName() %></a><% itemOK = true; 
%><% } else if (itElement.equals("Date")) { %><jalios:date nowifnull="true"/><% itemOK = true; 
%><% } else if (itElement.equals("Time")) { %><jalios:time nowifnull="true"/><% itemOK = true; 
%><% } else if (itElement.equals("100%")) { %>&nbsp;<% itemOK = false; 
%><% } else if (itElement.equals("Space") && itemOK) { %>&nbsp;<%
%><% } else if (itElement.equals("Separator") && itemOK) { %>&nbsp;<%= separator %>&nbsp;<%
%><% } else if (itElement.equals("Work")) { %><jalios:workspace /><% itemOK = true; 
%><% } else if (itElement.equals("WorkPortlet") && isLogged && loggedMember.canPublishSome(PortalElement.class)) { %><jalios:workspace /><% itemOK = true; 
%><% } else if (itElement.equals("Admin") && checkAccess("admin/")) { %><a href="admin/admin.jsp"><jalios:icon src='admin' alt='<%= glp("ui.com.alt.admin") %>' title='<%= glp("ui.com.alt.admin") %>'  /></a><% itemOK = true; 
%><% } else if (itElement.equals("Home")) { %><a href="index.jsp"><jalios:icon src='home' title='<%= glp("ui.com.alt.home") %>' alt='<%= glp("ui.com.alt.home") %>'  /></a><% itemOK = true; 
%><% } else if (itElement.equals("SiteMap")) { %><a href='<%= ServletUtil.getUrlWithUpdatedParam(request, "jsp" , "front/sitemap.jsp") %>'><jalios:icon src='sitemap' alt='<%= glp("ui.com.alt.sitemap") %>' title='<%= glp("ui.com.alt.sitemap") %>'  /></a><% itemOK = true; 
%><% } else if (itElement.equals("Caddy")) { %><% if (!Caddy.getCaddy(request).isEmpty()) { %><a href="work/caddy/caddyPopin.jsp" data-jalios-action="popin" class="caddyPopin" title="<%= glp("ui.work.mn.caddy") %>"><jalios:icon src='caddy-white' alt='<%= glp("ui.com.alt.show-caddy") %>' title='<%= glp("ui.com.alt.show-caddy") %>'  /></a><% } /* endif caddy not empty */ %><% itemOK = true; 
%><% } else if (itElement.equals("Login")) { %><jalios:login/><% itemOK = true; 
%><% } else if ((itElement.equals("Portal") || itElement.equals("PortalSimple")) && channel.isDataWriteEnabled() && (isAdmin || (isLogged && PortalManager.canWorkOnSome(portal, loggedMember)))) { %><a href="<%= PortalManager.sendAction(request,null,PortalManager.PORTAL_ACTION_MODE, isPortalMode ? PortalManager.PORTAL_ACTION_REMOVE : PortalManager.PORTAL_MODE_ENABLE) %>"><jalios:icon src='<%= isPortalMode ? "portal-level-select" : "portal-level" %>' alt='<%= glp("ui.com.alt.portal") %>' title='<%= glp("ui.com.alt.portal") %>'  /></a><% itemOK = true; 
%><% } else if (itElement.equals("Preview") && isLogged && PortalManager.canWorkOnSome(portal , loggedMember)) { %><a href='<%= ServletUtil.getUrlWithUpdatedParam(request, "preview", hasParameter("preview") ? null : "true") %>'><jalios:icon src='<%= hasParameter("preview") ? "magnifier-off" : "magnifier-on" %>' alt='<%= glp("ui.com.alt.previewpub") %>' title='<%= glp("ui.com.alt.previewpub") %>'  /></a><% itemOK = true; 
%><% } else if (itElement.equals("Flag") && channel.isMultilingual()) { %><jalios:lang/><% itemOK = true; 
%><% } else if (itElement.equals("FlagList") && channel.isMultilingual()) { %><jalios:lang display="list"/><% itemOK = true; 
%><% } else if (itElement.equals("FlagMenu") && channel.isMultilingual()) { %><jalios:lang display="menu"/><% itemOK = true; 
%><% } else if (itElement.equals("UserManual")) { %><a href='<%= JcmsUtil.getWebHelpHome(request) %>' target="_blank"><jalios:icon src='book-closed'  /></a><% itemOK = true; 
%><% } else if (itElement.equals("SwitchContext") && AccessibilityContextManager.getInstance().hasManyContexts()) { %><a href='front/switchAccessibilityContext.jsp?redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>' onclick='popupWindow(this.href + "&amp;popupEdition=true", "", 450, 450, true, true, true, true, window); return false;' target='_blank' title='<%= glp("ui.accessibility.accessibilitycontext.title") %> (<%= glp("ui.accessibility.msg.newwindow") %>)'><%= glp("ui.accessibility.accessibilitycontext.title") %></a><% itemOK = true; 
%><% } else if (itElement.equals("Plugins")) { %><jalios:include target="PORTLETMENU" targetContext="inline" /><% itemOK = false; 
%><% } else { %><% itemOK = false; %><% } %></jalios:foreach>
