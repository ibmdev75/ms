<%--
  @Summary: Packs all javascripts in only one stream and cache them in memory.
    This improves client side performance by reducing numbers of request needed for one page.
  @Author: Olivier Jaquemet
  @Customizable: False
  @Since: jcms-5.7 
--%><%@ include file="/jcore/doInitPage.jspf" %><%

  // Cache for 10 days by default or use expiration delay specified on properties (on both server and client side)
  final long CACHE_TIMEOUT = channel.getLongProperty("channel.packer.cache-expiration", 10) * 24 * 60; // convert days in minutes

  // A. Parameters
  String[] jsFiles = getStringParameterValues("js", "^[a-zA-Z0-9\\-\\.\\_/]*$");
  if (Util.isEmpty(jsFiles)) {
    return;
  }

  // B. Write Headers
  response.setContentType("text/javascript; charset=UTF-8");
  response.setDateHeader("Expires", System.currentTimeMillis() + (CACHE_TIMEOUT * 1000 * 60));
  
  // C. Setup cache id (from queryString)
  StringBuffer cacheIdSb = new StringBuffer(ServletUtil.getQueryString(request, false));
  final String cacheId = "jspacker_" + cacheIdSb.length() + "_" + jsFiles.length + "_" + cacheIdSb.toString().replaceAll("%2F", "_");
  
  // --------------------------------------------------------
  // D. Generate content, cache it and send it
  
  %><jalios:cache id='<%= cacheId %>' timeout='<%= CACHE_TIMEOUT %>' configuration='<%= "jspacker" %>'><%

  logger.debug("Packing JavaScript files : '" + Util.join(jsFiles, "', '") +"'");

  // 1. Build js file
  com.jalios.jcms.tools.JsPacker jsPacker = new com.jalios.jcms.tools.JsPacker();
  String jsContent = jsPacker.getFilePack(jsFiles);

  // 2. Write content
  out.print(jsContent);
 
  %></jalios:cache><%
  
%>