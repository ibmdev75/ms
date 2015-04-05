<%@ include file='/jcore/doInitPage.jspf'%>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="homepage-welcome">

  <%-- JUMBOTRON --%>
  <div class="jumbotron">
    <h1><%= glp("ui.homepage.welcome.jumbotron.title") %></h1>
    <p class="lead"><%= glp("ui.homepage.welcome.jumbotron.text") %></p>
    <p>
      <a role="button" href="http://community.jalios.com/jcms9" class="btn btn-lg btn-primary"><%= glp("ui.homepage.welcome.jumbotron.btn") %></a>
    </p>
  </div>
  
  <%-- NEWS --%>
  <div class="homepage-news row">
    <%-- RWD --%>
    <div class="col-md-4 homepage-news-box text-center">
      <div class="homepage-big-icon homepage-big-icon-blue">
        <jalios:icon src="glyph: icomoon-display3" />
      </div>
      <h2><%= glp("ui.homepage.welcome.news.rwd.title") %></h2>
      <p><%= glp("ui.homepage.welcome.news.rwd.text") %></p>
      <a href="http://community.jalios.com/jcms9-rwd" class="btn btn-default"><%= glp("ui.homepage.welcome.news.btn-more") %></a>
    </div>
  
    <%-- UX --%>
    <div class="col-md-4 homepage-news-box text-center">
      <div class="homepage-big-icon homepage-big-icon-green">
        <jalios:icon src="glyph: icomoon-paint-format" />
      </div>
      <h2><%= glp("ui.homepage.welcome.news.ux.title") %></h2>
      <p><%= glp("ui.homepage.welcome.news.ux.text") %></p>      <p>
      <a href="http://community.jalios.com/jcms9-ux" class="btn btn-default"><%= glp("ui.homepage.welcome.news.btn-more") %></a>
    </div>
  
    <%-- NEW FEATURES --%>
    <div class="col-md-4 homepage-news-box text-center">
      <div class="homepage-big-icon homepage-big-icon-orange">
        <jalios:icon src="glyph: icomoon-rocket" />
      </div>
      <h2><%= glp("ui.homepage.welcome.news.features.title") %></h2>
      <p><%= glp("ui.homepage.welcome.news.features.text") %></p>
      <a href="http://community.jalios.com/jcms9-features" class="btn btn-default"><%= glp("ui.homepage.welcome.news.btn-more") %></a>
    </div>
  
  </div>

</div>