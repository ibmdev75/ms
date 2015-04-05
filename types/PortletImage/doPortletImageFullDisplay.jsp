<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %>
<% 
PortletImage box = (PortletImage) portlet;  
String target = Util.notEmpty(box.getTargetWindow()) ? "target='" + box.getTargetWindow() + "'": "";
%>
<jalios:if predicate='<%= Util.notEmpty(box.getImage(userLang)) %>'>
	<jalios:if predicate='<%= Util.notEmpty(box.getLink(userLang)) %>'><a href='<%= box.getLink(userLang) %>' <%= target %>></jalios:if><%
	
		  String htmlAlt = Util.getString(box.getAlt(userLang),"");
		  String htmlAttributes = "title=\""+htmlAlt+"\"";
		  String inlineStyle = "border:0; text-align:center; vertical-align: middle; ";
		  int    maxWidth  = (box.getImgWidth()  > ThumbnailTag.MIN_THUMB_SIZE && box.getImgWidth() < ThumbnailTag.MAX_THUMB_SIZE) ? box.getImgWidth()  : (ThumbnailTag.MAX_THUMB_SIZE-1);
		  int    maxHeight = (box.getImgHeight() > ThumbnailTag.MIN_THUMB_SIZE && box.getImgWidth() < ThumbnailTag.MAX_THUMB_SIZE) ? box.getImgHeight() : (ThumbnailTag.MAX_THUMB_SIZE-1);
		  if ( maxWidth  != ThumbnailTag.MAX_THUMB_SIZE-1 ) {
		    inlineStyle += "width:"+maxWidth + "px;";
		  }
      if ( maxHeight != ThumbnailTag.MAX_THUMB_SIZE-1 ) {
        inlineStyle += "height:" + maxHeight + "px;";
      }
		
		  if (maxWidth != ThumbnailTag.MAX_THUMB_SIZE-1 || maxHeight != ThumbnailTag.MAX_THUMB_SIZE-1) {
		    %><jalios:thumbnail path='<%= box.getImage(userLang) %>' width="<%= maxWidth %>"  height="<%= maxHeight %>"  alt="<%= htmlAlt %>" htmlAttributes="<%= htmlAttributes %>"  />
		    <% } else {%><img src='<%= box.getImage(userLang) %>' alt="<%= htmlAlt %>" <%= htmlAttributes %> style="<%= inlineStyle %>" /><% } %>

	<jalios:if predicate='<%= Util.notEmpty(box.getLink(userLang)) %>'></a></jalios:if>
</jalios:if>
