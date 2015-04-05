<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%@ include file="/jcore/doInitPage.jspf" %>
<%  
jcmsContext.addJavaScript("js/lib/bootstrap/scrollspy.js");
jcmsContext.addJavaScript("js/lib/bootstrap/affix.js");
jcmsContext.addJavaScript("docs/jcms/js/jalios-doc.js");
jcmsContext.addJavaScript("docs/lib/highlight.pack.js");
%>	
<jalios:javascript>
hljs.initHighlighting();
</jalios:javascript>
<%@ include file="/jcore/doEmptyFooter.jspf" %>
