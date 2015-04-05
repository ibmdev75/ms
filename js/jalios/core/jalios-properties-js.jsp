<%-- 
 Output JavaScript configuration properties (all server properties prefixed with 'js.') in a JavaScript format. 
 - IMPORTANT : value of server side properties are voluntarly NOT encoded to allow number, js and other expression
 - Cached on both client and server side using the same properties used by css/js packer.
 - Loaded by jalios-common.js
 @since jcms-8.0.0
--%><%@ include file="/jcore/doInitPage.jspf" %><%

  // Cache for 10 days by default or use expiration delay specified on properties (on both server and client side)
  final long CACHE_TIMEOUT = channel.getLongProperty("channel.packer.cache-expiration", 10) * 24 * 60; // convert days in minutes
  
  // Write Headers
  response.setContentType("text/javascript; charset=UTF-8");
  response.setDateHeader("Expires", System.currentTimeMillis() + (CACHE_TIMEOUT * 1000 * 60));
  
  // C. Setup cache id
  final String cacheId = "js_properties";
%><jalios:cache id='<%= cacheId %>' timeout='<%= CACHE_TIMEOUT %>' 
                trim='<%= false %>' refresh='<%= false %>'>
var JCMS_Properties = {
<%
  final String javascriptPrefix = "js.";
  Map<String,String> properties = channel.getSortedProperties(javascriptPrefix);
  for (Map.Entry<String,String> entry : properties.entrySet()) {
    final String propertyName = entry.getKey().substring(javascriptPrefix.length());
    final String propertyValue = entry.getValue(); %>
  '<%= encodeForJavaScript(propertyName) %>': <%= propertyValue %>,<% // value voluntarly NOT encoded to allow number/js/expression, etc...
  }  
%>

  loaded : true
};
</jalios:cache>