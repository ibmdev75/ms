<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setAttribute("title", "UI Documentation - Tab Library"); %>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>

<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>JCMS Tag Library</h1>
    <p>The JCMS Tag Library provides a comprehensive set of
  tag to easily access and present data of a JCMS webapp.</p>  
  </div>
</div>

<div class="container bs-docs-container">
  <div class="row">
    <div class="col-md-9" role="main">
      <%@ include file="/docs/jcms/taglib.jspf" %>
    </div>
    <div class="col-md-3">
      <div class="bs-docs-sidebar hidden-print" role="complementary">
        <ul class="nav bs-docs-sidenav">
        </ul>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />       
