<%@ page import="com.jalios.jcms.search.*" %><%
%><%@ page import="org.apache.lucene.store.FSDirectory" %><%
%><%@ page import="org.apache.lucene.index.IndexReader" %><%
%><%@ page import="com.jalios.jcms.archive.ArchiveManager" %><%
%><%@ include file='/jcore/doInitPage.jspf'  %><%

  if (!checkAccess("admin/operation/search-engines")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.search.AdminSearchEnginesHandler"><%
 %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }
  PublicationSearchEngine pubSE = channel.getQueryManager().getPublicationSearchEngine();
  CategorySearchEngine catSE = channel.getQueryManager().getCategorySearchEngine();
  ArchiveEngine archiveEngine = ArchiveManager.getArchiveEngine();
  LuceneMemberSearchEngine luceneMbrEngine = channel.getMemberSearchEngine();
  
  boolean lucenePubSeOpRunning = (pubSE instanceof LucenePublicationSearchEngine) &&
                                 ((LucenePublicationSearchEngine) pubSE).isOperationRunning();
  boolean spellSuggestRunning  = (pubSE instanceof LucenePublicationSearchEngine) &&
                                 ((LucenePublicationSearchEngine) pubSE).getSpellSuggestEngine().isIndexing();
  boolean luceneCatSeOpRunning = (catSE instanceof LuceneCategorySearchEngine) &&
                                 ((LuceneCategorySearchEngine) catSE).isOperationRunning();
  boolean anythingRunning = lucenePubSeOpRunning || spellSuggestRunning || luceneCatSeOpRunning;
  
  request.setAttribute("title", glp("ui.adm.mn.op.index-mgr"));  
  request.setAttribute("searchSubAdminMenu", "true");  

%><%@ include file='/admin/doAdminHeader.jspf' %>

<style type="text/css">
.browser-IE6 .ie6toHell {
  float: none !important;
}
</style>

<div class="page-header"><h1><%= glp("ui.adm.mn.op.index-mgr") %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>

<%
int counter = 0; 
%>
<% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>

<jalios:message msg="ui.adm.search.intro" title="" />

<p>
<button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn <%= anythingRunning ? "btn-default" :"btn-danger" %>'
  onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=all")'>
  <%= glp("ui.adm.search.reindex-all") %>
</button>
</p>
<script language='JavaScript' type='text/javascript'>
  function refreshPage() {
    document.location = document.location;;
  }
</script>
<div class="tab-pane" id="search-engines-tab">

  <%-- *********************************************************************** --%>

  <%-- ** PUBLICATION SE ********************************** --%>
  <div class="tab-page">
  <h2 class="tab"><% /* %>Publication<% */ %><jalios:icon src='txt'  alt='P' /> <%= glp("ui.com.lbl.publications") %></h2>
  
    <% counter = 0; %>
		<table class="table-data table-condensed">
		  <tr>
		    <th colspan='2'><% /* %>Publication Search Engine<% */ %><%= glp("ui.adm.search.pub-engine") %></th>
		  </tr>
    <% if (!(pubSE instanceof LucenePublicationSearchEngine)) { %>
    </table>
    <% } else { %>
    
    <%-- PUBLICATION INDEX --%>
      <% LucenePublicationSearchEngine lucenePubSE = (LucenePublicationSearchEngine) pubSE; %>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.lucene.last-reindex-date")%></td>
        <td class="text-left">
          <jalios:date date='<%= lucenePubSE.getLastReindexDateSinceRestart() %>'/> - <jalios:time date='<%= lucenePubSE.getLastReindexDateSinceRestart() %>'/>
          <% if (lucenePubSE.getLastReindexDuration() != 0) { %>(<jalios:duration time='<%= lucenePubSE.getLastReindexDuration() %>'/>)<% } %>
        </td>
      </tr>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.lucene.last-optimize-date")%></td>
        <td class="text-left">
          <jalios:date date='<%= lucenePubSE.getLastOptimizeDateSinceRestart() %>'/> - <jalios:time date='<%= lucenePubSE.getLastOptimizeDateSinceRestart() %>'/>
          <% if (lucenePubSE.getLastOptimizeDuration() != 0) { %>(<jalios:duration time='<%= lucenePubSE.getLastOptimizeDuration() %>'/>)<% } %>
          <% if (lucenePubSE.getLastOptimizeDateSinceRestart() != null && lucenePubSE.getLastOptimizeDuration() == 0) { %>(<strong><%= glp("ui.adm.search.lucene.op-running") %></strong> <jalios:icon src='wait' alt='<%= glp("ui.adm.search.lucene.op-running") %>' />)<script language='JavaScript' type='text/javascript'> setTimeout("refreshPage()", 3000); </script><% } %>
        </td>
      </tr>
      <%
        for (Iterator it = channel.getLanguageList().iterator(); it.hasNext(); ) {
          String lang = (String) it.next();
          FSDirectory pubIndexDir = lucenePubSE.getDirectory(lang);
      %>
      <tr> 
        <td nowrap="nowrap">
          <jalios:lang lang='<%= lang %>' /> <%= glp("ui.adm.search.lucene.index-info", glp("lang." + lang))%>
        </td>
        <td class="text-left">
          <% printLuceneIndexInfos(out, pubIndexDir, userLocale); %>
        </td>
      </tr>
      <%
        }
      %>
    </table>
    
    <%-- PUBLICATION BUTTONS --%>
    <% if (lucenePubSeOpRunning) { %>
     <div style='margin-top: 5px; width: 700px; padding:2px; background-color:white; border: 1px solid black;'><iframe src="admin/adminSearchEnginesStatus.jsp?se=pub" width='700' height='40' frameborder='0' scrolling='no'></iframe></div>
    <% } %>
    <div style="margin: 5px 0;">
      <div class="ie6toHell" style="float: left; margin-right: 10px; margin-bottom: 15px">
  	    <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn <%= anythingRunning ? "btn-default" :"btn-danger" %>'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=reindexLucenePubSE")'>
          <%= glp("ui.adm.search.lucene-pubse.reindex-all") %>
        </button>
  	    <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn btn-default'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=optimizeLucenePubSE")'>
          <%= glp("ui.adm.search.lucene.optimize") %>
        </button>
      </div>
      <% if (!lucenePubSeOpRunning) { %>
        <jalios:icon src='warning'  /> <%= glp("ui.adm.search.lucene.warning") %>
      <% } %>
    </div>
    <div style="clear:both"></div>
    
    <%-- SPELL SUGGEST INDEX--%>
    <% counter = 0; %>
    <table class="table-data table-condensed">
      <tr>
        <th colspan='2'><% /* %>Spell Suggestion Module<% */ %><%= glp("ui.adm.search.suggestion-engine") %></th>
      </tr>
      <tr> 
        <td nowrap="nowrap">
          <%= glp("ui.adm.search.suggestion.schedule") %>
          <jalios:tooltip property="ui.adm.search.suggestion.schedule.h" />  
        </td>
        <td class="text-left"><%= JcmsUtil.formatSchedule(userLang, lucenePubSE.getSpellSuggestEngine().getIndexingSchedule()) %></td>
      </tr>
     <%
      {
        FSDirectory spellCheckerIndexDir = (FSDirectory) lucenePubSE.getSpellSuggestEngine().getSpellCheckerIndexDir();
     %>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.suggestion-index") %></td>
        <td class="text-left">
          <% printLuceneIndexInfos(out, spellCheckerIndexDir, userLocale); %>
        </td>
      </tr>
     <%
      }
     %>
      <tr> 
        <td nowrap="nowrap">
          <%= glp("ui.adm.search.suggestion.hits-threshold") %>
          <jalios:tooltip property="ui.adm.search.suggestion.hits-threshold.h" />  
        </td>
        <td class="text-left"><%= lucenePubSE.getSpellSuggestEngine().getHitsThreshold() %></td>
      </tr>
      <tr> 
        <td nowrap="nowrap">
          <%= glp("ui.adm.search.suggestion.score-threshold") %>
          <jalios:tooltip property="ui.adm.search.suggestion.score-threshold.h" />  
        </td>
        <td class="text-left"><%= lucenePubSE.getSpellSuggestEngine().getScoreThreshold() %></td>
      </tr>
    </table>
    
    <%-- SPELL SUGGEST BUTTONS --%>
    <% if (spellSuggestRunning) { %>
    <div style='margin-top: 5px;'>
      <strong><%= glp("ui.adm.search.lucene.op-running") %></strong>
      <jalios:icon src='wait' alt='<%= glp("ui.adm.search.lucene.op-running") %>' /> 
      <script language='JavaScript' type='text/javascript'> setTimeout("refreshPage()", 3000); </script>
    </div>
    <% } %>
    <div style="margin: 5px 0;">
      <div style="margin-right: 10px; margin-bottom: 15px">
        <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn <%= anythingRunning ? "btn-default" :"btn-danger" %>'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=populateSpellSuggest")'>
          <%= glp("ui.adm.search.suggestion.clear-and-index") %>
        </button>
        <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn btn-default'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=updateSpellSuggest")'>
          <%= glp("ui.adm.search.suggestion.update-index") %>
        </button>
      </div>
    </div>
       
    <% } // end LucenePublicationSearchEngine %>
    
  </div> 

  <%-- *********************************************************************** --%>
  
  <%-- ** CATEGORY SE ********************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Category Search Engine<% */ %><jalios:icon src='categories'  alt='C' /> <%= glp("ui.work.form.lbl.categories") %></h2>
  
    <% counter = 0; %>
    <table class="table-data table-condensed">
      <tr>
        <th colspan='2'><% /* %>Category Search Engine<% */ %><%= glp("ui.adm.search.cat-engine") %></th>
      </tr>
    <% if (!(catSE instanceof LuceneCategorySearchEngine)) { %>
    </table>
    <% } else { %>
    
    <%-- CATEGORY INDEX --%>
      <% LuceneCategorySearchEngine luceneCatSE = (LuceneCategorySearchEngine) catSE; %>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.lucene.last-reindex-date")%></td>
        <td class="text-left">
          <jalios:date date='<%= luceneCatSE.getLastReindexDateSinceRestart() %>'/> - <jalios:time date='<%= luceneCatSE.getLastReindexDateSinceRestart() %>'/>
          <% if (luceneCatSE.getLastReindexDuration() != 0) { %>(<jalios:duration time='<%= luceneCatSE.getLastReindexDuration() %>'/>)<% } %>
        </td>
      </tr>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.lucene.last-optimize-date")%></td>
        <td class="text-left">
          <jalios:date date='<%= luceneCatSE.getLastOptimizeDateSinceRestart() %>'/> - <jalios:time date='<%= luceneCatSE.getLastOptimizeDateSinceRestart() %>'/>
          <% if (luceneCatSE.getLastOptimizeDuration() != 0) { %>(<jalios:duration time='<%= luceneCatSE.getLastOptimizeDuration() %>'/>)<% } %>
          <% if (luceneCatSE.getLastOptimizeDateSinceRestart() != null && luceneCatSE.getLastOptimizeDuration() == 0) { %>(<strong><%= glp("ui.adm.search.lucene.op-running") %></strong> <jalios:icon src='wait' alt='<%= glp("ui.adm.search.lucene.op-running") %>' />)<script language='JavaScript' type='text/javascript'> setTimeout("refreshPage()", 3000); </script><% } %>
        </td>
      </tr>
      <%
        for (Iterator it = channel.getLanguageList().iterator(); it.hasNext(); ) {
          String lang = (String) it.next();
          FSDirectory catIndexDir = luceneCatSE.getDirectory(lang);
      %>
      <tr> 
        <td nowrap="nowrap">
          <jalios:lang lang='<%= lang %>' /> <%= glp("ui.adm.search.lucene.index-info", glp("lang." + lang))%>
        </td>
        <td class="text-left">
          <% printLuceneIndexInfos(out, catIndexDir, userLocale); %>
        </td>
      </tr>
      <%
        }
      %>
    </table>
    
    <%-- CATEGORY BUTTONS --%>
    <% if (luceneCatSeOpRunning) { %>
     <div style='margin-top: 5px; width: 700px; padding:2px; background-color:white; border: 1px solid black;'><iframe src="admin/adminSearchEnginesStatus.jsp?se=cat" width='700' height='40' frameborder='0' scrolling='no'></iframe></div>
    <% } %>
    <div style="margin: 5px 0;">
      <div style="float: left; margin-right: 10px; margin-bottom: 15px">
        <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn <%= anythingRunning ? "btn-default" :"btn-danger" %>'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=reindexLuceneCatSE")'>
          <%= glp("ui.adm.search.lucene-catse.reindex-all") %>
        </button>
        <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn btn-default'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=optimizeLuceneCatSE")'>
          <%= glp("ui.adm.search.lucene.optimize") %>
        </button>
      </div>
      <% if (!luceneCatSeOpRunning) { %>
        <jalios:icon src='warning'  /> <%= glp("ui.adm.search.lucene.warning") %>
      <% } %>
    </div>
    <div style="clear:both"></div>
          
    <% } // end LuceneCategorySearchEngine %>

  </div> 
  
  
    <%-- ** ARCHIVE SE ********************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Archive Search Engine<% */ %><jalios:icon src='archive'  alt='A' /> <%= glp("ui.com.lbl.archives") %></h2>
    <% counter = 0; %>
    <table class="table-data table-condensed">
      <tr>
        <th colspan='2'><% /* %>Archive Search Engine<% */ %><%= glp("ui.adm.search.archives-engine") %></th>
      </tr>
     <% if (archiveEngine instanceof LuceneArchiveEngine) { %>
      <% LuceneArchiveEngine luceneArchiveEngine = (LuceneArchiveEngine) archiveEngine; %>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.archives-index")%></td>
        <td class="text-left">
          <% printLuceneIndexInfos(out, luceneArchiveEngine.getDirectory(), userLocale); %>
        </td>
      </tr>
     <% } // end LuceneArchiveEngine %>
    </table>
  </div> 

    <%-- ** MEMBER SE ********************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Member Search Engine<% */ %><jalios:icon src='mbr-default'  alt='M' /> <%= glp("ui.com.lbl.member") %></h2>
    <% counter = 0; %>
    <table class="table-data table-condensed">
      <tr>
        <th colspan='2'><% /* %>Member Search Engine<% */ %><%= glp("ui.adm.search.member-engine") %></th>
      </tr>
      <tr> 
        <td nowrap="nowrap"><%= glp("ui.adm.search.member-index")%></td>
        <td class="text-left">
          <% printLuceneIndexInfos(out, luceneMbrEngine.getDirectory(), userLocale); %>
        </td>
      </tr>
    </table>
    
    <%-- Member BUTTONS --%>
    <div style="margin: 5px 0;">
      <div style="float: left; margin-right: 10px; margin-bottom: 15px">
        <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn <%= anythingRunning ? "btn-default" :"btn-danger" %>'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=reindexLuceneMbrSE")'>
          <%= glp("ui.adm.search.lucene-mbrse.reindex-all") %>
        </button>
        <button <% if (anythingRunning) { %>disabled='disabled'<%}%> class='btn btn-default'
                onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/adminSearchEngines.jsp?action=optimizeLuceneMbrSE")'>
          <%= glp("ui.adm.search.lucene.optimize") %>
        </button>
      </div>
      <jalios:icon src='warning'  /> <%= glp("ui.adm.search.lucene.warning") %>
    </div>
    <div style="clear:both"></div>
  </div> 

<% if (formHandler.isTabForced() ) { %>
<jalios:javascript>
  setSelectedTab("search-engines-tab", <%= formHandler.getOpenTab() %>);
</jalios:javascript>
<% } %>

<%!
  void printLuceneIndexInfos(JspWriter out, FSDirectory indexDirectory, Locale userLocale) throws IOException {
    // Index Path
    out.print(glp("ui.adm.search.lucene.index.path"));
    out.print(" ");
    out.print(indexDirectory.getFile().getPath());
    out.println("<br />");
    
    // Make sure index exists
    boolean indexExists = false;
    try { indexExists = IndexReader.indexExists(indexDirectory); }
    catch (IOException ex) { /* empty */ }
    if (!indexExists) {
      out.print("<img src='images/jalios/icons/warnSmall.gif' alt=''> ");
      out.print("<span style='color: red;'>");
      out.print(glp("ui.adm.search.lucene.index.not-found"));
      out.print("</span>");
      return;
    }
      
    IndexReader reader = null;
    try {
      reader = IndexReader.open(indexDirectory);
      // Last modified date
      out.print(glp("ui.adm.search.lucene.index.last-modified"));
      out.print(" ");
      out.print(JcmsUtil.getFriendlyDate(new Date(IndexReader.lastModified(indexDirectory)), DateFormat.SHORT, true, userLocale));
      out.println("<br />");
      // Index version
      out.print(glp("ui.adm.search.lucene.index.cur-version"));
      out.print(" ");
      out.print(IndexReader.getCurrentVersion(indexDirectory));
      out.println("<br />");
      // Index locked?
      out.print(glp("ui.adm.search.lucene.index.locked"));
      out.print(" ");
      out.print(glp("ui.com.lbl." + IndexReader.isLocked(indexDirectory)));
      out.println("<br />");
      // Index hasDeletions?
      out.print(glp("ui.adm.search.lucene.index.has-deletion"));
      out.print(" ");
      out.print(glp("ui.com.lbl." + reader.hasDeletions()));
      out.println("<br />");
      // Index max docs
      out.print(glp("ui.adm.search.lucene.index.max-doc"));
      out.print(" ");
      out.print(reader.maxDoc());
      out.println("<br />");
      // Index num docs
      out.print(glp("ui.adm.search.lucene.index.num-docs"));
      out.print(" ");
      out.print(reader.numDocs());
    } catch (IOException ex) {
      logger.warn(ex, ex);
    } finally {
      if (reader != null) {
        try { reader.close(); } catch (Exception ex) {/*empty*/}
      }
    }
  }
%>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %>