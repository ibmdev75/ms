<%@ include file='/jcore/doInitPage.jspf' %>
<%
  
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");  return; // No links because there is no link's name
  }
  
  String sid = encodeForHTMLAttribute(getUntrustedStringParameter("sid",""));
  String doc = encodeForURL(getUntrustedStringParameter("doc",""));
  
  if (Util.isEmpty(sid)){
    return;
  }
  
  String width  = encodeForHTMLAttribute(getAlphaNumParameter("width","425"));
  String height = encodeForHTMLAttribute(getAlphaNumParameter("height","355"));
  
  String cssClass = encodeForHTMLAttribute(getUntrustedStringParameter("class", ""));
  String cssStyle = encodeForHTMLAttribute(getUntrustedStringParameter("style", ""));
  
  cssClass = cssClass != null ? "class=\"slideshare "+cssClass+"\""   : "class=\"slideshare\"";
  cssStyle = cssStyle != null ? "style=\"width: "+width+"px; height: "+height+"px; "+cssStyle+"\""   : "style=\"width: "+width+"px; height: "+height+"px;\"";
  
%><iframe src="http://fr.slideshare.net/slideshow/embed_code/<%= sid %>" width="<%= width %>" height="<%= height %>" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen webkitallowfullscreen mozallowfullscreen> </iframe>
