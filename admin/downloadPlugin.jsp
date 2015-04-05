<%
  %><%@ include file='/jcore/doInitPage.jspf' %><%
  %><%@ page import="com.jalios.io.IOUtil" %><%
  %><%@ page import="com.jalios.jcms.servlet.BinaryFileServlet" %><%

  if (!checkAccess("admin/operation/plugin-mgr")) { 
    sendForbidden(request, response);
    return;
  }
  
  // Retrieve plugin
  String pluginName = getAlphaNumParameter("name", null);
  Plugin plugin = PluginManager.getPluginManager().getPlugin(pluginName);  
  if (plugin == null) {
    sendForbidden(request, response);
    return;
  }
  
  // Retrieve plugin filename : 
    
  // 1. Only allow characters expected in a plugin filename : "FooBar-1.0.x-alpha.zip"
  //    without "/" to prevent download of subdirectory files
  String fileName = getStringParameter("opDownload", null, "^[a-zA-Z0-9\\-\\._]*\\.zip$");
  if (fileName == null) {
    return;
  }
  
  // 2. Check file exists and belongs to plugin directory
  File file = new File(channel.getRealPath(PluginManager.PLUGIN_PRIVATE_PATH+"/"+fileName));  
  File pluginDir = new File(channel.getRealPath(PluginManager.PLUGIN_PRIVATE_PATH));
  if (!IOUtil.belongsToDirectory(pluginDir, file) || !file.exists()) {
    sendForbidden(request, response);
    return;
  }
	
  // Create a download ticket and redirect client to download servlet
  BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(file, "application/zip", fileName);
  ticket.sendToDownloadUrl(request, response);

%>