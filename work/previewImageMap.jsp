<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  String formName = getChooserParameter("formName");
  int    mapPos   = getIntParameter("mapPos", 0);
  String url      = getUntrustedStringParameter("url", ""); // ENCODE !!

  FileDocument image = null;
  for(Iterator it = channel.getFileIndexedDataSet(url).iterator(); it.hasNext();) {
    Object obj = it.next();
    if (obj instanceof FileDocument) {
      image = (FileDocument)obj;
      break;
    }
  }
  
  request.setAttribute("title",glp("ui.com.alt.preview"));
  request.setAttribute("zone","InternalUI");
  jcmsContext.addCSSHeader("css/jalios/widget/imagemap.css");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>

<%   jcmsContext.addJavaScript("js/jalios/widget/imagemap.js"); %>
<div class='imgmap previewImageMap' id='imgmap'>
  <button class='btn btn-default' onclick='ImageMap.toggleDivs();'><%= glp("ui.work.misc.toggle-imgmap") %></button>
</div>
<jalios:javascript>
    <% if (image != null && image.isWebImage()) { %>
    window.resizeTo(<%= Util.toInt(image.getMetaData("width"), 300) + 58 %>, <%= Util.toInt(image.getMetaData("height"), 200) + 88 %>);
    <% } %>
    ImageMap.initPreview(window.opener.document.<%= formName %>, <%= mapPos %>, '<%= encodeForJavaScript(url) %>');
</jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>