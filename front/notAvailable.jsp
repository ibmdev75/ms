<%--
  @Summary: page used to restart channel and wait for it
  @Category: Channel
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.0.0
--%><%@ include file='/jcore/doInitPage.jspf' %><%

// Attributes (set by restart.jsp)
boolean restartAsked  = Util.toBoolean(request.getAttribute("restart"), false);

// Parameters
String redirectUrl = Util.getString(getValidHttpUrl("redirect"), (restartAsked ? "admin/admin.jsp" : ""));
if (!redirectUrl.startsWith("http") && !redirectUrl.startsWith("/")) {
  redirectUrl = ServletUtil.getBaseUrl(request) + redirectUrl;
}

// do not allow restart if not admin
if (restartAsked && !isAdmin) { 
  JcmsJspContext.sendForbidden(request, response);
  return;
}
  
// directly redirect if no restart has been asked and channel is available
if (channel.isAvailable() && !restartAsked) {
  JcmsJspContext.sendRedirect(redirectUrl, request, response);
  return;
}

boolean restartSupported = channel.getAppServerInfo().isRestartSupported();
if (restartAsked && !restartSupported && isAdmin) {
  String cannotRestartMsg = glp("msg.js.cannot-restart");
  jcmsContext.setWarningMsgSession(cannotRestartMsg.replaceAll("\\\\n", "<br />"));
  JcmsJspContext.sendRedirect(redirectUrl, request, response);
  return;
}

%>
<html>
  <head>
   <base href="<%= ServletUtil.getBaseUrl(request) %>">
   <title><%= channel.getName() %></title>
   <script src="js/lib/prototype.js" type="text/JavaScript" language="JavaScript"></script>
   <link rel="stylesheet" href="css/jalios/msgbox.css" type="text/css" media="all" />
  </head>
  <body>
    <div align='center'>
      <div class="mbox mboxInfo" align='left'>
        <jalios:icon css="mbox" src="information" alt='<%= glp("msg.message-box.info") %>'/>
        <div class="mboxTitle"><%= glp("msg.message-box.info") %></div>
        <div class="mboxMsg">
          <div><%= glp(restartAsked ? "msg.restart" : "msg.not-available", channel.getName()) %></div>
          <div align='center'><jalios:icon src='wait'/></div>
        </div>
      </div>
    </div>
    <script language='JavaScript' type='text/javascript'>
      var checkSiteAvailable = function() {
				new Ajax.Request('<%= encodeForJavaScript(ServletUtil.getBaseUrl(request)) %>admin/status.jsp?t='+ (new Date()).getTime(), {
          onComplete: function(transport) {
            if (200 == transport.status) { document.location = '<%= encodeForJavaScript(redirectUrl) %>'; }
            else { checkSiteAvailable.delay(3); }
          }
				});
      }
      checkSiteAvailable.delay(3);
    </script>
  </body>
</html>
<%
  out.flush();

  if (restartAsked && restartSupported) {
    channel.restart();
  }
%>