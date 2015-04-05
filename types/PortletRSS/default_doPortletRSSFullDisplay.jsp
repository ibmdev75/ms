<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletRSS display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletRSS obj = (PortletRSS)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletRSS <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field source urlEditor abstract <%= Util.isEmpty(obj.getSource()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "source", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "source") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getSource()) %>'>
            <a href='<%= obj.getSource() %>' ><%= obj.getSource()%></a>
            </jalios:if>
    </td>
  </tr>
  <tr class="field showTitle booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "showTitle", userLang) %></td>
    <td class='field-data' >
            <%= obj.getShowTitleLabel(userLang) %>
    </td>
  </tr>
  <tr class="field showDescription booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "showDescription", userLang) %></td>
    <td class='field-data' >
            <%= obj.getShowDescriptionLabel(userLang) %>
    </td>
  </tr>
  <tr class="field showImage booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "showImage", userLang) %></td>
    <td class='field-data' >
            <%= obj.getShowImageLabel(userLang) %>
    </td>
  </tr>
  <tr class="field showWebMastersEmail booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "showWebMastersEmail", userLang) %></td>
    <td class='field-data' >
            <%= obj.getShowWebMastersEmailLabel(userLang) %>
    </td>
  </tr>
  <tr class="field showItemsDescription booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "showItemsDescription", userLang) %></td>
    <td class='field-data' >
            <%= obj.getShowItemsDescriptionLabel(userLang) %>
    </td>
  </tr>
  <tr class="field openLinksInNewWindow booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "openLinksInNewWindow", userLang) %></td>
    <td class='field-data' >
            <%= obj.getOpenLinksInNewWindowLabel(userLang) %>
    </td>
  </tr>
  <tr class="field trackingEnabled booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "trackingEnabled", userLang) %></td>
    <td class='field-data' >
            <%= obj.getTrackingEnabledLabel(userLang) %>
    </td>
  </tr>
  <tr class="field refresh durationEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "refresh", userLang) %></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getRefresh() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field maxItems intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "maxItems", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getMaxItems()) %>
    </td>
  </tr>
  <tr class="field skipFirstItems intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "skipFirstItems", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getSkipFirstItems()) %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "description", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDescription(userLang)) %>'>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "portletImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPortletImage(userLang)) %>'>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "cacheType", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheType()) %>'>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "cacheSensibility", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheSensibility()) %>'>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "invalidClass", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "invalidTime", userLang) %></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field displayCSS enumerateEditor  <%= Util.isEmpty(obj.getDisplayCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "displayCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayCSS") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDisplayCSS()) %>'>
            <%= obj.getDisplayCSSLabel(obj.getDisplayCSS(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field width textfieldEditor  <%= Util.isEmpty(obj.getWidth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "width", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "width") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getWidth()) %>'>
            <%= obj.getWidth() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field insetLeft intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "insetLeft", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetLeft()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field insetRight intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "insetRight", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetRight()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field insetTop intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "insetTop", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetTop()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field insetBottom intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "insetBottom", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetBottom()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field cellPadding intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "cellPadding", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCellPadding()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field alignH enumerateEditor  <%= Util.isEmpty(obj.getAlignH()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "alignH", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignH") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAlignH()) %>'>
            <%= obj.getAlignHLabel(obj.getAlignH(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field alignV enumerateEditor  <%= Util.isEmpty(obj.getAlignV()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "alignV", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignV") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAlignV()) %>'>
            <%= obj.getAlignVLabel(obj.getAlignV(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field alignTable enumerateEditor  <%= Util.isEmpty(obj.getAlignTable()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "alignTable", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignTable") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAlignTable()) %>'>
            <%= obj.getAlignTableLabel(obj.getAlignTable(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field border intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "border", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getBorder()) %>&nbsp;px
    </td>
  </tr>
  <tr class="field borderColor colorEditor  <%= Util.isEmpty(obj.getBorderColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "borderColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "borderColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBorderColor()) %>'>
            <%= obj.getBorderColor() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field backColor colorEditor  <%= Util.isEmpty(obj.getBackColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "backColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backColor") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBackColor()) %>'>
            <%= obj.getBackColor() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field backImage imageEditor  <%= Util.isEmpty(obj.getBackImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "backImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBackImage()) %>'>
            <img src='<%= Util.encodeUrl(obj.getBackImage()) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field displayTitle textfieldEditor  <%= Util.isEmpty(obj.getDisplayTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "displayTitle", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayTitle") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDisplayTitle(userLang)) %>'>
            <%= obj.getDisplayTitle(userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field skins textfieldEditor  <%= Util.isEmpty(obj.getSkins()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "skins", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skins") %>>
        <% if (Util.notEmpty(obj.getSkins())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getSkins() %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
              <%= itString %>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field skinCSS enumerateEditor  <%= Util.isEmpty(obj.getSkinCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "skinCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinCSS") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getSkinCSS()) %>'>
            <%= obj.getSkinCSSLabel(obj.getSkinCSS(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field popupState enumerateEditor  <%= Util.isEmpty(obj.getPopupState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "popupState", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "popupState") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPopupState()) %>'>
            <%= obj.getPopupStateLabel(obj.getPopupState(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field expandState enumerateEditor  <%= Util.isEmpty(obj.getExpandState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "expandState", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "expandState") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getExpandState()) %>'>
            <%= obj.getExpandStateLabel(obj.getExpandState(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "behaviorCopy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBehaviorCopy()) %>'>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field originalPortlet linkEditor  <%= Util.isEmpty(obj.getOriginalPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "originalPortlet", userLang) %></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getOriginalPortlet() != null && obj.getOriginalPortlet().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getOriginalPortlet() %>'/>
            </jalios:if>
    </td>
  </tr>
  <tr class="field condition enumerateEditor  <%= Util.isEmpty(obj.getCondition()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "condition", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "cssId", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssId()) %>'>
            <%= obj.getCssId() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "cssClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssClasses()) %>'>
            <%= obj.getCssClasses() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field skinClasses textfieldEditor  <%= Util.isEmpty(obj.getSkinClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletRSS.class, "skinClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getSkinClasses()) %>'>
            <%= obj.getSkinClasses() %>
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- aCN27dNRkKlPFA7vnr5dvg== --%>