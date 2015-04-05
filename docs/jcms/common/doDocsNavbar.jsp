<%@ include file="/jcore/doInitPage.jspf" %>

<!-- Docs master nav -->
<%
	String docsUrl = "docs/jcms/";
%>
<input type="hidden" class="linksurl" value="<%= ServletUtil.getBaseUrl(request) + "" + ServletUtil.getServletPath(request) %>"/>
<header class="navbar navbar-fixed-top bs-docs-nav" id="top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="<%= docsUrl %>index.jsp" class="navbar-brand"><jalios:icon src="topbar-home"/></a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li<%= getUntrustedStringParameter("docNav","").equals("introduction") ? " class=\"active\"" : "" %>>
          <a href="<%= docsUrl %>index.jsp?docNav=introduction">Introduction</a>
        </li>
        <li<%= getUntrustedStringParameter("docNav","").equals("jcmsComponents") ? " class=\"active\"" : "" %>>
          <a href="<%= docsUrl %>components.jsp?docNav=jcmsComponents">UI Components</a>
        </li>
        <li<%= getUntrustedStringParameter("docNav","").equals("jcmsForms") ? " class=\"active\"" : "" %>>
          <a href="<%= docsUrl %>forms.jsp?docNav=jcmsForms">Forms</a>
        </li>
        <li<%= getUntrustedStringParameter("docNav","").equals("lesscss") ? " class=\"active\"" : "" %>>
          <a href="<%= docsUrl %>less_css.jsp?docNav=lesscss">CSS & LESS</a>
        </li>           
        <li<%= getUntrustedStringParameter("docNav","").equals("jcmsJavascript") ? " class=\"active\"" : "" %>>
          <a href="docs/jsdoc/index.jsp?docNav=jcmsJavascript">Javascript</a>
        </li>
        <li<%= getUntrustedStringParameter("docNav","").equals("jcmsIcons") ? " class=\"active\"" : "" %>>
          <a href="<%= docsUrl %>icons.jsp?docNav=jcmsIcons">Icons</a>
        </li>
        <li<%= getUntrustedStringParameter("docNav","").equals("jcmsTaglib") ? " class=\"active\"" : "" %>>
          <a href="<%= docsUrl %>taglib.jsp?docNav=jcmsTaglib">Tag Library</a>
        </li>
      </ul>
    </nav>
  </div>
</header>
<div class="navbar-placeholder"></div>