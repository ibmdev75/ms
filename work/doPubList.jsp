<%--
 This JSP provide an easy way to display a Set of Pulication.
 You must:
  - Init a pager with name "plPagerHandler":
    <jalios:pager name='plPagerHandler' action='init' sort='...'
              paramPrefix='....' pageSize='...'/>
  - Add your Set of Publication in the request attribute "plPubSet"
--%>
<%@ include file='/jcore/doInitPage.jspf' %><% 
%><%@ include file='/work/doInsertLinkParams.jspf' %><%
 %><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><% 
%><% 
boolean isTextFieldPubLink = getBooleanParameter("textFieldPubLink", false);
Set pubSet = (Set)request.getAttribute("plPubSet");
int pubCount = Util.toInt(request.getAttribute("plPubCount"), -1);
if (pubCount == -1) {
  pubCount = pubSet != null ? pubSet.size() : 0 ;
}
if (Util.notEmpty(pubSet)) {
  QueryResultSet queryResultSet = (QueryResultSet) request.getAttribute("plQueryResultSet");
  String queryString            = (String) request.getAttribute("plQueryString");
  
  boolean showRadioInsert       = request.getAttribute("plShowRadioInsert")   == Boolean.TRUE;
  boolean showCheckInsert       = request.getAttribute("plShowCheckInsert")   == Boolean.TRUE;
  
  boolean showEditIcon          = request.getAttribute("plShowEditIcon")      != Boolean.FALSE; 
  boolean showValidateIcon      = request.getAttribute("plShowValidateIcon")  == Boolean.TRUE; 
  
  boolean showReadRigths        = request.getAttribute("plShowReadRights")      != Boolean.FALSE; 
  
  boolean showRefineLink        = request.getAttribute("plShowRefineLink")    == Boolean.TRUE;
  boolean showWorkflow          = request.getAttribute("plShowWorkflow")      == Boolean.TRUE;  
  boolean showRelevance         = request.getAttribute("plShowRelevance")     == Boolean.TRUE && queryResultSet != null;   
  boolean showState             = request.getAttribute("plShowState")         != Boolean.FALSE; 
  boolean showRole              = request.getAttribute("plShowRole")          == Boolean.TRUE;  
  boolean showAuthor            = request.getAttribute("plShowAuthor")        != Boolean.FALSE;
  boolean showWorkspace         = request.getAttribute("plShowWorkspace")     == Boolean.TRUE;
  boolean showType              = request.getAttribute("plShowType")          != Boolean.FALSE;
  boolean showPdate             = request.getAttribute("plShowPdate")         == Boolean.TRUE;               
  boolean showCdate             = request.getAttribute("plShowCdate")         == Boolean.TRUE;               
  boolean showMdate             = request.getAttribute("plShowMdate")         != Boolean.FALSE;   
  boolean showUdate             = request.getAttribute("plShowUdate")         == Boolean.TRUE;
  boolean showAdate             = request.getAttribute("plShowAdate")         == Boolean.TRUE;            
  boolean showEdate             = request.getAttribute("plShowEdate")         == Boolean.TRUE;
  boolean showSdate             = request.getAttribute("plShowSdate")         == Boolean.TRUE;            
  boolean showCaddy             = request.getAttribute("plShowCaddy")         != Boolean.FALSE;
  boolean showCSVExport         = request.getAttribute("plShowCSVExport")     == Boolean.TRUE;
  boolean showDelete            = request.getAttribute("plShowDelete")        != Boolean.FALSE;
  boolean showDeepDuplicate     = request.getAttribute("plShowDeepDuplicate") != Boolean.FALSE;
  boolean showDuplicate         = request.getAttribute("plShowDuplicate")     != Boolean.FALSE;
  boolean showVersion           = request.getAttribute("plShowVersion")       != Boolean.FALSE;
  boolean showWorkMerge         = request.getAttribute("plShowWorkMerge")     != Boolean.FALSE;

  boolean showPreviewIcon       = request.getAttribute("plShowPreviewIcon")   != Boolean.FALSE;
  boolean showReminderIcon      = request.getAttribute("plShowReminderIcon")  == Boolean.TRUE;
  boolean showReminderStatus    = request.getAttribute("plShowReminderStatus")  == Boolean.TRUE;

  boolean isContentMode         = request.getAttribute("plIsContentMode")     != Boolean.FALSE;
  boolean isPortletMode         = request.getAttribute("plIsPortletMode")     == Boolean.TRUE;
  boolean isFormMode            = request.getAttribute("plIsFormMode")        == Boolean.TRUE;
  boolean isDeleteMode          = request.getAttribute("plIsDeleteMode")      == Boolean.TRUE; 
  
  boolean popupEdition          = request.getAttribute("plIsPopupEdition")    == Boolean.TRUE;
  boolean isHybrid              = request.getAttribute("plIsHybrid")          == Boolean.TRUE;
  
  String  redirectRefresh       = ServletUtil.getUrl(request, false);
  String  redirectJSNoCaddy     = ServletUtil.getAbsUrlWithUpdatedParam(request, "caddyFilter", null);
  boolean isDetailMode          = getBooleanParameter("detail", false);
  
  String  displayURLparams      = Util.getString(request.getAttribute("plDisplayURLparams"), "");
%>
<jalios:pager name='plPagerHandler' declare="true" action='compute' size='<%= pubCount%>' showLastLink='<%= !isHybrid %>'/>
             <form name='editForm' action="<%= ServletUtil.getResourcePath(request) %>"> 
             <table id='pubTable' class="table-data">
              <tr>
                <%-- --- HEADER / DETAILLED VIEW ICON --------------------------- --%>
                <th class='nowrap' <%= !isTextFieldPubLink ? "colspan='2'" : "" %>>
                  <% if (isDetailMode) { %>
                  <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"detail"}, new String[] {"false"}) %>' title="<%= glp("ui.work.pub.txt.s-view") %>"><jalios:icon src='simple-list' alt='D' /></a>
                  <% } else { %>
                  <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"detail"}, new String[] {"true"}) %>' title="<%= glp("ui.work.pub.txt.d-view") %>"><jalios:icon src='detailled-list' alt='D' /></a>
                  <% } %>
                  <% if (showCSVExport) { %>
                  <a href='<%= ResourceHelper.getQueryCsv() %>?<%= queryString %>'><jalios:icon src="csv"  title='<%= glp("ui.com.btn.csv") %>' alt="CSV" /></a>                  
                  <% } %>
                </th>
                <%-- --- HEADER / RELEVANCE --------------------------- --%>
                <% if (showRelevance) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.relevance") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='relevance'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / STATUS --------------------------- --%>
                <% if (showState) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.status") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='pstatus'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / WORKFLOW --------------------------- --%>
                <% if (showWorkflow) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.workflow") %>
                </th>
                <% } %>
                <%-- --- HEADER / RIGHTS --------------------------- --%>
                <% if (showReadRigths) { %>
                <th class='nowrap'>
                  <jalios:icon src='key-white' title='<%= glp("ui.com.lbl.rights") %>'   />
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='right'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / AUDIENCE RIGHTS --------------------------- --%>
                <% if (AudienceRights.getInstance().isEnabled()) { %>
                <th class='nowrap'>
                  <jalios:icon src='target-white' title='<%= glp("ui.adm.prop.mbr.pub-read-r.title") %>'   />
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='audienceRight'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / TITLE --------------------------- --%>
                <th class="nowrap expand">
                  <%= glp("ui.com.lbl.title") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='title'/>
                  <% } %>
                </th>
                <%-- --- HEADER / SUBMIT MEMBER --------------------------- --%>
                <% if (isFormMode) { %>
                <th class='nowrap'>
                  <%= glp("ui.work.forms.lbl.submit-mbr") %>
                </th>
                <% } %>
                <%-- --- HEADER / AUTHOR - SUBMIT MANAGER --------------------------- --%>
                <% if (showAuthor) { %>
                <th class='nowrap'>
                  <%= glp(isFormMode ? "ui.adm.type-list.lbl.form-author" : "ui.com.lbl.author") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='author'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / ROLE --------------------------- --%>
                <% if (showRole) { %>
                <th class='nowrap'>
                  <%= glp("ui.work.form.tab.wf-role") %>
                </th>
                <% } %>
                <%-- --- HEADER / WORKSPACE --------------------------- --%>
                <% if (showWorkspace) { %>
               <th class='nowrap'>
                  <%= glp("ui.com.lbl.workspace") %>
                </th>
                <% } %>
                <%-- --- HEADER / OP-AUTHOR --------------------------- --%>
                <% if (isDeleteMode) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.op-author") %>
                </th>
                <% } %>
                <%-- --- HEADER / TYPE --------------------------- --%>
                <% if (showType) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.type") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='type'/>
                  <% } %>
                </th>
                <% } %>
                <% if (showMdate) { %>
                <%-- --- HEADER / DDATE --------------------------- --%>
                <% if (isDeleteMode) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.ddate-long") %>
                </th>
                <%-- --- HEADER / MDATE --------------------------- --%>
                <% } else { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.mdate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='mdate'/>
                  <% } %>
                </th>
                <% } 
                  } /* showMdate */ %>
                <%-- --- HEADER / CDATE --------------------------- --%>
                <% if ( showCdate || isDetailMode) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.cdate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='date'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / UDATE --------------------------- --%>
                <% if (showUdate || isDetailMode) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.udate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='udate'/>
                  <% } %>
                </th>
                <% } %>           
                <%-- --- HEADER / PDATE --------------------------- --%>
                <%   if (isContentMode && (showPdate || isDetailMode) ) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.pdate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='pdate'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / EDATE --------------------------- --%>
                <% if ( isContentMode && (showEdate || isDetailMode) ) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.edate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='edate'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / ADATE --------------------------- --%>
                <% if ( isContentMode && (showAdate || isDetailMode) ) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.adate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='adate'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / SDATE --------------------------- --%>
                <% if ( isContentMode && (showSdate || isDetailMode) ) { %>
                <th class='nowrap'>
                  <%= glp("ui.com.lbl.sdate") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='sdate'/>
                  <% } %>
                </th>
                <% } %>
                <%-- --- HEADER / MAIN LANGUAGE --------------------------- --%>
                <% if ( isContentMode && isDetailMode ) { %>
                <th class='nowrap'>
                  <%= glp("ui.work.form.lbl.main-language") %>
                </th>
                <% } %>
                <%-- --- HEADER / ID --------------------------- --%>
                <% if ( isDetailMode ) { %>
               <th class='nowrap'>
                  <%= glp("ui.com.lbl.id") %>
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='id'/>
                  <% } %>
                </th>
                <% } // isDetailMode %>
                <%-- --- HEADER / CADDY --------------------------- --%>
                <% if (!isTextFieldPubLink && showCaddy) { %>
                <th class="nowrap text-overflow">
                  <jalios:icon src='caddy' title='<%= glp("ui.work.mn.caddy") %>'   />
                  <% if (!isDeleteMode) { %>
                  <jalios:pager name='plPagerHandler' action='showSort' sort='caddy'/>
                  <% } %>
                </th>
                <% } %>
              </tr>
              
              <%-- Backup 'itPub' attribute --%>
              <% ServletUtil.backupAttribute(pageContext , "itPub"); %>
              
              <jalios:foreach name='itPub' type='Publication' collection='<%= pubSet %>' counter='plCounter'
                              max='<%= plPagerHandler.getPageSize() %>' skip='<%= plPagerHandler.getStart() %>'>
              <%-- Store the current publication in the request in order to use this publication in the targets --%>
              <% request.setAttribute("itPub", itPub); %>
              <tr> 
                 <%-- --- PUB / FIRST COL --------------------------- --%>
                <td class="nowrap">
                  <% if (showRadioInsert) { %>
                  <input type="radio" onclick="javascript:insertLink('<%= itPub.getId() %>', '<%= HttpUtil.encodeForJavaScript(itPub.getTitle(targetLang)) %>', '<%= JcmsUtil.getDisplayUrl(itPub, targetLocale) %>')" />
                  <% } else if (showCheckInsert) {%>
                  <input type="checkbox" name='pubId' value='<%= itPub.getId() %>' />
                  <% } %>
                  <% if (!isDeleteMode && !isTextFieldPubLink) { %>
                    <% if (showEditIcon) { %>
                    <jalios:edit pub='<%= itPub %>' redirect='<%= redirectRefresh %>' popup='<%= popupEdition %>'/>
                    <% } %>
                    <% if (showValidateIcon) { %>
                    <jalios:edit pub='<%= itPub %>' icon="edit-wf" iconTitle='<%= glp("ui.com.alt.validate") %>' openTab='<%= JcmsConstants.WORKFLOW_TAB %>' redirect='<%= redirectRefresh %>' popup='<%= popupEdition %>' />
                    <% } %>
                  <% } %>
                </td>
                <% if (!isTextFieldPubLink) { %>
                <td class="numeric">
                  <%= plPagerHandler.getStart() + plCounter.intValue() %>.
                </td>            
                <% } %>
                <%-- --- PUB / RELEVANCE --------------------------- --%>
                <% if (showRelevance) { %>
                <td class="text-center">
                  <% float  score = queryResultSet.getScore(itPub); %>
                  <% float  scorePercent = (100 * score / queryResultSet.getMaxScore()); %>
                  <div class="relevance gauge tiny" title="<%= Math.round(scorePercent) %>%"><%
                    %><div class="level progress" style="width: <%= Math.round(scorePercent) %>%;"></div><%
                  %></div>
                </td>
                <% } %>
                <%-- --- PUB / STATUS--------------------------- --%>
                <% if (showState) { %>
                <td class="text-overflow">
                  <%= itPub.getWFStateLabelHtml(userLang) %>
                  <% if (!isDeleteMode) { %>
                  <jalios:checkIntegrity data='<%= itPub %>'/> 
                  <% if (showPreviewIcon && !itPub.isInVisibleState()) { %>
                  <jalios:link data='<%= itPub %>' params='preview=true'><jalios:icon src="preview"  title='<%= glp("ui.com.alt.previewpub") %>' alt='' /></jalios:link>                   
                  <% } else if (!isTextFieldPubLink && itPub.isTracked() && ReaderTrackerManager.getInstance().isReaderTrackerEnabled()) { 
                       String readerGray = itPub.getReaderCount() > 0 ? "reader-tracking" : "reader-tracking-gray";
                  %><a href="front/readerTracking/readerTrackingModal.jsp?trackedPubId=<%= itPub.getId() %>" class="modal"><jalios:icon src="<%= readerGray %>"   title='<%= glp("ui.com.alt.tracked", itPub.getReaderCount()) %>' /></a><% } %>
                  <% } %>
                  <jalios:importIcon pub='<%= itPub %>' />
                </td>
                <% } %>  
                <%-- --- PUB / WORKFLOW--------------------------- --%>
                <% if (showWorkflow) { %>
                  <td class="text-overflow"><%= itPub.getWorkflow().getLabel(userLang) %></td>
                <% } %>
                <%-- --- PUB / RIGHTS--------------------------- --%>
                <% if (showReadRigths) { %>
                
                <td class="text-overflow text-center">
                  <% if (itPub.hasAnyReadRights()) { %>
                  <jalios:tooltip icon="key" longdesc='<%= "jcore/tooltip/ttPublicationRights.jsp?id="+itPub.getId() %>' />
                  <% } else if (!itPub.isPublic() && itPub.isInVisibleState()) { %>
                  <jalios:tooltip icon="protected" property="ui.work.pub.lbl.protected"/>
                  <% } %>
                </td>
                <% } %>
                <%-- --- PUB / AUDIENCE RIGHTS--------------------------- --%>
                <% if (AudienceRights.getInstance().isEnabled()) { %>
                <td class="text-center">
                  <% if (itPub.isAudienced()) { %>
                  <jalios:tooltip icon="target"><%= itPub.getAudiencedRightsString(userLang, 5) %></jalios:tooltip>
                  <% } %>
                </td>
                <% } %>
                <td <%= itPub.isImported() ? "class='imported'" : "" %>>
                <%-- --- PUB / TITLE--------------------------- --%>
                <% if (itPub.isInDatabase()) { %>
                <jalios:tooltip icon="db" property="ui.com.lbl.dbdata" />
                <% } %>
                  <jalios:include target="PUBLIST_TITLE_LEFT" />
                <% if (itPub instanceof FileDocument) { %>
                <a href="<jalios:url data='<%= itPub %>' params='<%= displayURLparams + "&amp;details=true" %>'/>" <%= popupEdition ? "target='_blank'" : "" %> class="ID_<%= itPub.getId() %> ctxTooltipCard"><jalios:fileicon doc='<%= ((FileDocument)itPub) %>' /></a>
                <% } else if (itPub instanceof PortalElement) { %>
                <%   if (itPub instanceof Portal)         { %><a href='<%=  ServletUtil.getUrlWithUpdatedParam(request, "portalId", itPub.getId()) %>'><% } %>
                <%   if (itPub instanceof PortalRedirect) { %><a href='<%= ((PortalRedirect)itPub).getRedirectURL(loggedMember) %>'><% } %>
                <jalios:dataicon data="<%= itPub %>"/>
                <%   if (itPub instanceof PortalInterface) { %></a><% } %>
                <% } else { %>
                <jalios:dataicon data="<%= itPub %>"/>
                <% } %>
                <% if (isDeleteMode) { %>
                <a href='work/version.jsp?id=<%= itPub.getId() %>'><%= itPub.getTitle(userLang) %></a>
                <% } else { %>
                  <% if (itPub instanceof Content || itPub instanceof UserContent || itPub instanceof Portal) { %>
                  <a href="<jalios:url data='<%= itPub %>' params='<%= displayURLparams %>'/>" <%= popupEdition ? "target='_blank'" : "" %> class="ID_<%= itPub.getId() %> ctxTooltipCard"><%= itPub.getTitle(userLang) %></a>
                  <% } else { %><a href='work/displayWork.jsp?id=<%= itPub.getId() %>'><%= itPub.getTitle(userLang) %></a><% } %>
                  <% if (isFormMode) { %> - <jalios:date date='<%= itPub.getCdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= itPub.getCdate() %>' format='<%= "short" %>'/><% } %>
                  <% if (itPub.isWorkCopy()) { %><span class="wfstate" title="<%= glp("ui.com.lbl.workcopyof", itPub.getMainInstance().getTitle(userLang)) %>"><%= glp("ui.com.lbl.workcopy") %></span><% } %>
                  <%-- Portlet Copy behavior --%>
                  <%
                   if ((itPub instanceof PortalElement) && !((PortalElement)itPub).isCopy()) { 
                     String behaviorCopy = ((PortalElement)itPub).getBehaviorCopy();
                     String behaviorCopyShort = "copy";
                     if ("ws".equals(behaviorCopy)) {
                       behaviorCopyShort = "ws";
                     } else if ("true".equals(behaviorCopy)) {
                       behaviorCopyShort = "copy";
                     } else if ("false".equals(behaviorCopy)) {
                       behaviorCopyShort = "ref";
                     }
                     String behaviorCopyTitle = glp("ui.editportlet.behaviorcopy") + " : " + glp("ui.editportlet.behaviorcopy." + behaviorCopyShort);
                     %><span class='portlet-behavior-copy <%= behaviorCopyShort %> ctxTooltipMenu' title='<%= encodeForHTMLAttribute(behaviorCopyTitle) %>'><%= glp("ui.editportlet.behaviorcopy." + behaviorCopyShort + ".label") %></span><%
                   }
                  %>
                  <jalios:lock data='<%= itPub %>'/>
                  <% if (showReminderStatus && itPub.getWFState().hasReminder()) { %>
                  <% long reminderCount = itPub.getEstimatedReminderCount(); %>
                  <%   if (reminderCount > 0) { %>
                  - <jalios:icon src='bell'  title='<%= glp("ui.com.alt.estim-reminder") %>' />
                  <%     if (reminderCount > 1) { %>
                  x <%= reminderCount %>
                  <%     } %>
                  <%   } %>
                  <% } %>
                <% } %>
                  <jalios:include target="PUBLIST_TITLE_RIGHT" />
                </td>
                <%-- --- PUB / SUBMIT MEMBER--------------------------- --%>
                <% if (isFormMode) { %>
                <td>
                  <%= ((Form)itPub).getSubmitMember() == null ? "" : "" + ((Form)itPub).getSubmitMember() %>
                </td>
                <% } %>
                <%-- --- PUB / AUTHOR--------------------------- --%>
                <% if (showAuthor) { %>
                <td class="text-overflow">
                  <% if (!showRefineLink || isDeleteMode) { %>
                  <% if (itPub.getAuthor() == loggedMember) { %><b><%= itPub.getAuthor() %></b><% } else { %><%= itPub.getAuthor() %><% } %>
                  <% } else { %>
                  <a href='<%= itPub.getAuthor() == null ? "" : ServletUtil.getUrlWithUpdatedParams(request, new String[] {"mid", "skip"}, new String[] {itPub.getAuthor().getId(),null}) %>'>
                  <% if (itPub.getAuthor() == loggedMember) { %><b><%= itPub.getAuthor() %></b><% } else { %><%= itPub.getAuthor() %><% } %>
                  </a>
                  <% } %>
                </td>
                <% } %>
                <%-- --- PUB / ROLE--------------------------- --%>
                <% if (showRole) { %>
                  <td>
                  <% if (Util.notEmpty(itPub.getRoleMap())) { %>
                  <ul>
                  <jalios:foreach collection='<%= itPub.getRoleMap().entrySet() %>' type='Map.Entry' name='itEntry' counter='itCounter2'>
                    <li><%= itEntry.getKey() %> : <%= itEntry.getValue() %></li>
                  </jalios:foreach>
                  </ul>
                  <% } %>
                  </td>
                <% } %>
                <%-- --- PUB / WORKSPACE--------------------------- --%>
                <% if (showWorkspace) { %>
                  <td class="text-overflow"><%= itPub.getWorkspace().getTitle(userLang) %></td>
                <% } %>
                <%-- --- PUB / OP-AUTHOR--------------------------- --%>                
                <% if (isDeleteMode) { %>
                <td>
                  <% if (itPub.getOpAuthor() != itPub.getAuthor()) { %><em><%= Util.getString(itPub.getOpAuthor(), glp("ui.com.lbl.no-op-author")) %></em><% } else { %><%= itPub.getOpAuthor() %><% } %>
                </td>
                <% } %>
                <%-- --- PUB / TYPE--------------------------- --%>                
                <% if (showType) { %>
                <td class="text-overflow">
                  <% if (!showRefineLink || isDeleteMode) { %>
                    <%= channel.getTypeLabel(itPub.getClass(),itPub.getWorkspace(), userLang) %>
                  <% } else { %>
                    <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"classname", "skip"}, new String[] {itPub.getClass().getName(), null}) %>' ><%= itPub.getTypeLabel(userLang) %></a>
                  <% } %>
                </td>
                <% } %>
                <%-- --- PUB / DDATE --------------------------- --%>
                <% if (isDeleteMode) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getDdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } else { %>
                <%-- --- PUB / MDATE --------------------------- --%> 
                <td class="date-time"><jalios:date date='<%= itPub.getMdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / CDATE--------------------------- --%> 
                <% if (isDetailMode) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getCdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / UDATE--------------------------- --%> 
                <% if (isDetailMode) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getUdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / PDATE--------------------------- --%> 
                <% if (isContentMode && (showPdate || isDetailMode)) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getPdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / EDATE--------------------------- --%> 
                <% if (isContentMode && (isDetailMode || showEdate)) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getEdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / ADATE--------------------------- --%> 
                <% if (isContentMode && (isDetailMode || showAdate)) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getAdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / SDATE--------------------------- --%> 
                <% if (isContentMode && (isDetailMode || showSdate)) { %>
                <td class="date-time"><jalios:date date='<%= itPub.getSdate() %>' format='<%= "dateOrTime" %>'/></td>
                <% } %>
                <%-- --- PUB / MAIN LANGUAGE --------------------------- --%> 
                <% if (isContentMode && isDetailMode) { %>
                <td class="text-center"><jalios:lang lang="<%= itPub.getMainLanguage() %>"/></td>
                <% } %>
                <%-- --- PUB / ID --------------------------- --%> 
                <% if (isDetailMode) { %>
                <td class="date-time"><%= itPub.getId() %></td>
                <% } %>
                <%-- --- PUB / CADDY --------------------------- --%> 
                <% if (!isTextFieldPubLink && showCaddy) { %>
                <td class="text-center">
                  <% if (showCaddy) { %><jalios:caddy data="<%= itPub %>" /><% } %>
                  <% if (showReminderIcon && !isDeleteMode && itPub.getWFState().hasReminder()) { %>
                    <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
                    <a href='work/sendWFReminder.jsp?id=<%= itPub.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(redirectJSNoCaddy) %>' onclick='confirmAction("<%= confirm %>", this.href); return false;'><jalios:icon src="bell-go"  title='<%= glp("ui.com.alt.send-reminder") %>' /></a> 
                  <% } %>
                </td>
                <% } %>
              </tr>
             </jalios:foreach>
              <%-- Restore 'itPub' attribute --%>
              <% ServletUtil.restoreAttribute(pageContext , "itPu"); %>
            </table>
            </form>

            <jalios:pager name='plPagerHandler'/>
            <% if (showCheckInsert) { %>
              <input class='btn btn-default' type='button' value='<%= glp("ui.work.pub-ch.btn.select") %>'
                     onclick="javascript:insertLink(FormUtil.getCheckedValues('editForm','pubId').join(' ') , '<%= glp("ui.work.pub-ch.list") %>')">
            <% } %>
<% } %>