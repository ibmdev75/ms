<%--
  @Summary: Portal Redirect content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditPortletPortalRedirectHandler formHandler = (EditPortletPortalRedirectHandler)request.getAttribute("formHandler");
%>
 
  <tr>
    <td>
      <div class="tab-pane" id="PortletPortalRedirect_redirection_tab">
      
        <%-- *** REDIRECT TAB **************************************** --%>
        <div class="tab-page">
          <h2 class="tab"><%= glp("ui.editredirect.tabredirect") %></h2>  
          <jalios:field label="ui.editredirect.redirectto">
            <table class='layout'>
              <tr>
                <td colspan='2' style="min-height: 50px;">
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_HOME, " "+glp("ui.editredirect.home"), false, PortalRedirect.REDIRECT_HOME.equals(formHandler.getAvailableStatus()), false, 0, userLang) %>
                </td>
              </tr>
              <tr>
                <td >
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_URL, " "+glp("ui.editredirect.url"), false, PortalRedirect.REDIRECT_URL.equals(formHandler.getAvailableStatus()), false, 1, userLang) %>
                </td>
                <td>
                <jalios:field  name="url" value='<%= formHandler.getAvailableUrl() %>'>
                  <jalios:control type="<%= ControlType.URL %>" />
                </jalios:field>
                </td>
              </tr>
              <tr>
                <td>
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_CONTENT, " "+glp("ui.editredirect.content"), false, PortalRedirect.REDIRECT_CONTENT.equals(formHandler.getAvailableStatus()), false, 1, userLang) %>
                </td>
                <td>
                 <jalios:field  name="content" value='<%= formHandler.getAvailableContent() %>'>
                  <jalios:control settings='<%= new PublicationSettings().superType(Content.class) %>' />
                </jalios:field>
                </td>
              </tr>
              <tr>
                <td>
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_PORTLET, " "+glp("ui.editredirect.portlet"), false, PortalRedirect.REDIRECT_PORTLET.equals(formHandler.getAvailableStatus()), false, 1, userLang) %>
                </td>
                <td>
                 <jalios:field  name="redirectPortlet" value='<%= formHandler.getAvailableRedirectPortlet() %>'>
                  <jalios:control settings='<%= new PublicationSettings().superType(PortalElement.class) %>' />
                </jalios:field>
                </td>
              </tr>
              <tr>
                <td>
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_FORM, " "+glp("ui.editredirect.form"), false, PortalRedirect.REDIRECT_FORM.equals(formHandler.getAvailableStatus()), false, 1, userLang) %>
                </td>
                <td>
                  <jalios:field>
                    <select name='redirectForm' class="form-control">
                      <option value="">&nbsp;</option>
                      <jalios:foreach collection='<%= channel.getSubTypeList(Form.class, userLang) %>' type='java.lang.Class' name='itClazz'>
                        <jalios:if predicate='<%= isAdmin || workspace.getTypeSet().contains(itClazz) %>'>
                          <% String shortName = Util.getClassShortName(itClazz); %>
                          <option value="<%= shortName %>" <%= shortName.equals(formHandler.getAvailableRedirectForm()) ? "selected" : "" %>><%= channel.getTypeLabel(itClazz, workspace, userLang) %></option>
                        </jalios:if>
                      </jalios:foreach>
                    </select>
                  </jalios:field>
                </td>
              </tr>
              <tr>
                <td colspan='2' style="min-height: 50px;">
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_FIRST_CATEGORY, " "+glp("ui.editredirect.first-child"), false, PortalRedirect.REDIRECT_FIRST_CATEGORY.equals(formHandler.getAvailableStatus()), false, 6, userLang) %>
                </td>
              </tr>
              <tr>
                <td>
                  <%= WidgetUtil.printInputBox(ServletUtil.generateUniqueDOMId(request, "redirectInput"), "status", PortalRedirect.REDIRECT_CATEGORY, " "+glp("ui.editredirect.category"), false, PortalRedirect.REDIRECT_CATEGORY.equals(formHandler.getAvailableStatus()), false, 6, userLang) %>
                </td>
                <td>
                 <jalios:field  name="category" value='<%= channel.getCategory(formHandler.getAvailableCategory()) %>'>
                  <jalios:control type="<%= ControlType.CATEGORY %>" />
                </jalios:field>
                </td>
              </tr>
            </table>
          </jalios:field>
                      
          <%-- DispPortal ------------------------------------------------------------ --%>
         <jalios:field  name="dispPortal" label="ui.editredirect.dispportal" description="ui.editredirect.dispportal.h" value='<%= formHandler.getAvailableDispPortal() %>'>
            <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class) %>' />
          </jalios:field>
			</div> 


      <%-- *** CATEGORY TAB **************************************** --%>
			<div class="tab-page">
			  <h2 class="tab"><%= glp("ui.editredirect.categories") %></h2>

        <%-- NavCategories ------------------------------------------------------------ --%>          
        <% if (formHandler.isFieldEdition("navCategories")) { %>
         <jalios:field  name='cids' label="ui.editredirect.categories" required='true' value='<%= formHandler.getCategorySet(null) %>'>
          <jalios:control settings='<%= new CategorySettings().tree().multiple().root(formHandler.getNavCategoriesRoot()) %>' />
        </jalios:field>
        <% } %>
        
        <%-- ExactCategory ------------------------------------------------------------ --%>
        <% if (formHandler.isFieldEdition("exactCategory")) { %>
        <jalios:field  name="exactCategory" label="ui.editportlet.exaccat" description="ui.editportlet.exaccat.h" value='<%= "" + formHandler.getAvailableExactCategory() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>

			</div> 
    </div>
  </td>
</tr>

<%-- Not Included because should be never used ???      %>
<%-- @ include file='/jcore/portal/doEditCommonPortlet.jspf' --%>

