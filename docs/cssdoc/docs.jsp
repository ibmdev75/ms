<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%  jcmsContext.addCSSHeader("docs/cssdoc/docs.css"); %>
<%@ include file="/admin/doAdminHeader.jspf" %>
<%@ include file="/jcore/doMessageBox.jspf" %>

<%  request.setAttribute("docs-active","jcms"); %>

<% jcmsContext.addJavaScript("js/lib/bootstrap/bootstrap-scrollspy.js"); %>
<jalios:javascript>
  jQuery('BODY').scrollspy({ target : '.bs-docs-sidebar' });
  jQuery('#docnavbar A').on('click', function(event){
    var idx = this.href.indexOf('#');
    if (idx < 0){ return; }
    window.location.hash = this.href.substring(idx);
    event.preventDefault();
  });
</jalios:javascript>

<div id="docs" class="container">
  <div class="row">
    <div class="col-md-3 bs-docs-sidebar">
	    <ul id="docnavbar" class="nav nav-list bs-docs-sidenav affix">
	      <li class="active"><a href="#intro"><i class="icon-chevron-right"></i> Introduction</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#commons"><i class="icon-chevron-right"></i> Commons</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#togglemanager"><i class="icon-chevron-right"></i> ToggleManager</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#images"><i class="icon-chevron-right"></i> Images</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#lists"><i class="icon-chevron-right"></i> Lists</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#forms"><i class="icon-chevron-right"></i> Forms</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#tables"><i class="icon-chevron-right"></i> Tables</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#box"><i class="icon-chevron-right"></i> Boxes</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#components"><i class="icon-chevron-right"></i> Components</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#layout"><i class="icon-chevron-right"></i> Layout</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#plupload"><i class="icon-chevron-right"></i> Plupload</a></li>
	      <li><a href="docs/cssdoc/docs.jsp#text"><i class="icon-chevron-right"></i> Text</a></li>
	      <li class="special"><a href="docs/jsdoc/index.jsp"><strong><i class="icon-chevron-right"></i> JavaScript</strong></a></li>
	    </ul>
    </div>
    <div class="col-md-9">
    
      <jalios:include jsp="docs/cssdoc/doDocsIntro.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsCommons.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsToggleManager.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsImage.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsList.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsForms.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsTable.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsBox.jsp" />

      <jalios:include jsp="docs/cssdoc/doDocsComponents.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsLayout.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsPlupload.jsp" />
      
      <jalios:include jsp="docs/cssdoc/doDocsText.jsp" />
      
    </div>
  </div>
</div>

<%@ include file="/admin/doAdminFooter.jspf" %>