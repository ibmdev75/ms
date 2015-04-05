<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletMenu display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletMenu obj = (PortletMenu)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletMenu <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field items enumerateEditor  <%= Util.isEmpty(obj.getItems()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "items", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "items") %>>
        <% if (Util.notEmpty(obj.getItems())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getItems() %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
            <%= obj.getItemsLabel(itString, userLang) %>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field itemSeparaor imageEditor  <%= Util.isEmpty(obj.getItemSeparaor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "itemSeparaor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "itemSeparaor") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getItemSeparaor()) %>'>
            <img src='<%= Util.encodeUrl(obj.getItemSeparaor()) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "description", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDescription(userLang)) %>'>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "portletImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPortletImage(userLang)) %>'>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "cacheType", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheType()) %>'>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "cacheSensibility", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheSensibility()) %>'>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "invalidClass", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "invalidTime", userLang) %></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field displayCSS enumerateEditor  <%= Util.isEmpty(obj.getDisplayCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "displayCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayCSS") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDisplayCSS()) %>'>
            <%= obj.getDisplayCSSLabel(obj.getDisplayCSS(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field width textfieldEditor  <%= Util.isEmpty(obj.getWidth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "width", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "width") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getWidth()) %>'>
            <%= obj.getWidth() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field insetLeft intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "insetLeft", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetLeft()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field insetRight intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "insetRight", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetRight()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field insetTop intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "insetTop", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetTop()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field insetBottom intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "insetBottom", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetBottom()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field cellPadding intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "cellPadding", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCellPadding()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field alignH enumerateEditor  <%= Util.isEmpty(obj.getAlignH()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "alignH", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignH") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAlignH()) %>'>
            <%= obj.getAlignHLabel(obj.getAlignH(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field alignV enumerateEditor  <%= Util.isEmpty(obj.getAlignV()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "alignV", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignV") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAlignV()) %>'>
            <%= obj.getAlignVLabel(obj.getAlignV(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field alignTable enumerateEditor  <%= Util.isEmpty(obj.getAlignTable()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "alignTable", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignTable") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAlignTable()) %>'>
            <%= obj.getAlignTableLabel(obj.getAlignTable(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field border intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "border", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getBorder()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field borderColor colorEditor  <%= Util.isEmpty(obj.getBorderColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "borderColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "borderColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBorderColor()) %>'>
            <%= obj.getBorderColor() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field backColor colorEditor  <%= Util.isEmpty(obj.getBackColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "backColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBackColor()) %>'>
            <%= obj.getBackColor() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field backImage imageEditor  <%= Util.isEmpty(obj.getBackImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "backImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBackImage()) %>'>
            <img src='<%= Util.encodeUrl(obj.getBackImage()) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "behaviorCopy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBehaviorCopy()) %>'>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field originalPortlet linkEditor  <%= Util.isEmpty(obj.getOriginalPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "originalPortlet", userLang) %></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getOriginalPortlet() != null && obj.getOriginalPortlet().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getOriginalPortlet() %>'/>
            </jalios:if>
    </td>
  </tr>
  <tr class="field condition enumerateEditor  <%= Util.isEmpty(obj.getCondition()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "condition", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "condition") %>>
        <% if (Util.notEmpty(obj.getCondition())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getCondition() %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
            <%= obj.getConditionLabel(itString, userLang) %>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field cssId textfieldEditor  <%= Util.isEmpty(obj.getCssId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "cssId", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssId()) %>'>
            <%= obj.getCssId() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletMenu.class, "cssClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssClasses()) %>'>
            <%= obj.getCssClasses() %>
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- bSMFaaNq1lrX/aW9KpuAZg== --%>