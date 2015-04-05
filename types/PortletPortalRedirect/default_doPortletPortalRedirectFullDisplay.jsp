<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletPortalRedirect display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletPortalRedirect obj = (PortletPortalRedirect)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletPortalRedirect <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field status textfieldEditor  <%= Util.isEmpty(obj.getStatus()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "status", userLang) %><jalios:edit pub='<%= obj %>' fields='status'/></td>
    <td class='field-data' <%= gfla(obj, "status") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getStatus()) %>'>
            <%= obj.getStatus() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field content linkEditor  <%= Util.isEmpty(obj.getContent()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "content", userLang) %><jalios:edit pub='<%= obj %>' fields='content'/></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getContent() != null && obj.getContent().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getContent() %>'/>
            </jalios:if>
    </td>
  </tr>
  <tr class="field redirectForm enumerateEditor  <%= Util.isEmpty(obj.getRedirectForm()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "redirectForm", userLang) %><jalios:edit pub='<%= obj %>' fields='redirectForm'/></td>
    <td class='field-data' <%= gfla(obj, "redirectForm") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getRedirectForm()) %>'>
            <%= obj.getRedirectFormLabel(obj.getRedirectForm(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field url textfieldEditor  <%= Util.isEmpty(obj.getUrl()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "url", userLang) %><jalios:edit pub='<%= obj %>' fields='url'/></td>
    <td class='field-data' <%= gfla(obj, "url") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getUrl()) %>'>
            <%= obj.getUrl() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field redirectPortlet linkEditor  <%= Util.isEmpty(obj.getRedirectPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "redirectPortlet", userLang) %><jalios:edit pub='<%= obj %>' fields='redirectPortlet'/></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getRedirectPortlet() != null && obj.getRedirectPortlet().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getRedirectPortlet() %>'/>
            </jalios:if>
    </td>
  </tr>
  <tr class="field category textfieldEditor  <%= Util.isEmpty(obj.getCategory()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "category", userLang) %><jalios:edit pub='<%= obj %>' fields='category'/></td>
    <td class='field-data' <%= gfla(obj, "category") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCategory()) %>'>
            <%= obj.getCategory() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field dispPortal linkEditor  <%= Util.isEmpty(obj.getDispPortal()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "dispPortal", userLang) %><jalios:edit pub='<%= obj %>' fields='dispPortal'/></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getDispPortal() != null && obj.getDispPortal().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getDispPortal() %>'/>
            </jalios:if>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDescription(userLang)) %>'>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "portletImage", userLang) %><jalios:edit pub='<%= obj %>' fields='portletImage'/></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPortletImage(userLang)) %>'>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cacheType", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheType'/></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheType()) %>'>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cacheSensibility", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheSensibility'/></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheSensibility()) %>'>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "invalidClass", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidClass'/></td>
    <td class='field-data' <%= gfla(obj, "invalidClass") %>>
        <% if (Util.notEmpty(obj.getInvalidClass())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getInvalidClass() %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
            <%= obj.getInvalidClassLabel(itString, userLang) %>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field invalidTime durationEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "invalidTime", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidTime'/></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "behaviorCopy", userLang) %><jalios:edit pub='<%= obj %>' fields='behaviorCopy'/></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBehaviorCopy()) %>'>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssId textfieldEditor  <%= Util.isEmpty(obj.getCssId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cssId", userLang) %><jalios:edit pub='<%= obj %>' fields='cssId'/></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssId()) %>'>
            <%= obj.getCssId() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cssClasses", userLang) %><jalios:edit pub='<%= obj %>' fields='cssClasses'/></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssClasses()) %>'>
            <%= obj.getCssClasses() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field navCategories categoryEditor  <%= Util.isEmpty(obj.getNavCategories(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "navCategories", userLang) %><jalios:edit pub='<%= obj %>' fields='navCategories'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getNavCategories(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getNavCategories(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("j_3"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field exactCategory booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "exactCategory", userLang) %><jalios:edit pub='<%= obj %>' fields='exactCategory'/></td>
    <td class='field-data' >
            <%= obj.getExactCategoryLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- guQcg2mi37pQuFaoYPlRVg== --%>