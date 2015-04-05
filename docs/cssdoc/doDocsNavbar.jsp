<% String active = (String) request.getAttribute("docs-active"); %>
<!-- Navbar
================================================== -->
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="./index.jsp">Bootstrap</a>
      <div class="nav-collapse">
        <ul class="nav">
          <li class='<%= "jcms".equals(active)        ? "active" : "" %>'><a href="docs/cssdoc/docs.jsp">JCMS Framework</a></li>
          <li class="<%= "index".equals(active)       ? "active" : "" %>"><a href="docs/lib/bootstrap/index.html" target="_blank">Bootstrap</a></li>
          <li class="<%= "scaffolding".equals(active) ? "active" : "" %>"><a href="docs/lib/bootstrap/scaffolding.html" target="_blank">Scaffolding</a></li>
          <li class="<%= "base".equals(active)        ? "active" : "" %>"><a href="docs/lib/bootstrap/base-css.html" target="_blank">Base CSS</a></li>
          <li class="<%= "components".equals(active)  ? "active" : "" %>"><a href="docs/lib/bootstrap/components.html" target="_blank">Components</a></li>
          <li class="<%= "javascript".equals(active)  ? "active" : "" %>"><a href="docs/lib/bootstrap/javascript.html" target="_blank">Javascript plugins</a></li>
          <li class="<%= "less".equals(active)        ? "active" : "" %>"><a href="docs/lib/bootstrap/less.html" target="_blank">Using LESS</a></li>
          <%-- <li class="divider-vertical"></li> --%>
          <%-- <li class=""><a href="./download.jsp">Customize</a></li> --%>
          <%-- <li class=""><a href="./examples.jsp">Examples</a></li>  --%>
        </ul>
      </div>
    </div>
  </div>
</div>
