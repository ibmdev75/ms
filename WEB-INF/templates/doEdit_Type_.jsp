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
boolean isFileDocument= TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
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
TreeSet catIdSet = new TreeSet();
List fieldEntryList = new ArrayList(Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next(); 
  if ("category".equals(fieldEntry.getEditor())) {
    catIdSet.add(fieldEntry.getRoot());
  }
  if ("sqlresult".equals(fieldEntry.getEditor())) { 
    it.remove(); 
  }
}

%>
[[%-- This file has been automatically generated. --%]]
[[%--
  @Summary: <%= className %> content editor
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

<% if (isFileDocument && !superclass.startsWith("generated.")) { %>
[[jsp:include page="/types/FileDocument/doEditFileDocument.jsp" /]]
<% } %>
<% 
  String previousTab = null;
  Set tabSet = new LinkedHashSet();
  for (Iterator it = fieldEntryList.iterator() ; it.hasNext() ; ){
    String tab = ((TypeFieldEntry)it.next()).getTab();
    if (Util.notEmpty(tab)){ tabSet.add(tab); }
    if (Util.isEmpty(currentTab)){ currentTab = tab; }
  }
%>
<jalios:buffer name="tabheader">
<% if (Util.notEmpty(tabSet)) { %>
[[% if(!formHandler.isPartialFieldEdition()) { %]]
  <ul class="nav nav-tabs">
    <jalios:foreach collection="<%= tabSet %>" name="itTab" type="String"><%
    %><li<%= currentTab.equals(itTab) ? " class='active'" : "" %>><a href="#<%= className %>_<%= itTab %>_tab" onclick="return false;">[[%= <%= formHandler %>.getTabLabel("<%= itTab %>") %]]</a></li>
    </jalios:foreach>
  </ul>
[[% } %]]
<% } %>
</jalios:buffer>

<jalios:foreach collection="<%= fieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
  String name         = itFieldEntry.getName();
  String nameCap      = itFieldEntry.getNameCap();
  String editor       = itFieldEntry.getEditor();
  String catFieldName = isExtension ? name : "cids" + (itFieldEntry.isExclusive() ? itFieldEntry.getNameCap() : "");
  String fieldName   = name;
  String type         = itFieldEntry.getType();  
  String tab          = itFieldEntry.getTab();
  
  if (Util.notEmpty(tab) && tabheader != null) {
    out.println(tabheader);
    tabheader = null;
  }
  
%><% if (Util.notEmpty(tab) && !tab.equals(previousTab)) {
       if (previousTab == null) {
         %><div[[%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %]]><%
       }
       if (previousTab != null) {
         %></div><%
       } %><div id="<%= className %>_<%= tab %>_tab"[[%= !formHandler.isPartialFieldEdition() ? " class='tab-pane<%= currentTab.equals(tab) ? " active" : "" %>'" : "" %]]><%
       previousTab = tab;
     } else if(Util.isEmpty(tab) && previousTab != null) {
       %></div><%
       previousTab = null;
     } %>

<%-- SUPER --------------------------------------------- --%>
<% if (itFieldEntry.isSuper()) { %>

[[%-- SUPER ------------------------------------------------------------ --%]]
[[% request.setAttribute("formHandler", <%= formHandler %>); %]]
[[jsp:include page="/types/<%= Util.getClassShortName(superclass) %>/doEdit<%= Util.getClassShortName(superclass) %>.jsp" /]]

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
<% if (previousTab != null){ %></div>[[%-- End last tab --%]]<% } %><% if (Util.notEmpty(tabSet)) { %></div>[[%-- End 'tab-content' --%]]<% } %>


[[%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
<jalios:foreach collection='<%= catIdSet %>' type='String' name='itCatId'>
  itRemoveCat = channel.getCategory("<%= itCatId %>");
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
</jalios:foreach>
  request.setAttribute("<%= className %>.removedCatSet", removedCatSet);
}  
%]]

<jalios:if predicate='<%= !isExtension %>'>
<%-- EXTENSION FILE INCLUDE (NON TABBED FORM) -------- --%>
<% if (Util.isEmpty(currentTab) && exTypeList.contains(className)) { %>
[[%@ include file="/types/<%= className %>Extension/doEdit<%= className %>Extension.jspf" %]]
<% } %>

<%-- TARGET ------------------------------------------ --%>
[[jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" /]]

<%-- EXTRA DATA INFO --------------------------------- --%>
[[jalios:include jsp="/jcore/doEditExtraData.jsp" /]]
</jalios:if>

[[% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %]]
<% out.flush(); %>
