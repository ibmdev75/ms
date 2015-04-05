<%@page import="com.jalios.jcms.upload.UploadManager"%>
<%@ include file="/jcore/doInitPage.jspf" %><% 

jcmsContext.addCSSHeader("docs/jcms/css/docs.css");
jcmsContext.addCSSHeader("docs/jcms/css/github.css");
UploadManager.getInstance().addUploadComponentScripts(jcmsContext);

%><%@ include file="/jcore/doEmptyHeader.jspf" %>