<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");

Element typeElt = (Element)session.getAttribute("typeElt");
String className = "generated." + typeElt.getAttributeValue("name");
Attribute categorizableAtt = typeElt.getAttribute("categorizable");
boolean categorizable = categorizableAtt != null && categorizableAtt.getBooleanValue();

String superclass = Util.getString(typeElt.getAttributeValue("superclass"), "");
boolean isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);

// Get the fields (and the inherited fields)                             
ArrayList tmpList = new ArrayList();
tmpList.addAll(typeElt.getChild(TypeUtil.FIELDS_ELT).getChildren());

// Clean the list: remove non editable fields (eg. sqlresult) and add imageMap fields
List fieldList = new ArrayList();
Map imageMapMap = new HashMap();
for(Iterator it = tmpList.iterator(); it.hasNext();) {
  Element itField = (Element)it.next();
  if ("sqlresult".equals(itField.getAttributeValue("editor"))) {
    continue;
  }
  fieldList.add(itField);
  if (Util.getString(itField.getAttributeValue("imageMap"), "false").equals("true")) {
    Element imageMapElt = (Element)itField.clone();
    imageMapElt.setAttribute("name", itField.getAttributeValue("name") + "Map");
    imageMapElt.setAttribute("editor", "textarea");
    imageMapElt.setAttribute("html", "true");
    imageMapElt.setAttribute("wiki", "false");
    imageMapElt.setAttribute("imageMap", "true");
    fieldList.add(imageMapElt);
    imageMapMap.put(imageMapElt, itField);
  }
}
boolean isDBType = Util.toBoolean(typeElt.getAttributeValue("database"),false);
String foreachAttribute = isDBType ? "collection" : "array";
%>
[[%@ page contentType="text/html; charset=UTF-8" %]]
[[%-- This file was automatically generated. Please, do not edit. --%]]
[[%--
  @Summary: <%= className %> diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%]]
[[%@ include file='/jcore/doInitPage.jspf' %]]

[[% 
{ 
<%= className %> newObj = (<%= className %>)request.getAttribute("newPub"); 
<%= className %> oldObj = (<%= className %>)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(<%= className%>.class);
boolean isSuperTypeIncluded = Boolean.TRUE.equals((Boolean)request.getAttribute("isSuperTypeIncluded")); 
{
  Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
  if (superFieldCount != null) { 
    fieldCount = superFieldCount.intValue();
  }
}
String fieldDomId = "";
%]]

<% if (!isFileDocument) { %>
[[% if (!isSuperTypeIncluded) { %]]
  [[%-- ** title *****************  --%]]
  [[jalios:foreach collection='[[%= channel.getLanguageList() %]]' name='itLang' type='String']]
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.getTitle(itLang, false), oldObj.getTitle(itLang, false)) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td>
      [[%= typeEntry.getTitleLabel(userLang) %]]
      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
    </td>
    [[% 
      fieldDomId = "titleDiffDomId_" + itLang ; 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %]]
    <td class="text-left" colspan="2" id="[[%= fieldDomId %]]">
		[[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
    [[%
    String newTitle = newObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(newObj.getTitle(itLang, false));
    String oldTitle = oldObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(oldObj.getTitle(itLang, false));
    request.setAttribute("newField", newTitle);
    request.setAttribute("oldField", oldTitle);
    request.setAttribute("step", "show_fields");
    %]]
    [[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
        <div class="merge_fields" >
    [[%
    BufferedReader newReader = new BufferedReader(new StringReader(newTitle));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTitle));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTitle));
    %]]
    [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %]]
    [[% oldReader.close(); %]]
        </div>
    </td>
  </tr>
  [[/jalios:if]]
  [[/jalios:foreach]]
[[% } %]]
<% } else if (!superclass.startsWith("generated.")) { %>
[[jsp:include page="/types/FileDocument/doFileDocumentDiff.jsp"/]]
<% } %> 

<jalios:foreach collection="<%= fieldList %>" name="itField" type="org.jdom.Element">
<%
if ("super".equals(itField.getAttributeValue("type"))) {
  String superClassShortName = Util.getClassShortName(superclass);
%>
[[%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%]]
[[jsp:include page="/types/<%= superClassShortName %>/do<%= superClassShortName %>Diff.jsp"/]]
[[%
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
  ServletUtil.restoreAttribute(pageContext, "isSuperTypeIncluded");
%]]
<%
} else {
  String name = itField.getAttributeValue("name");
  String nameCap = Util.recapitalize(name);
  String label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + name + "\", userLang) %]]";
  if (imageMapMap.containsKey(itField)) {
    String imageName = ((Element)imageMapMap.get(itField)).getAttributeValue("name");
    label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + imageName + "\", userLang) %]] - [[%= glp(\"ui.adm.type-edit.lbl.image-map\") %]]";
  }
  String type = itField.getAttributeValue("type");
  String editor = itField.getAttributeValue("editor");
  if (editor == null) { editor = ""; }
  Attribute ml = itField.getAttribute("ml");
  boolean fieldML = ml != null && ml.getBooleanValue();

  String rootCatId = itField.getAttributeValue("root");

  String arrayType = "";
  boolean isTypeArray = type.endsWith("[]");
  boolean isTypeList  = type.startsWith("List<");
  boolean isTypeSet   = type.startsWith("Set<");
  
  if (isTypeArray) {
   arrayType = type.substring(0, type.length() - 2);
  }
  boolean isTypeScalar = !isTypeArray && !isTypeList && !isTypeSet;
  boolean isAnyLink = editor.startsWith("link") || editor.startsWith("group") || editor.startsWith("member");
  long durationResolution = Util.toLong(itField.getAttributeValue("resolution"), JaliosConstants.MILLIS_IN_ONE_SECOND);
  
  String typeShort = type;
  if (isTypeArray) {
    typeShort = type.substring(0, type.length() - 2);
  } 
  else if (isTypeList) {
    typeShort = type.substring("List<".length(), type.length() - 1);
  }
  else if (isTypeSet) {
    typeShort = type.substring("Set<".length(), type.length() - 1);
  }
%>
  [[%-- ** <%= name %> ***************** --%]]

<jalios:select>

<%-- ** STRING[] **************************************** --%>
<jalios:if predicate='<%= type.equals("String[]") %>'>
<jalios:if predicate='<%= fieldML %>'>
  [[jalios:foreach collection='[[%= channel.getLanguageList() %]]' name='itLang' type='String']]
</jalios:if>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>), oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>)) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
<jalios:select>
<%-- -- STRING[] / TEXTAREA / TEXTFIELD ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("textarea") || editor.equals("textfield") %>'>
    <td nowrap="nowrap">
      <%= label %>
      <jalios:if predicate='<%= fieldML %>'>
        [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
      </jalios:if>
    </td>
    <td class="text-left" colspan="2">
      <table>
    [[% String[] array0 = newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? new String[0] : newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>); %]]
    [[% String[] array1 = oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? new String[0] : oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>); %]]
    [[% int maxLength  = Math.max(array0.length, array1.length); %]]
    [[% for(int i = 0; i < maxLength; i++) { %]]
    [[%   String newItem = (i < array0.length && array0[i] != null ? Util.toWordLine(array0[i]) : ""); %]]
    [[%   String oldItem = (i < array1.length && array1[i] != null ? Util.toWordLine(array1[i]) : ""); %]]
    [[%   if (newItem.equals(oldItem)) { %]]
        <tr>
          <td class="vTop text-right fit">[[%= i + 1 %]].</td>
          <td><em>[[%= glp("ui.work.ver.diff.item") %]]</em></td>
        </tr>
    
    [[%   } else { %]]
    [[%
    BufferedReader newReader = new BufferedReader(new StringReader(newItem));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldItem));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldItem));
    %]]
        <tr>
          <td class="vTop text-right">[[%= i + 1 %]].</td>
          <td width='100%'>
<jalios:select>
<jalios:if predicate='<%= editor.equals("textarea") %>'>
          [[jalios:wiki]][[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %]][[/jalios:wiki]]
</jalios:if>
<jalios:default>
          [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %]]
</jalios:default>
</jalios:select>
          </td>
        </tr>
    [[% oldReader.close(); %]]
    [[%  } %]]
    [[% } // for %]]
      </table>
    </td>
</jalios:if>
<%-- -- STRING[] WYSIWYG ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("wysiwyg") %>'>
<% String nameML = name + (fieldML ? "_[[%= itLang %]]" : ""); %>
    <td nowrap="nowrap">
      <%= label %>
      <jalios:if predicate='<%= fieldML %>'>
        [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
      </jalios:if>
    </td>
    <td class="text-left" colspan="2">
      <table>
    [[% String[] array0 = newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? new String[0] : newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>); %]]
    [[% String[] array1 = oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? new String[0] : oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>); %]]
    [[% int maxLength  = Math.max(array0.length, array1.length); %]]
    [[% for(int i = 0; i < maxLength; i++) { %]]
    [[%   String newItem = (i < array0.length && array0[i] != null ? Util.toWordLine(array0[i]) : ""); %]]
    [[%   String oldItem = (i < array1.length && array1[i] != null ? Util.toWordLine(array1[i]) : ""); %]]
    [[%   if (newItem.equals(oldItem)) { %]]
        <tr>
          <td class="vTop text-right fit">[[%= i + 1 %]].</td>
          <td><em>[[%= glp("ui.work.ver.diff.item") %]]</em></td>
        </tr>
    
    [[%   } else { %]]
        <tr>
          <td class="vTop text-right">[[%= i + 1 %]].</td>
          <td width='100%'>
    <%-- --------------------------------------------- --%>
    <div id='intro_<%= nameML %>_[[%= i %]]'>
    [[%= glp("ui.work.ver.diff.ww.item") %]]. <a href='#' onclick="$('textHtmlView_<%= nameML %>_[[%= i %]]').show(); $('intro_<%= nameML %>_[[%= i %]]').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.detail") %]]</a>.
    </div>
    
    <%-- Text View --%>
    <div id='textHtmlView_<%= nameML %>_[[%= i %]]' style='display:none;'>
      <div id='textView_<%= nameML %>_[[%= i %]]'>
        <div>
    [[%= glp("ui.work.ver.diff.ww.text") %]]
    - <a href='#' onclick="$('htmlView_<%= nameML %>_[[%= i %]]').show(); $('textView_<%= nameML %>_[[%= i %]]').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.html") %]]</a>
    - <a href='#' onclick="$('intro_<%= nameML %>_[[%= i %]]').show(); $('textHtmlView_<%= nameML %>_[[%= i %]]').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.hide") %]]</a>
        </div>
        <div>
    <%-- --------------------------------------------- --%>
    [[%
    {
    String textNewItem = XmlUtil.extractText(newItem);
    String textOldItem = XmlUtil.extractText(oldItem);
    BufferedReader newReader = new BufferedReader(new StringReader(textNewItem));
    BufferedReader oldReader = new BufferedReader(new StringReader(textOldItem));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(textOldItem));
    %]]
    [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %]]
    [[% 
    oldReader.close(); 
    }
    %]]
    <%-- --------------------------------------------- --%>
        </div>
      </div>
    
      <%-- HTML View --%>
      <div id='htmlView_<%= nameML %>_[[%= i %]]' style='display:none;'>
        <div>
    <a href='#' onclick="$('textView_<%= nameML %>_[[%= i %]]').show(); $('htmlView_<%= nameML %>_[[%= i %]]').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.text") %]]</a>
    - [[%= glp("ui.work.ver.diff.ww.html") %]]
    - <a href='#' onclick="$('intro_<%= nameML %>_[[%= i %]]').show(); $('textHtmlView_<%= nameML %>_[[%= i %]]').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.hide") %]]</a>
        </div>
        <div>
    <%-- --------------------------------------------- --%>
    [[%
    {
    BufferedReader newReader = new BufferedReader(new StringReader(newItem));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldItem));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldItem));
    %]]
    [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %]]
    [[% 
    oldReader.close(); 
    }
    %]]
    <%-- --------------------------------------------- --%>
        </div>
      </div>
    </div>
    <%-- --------------------------------------------- --%>
          </td>
        </tr>
    [[%  } %]]
    [[% } // for %]]
      </table>
    </td>
</jalios:if>
<%-- -- STRING[] / Password ----------------------------- --%>
<jalios:if predicate='<%= editor.equals("password") %>'>
    <td nowrap="nowrap"><%= label %></td>
    <td colspan="2"><em>[[%= glp("ui.work.ver.diff.pwd-l") %]]</em></td>
</jalios:if>

<%-- -- STRING[] / OTHER --------------------------------- --%>
<jalios:default>
    <td nowrap="nowrap">
      <%= label %>
      <jalios:if predicate='<%= fieldML %>'>
        [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
      </jalios:if>
    </td>
    <td>
      [[% if (Util.notEmpty(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>))) { %]]
      <ol>
        [[jalios:foreach name="itData" type="String" <%= foreachAttribute %>="[[%= newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) %]]" counter='c2']]
        <li>[[%= itData %]]</li>
        [[/jalios:foreach]]
      </ol>
      [[% } else { %]] - [[% } %]]
    </td>
    <td>
      [[% if (Util.notEmpty(oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>))) { %]]
      <ol>
        [[jalios:foreach name="itData" type="String" <%= foreachAttribute %>="[[%= oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) %]]" counter='c2']]
        <li>[[%= itData %]]</li>
        [[/jalios:foreach]]
      </ol>
      [[% } else { %]] - [[% } %]]
    </td>
</jalios:default>

</jalios:select>
  </tr>
  [[/jalios:if]]
<jalios:if predicate='<%= fieldML %>'>
  [[/jalios:foreach]]
</jalios:if>
</jalios:if>

<%-- ** STRING ****************************************** --%>
<jalios:if predicate='<%= type.equals("String") %>'>
<jalios:if predicate='<%= fieldML %>'>
  [[jalios:foreach collection='[[%= channel.getLanguageList() %]]' name='itLang' type='String']]
</jalios:if>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>), oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>)) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
<jalios:select>
<%-- -- STRING / TEXTFIELD - TEXTAREA -------------------- --%>
<jalios:if predicate='<%= editor.equals("textarea") || editor.equals("textfield") %>'>
    [[% fieldDomId = "<%= name %>DiffDomId"; %]]
    <td nowrap="nowrap">
      <%= label %>
<jalios:if predicate='<%= fieldML %>'>
      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
      [[% fieldDomId += "_" + itLang; %]]
</jalios:if>
    </td>
    [[% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %]]
    <td class="text-left" colspan="2" id="[[%= fieldDomId %]]">
    [[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
    [[%
    {
    String new<%= nameCap %> = newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? "" : Util.toWordLine(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>));
    String old<%= nameCap %> = oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? "" : Util.toWordLine(oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>));
    request.setAttribute("newField", new<%= nameCap %>);
    request.setAttribute("oldField", old<%= nameCap %>);
    request.setAttribute("step", "show_fields");
    %]]
    [[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
        <div class="merge_fields" >
    [[%
    BufferedReader newReader = new BufferedReader(new StringReader(new<%= nameCap %>));
    BufferedReader oldReader = new BufferedReader(new StringReader(old<%= nameCap %>));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(old<%= nameCap %>));
    %]]
<jalios:select>
<jalios:if predicate='<%= editor.equals("textarea") %>'>
    [[jalios:wiki]][[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %]][[/jalios:wiki]]
</jalios:if>
<jalios:default>
     [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %]]
</jalios:default>
</jalios:select>
    [[% 
    oldReader.close(); 
    }
    %]]
        </div>
    </td>
</jalios:if>
<%-- -- STRING / WYSIWYG -------------------- --%>
<jalios:if predicate='<%= editor.equals("wysiwyg") %>'>
<% String nameML = name + (fieldML ? "_[[%= itLang %]]" : ""); %>
    [[% fieldDomId = "<%= name %>DiffDomId"; %]]
    <td nowrap="nowrap">
      <%= label %>
<jalios:if predicate='<%= fieldML %>'>
      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
      [[% fieldDomId += "_" + itLang; %]]
</jalios:if>
    </td>
    [[% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %]]
    <td class="text-left" colspan="2" id="[[%= fieldDomId %]]">
    <%-- --------------------------------------------- --%>
    <div id='intro_<%= nameML %>'>
    [[%= glp("ui.work.ver.diff.ww.change") %]]. <a href='#' onclick="$('textHtmlView_<%= nameML %>').show(); $('intro_<%= nameML %>').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.detail") %]].</a>
    </div>
    <div id='textHtmlView_<%= nameML %>' style="display: none;">
    [[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
      <div id='textView_<%= nameML %>'>
        <p>
    [[%= glp("ui.work.ver.diff.ww.text") %>
    - <a href='#' onclick="$('htmlView_<%= nameML %>').show(); $('textView_<%= nameML %>').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.html") %]]</a>
    - <a href='#' onclick="$('intro_<%= nameML %>').show(); $('textHtmlView_<%= nameML %>').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.hide") %]]</a>
        </p>
    <%-- --------------------------------------------- --%>
    [[%
    {
    String new<%= nameCap %> = newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? "" : Util.toWordLine(XmlUtil.extractText(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>)));
    String old<%= nameCap %> = oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? "" : Util.toWordLine(XmlUtil.extractText(oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>)));
    request.setAttribute("newField", new<%= nameCap %>);
    request.setAttribute("oldField", old<%= nameCap %>);
    request.setAttribute("step", "show_fields");
    %]]
    [[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
        <div class="merge_fields" >
    [[%
    BufferedReader newReader = new BufferedReader(new StringReader(new<%= nameCap %>));
    BufferedReader oldReader = new BufferedReader(new StringReader(old<%= nameCap %>));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(old<%= nameCap %>));
    %]]
    [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %]]
    [[% 
    oldReader.close(); 
    }
    %]]
    <%-- --------------------------------------------- --%>
        </div>
      </div>
    
      <div id='htmlView_<%= nameML %>' style='display: none;'>
        <p>
    <a href='#' onclick="$('textView_<%= nameML %>').show(); $('htmlView_<%= nameML %>').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.text") %]]</a>
    - [[%= glp("ui.work.ver.diff.ww.html") %]]
    - <a href='#' onclick="$('intro_<%= nameML %>').show(); $('textHtmlView_<%= nameML %>').hide(); return false;">[[%= glp("ui.work.ver.diff.ww.hide") %]]</a>
        </p>
    <%-- --------------------------------------------- --%>
    [[%
    {
    String new<%= nameCap %> = newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? "" : Util.toWordLine(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>));
    String old<%= nameCap %> = oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>) == null ? "" : Util.toWordLine(oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>));
    request.setAttribute("newField", new<%= nameCap %>);
    request.setAttribute("oldField", old<%= nameCap %>);
    request.setAttribute("step", "show_fields");
    %]]
    [[jsp:include page="/work/doVersionToggleMergeFields.jsp" /]]
            <div class="merge_fields" >
    [[%
    BufferedReader newReader = new BufferedReader(new StringReader(new<%= nameCap %>));
    BufferedReader oldReader = new BufferedReader(new StringReader(old<%= nameCap %>));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(old<%= nameCap %>));
    %]]
    [[%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %]]
    [[% 
    oldReader.close(); 
    }
    %]]
    <%-- --------------------------------------------- --%>
        </div>
      </div>
    </div>
    <%-- --------------------------------------------- --%>
    </td>
</jalios:if>
<%-- -- STRING / PASSWORD ------------------------------ --%>
<jalios:if predicate='<%= editor.equals("password") %>'>
    <td nowrap="nowrap"><%= label %></td>
    <td colspan="2"><em>[[%= glp("ui.work.ver.diff.pwd") %]]</em></td>
</jalios:if>

<%-- -- STRING / OTHER ------------------------------ --%>
<jalios:default>
    <td nowrap="nowrap">
      <%= label %>
<jalios:if predicate='<%= fieldML %>'>
      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]
</jalios:if>
    </td>
    <td>[[%= Util.getString(newObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>), "") %]]</td>
    <td>[[%= Util.getString(oldObj.get<%= nameCap %>(<%= fieldML ? "itLang, false" : "" %>), "") %]]</td>
</jalios:default>

</jalios:select>
  </tr>
  [[/jalios:if]]
<jalios:if predicate='<%= fieldML %>'>
  [[/jalios:foreach]]
</jalios:if>
</jalios:if>

<%-- ** Date ****************************************** --%>
<jalios:if predicate='<%= type.equals("java.util.Date") %>'>
  [[jalios:if predicate='[[%= newObj.get<%= nameCap %>() != oldObj.get<%= nameCap %>() %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>[[jalios:date date='[[%= newObj.get<%= nameCap %>() %]]' /]] [[jalios:time date='[[%= newObj.get<%= nameCap %>() %]]' /]]</td>
    <td>[[jalios:date date='[[%= oldObj.get<%= nameCap %>() %]]' /]] [[jalios:time date='[[%= oldObj.get<%= nameCap %>() %]]' /]]</td>
  </tr>
  [[/jalios:if]]
</jalios:if>


<%-- ** Member | Group | Link |  ****************************************** --%>
<jalios:if predicate='<%= isTypeScalar && isAnyLink %>'>
  [[jalios:if predicate='[[%= newObj.get<%= nameCap %>() != oldObj.get<%= nameCap %>() %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
      [[% Data newLink = newObj.get<%= nameCap %>(); %]]
      [[% if (newLink != null) { %]] 
      [[%   if (newLink instanceof FileDocument) { %]]
      <a href="work/displayWork.jsp?id=[[%= newLink.getId() %]]&amp;details=true">[[jalios:fileicon doc='[[%= ((FileDocument)newLink) %]]' /]]</a>
      [[%   } %]][[jalios:link data='[[%= newLink %]]'/]][[% } %]]
    </td>
    <td>
      [[% Data oldLink = oldObj.get<%= nameCap %>(); %]]
      [[% if (oldLink != null) { %]] 
      [[%   if (oldLink instanceof FileDocument) { %]]
      <a href="work/displayWork.jsp?id=[[%= oldLink.getId() %]]&amp;details=true">[[jalios:fileicon doc='[[%= ((FileDocument)oldLink) %]]' /]]</a>
      [[%   } %]][[jalios:link data='[[%= oldLink %]]'/]][[% } %]]
    </td>  </tr>
  [[/jalios:if]]
</jalios:if>

<%-- ** int | double ****************************************** --%>
<jalios:if predicate='<%= isTypeScalar && (editor.equals("int") || editor.equals("double")) %>'>
  [[jalios:if predicate='[[%= newObj.get<%= nameCap %>() != oldObj.get<%= nameCap %>() %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>[[%= newObj.get<%= nameCap %>()  %]]</td>
    <td>[[%= oldObj.get<%= nameCap %>()  %]]</td>
  </tr>
  [[/jalios:if]]
</jalios:if>

<%-- ** duration ****************************************** --%>
<jalios:if predicate='<%= isTypeScalar && editor.equals("duration") %>'>
  [[jalios:if predicate='[[%= newObj.get<%= nameCap %>() != oldObj.get<%= nameCap %>() %]]']]
  <tr class="vTop" >
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>[[jalios:duration time='[[%= newObj.get<%= nameCap %>() * <%= durationResolution %> %]]'/]]</td>
    <td>[[jalios:duration time='[[%= oldObj.get<%= nameCap %>() * <%= durationResolution %> %]]'/]]</td>
  </tr>
  [[/jalios:if]]
</jalios:if>

<%-- ** boolean ****************************************** --%>
<jalios:if predicate='<%= isTypeScalar && editor.equals("boolean")  %>'>
  [[jalios:if predicate='[[%= newObj.get<%= nameCap %>() != oldObj.get<%= nameCap %>() %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>[[%= newObj.get<%= nameCap %>Label(userLang) %]]</td>
    <td>[[%= oldObj.get<%= nameCap %>Label(userLang) %]]</td>
  </tr>
  [[/jalios:if]]
</jalios:if>

<%-- ** Member[] | Group[] | Link[]  ****************************************** --%>
<jalios:if predicate='<%= !isTypeScalar && isAnyLink %>'>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(), oldObj.get<%= nameCap %>()) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
      [[% if (Util.notEmpty(newObj.get<%= nameCap %>())) { %]]
      <ol>
        [[jalios:foreach name="itData" type="Data" <%= foreachAttribute %>="[[%= newObj.get<%= nameCap %>() %]]"]]
        <li>
        [[% if (itData != null) { %]] 
        [[%   if (itData instanceof FileDocument) { %]]
        <a href="work/displayWork.jsp?id=[[%= itData.getId() %]]&amp;details=true">[[jalios:fileicon doc='[[%= ((FileDocument)itData) %]]' /]]</a>
        [[%   } %]][[jalios:link data='[[%= itData %]]'/]][[% } else { %]] - [[% } %]]
        </li>
        [[/jalios:foreach]]
      </ol>
      [[% } %]]
    </td>
    <td>
      [[% if (Util.notEmpty(oldObj.get<%= nameCap %>())) { %]]
      <ol>
        [[jalios:foreach name="itData" type="Data" <%= foreachAttribute %>="[[%= oldObj.get<%= nameCap %>() %]]"]]
        <li>
        [[% if (itData != null) { %]] 
        [[%   if (itData instanceof FileDocument) { %]]
        <a href="work/displayWork.jsp?id=[[%= itData.getId() %]]&amp;details=true">[[jalios:fileicon doc='[[%= ((FileDocument)itData) %]]' /]]</a>
        [[%   } %]][[jalios:link data='[[%= itData %]]'/]][[% } else { %]] - [[% } %]]
        </li>
        [[/jalios:foreach]]
      </ol>
      [[% } %]]
    </td>
  </tr>
  [[/jalios:if]]
</jalios:if>

<%-- **  boolean[]  ****************************************** --%>
<jalios:if predicate='<%= type.equals("boolean[]") || type.equals("List<Boolean>") %>'>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(), oldObj.get<%= nameCap %>()) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
       [[% 
        { 
          <%= type %> arrayOrCollection = newObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
       %]]
      <ol>
       [[%
            int _len = <% if (isTypeArray) { %>arrayOrCollection.length<% } else { %>arrayOrCollection.size()<% } %>;
            for(int i = 0; i < _len; i++) { 
        %]]
             <li>[[%= newObj.get<%= nameCap %>Label(i, userLang) %]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
       %]]
    </td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = oldObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%

            int _len = <% if (isTypeArray) { %>arrayOrCollection.length<% } else { %>arrayOrCollection.size()<% } %>;
            for(int i = 0; i < _len; i++) { 
        %]]
             <li>[[%= oldObj.get<%= nameCap %>Label(i, userLang) %]]</li>
        [[%
            }
        %]]
      </ol>
       [[%
          }
        }
        %]]
   </td>
  </tr>
  [[/jalios:if]]
  </tr>
</jalios:if>

<%-- **  int[] | double[]  ****************************************** --%>
<jalios:if predicate='<%= !isTypeScalar && (editor.equals("int") || editor.equals("double")) %>'>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(), oldObj.get<%= nameCap %>()) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = newObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%
            for(<%= typeShort %> item: arrayOrCollection) { 
        %]]
             <li>[[%= item %]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
        %]]
    </td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = oldObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%
            for(<%= typeShort %> item: arrayOrCollection) { 
        %]]
             <li>[[%= item %]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
        %]]
   </td>
  </tr>
  [[/jalios:if]]
</jalios:if>


<%-- **  duration[]  ****************************************** --%>
<jalios:if predicate='<%= !isTypeScalar && editor.equals("duration") %>'>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(), oldObj.get<%= nameCap %>()) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = newObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%
            for(<%= typeShort %> item: arrayOrCollection) { 
        %]]
             <li>[[jalios:duration time='[[%= item * <%= durationResolution %> %]]'/]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
        %]]
    </td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = oldObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%
            for(<%= typeShort %> item: arrayOrCollection) { 
        %]]
             <li>[[jalios:duration time='[[%= item * <%= durationResolution %> %]]'/]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
        %]]
   </td>
  </tr>
  [[/jalios:if]]
</jalios:if>

<%-- **  DATE[]  ****************************************** --%>
<jalios:if predicate='<%= !isTypeScalar && editor.equals("date") %>'>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(), oldObj.get<%= nameCap %>()) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = newObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%
            for(<%= typeShort %> item: arrayOrCollection) { 
        %]]
             <li>[[jalios:date date='[[%= item %]]' /]] [[jalios:time date='[[%= item %]]' /]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
        %]]
    </td>
    <td>
        [[% 
        { 
          <%= type %> arrayOrCollection = oldObj.get<%= nameCap %>(); 
          if (Util.notEmpty(arrayOrCollection)) {
        %]]
      <ol>
       [[%
            for(<%= typeShort %> item: arrayOrCollection) { 
        %]]
             <li>[[jalios:date date='[[%= item %]]' /]] [[jalios:time date='[[%= item %]]' /]]</li>
        [[%
            }
       %]]
      </ol>
       [[%
          }
        }
        %]]
   </td>
  [[/jalios:if]]
  </tr>
</jalios:if>
<%-- ** CATEGORY ****************************************** --%>
<jalios:if predicate='<%= editor.equals("category") %>'>
  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get<%= nameCap %>(loggedMember), oldObj.get<%= nameCap %>(loggedMember)) %]]']]
  <tr class="vTop">
    <td class="text-right">[[%= fieldCount++ %]].</td>
    <td nowrap="nowrap"><%= label %></td>
    <td>
      [[% if (Util.notEmpty(newObj.get<%= nameCap %>(loggedMember))) { %]]
      <ol>
        [[jalios:foreach collection="[[%= newObj.get<%= nameCap %>(loggedMember) %]]" type="Category" name="itCategory" ]]
        <li>[[%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("<%= rootCatId %>"), " > ", true) %]]</li>
        [[/jalios:foreach]]
      </ol>
      [[% } %]]
    </td>
    <td>
      [[% if (Util.notEmpty(oldObj.get<%= nameCap %>(loggedMember))) { %]]
      <ol>
        [[jalios:foreach collection="[[%= oldObj.get<%= nameCap %>(loggedMember) %]]" type="Category" name="itCategory" ]]
        <li>[[%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("<%= rootCatId %>"), " > ", true) %]]</li>
        [[/jalios:foreach]]
      </ol>
      [[% } %]]
    </td>
  </tr>
  [[/jalios:if]]
</jalios:if>
</jalios:select>
<% } %>
</jalios:foreach>

<%-- **  COMMON FIELDS  ****************************************** --%>
<% if (!isFileDocument) { %>
[[% if (!isSuperTypeIncluded) { 
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  request.setAttribute("fieldCount", new Integer(fieldCount));
%]]  
[[jsp:include page="/work/doCommonPubDiff.jsp"/]]
[[% 
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
 } else {
     request.setAttribute("fieldCount", new Integer(fieldCount));
 } %]]
<% } %>
[[% } %]]
<% out.flush(); %>
