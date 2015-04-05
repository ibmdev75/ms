<%--
  @Summary: Publication result display for Newspaper template
  @Category: Publication Template
  @Author: Sylvain DEVAUX
  @Customizable: False
  @Requestable: False
  @since: jcms-9.0.1
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

Publication pub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);

String displayURLparams = (String)request.getAttribute("displayURLparams");
%>
<%@ include file="/front/publication/doPublicationOrientedImage.jspf" %>

<%
String dataImageTitleAttr = Util.notEmpty(dataImageTitle) ? " title='" + encodeForHTMLAttribute(dataImageTitle) +"'":"";
%>
<%-- Store result's title for possible use at different places --%>
<jalios:buffer name="resultTitle">
  <div class="newspaper-result-title">
    <jalios:link data="<%= pub %>" params="<%= displayURLparams %>" css="noTooltipCard"/>
  </div>
</jalios:buffer>
<div class="newspaper-result-display <%= Util.getClassShortName(pub) %>">

  <%-- Landscape image uses the CSS background-image property, with a "background-size: cover;" rule. --%>
  <% if (hasImage && isLandscape) { %>
    <%
    // The maximum height of data-image
    int limitedHeight = 200;
    %>
    <div class="thumbnail-wrapper orientation-landscape clickable" data-jalios-url="<%= pub.getDisplayUrl(userLocale) %>" style="background-image: url('<%= dataImage %>'); height: <%= limitedHeight %>px;"<%= dataImageTitleAttr %>></div>
  <% } %>

  <div class="newspaper-result-body">

    <% if (!isPortrait) { %>
      <%= resultTitle %>
    <% } %>
    <% if (hasImage && !isLandscape) { %>
      <div class="thumbnail-wrapper<%= isPortrait ? " orientation-portrait" : " orientation-default" %>">
        <a href="<%= pub.getDisplayUrl(userLocale) %>"<%= dataImageTitleAttr %>>
          <img src="<%= dataImage %>" class="img-thumbnail" alt="<%= encodeForHTMLAttribute(dataImageTitle) %>" />
        </a>
      </div>
    <% } %>
    <% if (isPortrait) { %>
      <%= resultTitle %>
    <% } %>

    <% Publication obj = pub; %>
    <%@ include file="/front/publication/doPublicationAbstract.jspf" %>

    <div class="newspaper-result-footer">
      <% if (pub.getPdate() != null) { %>
      <div class="newspaper-result-pdate" title="<%= encodeForHTMLAttribute(glp("ui.work.query.txt.published") + " " + pub.getAuthor().getFullName()) %>">
        <%= glp("ui.com.lbl.pdate") %>
        <%= JcmsUtil.getFriendlyDate(pub.getPdate(), DateFormat.MEDIUM, false, userLocale) %>
      </div>
      <% } %>
    </div>

  </div>
</div>