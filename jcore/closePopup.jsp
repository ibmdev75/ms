<%@ include file="/jcore/doInitPage.jspf" %>
<%
org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger("jsp.jcore.closePopup_jsp");

String redirect = getValidHttpUrl("redirect");

String refreshParam = getUntrustedStringParameter("refresh", null);
%>
<%@ include file="/jcore/doEmptyHeader.jspf" %>

<%-- Run popup callback --%> 
<% if(Util.notEmpty(refreshParam)) { %>
  <% logger.trace("Injecting javascript..."); %>
  <jalios:javascript>
    !function ($) {
      // Initialization on DOM ready
      $(document).ready(function($) {
        Popup.callback(<%= refreshParam %>);
        window.close();
      });
    }(window.jQuery);
  </jalios:javascript>
<% } else { %>
  <jalios:javascript>
    try {
        // if the opener is an iframe (ie. if it has a parent)
        // we want to refresh the parent and not just the iframe
        var openerLocation;
        if (opener.parent && !opener.tinyMCEPopup) {
          openerLocation = opener.parent.document.location;
        } else {
          openerLocation = opener.document.location;
        }
      <%-- Redirect opener to specified redirect parameter --%>
      <% if (redirect != null) { %>
        <% logger.trace("Closing popup and redirecting to : '" + redirect + "'"); %>
        var url = '<%= encodeForJavaScript(redirect) %>';
      <%-- Refresh opener --%>
      <% } else { %>
        <% logger.trace("Refreshing opener..."); %>
      
        // Remove the '#' otherwise the refresh is not performed
        var url = openerLocation.href;
        var p = url.indexOf('#')
        if (p >= 0) {
          url = url.substring(0, p);
        }
      <% } %>
      openerLocation.href = url;
    } catch(ex) {
      // EMPTY
    }
    
    close();
  </jalios:javascript>
<% } %>
  
<%@ include file="/jcore/doEmptyFooter.jspf" %>