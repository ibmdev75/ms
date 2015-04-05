<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% String section = getUntrustedStringParameter("section", null); %>
<jsp:include page="/docs/jcms/common/doDocsHeader.jsp" />
<jalios:modal>
  <% if("introduction".equals(section)) { %>
    <jalios:include jsp="/docs/jcms/forms/forms_section_introduction.jsp" />
  <% } else if("text".equals(section)) { %>
    <jalios:include jsp="/docs/jcms/forms/forms_section_text.jsp" />
  <% } else if("chooser".equals(section)) { %>
    <jalios:include jsp="/docs/jcms/forms/forms_section_chooser.jsp" />
  <% } else if("widget".equals(section)) { %>
    <jalios:include jsp="/docs/jcms/forms/forms_section_widget.jsp" />
  <% } else if("advanced".equals(section)) { %>
    <jalios:include jsp="/docs/jcms/forms/forms_section_advanced.jsp" />
  <% } else { %>
    <jalios:message level="<%= MessageLevel.WARN %>" msg="No content" dismissable="false" title="" />
  <% } %>
</jalios:modal>
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />