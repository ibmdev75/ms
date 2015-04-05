<%--
  @Summary: Packs all css files in only one stream and cache them in memory.
    This improves client side performance by reducing numbers of request needed for one page.
  @Author: Olivier Jaquemet
  @Customizable: False
  @Since: jcms-5.7 
--%><%@ include file="/jcore/doInitPage.jspf" %><%

  // Cache for 10 days by default or use expiration delay specified on properties (on both server and client side)
  final long CACHE_TIMEOUT = channel.getLongProperty("channel.packer.cache-expiration", 10) * 24 * 60; // convert days in minutes

  // A. Parameters
  String[] cssFiles = getStringParameterValues("css", "^[a-zA-Z0-9\\-\\.\\_/]*$");
  if (Util.isEmpty(cssFiles)) {
    return;
  }

  // B. Write Headers
  response.setContentType("text/css; charset=UTF-8");
  response.setDateHeader("Expires", System.currentTimeMillis() + (CACHE_TIMEOUT * 1000 * 60));
  
  // C. Setup cache id (from queryString)
  StringBuffer cacheIdSb = new StringBuffer(ServletUtil.getQueryString(request, false));
  final String cacheId = "csspacker_" + cacheIdSb.length() + "_" + cssFiles.length + "_" + cacheIdSb.toString().replaceAll("%2F", "_");
  
  // --------------------------------------------------------
  // D. Generate content, cache it and send it
  
  %><jalios:cache id='<%= cacheId %>' timeout='<%= CACHE_TIMEOUT %>' configuration='<%= "csspacker" %>'><%

  logger.debug("Packing CSS files : '" + Util.join(cssFiles, "', '") +"'");

  // 1. Build CSS file
  com.jalios.jcms.tools.CssPacker cssPacker = new com.jalios.jcms.tools.CssPacker("/css/");
  String cssContent = cssPacker.getFilePack(cssFiles);

  // 2. Write content
  out.print(cssContent);
  
  // Provide message for a better configuration of browser limit as reported in JCMS-2816/JCMS-2817
  // - This message will appear only once since it is in the jalios:cache
  // - known limits : this message will only appear if the pack is first created with Internet Explorer
  if (clientBrowser.isIE() && cssContent.length() > 288000) {
    logger.warn("CSS pack of " + cssFiles.length + " files for a total length of " + cssContent.length() + " chars " +
                "exceed Internet Explorer browser limit of 288000bytes. Update properties 'channel.packer.max-size.*'. "+
                "CSS Files : " + Util.join(cssFiles, "', '") +"'");
  }
 
  %></jalios:cache>