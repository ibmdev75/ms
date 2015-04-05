<%-- 
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Caddy popin
  @Category: Presentation / Popup
--%>
<%@ include file='/jcore/doInitPage.jspf' %>  
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.CaddyPopinHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
  request.setAttribute("zone", "Public");
  if (trace != null) {
    trace.put("zone", request.getAttribute("zone"));
  }
  request.setAttribute("title", glp("ui.work.mn.caddy"));

  Caddy  caddy = Caddy.getCaddy(request);
  Class  dataClass = formHandler.getDataClass();
  String dataType = formHandler.getDataType();
  List   dataOrIdList = caddy.getList(dataClass);
  String caddyManagerJsp = "work/caddy/" + dataType.toLowerCase() + "CaddyManager.jsp";
  
  boolean couldManageCaddy = isLogged && loggedMember.isWorker();
  boolean manageButtonEnabled = couldManageCaddy && caddy.canManage(dataClass, loggedMember);
  boolean isEmpty = dataOrIdList.size() == 0;
%>
<div class="ajax-refresh-div" <%= untranslatedZoneAttribute %>>

  <div class="box caddy">
    <div class="box-body">
      <a href="#" class="close-btn"></a>
      <h3><%= formHandler.isCaddyUpdated() ? glp("ui.caddy-popin.updated") : glp("ui.work.mn.caddy") %></h3>
      <p><%= isEmpty ? glp("ui.caddy-popin.is-empty") : glp("ui.caddy-popin.infos." + dataType.toLowerCase(), dataOrIdList.size()) %></p>
   
		  <% if (!isEmpty) { %>
		  <div class="text-right">
		    <a href="work/caddy/printCaddy.jsp?dataType=<%= dataType %>" class="btn btn-default" target="_blank"><%= glp("ui.caddy-popin.print") %></a>
		    &nbsp;
		    <% if (couldManageCaddy) { %>
		      <a href="<%= caddyManagerJsp %>" class="btn btn-primary" onclick="if (Popup.isInPopup() || Util.isInIFrame()) { this.target='_blank'; }"><%= glp("ui.caddy-popin.manage") %></a>
		    <% } %>
		  </div>
		  <% } %>
    </div>
  </div>
  <div id="caddyPopinAjaxReplacements" style="display:none;">
<%
    String[] elmIds = getStringParameterValues("elmIds", "^[a-zA-Z0-9_\\-\\.]*$"); // HTML id
    if (elmIds != null) {
      for (String elmId : elmIds) {
        String action = getStringEnumParameter(elmId + "cadAction", null, CaddyPopinHandler.ALL_ACTIONS);
  
        TreeSet<Data> dataSet = getDataSetParameterValues(elmId + "cadIds", Data.class);
        Data data = (dataSet.size() == 1) ? dataSet.iterator().next() : null;
            
        String qs      = getUntrustedStringParameter(elmId + "cadQueryString", null);
        String grpQs   = getUntrustedStringParameter(elmId + "cadGroupQueryString", null);
        String mbrQs   = getUntrustedStringParameter(elmId + "cadMemberQueryString", null);
        String dbmbrQs = getUntrustedStringParameter(elmId + "cadDbMemberQueryString", null);
        String wsQs    = getUntrustedStringParameter(elmId + "cadWorkspaceQueryString", null);
  
        boolean checkPstatus = getBooleanParameter(elmId + "cadCheckPstatus", false);
        boolean displayLinkText = getBooleanParameter(elmId + "cadDisplayLinkText", false);
        
        String css = getUntrustedStringParameter(elmId + "cadCss", null);
        String icon = getUntrustedStringParameter(elmId + "cadIcon", null);
        String iconOut = getUntrustedStringParameter(elmId + "cadIconOut", null);
        
      %><div id="<%= encodeForHTMLAttribute(elmId) %>Replacement"><jalios:caddy 
          action='<%= action %>'
          
          data='<%= data %>'
          collection='<%= dataSet %>'
          
          queryString='<%= qs %>'
          groupQueryString='<%= grpQs %>'
          memberQueryString='<%= mbrQs %>'
          dbMemberQueryString='<%= dbmbrQs %>'
          workspaceQueryString='<%= wsQs %>'
  
          checkPstatus='<%= checkPstatus %>'
          displayLinkText='<%= displayLinkText %>'
          
          css='<%= css %>'
          icon='<%= icon %>'
          iconOut='<%= iconOut %>'
  
      /></div><%
      }
    }
%>
  </div>
</div>
<%@ include file='/jcore/doAjaxFooter.jspf' %>