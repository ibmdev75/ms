<%--

  @Summary: this JSP packs all the tinyMCE js in only one stream.
  @Author: Olivier Jaquemet
  @Customizable: True
  @Since: jcms-6.0 
              
--%><%@ page import="java.io.*,java.util.zip.*" %><%--
--%><%@ include file="/jcore/doInitPage.jspf" %><%

  // A. Options

  boolean useJSSources = Util.toBoolean(channel.getProperty("wysiwyg.tinymce.use-source", ""), false);
  boolean forceCacheRefresh = false; // set to true when developping, set to false for release
  
  boolean useDiskCache = getBooleanParameter("diskcache", true);
  long cacheTimeout = channel.getLongProperty("wysiwyg.tinymce.pack.duration", 14400) /* minutes */; // Cache on both server and client side (10 days by default)

  String[] plugins = channel.getProperty("wysiwyg.tinymce.plugins", "").split(",");
  String[] languages = (String[]) channel.getLocalizedLanguageList().toArray(new String[channel.getLocalizedLanguageList().size()]);
  String[] themes = { "simple", "advanced" };
  String[] customFiles = {};
  
  // For languages code, apply mapping between JCMS language code and TinyMCE one (eg zh-Hant --> th-tw)
  for (int langIdx = 0; langIdx < languages.length; langIdx++) {
    languages[langIdx] = channel.getProperty("wysiwyg.tinymce.languagekey-mapping." + languages[langIdx], languages[langIdx]);
  } 

  // B. Write Headers
  response.setContentType("text/javascript; charset=UTF-8");
  response.setDateHeader("Expires", System.currentTimeMillis() + (cacheTimeout * 1000 * 60));
  
  // C. Setup cache id (from current url and from custom included files)
  StringBuffer cacheIdSb = new StringBuffer(ServletUtil.getUrl(request));
  for (int i=0; i<customFiles.length; i++) {
    cacheIdSb.append(customFiles[i]);
  }
  final String cacheId = "tiny_mce_pack_" + Util.cryptMD5(cacheIdSb.toString());
  
  // --------------------------------------------------------
  // D. Cache and send content
  
  %><jalios:cache id="<%= cacheId %>" timeout="<%= cacheTimeout %>" refresh="<%= forceCacheRefresh %>"><%

  // 1. Build js file
  String jsContent = buildJS(request, useJSSources, languages, themes, plugins, customFiles);

  // 2. Write content
  out.print(jsContent);
 
  %></jalios:cache><%
  
%><%!
  // --------------------------------------------------------

  public String buildJS(HttpServletRequest request, boolean useSources, String[] languages, String[] themes, String[] plugins, String[] custom) {
    String suffix = useSources ? "_src" : "";
    
    StringBuffer sb = new StringBuffer();

    sb.append(" tinyMCEPreInit = {\n");
    sb.append("   suffix : '").append(suffix).append("',\n");
    sb.append("   base : '").append(ServletUtil.getBaseUrl(request)).append("js/tiny_mce',\n");
    sb.append("   query : '").append("").append("'\n");
    sb.append(" };\n");
    
    // 1. Add core
    sb.append(getFileContent("tiny_mce" + suffix + ".js"));

    // 2. Prepare list of files that will be added
    ArrayList<String> fileList = new ArrayList<String>();
    // - Core languages
    for (int x=0; x<languages.length; x++) {
      fileList.add("langs/" + languages[x] + ".js");
    }
    // - Themes
    for (int i=0; i<themes.length; i++) {
      fileList.add("themes/" + themes[i] + "/editor_template" + suffix + ".js");
      
      for (int x=0; x<languages.length; x++) {
        fileList.add("themes/" + themes[i] + "/langs/" + languages[x] + ".js");
      }
    }
    // - plugins
    for (int i=0; i<plugins.length; i++) {
      fileList.add("plugins/" + plugins[i] + "/editor_plugin" + suffix + ".js");

      for (int x=0; x<languages.length; x++) {
        fileList.add("plugins/" + plugins[i] + "/langs/" + languages[x] + ".js");
      }
    }
    
    // 3. Patch loading functions
    sb.append("/* file:js/tiny_mce/tiny_mce_pack.jsp */\n");
    sb.append("(function() {\n");
    sb.append(" var sl = sl = tinymce.ScriptLoader;\n");
    sb.append(" function load(u) {\n");
    sb.append("   sl.markDone('").append(ServletUtil.getBaseUrl(request)).append("js/tiny_mce/' + u);\n");
    sb.append(" };\n");
    for (String filePath : fileList) {
      sb.append(" load('").append(filePath).append("');\n");
    }
    sb.append("})();\n");
    
    // 4. Add files list (core languages/themes/plugins)
    for (String filePath : fileList) {
      sb.append(getFileContent(filePath));
    }

    // 5. Add custom files
    for (int i=0; i<custom.length; i++) {
      sb.append(getFileContent(custom[i]));
    }
    
    return sb.toString();
  }

  public String getFileContent(String tinyMceRelativePath) {
    try {
      String path = channel.getRealPath("/js/tiny_mce/" + tinyMceRelativePath);
      return org.apache.commons.io.FileUtils.readFileToString(new File(path), "utf-8"); 
    } catch (IOException ex) {
      logger.debug(ex);
    }
    return "";
  }

%>