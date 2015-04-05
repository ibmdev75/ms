<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/admin/doAdminHeader.jspf' %><%

String sep = System.getProperty("path.separator");

StringBuffer sb = new StringBuffer(2048);

sb.append(new File(channel.getWebInfPath("classes"))).append(sep);

File libDir = new File(channel.getWebInfPath("lib"));
sb.append(libDir.getAbsolutePath() + File.separator + "*");
/*
String[] list = libDir.list();
for (int i = 0; i < list.length; i++) {
  sb.append(new File(libDir, list[i])).append(sep);
}
*/
String cp = sb.toString();
String osName = System.getProperty("os.name");
%>
<% if (osName.toLowerCase().indexOf("windows") > -1) { %>
<h1>JCMS environment variables for Windows</h1>
Open a cmd, and cut&paste the content of the following textarea<br />
<textarea cols=80 rows=10 warp="virtual">
set JAVA_HOME=<%= System.getProperty("java.home") %>
set CLASSPATH=<%= cp %>
</textarea>
<% } else { %>
<h1>JCMS environment variables for Unix (sh/ksh/bash)</h1>
Open a sh/ksh/bash session and cut&paste the content of the following textarea<br />
<textarea cols=80 rows=10 warp="virtual">
export JAVA_HOME=<%= System.getProperty("java.home") %>
export CLASSPATH=<%= cp %>
</textarea>

<h1>JCMS environment variables for Unix (csh/tcsh)</h1>
Open a csh/tcsh session and cut&paste the content of the following textarea<br />
<textarea cols=80 rows=10 warp="virtual">
setenv JAVA_HOME <%= System.getProperty("java.home") %>
setenv CLASSPATH <%= cp %>
</textarea>
<% } %>
<%@ include file='/admin/doAdminFooter.jspf' %>
