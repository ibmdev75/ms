<%--
  @Summary: FileDocument display page
  @Category: Customized
  @Author: Olivier Dedieu
  @Customizable: True
  @Requestable: True
--%><%@page import="com.jalios.io.IOUtil"%><%
%><%@ page import="com.jalios.jcms.webdav.cat.CatWebdavUtil" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
  FileDocument doc = (FileDocument)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  String jsp = ServletUtil.getJsp(request);
  if ((jcmsContext.isInFrontOffice() || jsp.equals("displayWork.jsp")) && 
       !getBooleanParameter("details", doc.isDefaultDetailView()) &&
      !"work/caddy/printCaddy.jsp".equals(getUntrustedStringParameter("jsp", ""))) {
    sendRedirect(doc.getFilename(), request, response);
    return;
  }
  boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView")); 
%>
<%@ include file='/jcore/doMessageBox.jspf' %>
<%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay FileDocument">
  <%@ include file='/front/publication/doPublicationHeader.jspf' %>  
  <%-- TARGET --%>
  <jalios:include target="FILEDOCUMENT_FULLDISPLAY_HEADER" />
  
  <div class="publication-body">
    <%-- DESCRIPTION --%>
    <% if (Util.notEmpty(doc.getDescription())) { %>
    <div class="description">
      <jalios:wiki data="<%= doc %>" field="description"><%= doc.getDescription(userLang) %></jalios:wiki>
    </div>
    <% } %>
    
    <%-- MAIN ACTIONS --%>
    <div class="main-actions br hidden-print">
    
      <%-- Download --%>
      <a class="btn btn-success" href="<%= doc.getFilename() %>" ><jalios:icon src="download-btn" /> <%= glp("ui.com.btn.download") %></a>
    
      <%-- Reupload --%>
      <% if (isLogged && doc.canBeUploadedBy(loggedMember)) { %>
      <% String docChooserRedirect = ServletUtil.encodeURL(ServletUtil.getBaseUrl(request) + doc.getDisplayUrl(userLocale) + "?details=true"); %>
      <a class="btn btn-default" href="work/docChooser.jsp?id=<%= doc.getId() %>&amp;nbElt=1&amp;redirect=<%= docChooserRedirect %>" onclick="popupWindow(this.href, 'DocChooser_<%= doc.getId() %>', <%= JcmsConstants.DOCCHOOSER_WIDTH %>, <%= JcmsConstants.DOCCHOOSER_HEIGHT %>); return false;"><%= glp("ui.filedocument.lbl.update") %></a>

      <%-- Image Editor --%>
      <%   if (doc.isWebImage()) { %>
      <a href="jcore/imageEditor.jsp?fd=<%= doc.getId() %>" class="btn btn-default modal"><%= glp("ui.filedocument.image-editor.link") %></a>
      <%   } %>

      <% } %>

      <jalios:include target="FILEDOCUMENT_MAIN_ACTIONS" targetContext="" />
    </div>
    
    <%-- TARGET --%>
    <jalios:include target="FILEDOCUMENT_FULLDISPLAY" targetContext="div" />
    
    <%-- PREVIEW --%> 
    <% if (Util.toBoolean(request.getAttribute("fileDocumentPreview"),true)){ %>
    <div class="preview">
     <jalios:media fileDoc="<%= doc %>"/>
    </div>
    <% } %>      
  </div>  
</div>