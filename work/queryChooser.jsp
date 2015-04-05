<%--
  @Summary: Query Chooser : allow user to select search and query options for use in query field
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%  request.setAttribute("title", glp("ui.work.query-ch.title")); %><%
%><%@ include file="/jcore/doEmptyHeader.jspf" %><%

Calendar beginCalendar = Calendar.getInstance();
beginCalendar.setTime(new Date(System.currentTimeMillis()- 3*JcmsConstants.MILLIS_IN_ONE_MONTH));
Calendar endCalendar = Calendar.getInstance();
endCalendar.setTime(new Date());
java.text.DateFormatSymbols dfs = new java.text.DateFormatSymbols(userLocale);
String targetInput  = getChooserParameter("targetInput");
String targetLabel  = getChooserParameter("targetLabel");
boolean opValidate = hasParameter("opValidate");
	
	request.setAttribute("zone","InternalUI");
	
String ADVANCEDSEARCH_INPUT_ID_PREFIX = "SearchInputIdPrefix_";  


if (opValidate) {

  %><jsp:useBean id="queryHandler" scope="page" class="com.jalios.jcms.handler.QueryHandler"><%
    %><jsp:setProperty name="queryHandler" property="request"  value="<%= request %>"/><%
    %><jsp:setProperty name="queryHandler" property="response" value="<%= response %>"/><%
    %><jsp:setProperty name="queryHandler" property="*" /><%
  %></jsp:useBean><%
  
  queryHandler.setIgnoreDefaultTypes(true);
  
  String queryString = queryHandler.getQueryString();    
  String readableQuery = queryHandler.getDescription();  
%>
<jalios:javascript>
    var str = '<%= queryString %>';
    var readableQuery = '<%= encodeForJavaScript(readableQuery) %>';
  
    <% if (targetLabel != null && Util.notEmpty(targetLabel)) { %>
  		window.opener.<%= targetLabel %> = readableQuery;
  	<% } %>
  	<% if (targetInput != null && Util.notEmpty(targetInput)) { %>
      window.opener.<%= targetInput %> = str;
    <% } else { %>
      Popup.callback(str, readableQuery);
    <% } %>
    window.close();
</jalios:javascript><%

%>
<jalios:message>
  <p><strong><%= glp("ui.com.lbl.description") %> : </strong></p> 
  <blockquote><%= encodeForHTML(readableQuery) %></blockquote>
  
  <p><strong><%= glp("types.PortletQueryForeach.tabs.query.label") %> : </strong></p>
  <pre><%= encodeForHTML(queryString) %></pre>
</jalios:message>
<%
  
} // opValidate

if (!opValidate) {
 
  String qs = getUntrustedStringParameter("qs", null); // ENCODE !!
  com.jalios.jcms.handler.QueryHandler formHandler = null;
  try {
    formHandler = qs != null ? new com.jalios.jcms.handler.QueryHandler(qs) : null;
  } catch (IllegalArgumentException ex) {
    logger.warn("An invalid queryString was given to the QueryChooser, an empty search will be used : '"+qs+"' : " + ex.getMessage());
  }
  
  if (formHandler != null) { 
    formHandler.setCheckPstatus(false);
    request.setAttribute("formHandler", formHandler);
  }
%>
<div class="navbar-placeholder"></div>
<form name="queryForm" action="work/queryChooser.jsp" method="post" class="form-horizontal">
  <input type="hidden" name="targetInput" value='<%= encodeForHTMLAttribute(Util.getString(targetInput, "")) %>' />
  <input type="hidden" name="targetLabel" value='<%= encodeForHTMLAttribute(Util.getString(targetLabel, "")) %>' />

  <div class="mb-nav navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <a class="navbar-brand" href="#"><%= glp("ui.work.query-ch.title") %></a>
        <button type="submit" name="opValidate" value="true" class="btn btn-primary navbar-btn pull-right visible-xs-block" style="margin-right: 15px;">
          <%= glp("ui.work.query-ch.btn.select") %>
        </button>
      </div>
        
      <ul class="nav navbar-form navbar-nav navbar-right hidden-xs ">      
        <li>
          <button type="submit" name="opValidate" value="true" class="btn btn-primary">
            <%= glp("ui.work.query-ch.btn.select") %>
          </button>
        </li>
      </ul>   
            
         
    </div>
  </div><%-- navbar --%>
  
  <div class="container-fluid">
  <ul class="nav nav-tabs" role="tablist">
    <li class="active"><a href="#qs-tab-cat" data-toggle="tab"><%= glp("ui.work.search.tab.cat") %></a></li>
    <li><a href="#qs-tab-date" data-toggle="tab"><%= glp("ui.work.search.tab.date") %></a></li>
    <li><a href="#qs-tab-type" data-toggle="tab"><%= glp("ui.work.search.tab.type") %></a></li>
    <li><a href="#qs-tab-group" data-toggle="tab"><%= glp("ui.work.search.tab.group") %></a></li>
    <li><a href="#qs-tab-state" data-toggle="tab"><%= glp("ui.work.search.tab.state") %></a></li>
   <% if (channel.isMultilingual()) { %>
    <li><a href="#qs-tab-lang" data-toggle="tab"><%= glp("ui.work.search.tab.lang") %></a></li>
   <% } %>
    <li><a href="#qs-tab-kind" data-toggle="tab"><%= glp("ui.work.search.tab.kind") %></a></li>
    <li><a href="#qs-tab-ws" data-toggle="tab"><%= glp("ui.work.search.tab.ws") %></a></li>
    <li><a href="#qs-tab-advanced" data-toggle="tab"><%= glp("ui.work.search.tab.advanced") %></a></li>
    <li></li>
  </ul>    
  </div>
  
  <div class="tab-content container-fluid">
  
   <%-- *** CATEGORY ************************************** --%>
   <% 
   if (formHandler != null)  {
     request.setAttribute("dscExactCat",   formHandler.getExactCat()); 
     request.setAttribute("dscCatMode",    Util.getString(formHandler.getCatMode(), "and")); 
     request.setAttribute("dscCatSet",     formHandler.getCategorySet("cids")); 
   } 
   request.setAttribute("dscRootSet",    Util.getHashSet(channel.getRootCategory()));
   %>
    <div class="tab-pane active" id="qs-tab-cat">
      <%@ include file="/jcore/search/doSearchCategory.jspf" %>
    </div>
    
    <%-- *** DATE ************************************** --%>
    <div class="tab-pane" id="qs-tab-date">
      <% if (formHandler != null)  {
           request.setAttribute("dsdDateType",   formHandler.getDateType()); 
           request.setAttribute("dsdDateSince",  "" + formHandler.getDateSinceInt()); 
           Date[] beginAndEndDates = formHandler.getBeginAndEndDates();           
           request.setAttribute("dsdBeginDate",  beginAndEndDates[0]); 
           request.setAttribute("dsdEndDate",    beginAndEndDates[1]); 
         }
      %>
      <%@ include file="/jcore/search/doSearchDate.jspf" %>
    </div>
    
    <%-- *** TYPE ************************************** --%>
    <div class="tab-pane" id="qs-tab-type">
      <% 
         request.setAttribute("dstCheckPstatus", "false");
         request.setAttribute("dstShowReplaceFileDoc", "true");
         if (formHandler != null)  {
           request.setAttribute("dstReplaceFileDoc",  "" + formHandler.getReplaceFileDoc());
           request.setAttribute("dstExactType",  "" + formHandler.getExactType());
           request.setAttribute("dstClassSet", formHandler.getClassSet()); 
         }
      %>
      <%@ include file="/jcore/search/doSearchType.jspf" %>
    </div>
    
    <%-- *** GROUP ************************************** --%>
    <div class="tab-pane" id="qs-tab-group">
      <% if (formHandler != null)  {
           request.setAttribute("dsgGroupSet", channel.getDataSet(formHandler.getGids())); 
           if (Util.notEmpty(formHandler.getMids())) {
             request.setAttribute("dsgMember", channel.getMember(formHandler.getMids()[0])); 
           }
         }
      %>
      <%@ include file="/jcore/search/doSearchGroup.jspf" %>
    </div>
    
    <%-- *** STATE ************************************** --%>
    <div class="tab-pane" id="qs-tab-state">
      <%
      if (formHandler != null) {
        request.setAttribute("dspPstatus", formHandler.getIntPstatus());
        request.setAttribute("dspWfId", formHandler.getWfId());
      }
      %>
      <jalios:include jsp="/jcore/search/doSearchPstatus.jsp" />
    </div>
    
    <%-- *** LANG ************************************** --%>
    <% if (channel.isMultilingual()) { %>
    <div class="tab-pane" id="qs-tab-lang">
      <% request.setAttribute("dslUserLang", "true"); %>
      <% if (formHandler != null) request.setAttribute("dslLangs", formHandler.getUnresolvedLangs()); %>
      <%@ include file="/jcore/search/doSearchLang.jspf" %>
    </div>
    <% } %>
    
    <%-- *** FileDocument kind ************************************** --%>
    <div class="tab-pane" id="qs-tab-kind">
      <% if (formHandler != null) request.setAttribute("dslDocumentKinds", formHandler.getDocumentKinds()); %>
      <%@ include file="/jcore/search/doSearchKind.jspf" %>
    </div>
    
    <%-- *** WORKSPACE ************************************** --%>
    <div class="tab-pane" id="qs-tab-ws">
      <%
      if (formHandler != null) {
        request.setAttribute("dswWorkspaces", formHandler.getWorkspaceSet());
        request.setAttribute("dswSearchInSubWorkspaces", formHandler.getSearchInSubWorkspaces());
      }
      %>
      <%@ include file="/jcore/search/doSearchWorkspace.jspf" %>
    </div>
    
    <%-- *** ADVANCED ************************************** --%>
    <div class="tab-pane" id="qs-tab-advanced">
      <% if (formHandler != null) request.setAttribute("dsaSearchAdvanced", formHandler.getAdvanced()); %>
      <%@ include file="/jcore/search/doSearchAdvanced.jspf" %>
    </div>
    
  </div><%-- class="tab-content" --%>
  
</form>
<% request.removeAttribute("formHandler"); %>
<% } %>

<%@ include file="/jcore/doEmptyFooter.jspf" %>