<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setAttribute("title", "UI Documentation - UI Components"); %>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>
<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>CSS & LESS</h1>
    <p>How to use CSS and LESS in JCMS.</p>
  </div>
</div>
<div class="container bs-docs-container">
  <div class="row">
    <div class="col-md-9" role="main">
      <jalios:include jsp="/docs/jcms/lesscss/less_css.jsp" />
    </div><%-- EOF .col-md-9 --%>
    <div class="col-md-3">
      <%@ include file="/docs/jcms/sidemenu.jspf" %>
    </div>
  </div>
</div>
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />       