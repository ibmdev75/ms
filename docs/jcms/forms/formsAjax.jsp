<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/forms/formsAjax.jsp")); %>
<% if(!jcmsContext.isAjaxRequest()) { %>
<jalios:include jsp="/docs/jcms/common/doDocsHeader.jsp" />
<% } %>

<div id="ajax-example" class="bs-example">
  <% if(!jcmsContext.isAjaxRequest()) { %>
  <div class="example-ignore">
    <div class="highlight"><pre><code><%= exampleMap.get("ajax-example") %></code></pre></div>
  </div>
  <div class="navbar navbar-default">
    <div class="container-fluid">
      <a href="docs/jcms/formsAjax.jsp" data-jalios-ajax-refresh="nofocus waiting nohistory" data-jalios-target=".forms-ajax-refresh" class="ajax-refresh btn btn-default navbar-btn">Ajax Reload</a>
    </div>
  </div>
  <% } %>
  
  <div class="container bs-docs-container forms-ajax-refresh" data-jalios-ajax-refresh-url="docs/jcms/forms/formsAjax.jsp">
    <% if(jcmsContext.isAjaxRequest()) { %>
      <jalios:message msg="Your page has been successfully ajax reloaded" />
      <jalios:include jsp="/docs/jcms/forms/forms_section_introduction.jsp" />
      <jalios:include jsp="/docs/jcms/forms/forms_section_text.jsp" />
      <jalios:include jsp="/docs/jcms/forms/forms_section_widget.jsp" />
      <jalios:include jsp="/docs/jcms/forms/forms_section_chooser.jsp" />
      <jalios:include jsp="/docs/jcms/forms/forms_section_advanced.jsp" />
    <% } %>
  </div>
</div>

<% if(!jcmsContext.isAjaxRequest()) { %>
<jalios:include jsp="/docs/jcms/common/doDocsFooter.jsp" />
<% } %>