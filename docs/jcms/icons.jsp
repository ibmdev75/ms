<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setAttribute("title", "UI Documentation - Icons"); %>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>

<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>JCMS Icons</h1>
    <p>The JCMS icon system you must use to declare and use icons.</p>  
  </div>
</div>

<div class="container bs-docs-container">
  <div class="row">
    <div class="col-md-9" role="main">
      <jalios:include jsp="/docs/jcms/icons/icons_intro.jsp" />
      <jalios:include jsp="/docs/jcms/icons/icons_list.jsp" />
    </div><%-- EOF .col-md-9 --%>
    <div class="col-md-3">
      <%@ include file="/docs/jcms/sidemenu.jspf" %>
    </div>
  </div>
</div>
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />       
