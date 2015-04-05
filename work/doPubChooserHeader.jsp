<%@ include file='/jcore/doInitPage.jspf' %>
<%  
    String jsFuncParameter = getUntrustedStringParameter("jsFunc","");
	  boolean isTextFieldPubLink = getBooleanParameter("textFieldPubLink", false);
  
    boolean myContentWAMenu      = request.getAttribute("myContentWAMenu")      != null;
    boolean allContentWAMenu     = request.getAttribute("allContentWAMenu")     != null;
    boolean deletedContentWAMenu = request.getAttribute("deletedContentWAMenu") != null;
    boolean archivedContentWAMenu= request.getAttribute("archivedContentWAMenu")!= null;
    boolean contentWAMenu        = myContentWAMenu       ||
                                   allContentWAMenu      || 
                                   deletedContentWAMenu  || 
                                   archivedContentWAMenu ||
                                   request.getAttribute("contentWAMenu")        != null;
                                   
    boolean myUGCWAMenu         = request.getAttribute("myUGCWAMenu")         != null;
    boolean allUGCWAMenu        = request.getAttribute("allUGCWAMenu")        != null;
    boolean deletedUGCWAMenu    = request.getAttribute("deletedUGCWAMenu")    != null;
    boolean ugcWAMenu           = myUGCWAMenu       ||
                                 allUGCWAMenu      || 
                                 deletedUGCWAMenu  || 
                                 request.getAttribute("ugcWAMenu")           != null;                                
  
    boolean myFormWAMenu         = request.getAttribute("myFormWAMenu")         != null;
    boolean allFormWAMenu        = request.getAttribute("allFormWAMenu")        != null;
    boolean deletedFormWAMenu    = request.getAttribute("deletedFormWAMenu")    != null;
    boolean archivedFormWAMenu   = request.getAttribute("archivedFormWAMenu")   != null;
    boolean formWAMenu           = myFormWAMenu       ||
                                   allFormWAMenu      || 
                                   deletedFormWAMenu  || 
                                   archivedFormWAMenu ||
                                   request.getAttribute("formWAMenu")           != null;
    
    String superClassName = getUntrustedStringParameter("super","");
    Class superClass = null;
    try {
      superClass = channel.getClass(superClassName);
    } catch (ClassNotFoundException e) {
      //EMPTY
    }
    boolean isPortletChooser = superClass != null && superClass.isAssignableFrom(com.jalios.jcms.portlet.PortalElement.class);
%>
<div class="navbar-placeholder"></div>
  
<div class="navbar navbar-default navbar-fixed-top pub-chooser-navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#pub-chooser-header-navbar">
        <jalios:icon src="nav-burger"/> 
      </button>
    </div>    
    
    <% 
      String superParameter = getUntrustedStringParameter("super","");
    
      boolean isContentDisplayed = superParameter.equals("");
      boolean isUserContentDisplayed = superParameter.equals("com.jalios.jcms.UserContent");
      boolean isFormDisplayed = superParameter.equals("com.jalios.jcms.Form");
      
      String modeParameter = getUntrustedStringParameter("mode","");
      
      boolean isModeMine = modeParameter.equals("mine");
      boolean isModeAll = modeParameter.equals("all") || !isModeMine;
      
      String mineLabel = "";
      String allLabel = "";
      
      if (contentWAMenu) {
        mineLabel = glp("ui.work.mn.ctnt.mine");
        allLabel = glp("ui.work.mn.ctnt.all");
      } else if (ugcWAMenu) {
        mineLabel = glp("ui.work.mn.ugc.mine");
        allLabel = glp("ui.work.mn.ugc.all");
      } else if (formWAMenu) {
        mineLabel = glp("ui.work.mn.form.mine");
        allLabel = glp("ui.work.mn.form.all");
      }
      
    %>
  
    <div class="collapse navbar-collapse" id="pub-chooser-header-navbar">
      <ul class="nav navbar-nav">
        <% if (!isPortletChooser) { %>
        <li class="dropdown pub-chooser-type">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <% if (isUserContentDisplayed) { %>
              <%= glp("ui.work.mn.ugc") %>
            <% } else if (isFormDisplayed) { %>
              <%= glp("ui.work.mn.form") %>
            <% } else  { %>
              <%= glp("ui.work.mn.ctnt") %>
            <% } %>
            <jalios:icon src="caret" />
          </a>
          <ul class="dropdown-menu" role="menu">
            <%-- CONTENTS --%>
            <li id="contentWAMenu" class="<% if (contentWAMenu){%> active<%}%>"><a href="work/pubChooser.jsp?jsFunc=<%= jsFuncParameter %><%= isTextFieldPubLink ? "&amp;textFieldPubLink=true" : ""%>"><jalios:icon src="contents"  /> <%= glp("ui.work.mn.ctnt") %></a></li>
            
            <%-- UGC --%>
            <% if (loggedMember.canPublishSome(UserContent.class, workspace)) { %>
            <li id="ugcWAMenu" class="<% if (ugcWAMenu){%> active<%}%>"><a href="work/pubChooser.jsp?jsFunc=<%= jsFuncParameter %>&amp;mode=all&amp;super=com.jalios.jcms.UserContent<%= isTextFieldPubLink ? "&amp;textFieldPubLink=true" : ""%>"><jalios:icon src="contents-user"  /> <%= glp("ui.work.mn.ugc") %></a></li>
            <% } %>
            
            <%-- FORM --%>
            <% if (loggedMember.canPublishSome(Form.class, workspace)) { %>
            <li id="formWAMenu" class="<% if (formWAMenu){%> active<%}%>"> 
              <a href="work/pubChooser.jsp?jsFunc=<%= jsFuncParameter %>&amp;mode=all&amp;super=com.jalios.jcms.Form<%= isTextFieldPubLink ? "&amp;textFieldPubLink=true" : ""%>"><jalios:icon src="forms"  /> <%= glp("ui.work.mn.form") %></a>
            </li>
            <% } %> 
          </ul>
        </li>
        <li class="dropdown pub-chooser-mode">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <% if (isModeAll) { %>
              <%= allLabel %>
            <% } else if (isModeMine) { %>
              <%= mineLabel %>
            <% } %>
             <jalios:icon src="caret" />
          </a>
          <ul class="dropdown-menu" role="menu">
            <% if (contentWAMenu) { %>
              <%-- ##### CONTENT ##### --%>
              <li<%= myContentWAMenu ? " class=\"active\"" : "" %>><a href="work/pubChooser.jsp<%= ServletUtil.getUpdatedParams(request, new String[] {"mode"}, new String[] {"mine"}, new String[] {"mid"}) %>&amp;jsFunc=<%= jsFuncParameter %>" ><% /* %>My Contents<% */ %><%= glp("ui.work.mn.ctnt.mine") %></a></li> 
              <li<%= allContentWAMenu ? " class=\"active\"" : "" %>><a href="work/pubChooser.jsp<%= ServletUtil.getUpdatedParams(request, new String[] {"mode"}, new String[] {"all"}) %>&amp;jsFunc=<%= jsFuncParameter %>"><% /* %>All Contents<% */ %><%= glp("ui.work.mn.ctnt.all") %></a></li>
              <jalios:include target="WORK_CONTENT_SUBMENU" targetContext="li" />
            <% } else if (ugcWAMenu) { %>
              <%-- ##### UGC ##### --%>
              <li<%= myUGCWAMenu ? " class=\"active\"" : "" %>><a href="work/pubChooser.jsp<%= ServletUtil.getUpdatedParams(request, new String[] {"mode"}, new String[] {"mine"}) %>&amp;jsFunc=<%= jsFuncParameter %>&amp;super=com.jalios.jcms.UserContent"><% /* %>My UGC<% */ %><%= glp("ui.work.mn.ugc.mine") %></a></li>
              <li<%= allUGCWAMenu ? " class=\"active\"" : "" %>><a href="work/pubChooser.jsp<%= ServletUtil.getUpdatedParams(request, new String[] {"mode"}, new String[] {"all"}) %>&amp;jsFunc=<%= jsFuncParameter %>&amp;super=com.jalios.jcms.UserContent"><% /* %>All UGC<% */ %><%= glp("ui.work.mn.ugc.all") %></a></li>
              <jalios:include target="WORK_UGC_SUBMENU" targetContext="li" />
            <% } else if (formWAMenu) { %>
              <%-- ##### FORM ##### --%>
              <li<%= myFormWAMenu ? " class=\"active\"" : "" %>><a href="work/pubChooser.jsp<%= ServletUtil.getUpdatedParams(request, new String[] {"mode"}, new String[] {"mine"}) %>&amp;jsFunc=<%= jsFuncParameter %>&amp;super=com.jalios.jcms.Form" ><% /* %>My Form<% */ %><%= glp("ui.work.mn.form.mine") %></a></li>
              <li<%= allFormWAMenu ? " class=\"active\"" : "" %>><a href="work/pubChooser.jsp<%= ServletUtil.getUpdatedParams(request, new String[] {"mode"}, new String[] {"all"}) %>&amp;jsFunc=<%= jsFuncParameter %>&amp;super=com.jalios.jcms.Form" ><% /* %>All Form<% */ %><%= glp("ui.work.mn.form.all") %></a></li>
              <jalios:include target="WORK_FORM_SUBMENU" targetContext="li"/>
            <% } %>

          </ul>
        </li>        
        <% } %>
          <%-- Workspace --%>
          <li class="typeahead-container">
            <a href="#" class="typeahead-label">
              <%
                boolean workspaceFilter = getBooleanParameter("workspaceFilter", false) || !hasParameter("workspaceFilter");
              
                if (workspaceFilter) { %>
                  <%= encodeForHTML(workspace.getTitle(userLang)) %>
                <% } else if (getWorkspaceParameter("ws") != null && workspaceFilter){ %>
                  <%= encodeForHTML(getWorkspaceParameter("ws").getTitle(userLang)) %>
                <% } else { %>
                  <%= glp("ui.work.mn.allworkspace") %>
                <% 
                }
              %>
              <jalios:icon src="caret" />
            </a> 
            
            <div class="typeahead-input" style="display:none"> 
              <form class="navbar-form  navbar-right noSingleSubmitButton" role="search">                
                <div class="form-group">
                 <div class="input-group jalios-input-group">
                  <input type="text" class="form-control typeahead" name="text" 
                         placeholder="<%= glp("ui.topbar.workspace.placeholder") %>"
                         data-jalios-ajax-refresh-url="jcore/autocomplete/acworkspaceQuery.jsp" 
                         data-ac-lookup-empty="true" />
                  <div class="input-group-btn">
                     <button type="button" name="close-typeahead" class="btn btn-default">
                       <jalios:icon src="topbar-space-close" css="close-button typeahead-close"/>
                     </button>
                  </div>
                 </div>
                </div>
              </form>
            </div>
          </li>        
        
        
      </ul>
    </div><!-- /.navbar-collapse -->    
  </div>
</div>  