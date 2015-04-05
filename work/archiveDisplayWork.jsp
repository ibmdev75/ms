<%--
  @Summary: Display archived publication
  @Category: Work Area / Content
  @Author: Oliver Jaquemet
  @Copyright: Jalios
  @Customizable: False
  @Requestable: True
  @Deprecated: False 
  @Since: jcms-4.1.1
--%><%@ page import="org.jdom.Document,org.jdom.Element, org.jdom.JDOMException, org.jdom.input.SAXBuilder" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  String archiveRowId = getAlphaNumParameter("id", null);
  ArchivedPublication archive = ArchiveManager.getArchive(archiveRowId);
  if (archive == null) {
    sendRedirect("work/archiveBrowser.jsp", request, response);
    return;
  }
  if (!archive.canBeReadBy(loggedMember)) {
    sendForbidden(request, response); 
    return;
  }
  // Setting current Workspace to allow doWorkHeader to check acces rights
  workspace = archive.getWorkspace();
  Workspace.setSessionWorkspace(request.getSession(), workspace);

  String   archiveDirectory = ArchiveManager.getArchiveDirectoryPath(null, archive);
  String   archiveHtmlPath = archive.getSavedHtmlPath(userLang);
  String   archiveXmlPath = archive.getSavedXmlPath();
  HashMap fileNamePathMap = archive.getAssociatedFilesMap();

%><%!

  void displayArchiveXml( String xmlFilePath, JspWriter out,
                          String userLang, Locale userLocale) throws java.io.IOException {
    SAXBuilder builder = new SAXBuilder(org.apache.xerces.parsers.SAXParser.class.getName());
    Document doc = null;
    try {
      doc = builder.build(new File(channel.getRealPath(xmlFilePath)));
    } catch (Exception ex) {
      out.println("<span style='color:red'>");
      out.println(ex.getMessage());
      out.println("</span>");
      return;
    }
    Element root = doc.getRootElement();
    out.println("<font size='2' face='Arial, Helvetica, sans-serif'>");
    out.println("<b>" + glp("ui.work.arch.text.xmlpath") + "</b>&nbsp;<a href='" + xmlFilePath + "'>" + xmlFilePath + "</a><br />");
    out.println("<b>" + glp("ui.work.arch.text.pubtype") + "</b>&nbsp;" + root.getName() + "<br />");
    out.println("</font><br />");
    displayElement(root, out, userLang, userLocale);
  }

  void displayElement(Element elem, JspWriter out, 
                      String userLang, Locale userLocale) throws java.io.IOException {
    out.println("<table class='xmlTable'>");
    
    List children = elem.getChildren();
    for (Iterator it = children.iterator(); it.hasNext();) {
      Element child = (Element) it.next();
      
      // NAME - VALUE
      out.println(" <tr>");
      out.println("  <td><b>" + child.getName() + "</b></td>");
      out.print("  <td>");
      if (child.getName().endsWith("date")) {
        try {
          out.print(channel.getDateTimeFormat(userLang).format(new Date(Long.parseLong(child.getText()))));
        } catch (Exception e) {}
      } else {
        out.print(child.getText());
      }

      // SUB ITEM
      out.println("&nbsp;</td>");
      out.println(" </tr>");
      if (Util.notEmpty(child.getChildren())) {
        out.println(" <tr>");
        out.println("  <td>&nbsp;</td>");
        out.println("  <td>");
        displayElement(child, out, userLang, userLocale);
        out.println("  </td>");
        out.println(" <tr>");
      }
    }
    out.println("</table>");
  }

%><%

  // Set work area header attributes
  request.setAttribute("title", glp("ui.work.arch.title", archive.getTitle(userLang)));
  if (archive.getOriginalType() == ArchivedPublication.TYPE_CONTENT) {
    request.setAttribute("contentWAMenu", "true");
  } else if (archive.getOriginalType() == ArchivedPublication.TYPE_FORM){
    request.setAttribute("formWAMenu", "true");
  }
  
%><%@ include file='/work/doWorkHeader.jspf' %>

<p class='t1'><%= glp("ui.work.arch.title", archive.getTitle(userLang)) %></p>

<div class="tab-pane" id="archiveTab">

  <jalios:if predicate="<%= Util.notEmpty(archiveHtmlPath) %>">
  <div class="tab-page">
    <h2 class="tab"><% /* %>Original View<% */ %><%= glp("ui.work.arch.html-view") %></h2>

  <% if (!channel.isMultilingual()) { %>
    <font size='2' face='Arial, Helvetica, sans-serif'>
    <b><%= glp("ui.work.arch.text.htmlpath") %></b>&nbsp;<a href='<%= archiveHtmlPath %>'><%= archiveHtmlPath %></a><br />
    </font><br />
    <iframe src="work/archiveDisplayHtml.jsp?id=<%= archive.getRowId() %>"
            style="border:1px solid #999999; width:100%; height:400px;" frameborder="0"></iframe>
   <% } else { %>
    <div class="tab-pane" id="archiveHtmlTab">
   <%
	  // Display HTML for every channel language if it exists
	  List langList = channel.getLanguageList();
	  for (Iterator itLang = langList.iterator(); itLang.hasNext(); ) {
	    String lang = (String) itLang.next();
	    archiveHtmlPath = archiveDirectory + lang + ".html";
	    File archiveHtmlFile = new File(channel.getRealPath(archiveHtmlPath));
	    if (archiveHtmlFile.exists()) {
	    %>
	    <div class='tab-page'>
	    <h2  class='tab'><jalios:lang lang="<%= lang %>"/></h2>
	    <font size='2' face='Arial, Helvetica, sans-serif'>
	    <b><%= glp("ui.work.arch.text.htmlpath") %></b>&nbsp;<a href='<%= archiveHtmlPath %>'><%= archiveHtmlPath %></a><br />
	    </font><br />
	    <iframe src="work/archiveDisplayHtml.jsp?id=<%= archive.getRowId() %>&lang=<%= lang %>"
	            style="border:1px solid #999999; width:100%; height:400px;" frameborder="0"></iframe>
	    </div>
	    <%
	    }
	  }
	 %>
    </div>
  <% } // isMultilingual %>
  </div>
  </jalios:if>

  <jalios:if predicate="<%= Util.notEmpty(archiveXmlPath) %>">
  <div class="tab-page">
    <h2 class="tab"><% /* %>XML View<% */ %><%= glp("ui.work.arch.xml-view") %></h2>
    <% displayArchiveXml(archiveXmlPath, out, userLang, userLocale); %>
  </div>
  </jalios:if>
  
  <jalios:if predicate="<%= !fileNamePathMap.isEmpty() %>">
  <div class="tab-page">
    <h2 class="tab"><% /* %>Associated Files<% */ %><%= glp("ui.work.arch.files-view") %></h2>
    <table class='layout'>
      <jalios:foreach collection="<%= fileNamePathMap.entrySet() %>" name="itEntry" type="Map.Entry">
      <tr>
        <td><font size='2' face='Arial, Helvetica, sans-serif'><b><%= itEntry.getKey() %></b></font></td>
        <td><font size='2' face='Arial, Helvetica, sans-serif'>&nbsp;<a href='<%= itEntry.getValue() %>'><%= itEntry.getValue() %></a></font></td>
      </tr>
      </jalios:foreach>
    </table>
  </div>
  </jalios:if>
  
</div>
<br />

<%@ include file='/work/doWorkFooter.jspf' %>
