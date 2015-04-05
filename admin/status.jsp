<%--
  @Summary: Display information about JCMS
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.0 
--%><%--
--%><%@ page import="custom.*,generated.*, com.jalios.jcms.context.*, com.jalios.jcms.*, com.jalios.jcms.archive.*, com.jalios.jcms.portlet.*, com.jalios.jcms.workspace.*, com.jalios.util.*, com.jalios.util.diff.*, java.io.*, java.util.*, java.text.*, java.net.*,org.apache.log4j.Logger, com.jalios.jcms.taglib.*" %><%--
--%><%@ taglib uri="jcms.tld" prefix="jalios" %><%--
--%><%!
	Channel channel;
  Logger logger;
  ServletContext context;
	public void jspInit() {
	 context = getServletConfig().getServletContext();
	 channel = Channel.getChannel();
   logger = Logger.getLogger("jsp.status_jsp");
	}
%><%@ include file='/jcore/doInitFunc.jspf' %><%

if (!JcmsUtil.isAuthorizedToAccessStatusInfo(context, request)) {
  JcmsUtil.logSecurityIssue(logger, "Forbidden acces to status.jsp from " + request.getRemoteAddr());
  response.sendError(403, "You are not allowed to access this resource.");
  return;
}

if (logger.isDebugEnabled()) { logger.debug(ServletUtil.getUrl(request)); }

response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");

// Set contextPath, baseURL and securedBaseURL if needed
if (channel != null && channel.isReverseProxyEnabled()) {
  channel.processReverseProxyRequest(request);
}


  boolean isChannelOK = (channel != null && channel.isAvailable());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%= ServletUtil.getBaseUrl(request) %>"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" href="css/jalios/core/bootstrap.css" type="text/css"/>
  <link rel="stylesheet" href="css/jalios/core/core.css" type="text/css"/>
  <link rel="stylesheet" href="css/jalios/core/channel.css" type="text/css"/>
  <link rel="stylesheet" href="css/jalios/core/admin.css" type="text/css"/>
  <link rel="shortcut icon" href="images/jalios/icons/jalios.ico"/>
  <title>JCMS Status Page</title>
</head>
<body>
<div style="margin: 10px;">

<div class="page-header"><h1><%= isChannelOK ? "JCMS is running..." : "JCMS is not running..." %></h1></div>

<% int counter = 0; %>
<table class="table-data table-condensed auto">
  <tr> 
    <th colspan="2">Application Server Info</th>
  </tr>
  <tr> 
    <td nowrap="nowrap">App. Server</td>
    <td class="text-right"><%= context.getServerInfo() %></td>
  </tr>
  <tr> 
      <td nowrap="nowrap">Context Path</td>
    <td class="text-right"><%= request.getContextPath() %></td>
  </tr>
  <tr> 
    <td nowrap="nowrap">JVM</td>
    <td class="text-right">
       <%= System.getProperty("java.vm.name") %> (<%= System.getProperty("java.vm.version") %>)<br />
       <%= System.getProperty("java.vm.vendor") %><br />
<%       
  long freeMemory = Runtime.getRuntime().freeMemory();
  long totalMemory = Runtime.getRuntime().totalMemory();
  String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, new Locale("en", "us")); 
  String totalMemoryStr = Util.formatFileSize(totalMemory, new Locale("en", "us")); 
  int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);
%>
       <%= usedMemoryStr %> / <%= totalMemoryStr %> (<%= percentMemory %>%)
    </td>
  </tr>
  <tr> 
    <td nowrap="nowrap">Operating System</td>
    <td class="text-right">
      <%= System.getProperty("os.name") %> <%= System.getProperty("os.version") %> (<%= System.getProperty("os.arch") %>)<br />
    </td>
  </tr>
  <tr> 
	  <td nowrap="nowrap">Java Home</td>
	  <td class="text-left"><%= System.getProperty("java.home") %></td>
	</tr>
  <tr> 
	  <td nowrap="nowrap">Temp. dir.</td>
	  <td class="text-left"><%= System.getProperty("java.io.tmpdir") %></td>
	</tr>
</table>

<p></p>

<% String failureExplanation = (String) context.getAttribute("failureExplanation"); %>

<%-- ** JCMS NOT Started **************************************** --%>
<% if (failureExplanation != null) { %>
<table class="table-data table-condensed auto">
  <tr> 
    <th>JCMS Infos</th>
  </tr>
  <tr> 
    <td>
      <img src="images/jalios/icons/error.gif" alt="" align="left" hspace="4" vspace="4" />
	    <span style="color: red">
	     <b>JCMS could not be started </b>
       <span style="font-size: 80%"><% if (channel == null) {%> (channel == null)<% }%></span><br />
	     <%= failureExplanation %><br />
      </span><br />
      <span style="font-size: 80%">Refer to JCMS logs for more informations.</span>
    </td>
  </tr>
</table>

<%-- ** JCMS started successfully ****************************************** --%>
<% } else { %>
<table class="table-data table-condensed auto">
  <tr> 
    <th colspan="2">JCMS Infos</th>
  </tr>
  <tr> 
    <td nowrap="nowrap">Name</td>
    <td class="text-right"><%= channel.getName() %></td>
  </tr>
  <tr> 
    <td nowrap="nowrap">URID</td>
    <td class="text-right"><%= channel.getUrid() %></td>
  </tr>
  <tr> 
    <td nowrap="nowrap">JCMS Version</td>
    <td class="text-right"><%= channel.getJcmsInfo().getVersion() %></td>
  </tr>
  <tr> 
    <td nowrap="nowrap"><% /* %>Last restart<% */ %><%= glp("ui.adm.ch-status.ch.jcms.last") %></td>
    <td class="text-right"> <%= (Date) context.getAttribute("channelLastRestart") %><br />
      (<jalios:duration begin='<%= (Date) context.getAttribute("channelLastRestart")%>' end='<%= new Date() %>'/>) 
    </td>
  </tr>
</table>
<p>
<a href="admin/">Admin Area</a> - <a href="work/">Work Area</a> - <a href="index.jsp">Front office</a>
</p>
<% }%><%-- end jcms started --%>
</div>
  <script language="JavaScript" src="js/lib/prototype.js" type="text/javascript"></script>
  <script language="JavaScript" src="js/tabpane.js"       type="text/javascript"></script>
  <script language="JavaScript" src="js/jalios/util.js"   type="text/javascript"></script>
  <script language="JavaScript" src="js/channel.js"       type="text/javascript"></script>
  <script language="JavaScript" src="js/custom.js"        type="text/javascript"></script>
</body>
</html>
