<%--
  @Summary: Article's Full Display
  @Deprecated: False
  @Customizable: True
  @Requestable: False
  @Category: Customized
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
Article article = (Article)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
Content[] relatedContents = article.getRelatedContents();
%><%@ include file="/front/doFullDisplay.jspf" %>

<% Publication pub = article; %>
<%@ include file="/front/publication/doPublicationOrientedImage.jspf" %>

<div class="fulldisplay Article" itemscope="itemscope" itemtype="http://schema.org/Article">

  <% if (hasImage && isLandscape) { %>
    <%-- LANDSCAPE PICTURE --%> 
    <div class="article-picture orientation-landscape">
      <meta itemprop="image" content="<%= dataImage %>" />
      <img src="<%= dataImage %>" class="img-thumbnail" title="<%= dataImageTitle %>" alt="" />
    </div>
  <% } %>

  <div class="article-body">
    <div class="publication-header">
      <%-- TITLE --%> 
      <h1 class="publication-title" <%= gfla(article, "title") %> itemprop="name"><%= article.getTitle(userLang) %></h1>
    </div>
  
    <% if (hasImage && !isLandscape) { %>
      <div class="article-picture<%= isPortrait ? " orientation-portrait" : " orientation-default" %>">
        <meta itemprop="image" content="<%= dataImage %>" />
        <img src="<%= dataImage %>" class="img-thumbnail" title="<%= dataImageTitle %>" alt="" />
      </div>
    <% } %>
  
    <% if (Util.notEmpty(article.getIntro(userLang))) { %>
      <div class="article-intro lead" <%= gfla(article, "intro") %> itemprop="headline">
        <jalios:wiki data="<%= article %>" field="intro"><%= article.getIntro(userLang) %></jalios:wiki>
      </div>
    <% } %>
  
    <div class="article-content clearfix" itemprop="articleBody">
      <jalios:wysiwyg><%= article.getContent(userLang) %></jalios:wysiwyg>
    </div>

    <%-- Related Contents --%>
    <% if (Util.notEmpty(relatedContents)) { %>
      <%-- 1. Put (visible only) related contents in a Buffer --%>
      <jalios:buffer name="relatedContentBuffer">
        <% for (Content relatedContent : relatedContents) { %>
          <% if (relatedContent != null && relatedContent.canBeReadBy(loggedMember)) { %>
          <li>
            <%= relatedContent.getDataIconHtml(userLang) %>
            <jalios:link data="<%= relatedContent %>" />
          </li>
          <% } %>
        <% } %>
      </jalios:buffer>
      <%-- 2. If buffer is not empty, wrap it --%>
      <% if (Util.notEmpty(relatedContentBuffer.toString())) { %>
      <div class="article-related-content">
        <h2 class="field-label"><%= glp("types.Article.fields.relatedContents.label") %></h2>
        <ul><%= relatedContentBuffer.toString() %></ul>
      </div>
      <% } %>
    <% } %>

    <%-- METADATA --%>
    <% pub = article; %>
    <%@ include file="/front/publication/doPublicationMeta.jspf" %>
  </div>
</div>