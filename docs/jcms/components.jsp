<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setAttribute("title", "UI Documentation - UI Components"); %>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>
<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>JCMS UI Components</h1>
    <p>The JCMS components you can use to build you users interfaces: modal, panel, accordions, ...</p>
  </div>
</div>
<div class="container bs-docs-container">
  <div class="row">
    <div class="col-md-9" role="main">
      <jalios:include jsp="/docs/jcms/components/components_modal.jsp" />
      <jalios:include jsp="/docs/jcms/components/components_panel.jsp" />
      <jalios:include jsp="/docs/jcms/components/components_message.jsp" />
      <jalios:include jsp="/docs/jcms/components/components_accordion.jsp" />
      <jalios:include jsp="/docs/jcms/components/components_menu.jsp" />
      <jalios:include jsp="/docs/jcms/components/components_custom.jsp" />
    </div><%-- EOF .col-md-9 --%>
    <div class="col-md-3">
      <%@ include file="/docs/jcms/sidemenu.jspf" %>
    </div>
  </div>
</div>
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />				