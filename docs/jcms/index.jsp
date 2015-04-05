<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setAttribute("title", "UI Documentation"); %>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>
<% String docsUrl = "docs/jcms/"; %>

<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>JCMS UI Documentation</h1>
    <p>This documentation is about all the user interface components of JCMS.</p>  
  </div>
</div>

<div class="container bs-docs-container">

  <div class="row">
    <div class="col-md-9" role="main">

      <div class="bs-docs-section">
        <h1 id="introduction" class="page-header">Introduction</h1>
        <p>JCMS is based on <a href="http://getbootstrap.com/">Bootstrap 3.2</a>. Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.</p>
        <p>JCMS provides additionnal components to Bootstrap</p>
        <p>Bootstrap links : </p>        
        <ul><li><a href="http://bootstrapdocs.com/v3.2.0/docs/">Bootstrap 3.2 documentation</a></li></ul>
      </div>
    
    
      <div class="bs-docs-section">
        <h1 id="sections" class="page-header">Sections</h1>

        <h2>CSS & LESS</h2>
        <p>This section describes how to work with LESS and CSS in JCMS<p>
        <p><a href="<%= docsUrl %>less_css.jsp?docNav=lesscss">View details</a></p> 
              
        <h2>UI Components</h2>
        <p>This section describes the JCMS UI components : modal, panel, accordions...<p>
        <p><a href="<%= docsUrl %>components.jsp?docNav=jcmsComponents">View details</a></p> 

        <h2>Forms</h2>
        <p>This section describes all the UI components to build web forms.<p>
        <p><a href="<%= docsUrl %>forms.jsp?docNav=jcmsForms">View details</a></p> 
        
        <h2>Javascript</h2>
        <p>This section contains the documentation of all the Javascript functions.<p>
        <p> <a href="docs/jsdoc/index.jsp?docNav=jcmsJavascript">View details</a></p> 
        
        <h2>Icons</h2>
        <p>This section describes the JCMS Icon System.<p>
        <p><a href="<%= docsUrl %>icons.jsp?docNav=jcmsIcons">View details</a></p> 
          
        <h2>Taglib</h2>
        <p>This section contains the documentation of all the JCMS Tags.<p>
        <p><a href="<%= docsUrl %>taglib.jsp?docNav=jcmsTaglib">View details</a></p> 
      
      </div>
    </div><%-- EOF .col-md-9 --%>
    <div class="col-md-3">
      <%@ include file="/docs/jcms/sidemenu.jspf" %>
    </div>
  </div>
  
</div>
  
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />