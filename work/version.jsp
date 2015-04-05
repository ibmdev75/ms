<%--
  @Summary: Version Manager
  @Category: Work Area / Version
  @Author: Jalios SA
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%><%

%><%!

public static boolean isVids(String[] vids , String vid){
  if (null == vids) {
    return false;
  }
		
  for (int i = 0 ; i < vids.length ; i++){
    if (vids[i].equals(vid)) {
      return true;
    }
  }
  return false;
}

WFNote getWFNote(Publication oldPub) {
  Publication pub = (Publication)channel.getPublication(oldPub.getId());
  List wfNoteList = WorkflowManager.getInstance().getWFNoteList(pub);
  if (Util.isEmpty(wfNoteList)) {
    return null;
  }
  long mdate = oldPub.getMdate().getTime();
  for(Iterator it = wfNoteList.iterator(); it.hasNext();) {
    WFNote wfNote = (WFNote)it.next();
    if (Math.abs(wfNote.getCdate().getTime() - mdate) < 1000) {
      if (Util.notEmpty(wfNote.getNote())) {
        return wfNote;
      }
      return null;
    }
  }
  return null;
}
%><%

if (hasParameter("opRevert")) {
  request.setAttribute("CheckCSRF", Boolean.TRUE);
}

%><%@ include file='/jcore/doInitPage.jspf' %>
<jalios:javascript>
 'JCMS.Version'._namespace({
     showFieldsMerged   : function(element) { 
       element.getElementsBySelector('.show_fields').each(Element.show);
       element.getElementsBySelector('.merge_fields').each(Element.hide);
     },
     showFieldsCompared : function(element) { 
       element.getElementsBySelector('.show_fields').each(Element.hide);
       element.getElementsBySelector('.merge_fields').each(Element.show);
     }
 });
</jalios:javascript><%
  
  // Disable Wiki Edit Inline
  jcmsContext.setAjaxRequestAttribute(com.jalios.jcms.taglib.WikiTag.DISABLED_INLINE,"true");
  
	// Set FrontOffice CSS and JS
	jcmsContext.addCSSHeader(JcmsJspContext.getFrontOfficeCSSHeader());
	jcmsContext.addJavaScript(JcmsJspContext.getFrontOfficeJavaScriptSet());
	jcmsContext.addCSSHeader("css/portal/jalios.css");
  jcmsContext.addCSSHeader("css/jalios/edit-pub.css");
  String id = getStringParameter("id", null, HttpUtil.DATAID_REGEX);
	if (Util.isEmpty(id)) {
		sendRedirect("index.jsp", request, response);
		return;
	}

	// -- Setting parameters --
	String 		vid 		= getAlphaNumParameter("vid", null); 
	String 		revert 		= getAlphaNumParameter("opRevert", null);
	List 		versionList = null;
	int			versionID	= 0;
	
	Publication itPubVer	= null;
  Publication pub = channel.getPublication(id);
  
  if (null != id && (pub == null || pub.isVersioned())){
		versionList	= channel.getVersionList(id);
		if (null != vid) {	
			versionID	= Util.toInt(vid,0);
	    itPubVer	= (Publication) versionList.get(versionID);	
			if (null != revert){
			  Publication currPub = channel.getPublication(itPubVer.getId());
			  
        // Revert a deleted publication
				if (currPub == null ) {
					itPubVer.setId(null);
					itPubVer.setMajorVersion(1);
					itPubVer.setPstatus(itPubVer.getWorkflow().getInitState().getPstatus());
					itPubVer.performCreate(loggedMember);
					sendRedirect("work/pubBrowser.jsp?mode=all", request, response);
				}
			  // Revert (update) a live publication
				else {
          
                  // For DBData, evict the currPub to avoid the NonUniqueObjectException
				  if (itPubVer instanceof DBData) {
				    HibernateUtil.evict(currPub);
				  }
				  // Increase major version if different
				  if (currPub.getMajorVersion() != itPubVer.getMajorVersion()) {
				    itPubVer.setMajorVersion(currPub.getMajorVersion() + 1);
				  }
				  Map context = Util.getHashMap(DataController.CTXT_IGNORE_DBDATA_MODIFICATION_CHECK, Boolean.TRUE); // FIX JCMS-3264
				  itPubVer.performUpdate(loggedMember, context);
				  sendRedirect(ServletUtil.getBaseUrl(request) + "work/version.jsp?id="+id, request, response);
				}
				
				return;
			}
		}
	}
	boolean isDeleted = (channel.getPublication(id) == null);
  Publication lastPub = Util.isEmpty(versionList) ? null : (Publication)versionList.get(versionList.size() - 1);
  request.setAttribute("title",  glp("ui.work.ver.title") + (lastPub == null ? "" : " " + lastPub.getTitle(userLang))); 
  
  String subMenuKey = isDeleted ? "deleted" : "my";
  subMenuKey += (itPubVer instanceof PortalElement) ? "Portlet" :
                (itPubVer instanceof UserContent) ? "UGC" :
                (itPubVer instanceof Form) ? "Form" : "Content";
  subMenuKey += "WAMenu";
  
  request.setAttribute(subMenuKey, "true"); 

  if (lastPub != null && loggedMember.canWorkOn(lastPub)) {
    request.setAttribute("authorized", Boolean.TRUE); 
  }

  Workflow wf = WorkflowManager.getInstance().getWorkflow(lastPub);
  List rVersionList = Util.isEmpty(versionList) ? new ArrayList() : new ArrayList(versionList);
  if (isDeleted && Util.notEmpty(rVersionList)) {
    rVersionList.remove(rVersionList.size() - 1);
  }
  String[] vids = getStringParameterValues("vid", "^[0-9]*$");
  Collections.reverse(rVersionList);
  int openTab = 0;
  boolean isShowVersion = false;
  boolean isShowDiff = false;
  if (vids != null && vids.length == 1) {
    isShowVersion = true;
    openTab = 1;
  }
  if (vids != null && vids.length == 2) {
    isShowDiff = true;
    openTab = 1;
  }
  
  // ddate
  String ddate = lastPub == null || lastPub.getDdate() == null ? "???" : DateFormat.getDateInstance(DateFormat.SHORT, userLocale).format(lastPub.getDdate());
  String dtime = lastPub == null || lastPub.getDdate() == null ? "???" : DateFormat.getTimeInstance(DateFormat.SHORT, userLocale).format(lastPub.getDdate());
  
  // Set the Portal CSS
	PortalInterface pi = jcmsContext.getPortal();
	if (pi instanceof Portal){
	  jcmsContext.addCSSHeader(((Portal)pi).getCssFile());
	}
  if(Util.getSize(vids) > 2){
    request.setAttribute(JcmsConstants.WARNING_MSG, glp("ui.work.ver.versions-max"));
  }
%><%@ include file='/work/doWorkHeader.jspf' %>
<% if (Util.isEmpty(versionList)) { %>
<% setErrorMsgSession(glp("ui.work.ver.no-ver", "<i>" + channel.getPublication(id) + "</i> (" + id + ")"), request); %>
<% } else { %>
<div class="page-header">
  <h1><%= glp("ui.work.ver.title") %>
    <% if (isDeleted) { %>
    <i><%= lastPub.getTitle(userLang) %></i>
    <% } else { %>
    <jalios:link data='<%= lastPub %>'/>
    <jalios:edit pub="<%= lastPub %>" />
    <% } %>
  </h1>
</div>
<% if (isDeleted) { %>
  <% String delOpAuthor = lastPub.getOpAuthor() == null ? "???" : lastPub.getOpAuthor().getFullName(); %>
  <p>
  <jalios:icon src='warning'  /> <font color="#FF3333" size="2" face="Arial, Helvetica, sans-serif"><b><% /* %>This publication has been deleted.<% */ %><%= glp("ui.work.ver.txt.del-pub", delOpAuthor, ddate, dtime) %></b></font>
  </p>
<% } %>


<div class="tab-pane" id="versionTab">

<%-- *** VERSION HISTORY **************************************************** --%>
<% if (null != id && (!versionList.isEmpty() && loggedMember.canWorkOn(lastPub))) { %> 
<%
Date minDate = ((Publication)versionList.get(0)).getCdate();
Date maxDate = lastPub.getMdate();
String minDateStr = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, userLocale).format(minDate);
String maxDateStr = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, userLocale).format(maxDate);

%>
<div class="tab-page">
<h2 class="tab"><% /* %>Version History<% */ %><%= glp("ui.work.ver.tab.hist") %></h2>
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <p><%= glp("ui.work.ver.summary", "" + versionList.size(), minDateStr, maxDateStr) %></p>
  <form action="work/version.jsp" name="editForm" method="post">
  <input type="hidden" name="id"  value="<%= id %>" />
  <table id='versionTable' class="table-data table-condensed">
    <tr>
      <td class='listHeader text-center' nowrap="nowrap">&nbsp;</td>
      <td class='listHeader text-center' nowrap="nowrap">&nbsp;</td>
      <td class='listHeader text-center' nowrap="nowrap"><%= glp("ui.com.lbl.status") %></td>
      <td class='listHeader text-center' width="100%" nowrap="nowrap"><%= glp("ui.com.lbl.title") %></td>
      <td class='listHeader text-center' width="100%" nowrap="nowrap"><%= glp("ui.com.lbl.author") %></td>
      <td class='listHeader text-center' width="100%" nowrap="nowrap"><%= glp("ui.com.lbl.op-author") %></td>
      <td class='listHeader text-center' width="100%" nowrap="nowrap"><%= glp("ui.com.lbl.op-delegate") %></td>
      <td class='listHeader text-center' nowrap="nowrap"><%= glp("ui.work.ver.lbl.cat") %></td>
      <td class='listHeader text-center' nowrap="nowrap"><%= glp("ui.com.lbl.rights") %></td>
      <td class='listHeader text-center' nowrap="nowrap"><%= glp("ui.com.lbl.pdate") %></td>
      <td class='listHeader text-center' nowrap="nowrap"><%= glp("ui.com.lbl.edate") %></td>
      <td class='listHeader text-center' nowrap="nowrap"><%= glp("ui.com.lbl.mdate") %></td>
    </tr>
    <jalios:pager name='vPagerHandler' declare='true' action='init' size='<%= rVersionList.size() %>'/>
    <% 
	  String noChangeClass = "class='no-change'";
    int lastPos = rVersionList.size() - 1;
    %>
    <jalios:foreach name='itPub' type='Publication' collection='<%= rVersionList %>'
                    max='<%= vPagerHandler.getPageSize() %>'
                    skip='<%= vPagerHandler.getStart() %>'>
    	<% 
    	int pos = (itCounter.intValue()-1) + vPagerHandler.getStart() ;
    	boolean deleted	= channel.getData(itPub.getId()) == null;
    	int version = rVersionList.size() - (itCounter.intValue() + vPagerHandler.getStart());
    	boolean lastIteration = pos == lastPos;
    	Publication nextPub = lastIteration ? null : (Publication)rVersionList.get(pos + 1); 
    	boolean cmpNext = nextPub != null;
    	String cssClass = "";
    	WFNote wfNote = getWFNote(itPub);
    	boolean majorUpdate = nextPub == null || itPub.getMajorVersion() != nextPub.getMajorVersion();	
    	boolean merge = nextPub != null && itPub.getMergeDate() != nextPub.getMergeDate();
    	boolean newUpload = itPub instanceof FileDocument && (nextPub == null || !((FileDocument)itPub).getUploadDate().equals(((FileDocument)nextPub).getUploadDate()));
      %>
    <tr class="vTop"> 
      <td class='text-right' nowrap="nowrap"><input name="vid" type="checkbox" value="<%= version %>" <%= isVids(vids , version + "") ? "checked" : "" %>></td>

      <%-- VALUE / VERSION --%>
      <td align='right' nowrap="nowrap">
      <% if (majorUpdate) { %><strong><% } %>
      v. <%= itPub.getVersionString() %>
      <% if (majorUpdate) { %></strong><% } %>
      </td>
      <%-- VALUE / STATE --%>
      <% String stateClass = "class='" + (itPub.isInVisibleState() ? "pub-state" : "work-state") +"'"; %>
      <% boolean noChange = cmpNext && itPub.getPstatus() == nextPub.getPstatus(); %>
      <% cssClass = noChange ? noChangeClass : stateClass; %>
      <td align='left' nowrap="nowrap">
        <jalios:icon src='wf' />
        <% if (noChange) { %>
        <span <%= noChangeClass %>><%= itPub.getWFStateLabel(userLang) %></span>
        <% } else { %>
        <%= (null != wf) ? itPub.getWFStateLabelHtml(userLang) : "No Workflow" %>
        </span>
        <% } %>
	  	  <% if (wfNote != null) {%>
	  	  <jalios:icon src='wfnote'  title='<%= encodeForHTMLAttribute(wfNote.getNote() + " - " + wfNote.getAuthor()) %>'/>
	  	  <% } %>
	  	  <% if (newUpload) {%>
	  	  <jalios:fileicon doc='<%= (FileDocument)itPub %>' />
	  	  <% } %>
	  	  <% if (merge) {%>
	  	  <a href='work/version.jsp?id=<%= itPub.getMergeId() %>'><jalios:icon src="duplicate-merge" title='<%= glp("ui.work.ver.lbl.merge") %>'  /></a>
	  	  <% } %>
       </td>
      
      <%-- VALUE / TITLE --%>
      <% cssClass = cmpNext && Util.isSameContent(itPub.getTitle(), nextPub.getTitle()) ? noChangeClass : ""; %>
      <td <%= cssClass %> align='left'>
	  	  <a href='work/version.jsp?id=<%= itPub.getId() %>&amp;vid=<%= version %>'>
	  	  <%= itPub.getTitle(userLang) %>
	  	  </a>
     </td>
      
      <%-- VALUE / AUTHOR --%>
      <% cssClass = cmpNext && itPub.getAuthor() == nextPub.getAuthor() ? noChangeClass : ""; %>
      <td <%= cssClass %> nowrap="nowrap">
      <%= itPub.getAuthor() %>
      </td>
      
      <%-- VALUE / OPAUTHOR --%>
      <% cssClass = cmpNext && itPub.getOpAuthor() == nextPub.getOpAuthor() ? noChangeClass : ""; %>
      <td <%= cssClass %> nowrap="nowrap">
      <%= Util.getString(itPub.getOpAuthor(), glp("ui.com.lbl.no-op-author")) %>
      </td>
      
      <%-- VALUE / OPDELEGATE --%>
      <% cssClass = cmpNext && itPub.getOpDelegate() == nextPub.getOpDelegate() ? noChangeClass : ""; %>
      <td <%= cssClass %> nowrap="nowrap">
      <%= Util.getString(itPub.getOpDelegate(), "") %>
      </td>

      <%-- VALUE / CATEGORIES --%>
      <td nowrap="nowrap">
       <% if (cmpNext && Util.isSameContent(itPub.getCategories(), nextPub.getCategories())) { %>
        <span <%= noChangeClass %>><%= glp("ui.work.ver.lbl.nochange")%></span>
        <% } else { %>
        <ul>
	      <jalios:foreach array="<%= itPub.getCategories() %>" type="Category" name="itCat" counter="catCounter">
          <li><%= itCat != null ? itCat.toString() : "" %></li>
        </jalios:foreach>
        </ul>
        <% } %>
      </td>
      
      <%-- VALUE / RIGHTS --%>
      <td nowrap="nowrap">
       <% if (cmpNext && Util.isSameContent(itPub.getAuthorizedMemberSet(), nextPub.getAuthorizedMemberSet())
                      && Util.isSameContent(itPub.getAuthorizedGroupSet(), nextPub.getAuthorizedGroupSet())) { %>
        <span <%= noChangeClass %>><%= glp("ui.work.ver.lbl.nochange")%></span>
        <% } else { %>
        <ul>
	      <jalios:foreach collection="<%= itPub.getAuthorizedGroupSet() %>" type="Group" name="itGrp" counter="grpCounter">
          <li><%= itGrp != null ? itGrp.toString() : "" %></li>
        </jalios:foreach>
	      <jalios:foreach collection="<%= itPub.getAuthorizedMemberSet() %>" type="Member" name="itMbr" counter="mbrCounter">
          <li><%= itMbr != null ? itMbr.toString() : "" %></li>
        </jalios:foreach>
        </ul>
        <% } %>
      </td>
      
      <%-- VALUE / PDATE --%>
      <% cssClass = cmpNext && Util.isSameContent(itPub.getPdate(), nextPub.getPdate()) ? noChangeClass : ""; %>
      <td <%= cssClass %> align='right' nowrap="nowrap">
        <jalios:date date='<%= itPub.getPdate() %>' format='<%= "short" %>'/>&nbsp;<jalios:time date='<%= itPub.getPdate() %>' format='<%= "short" %>'/>
      </td>
      
      <%-- VALUE / EDATE --%>
      <% cssClass = cmpNext && Util.isSameContent(itPub.getEdate(), nextPub.getEdate()) ? noChangeClass : ""; %>
      <td <%= cssClass %> align='right' nowrap="nowrap">
        <jalios:date date='<%= itPub.getEdate() %>' format='<%= "short" %>'/>&nbsp;<jalios:time date='<%= itPub.getEdate() %>' format='<%= "short" %>'/>
      </td>
      
      <%-- VALUE / MDATE --%>
      <% cssClass = cmpNext && Util.isSameContent(itPub.getMdate(), nextPub.getMdate()) ? noChangeClass : ""; %>
      <td <%= cssClass %> align='right' nowrap="nowrap">
        <jalios:date date='<%= itPub.getMdate() %>' format='<%= "short" %>'/>&nbsp;<jalios:time date='<%= itPub.getMdate() %>' format='<%= "short" %>'/>
      </td>
       
    </tr>
    </jalios:foreach>
  </table>
  <p>
    <input class='btn btn-primary' name="opUpdate" type="submit" value='<%= glp("ui.work.ver.btn.diff") %>' />
  </p>
  </form>
  
  <jalios:pager name='vPagerHandler' />
</div>

<%-- *** SHOW VERSION **************************************************** --%>
<% if (isShowVersion) { %>
<%
    TypeTemplateEntry tte = itPubVer.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_FULL,true);
		String displayTemplateFile = "/" + tte.getPath();
		String displayTemplateLabel = tte.getLabel(userLang);
%>
<div class="tab-page">
<h2 class="tab"><% /* %>Display Template<% */ %><%= glp("ui.work.ver.tab.disp", itPubVer.getVersionString() ) %></h2>
  <font size="2" face="Arial, Helvetica, sans-serif"><b><%= glp("ui.work.ver.txt.temp") %></b> <%= displayTemplateLabel %> (<%= displayTemplateFile %>)</font><br />
  <font size="2" face="Arial, Helvetica, sans-serif"><b><%= glp("ui.com.lbl.op-author") %></b> <%= Util.getString(itPubVer.getOpAuthor(), glp("ui.com.lbl.no-op-author")) %></font><br />
  <% if (itPubVer.getOpDelegate() != null) { %>
  <font size="2" face="Arial, Helvetica, sans-serif"><b><%= glp("ui.com.lbl.op-delegate") %></b> <%= itPubVer.getOpDelegate() %></font><br />
  <% } %>
  <br />
  <table class='layout'>
		<tr>
		  <td bgcolor="#FFFFFF">
				<% if (itPubVer instanceof PortalElement ) { %>
					<div>
					<%  displayPortlet = (PortalElement)itPubVer; %>
					<%@ include file='/jcore/portal/doIncludePortlet.jspf' %>
					</div>
				<% } else { %>
  			  <% 
  			    boolean tmpForceEditIcon = jcmsContext.isEditIcon();
  			    jcmsContext.forceEditIcon(false);
  			    request.setAttribute(PortalManager.PORTAL_PUBLICATION, itPubVer);
  			    request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
            Set<String> allFilePath = itPubVer.getAllFilePath();
            if (Util.notEmpty(allFilePath)) {
              synchronized (session) {
		 	          Set<String> authorizedFilenamesSet = (Set<String>)session.getAttribute(JcmsConstants.SESSION_AUTHORIZED_FILENAMES_SET);
		 	          if (authorizedFilenamesSet == null) {
		 	            authorizedFilenamesSet = new TreeSet<String>();
		 	            session.setAttribute(JcmsConstants.SESSION_AUTHORIZED_FILENAMES_SET, authorizedFilenamesSet);
		 	          }
                authorizedFilenamesSet.addAll(allFilePath);
	 	          }
            }
  			  %>
				  <jalios:include jsp="<%= displayTemplateFile %>" />
				  <% 
				    jcmsContext.forceEditIcon(tmpForceEditIcon); 
				    request.removeAttribute("isInContentFullDisplay");
				  %>
				<% } %>
				
		</td></tr>
  </table>
  <% if (isDeleted || Util.toInt(vids[0],-1) != lastPos){ %>
  <div class="text-center">
    <form action="work/version.jsp" 	name="editForm" method="get">
      <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
      <input class='btn btn-primary' type="button" name="opRevert" value='<%= glp("ui.work.ver.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/work/version.jsp?opRevert=true&amp;id=<%= id %>&amp;vid=<%= vid %>")' />
    </form>
  </div>
  <% } %>
</div>
<% } %>

<%-- *** SHOW DIFF  **************************************************** --%>
<% if (isShowDiff) { %>
<div class="tab-page">
<% 
Publication newPub = (Publication) versionList.get(Util.toInt(vids[0],0));
Publication oldPub = (Publication) versionList.get(Util.toInt(vids[1],0)); 
request.setAttribute("newPub", newPub);
request.setAttribute("oldPub", oldPub);
request.setAttribute("vids", vids);

String classShortName = Util.getClassShortName(newPub.getClass());
String diffJSP = "/types/" + classShortName + "/do" + classShortName + "Diff.jsp"; 
%>
  <h2 class="tab"><% /* %>Diff 2 Versions<% */ %><%= glp("ui.work.ver.tab.diff", newPub.getVersionString(), oldPub.getVersionString()) %></h2>

<table id='versionTable' class="table-data table-condensed">
  <tr>
    <th width="1%">&nbsp;</th>
    <th nowrap="nowrap" ><%= glp("ui.work.ver.lbl.field") %></th>
    <th nowrap="nowrap" width="49%"><%= glp("ui.work.ver.lbl.ver", newPub.getVersionString()) %></th>
    <th nowrap="nowrap" width="49%"><%= glp("ui.work.ver.lbl.ver", oldPub.getVersionString()) %></th>
  </tr>
<jalios:include jsp="<%= diffJSP %>"/>
</table>
<br /><%= glp("ui.work.ver.txt.legend") %> <span class='diff-add'><%= glp("ui.work.ver.txt.add") %></span> - <span class='diff-remove'><%= glp("ui.work.ver.txt.remove") %></span></font>
</div>
<% } %>

<% } %>

</div>
<br />
<jalios:javascript>
  setSelectedTab("versionTab", <%= openTab %>);
</jalios:javascript>

<% } // versionList == null %>
<%@ include file='/work/doWorkFooter.jspf' %>
