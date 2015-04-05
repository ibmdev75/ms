<%@ include file='/jcore/doInitPage.jspf' %>
<%
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");  return; // No links because there is no link's name
  }
  
  String yid = encodeForURL(getUntrustedStringParameter("yid",""));
  if (Util.isEmpty(yid)){
    return;
  }
  
  String cssClass = encodeForHTMLAttribute(getUntrustedStringParameter("class", "embed-responsive-16by9"));
  String cssStyle = encodeForHTMLAttribute(getUntrustedStringParameter("style", ""));
  
  cssClass = cssClass != null ? "class=\"youtube embed-responsive "+cssClass+"\""   : "class=\"youtube embed-responsive embed-responsive-16by9\"";
  cssStyle = cssStyle != null ? "style=\""+cssStyle+"\"" : "";
  
%>
<div <%= cssClass %> <%= cssStyle %>>
	<object class="embed-responsive-item">
		<param name="movie" value="//www.youtube.com/v/<%= yid %>?fs=1&amp;"></param>
		<param name="allowFullScreen" value="true"></param>
		<param name="allowscriptaccess" value="always"></param>
		<embed class="embed-responsive-item" src="//www.youtube.com/v/<%= yid %>?fs=1&amp;" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true"></embed>
	</object>
</div>