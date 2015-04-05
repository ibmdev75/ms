<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page buffer="none" autoFlush="true" %>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*, com.jalios.jcms.widget.*, com.jalios.jcms.taglib.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%  request.setCharacterEncoding("UTF-8");

final Channel channel = Channel.getChannel();

Element typeElt       = (Element) session.getAttribute("typeElt");
List    exTypeList    = (List)    session.getAttribute("extendedTypeList");
boolean isExtension   = typeElt == null;
        typeElt       = isExtension ? (Element)session.getAttribute("extensionElt") : typeElt;
String  superclass    = Util.getString(typeElt.getAttributeValue("superclass"), "");
boolean isForm        = typeElt.getAttribute("formAuthor") != null;
String  className     = isExtension ? Util.getClassShortName(typeElt.getAttributeValue("type")) + "Extension" : typeElt.getAttributeValue("name");
String  formHandler   = isExtension ? "extFormHandler" : "formHandler";
String  currentTab    = null;

// EXTENSION
String  extensionTab  = isExtension ? Util.getString(typeElt.getAttributeValue("tab"),"") : null;
String  getPubClass   = isExtension ? "extFormHandler.getExtensionClass()" : "formHandler.getPublicationClass()";

// UNUSED
String  getAuthor     = formHandler + (isForm ? ".getAvailableAuthor()" : ".getLoggedMember()");
boolean categorizable = Util.toBoolean(typeElt.getAttributeValue("categorizable"), false);


// ALL FIELDS (filtered)
List fieldEntryList = new ArrayList(Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next(); 
  if ("sqlresult".equals(fieldEntry.getEditor())) { it.remove(); }
}

%>
[[%-- This file has been automatically generated. --%]]
[[%--
  @Summary: <%= className %> modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%]]
[[%@ page contentType="text/html; charset=UTF-8" %]]


<jalios:if predicate='<%= !isExtension %>'>
[[%@ include file='/jcore/doInitPage.jspf' %]]
[[% 
  Edit<%= className %>Handler formHandler = (Edit<%= className %>Handler)request.getAttribute("formHandler");
<jalios:if predicate='<%= exTypeList.contains(className) %>'>
  Edit<%= className %>ExtensionHandler extFormHandler = (Edit<%= className %>ExtensionHandler)request.getAttribute("extFormHandler");
</jalios:if>
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.<%= className %>.class);
%]]
</jalios:if>

<% 
  String previousTab = null;
  Set tabSet = new LinkedHashSet();
  for (Iterator it = fieldEntryList.iterator() ; it.hasNext() ; ){
    String tab = ((TypeFieldEntry)it.next()).getTab();
    if (Util.notEmpty(tab)){ tabSet.add(tab); }
    if (currentTab == null){ currentTab = tab; }
  }
  if (Util.notEmpty(tabSet)) {
%>
<ul class="nav nav-tabs">
<jalios:foreach collection="<%= tabSet %>" name="itTab" type="String"><%
%><li <%= currentTab == itTab ? "class='active'" : "" %>><a href="#<%= className %>_<%= itTab %>_tab" onclick="return false;">[[%= <%= formHandler %>.getTabLabel("<%= itTab %>") %]]</a></li>
</jalios:foreach>
</ul>
<% } %>

<jalios:foreach collection="<%= fieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
  String name         = itFieldEntry.getName();
  String nameCap      = itFieldEntry.getNameCap();
  String editor       = itFieldEntry.getEditor();
  String catFieldName = isExtension ? name : "cids" + (itFieldEntry.isExclusive() ? itFieldEntry.getNameCap() : "");
  String fieldName   = "category".equals(editor) ? catFieldName : name;
  String type         = itFieldEntry.getType();  
  String tab          = itFieldEntry.getTab();

%><% if (Util.notEmpty(tab) && !tab.equals(previousTab)){ 
     if (previousTab == null){ %><div class="tab-content jalios-tab-template clearfix"><% }
     if (previousTab != null){ %></div><% } %><div id="<%= className %>_<%= tab %>_tab" class='tab-pane <%= currentTab == tab ? "active" : "" %>'><% previousTab = tab; } %>

<%-- SUPER --------------------------------------------- --%>
<% if (itFieldEntry.isSuper()) { %>

<% if (previousTab != null){ previousTab = null; %></div><% } %>
</div><div id="<%= className %>_super_tab" class="clearfix separator">
[[% request.setAttribute("formHandler", <%= formHandler %>); %]]
[[jsp:include page="/types/<%= Util.getClassShortName(superclass) %>/doEdit<%= Util.getClassShortName(superclass) %>Modal.jsp" /]]
</div>

<%-- EXTENSION ----------------------------------------- --%>
<% } else if (isExtension) { %>

[[%-- <%= nameCap %> ------------------------------------------------------------ --%]]
[[jalios:field name="<%= fieldName %>" formHandler="[[%= <%= formHandler %> %]]"]]
  [[jalios:control /]]
[[/jalios:field]]

<%-- FIELD --------------------------------------------- --%>
<% } else if (itFieldEntry.isWidget()) { %>

[[%-- <%= nameCap %> ------------------------------------------------------------ --%]]
[[jalios:field name="<%= fieldName %>" formHandler="[[%= <%= formHandler %> %]]"]]
  [[jalios:control /]]
[[/jalios:field]]

<% } %>
</jalios:foreach>
<% if (previousTab != null){ %></div><% if (Util.notEmpty(tabSet)) { %></div><% } %><% } %>


<jalios:if predicate='<%= !isExtension %>'>
<%-- EXTENSION FILE INCLUDE (NON TABBED FORM) -------- --%>
<% if (Util.isEmpty(currentTab) && exTypeList.contains(className)) { %>
[[%@ include file="/types/<%= className %>Extension/doEdit<%= className %>Extension.jspf" %]]
<% } %>

<%-- TARGET ------------------------------------------ --%>
[[jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" /]]

<%-- EXTRA DATA INFO --------------------------------- --%>
[[jalios:include jsp="/jcore/doEditExtraData.jsp" /]]

[[% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %]]
</jalios:if>
<% out.flush(); %>