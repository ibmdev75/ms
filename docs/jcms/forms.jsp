<% request.setAttribute("title", "UI Documentation - Forms"); %>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>
<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>JCMS Forms</h1>
    <p>The JCMS components you can use to build your forms.</p>
  </div>
</div>

<div class="container bs-docs-container forms-ajax-refresh" data-jalios-ajax-refresh-url="docs/jcms/formsAjax.jsp">
  <div class="row">
    <div class="col-md-9" role="main">
      <form class="noSingleSubmitButton" onsubmit="return false;">
        <jalios:include jsp="/docs/jcms/forms/forms_section_introduction.jsp" />
        <jalios:include jsp="/docs/jcms/forms/forms_section_text.jsp" />
        <jalios:include jsp="/docs/jcms/forms/forms_section_widget.jsp" />
        <jalios:include jsp="/docs/jcms/forms/forms_section_chooser.jsp" />
        <jalios:include jsp="/docs/jcms/forms/forms_section_advanced.jsp" />
      </form>
      <div class="bs-docs-section form-horizontal">
        <h1 id="ajax-reload" class="page-header">refresh whole page in ajax : <a href="docs/jcms/forms/formsAjax.jsp" class="btn btn-default popup-lg" onclick="return false;">Ajax Reload</a></h1>
      </div>
    </div><%-- EOF .col-md-9 --%>
    
    <div class="col-md-3">
       <%@ include file="/docs/jcms/sidemenu.jspf" %>
    </div>
  </div>
</div>
<jalios:include jsp='/docs/jcms/common/doDocsFooter.jsp' />