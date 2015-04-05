<%-- 
 Output I18N strings (all I18N properties prefixed with 'js.') in a JavaScript format. 
 - Cached on both client and server side using the same properties used by css/js packer.
 - Loaded by jalios-i18n.js
 @since jcms-8.0.0 / JCMS-3328
--%><%@ include file="/jcore/doInitPage.jspf" %><%

  // Cache for 10 days by default or use expiration delay specified on properties (on both server and client side)
  final long CACHE_TIMEOUT = channel.getLongProperty("channel.packer.cache-expiration", 10) * 24 * 60; // convert days in minutes
  
  // A. Parameters
  String lang = getAlphaNumParameter("lang", userLang);
  if (!channel.getLocalizedLanguageList().contains(lang)) {
    lang = channel.getLanguage();
  }
      
  // B. Write Headers
  response.setContentType("text/javascript; charset=UTF-8");
  response.setDateHeader("Expires", System.currentTimeMillis() + (CACHE_TIMEOUT * 1000 * 60));
  
  // C. Setup cache id (from queryString)
  final String cacheId = "js_I18N_" + lang;
%><jalios:cache id='<%= cacheId %>' timeout='<%= CACHE_TIMEOUT %>' 
                trim='<%= true %>' refresh='<%= false %>'>
var I18N = {
  
  lang : "<%= encodeForJavaScript(lang) %>",
  'lang.tinymce' : "<%= encodeForJavaScript(channel.getProperty("wysiwyg.tinymce.languagekey-mapping." + lang, lang)) %>",
  'lang.datepicker' : "<%= encodeForJavaScript(channel.getProperty("datepicker.languagekey-mapping." + lang, lang)) %>",
  
  glp : function(prop) {
    var msg  = I18N[prop];
    if (!msg){ return prop; }
    
    for (var i = 1 ; i < arguments.length ; i++){
      msg = msg.replace('{'+(i-1)+'}',arguments[i]);
    }
    
    return msg;
  },
<%
  final String javascriptI18NstringsPrefix = lang + ".js.";
  Map<String,String> properties = channel.getSortedProperties(javascriptI18NstringsPrefix);
  for (Map.Entry<String,String> entry : properties.entrySet()) {
    final String propertyName = entry.getKey().substring(javascriptI18NstringsPrefix.length());
    final String propertyValue = entry.getValue(); %>
  '<%= encodeForJavaScript(propertyName) %>': "<%= encodeForJavaScript(propertyValue) %>",<%
  }  
%>

  loaded : true
};
</jalios:cache>