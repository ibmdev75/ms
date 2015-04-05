<%@ include file='/jcore/doInitPage.jspf' %>
<%
  String webappId           = getAlphaNumParameter("webappId", "");
  boolean save              = getBooleanParameter("save", false);
  String action             = getAlphaNumParameter("action", "");
  boolean isUploadSelected  = action.equals("opFullCopy");
  boolean isStatSelected    = false;
  boolean isLogSelected    = false;
  boolean isLuceneSelected  = action.equals("opFullCopy");
  boolean isArchiveFilesSelected = action.equals("opFullCopy");
  boolean isArchiveIdxSelected   = action.equals("opFullCopy");
  boolean isDocSelected     = false;
  boolean isJavadocSelected = action.equals("opDevCopy");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<jalios:javascript>
 'JCMS.popupDownload'._namespace({
		 submitForm : function() {
		   var elts = document.downloadForm.elements;
		   link = "<%= contextPath %>/admin/deploy/deployMgrDownload.jsp?";
		   for(i = 0; i < elts.length; i++) {
		     if (elts[i].type == "checkbox") {
		       link = link + "&" + elts[i].name + "=" + elts[i].checked; 
		     } else {
		       link = link + "&" + elts[i].name + "=" + elts[i].value; 
		     }
		   }
		   window.opener.location = JCMS.Security.getUrlWithCSRFToken(link);
		   popupWindow('<%= contextPath %>/admin/deploy/downloadMonitor.jsp', 'DownloadMonitor', 440, 160);
		   window.close();
	 }
 });
</jalios:javascript>
  <div style="padding: 10px;">
  <form action='admin/deploy/deployMgrDownload.jsp' name='downloadForm'>

    <table class="table-data table-condensed">
      <tr> 
        <th colspan="2"><strong><%= glp("ui.adm.dm.dl.txt") %></strong></th>
      </tr>   
      <tr> 
        <td class="text-overflow" width="50%">
	      <label for="copyUploadDir"><input type="checkbox" name="copyUploadDir" value="true" <%= isUploadSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.upload") %></label>
        </td>
        <td class="formInfo text-overflow" width="50%">
	      <label for="copyStatDir"><input type="checkbox" name="copyStatDir" value="true" <%= isStatSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.stat") %></label>
        </td>
      </tr>   
      <tr> 
        <td class="text-overflow">
	      <label for="copyLuceneDir"><input type="checkbox" name="copyLuceneDir" value="true" <%= isLuceneSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.lucene") %></label>
        </td>
        <td class="text-overflow">
	      <label for="copyLogDir"><input type="checkbox" name="copyLogDir" value="true" <%= isLogSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.logs") %></label>
        </td>
      </tr>   
        <td class="text-overflow">
	      <label for="copyArchiveDir"><input type="checkbox" name="copyArchiveDir" value="true" <%= isArchiveFilesSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.archive-file") %></label>
        </td>
        <td class="text-overflow">
	      <label for="copyLuceneArchiveDir"><input type="checkbox" name="copyLuceneArchiveDir" value="true" <%= isArchiveIdxSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.archive-idx") %></label>
        </td>
      </tr>   
      <tr> 
        <td class="text-overflow">
	      <label for="copyJavadocDir"><input type="checkbox" name="copyJavadocDir" value="true" <%= isJavadocSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.javadoc") %></label>
        </td>
        <td class="text-overflow">
	      <label for="copyDocDir"><input type="checkbox" name="copyDocDir" value="true" <%= isDocSelected ? "checked" : "" %>> <%= glp("ui.adm.dm.dl.dir.doc") %></label>
        </td>
      </tr>   
    </table> 
    <div>
      <input type="button" name="button" value="<%= glp(save ? "ui.com.btn.save" : "ui.com.btn.download") %>" onclick="JCMS.popupDownload.submitForm(); return false;" class="btn btn-default" />
      <input type="button" name="button" value="<%= glp("ui.com.btn.cancel") %>" onclick="javascript:window.close();" class="btn btn-default" />
      <input type="hidden" name="webappId" value="<%= encodeForHTMLAttribute(webappId) %>" />
      <input type="hidden" name="save" value="<%= save %>" />
      <input type="hidden" name="<%= encodeForHTMLAttribute(action) %>" value="true" />
    </div>
  </form>
  </div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
