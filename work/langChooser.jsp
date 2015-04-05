<%-- 
  @Summary: Language chooser
  @Category: Presentation / Popup
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% request.setAttribute("title", glp("ui.work.language-chooser.title")); %>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<%-- COMMON LIST STYLE AND JS --%>
<style>
<!--
.list {
  border-collapse: collapse;
  border:1px;
  background-color: #F5F5FF;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 10pt
}
.list td {
  margin: 0;
  padding: 2px;
}
.list thead  {
  background-color: #e0e0e0;
  font-weight: bold;
  text-align: center;
  white-space: nowrap;
}
.listSelectedRow { background-color: #FBD5D5; }
-->
</style>
<script type="text/javascript">
<!--
 function listMouseOver(rowEl) {
   rowEl.className += " listOverRow";
 }
 function listMouseOut(rowEl) {
   rowEl.className = rowEl.className.replace(" listOverRow", "");
 }
 function listToggleRow(rowID, isSelected) {
   var rowEl = document.getElementById(rowID);
   if (isSelected) {
     if (rowEl.className.indexOf("listSelectedRow") == -1) {
       rowEl.className += " listSelectedRow";
     }
   } else {
     if (rowEl.className.indexOf("listSelectedRow") != -1) {
       rowEl.className = rowEl.className.replace(" listSelectedRow", "");
     }
   }
 }
//-->
</script>

<%-- LANGUAGE CHOOSER LOGIC, STYLEs AND JS --%>
<%
  final boolean isMultiple = getBooleanParameter("multiple", false);
  final boolean allLanguages = getBooleanParameter("all", false);
  final boolean shortList = getBooleanParameter("shortList", true);
  final HashSet selectedLangSet = new HashSet(Util.splitToList(getStringParameter("selected", "", "^[a-zA-Z, ]*$"), ", "));
  final List langList;
  if (allLanguages) {
    String isoCodePropKey = shortList ? "iso-639-codes.short-list" : "iso-639-codes";
    langList = Util.splitToList(channel.getProperty(isoCodePropKey), ", ");
  } else {
    langList = channel.getLanguageListOrdered();
  }
  if (isMultiple == false && selectedLangSet.size() > 1) {
    String lang = (String) selectedLangSet.iterator().next();
    selectedLangSet.clear();
    selectedLangSet.add(lang);
  }
%>
<style>
<!--
.userLangName { font-weight: bold; }
.nativeLangName { }
.codeLangName { }
-->
</style>
<script type="text/javascript">
<!--
 function checkLang(inputID, rowID) {
   var inputEl = document.getElementById(inputID);
   <% if (!isMultiple) { %>
   checkAllLang(false);
   inputEl.checked = !inputEl.checked;
   <% } %>
   listToggleRow(rowID, inputEl.checked);
   <% if (!isMultiple) { %>
   selectLanguagesAndClose();
   <% } %>
 }
 function checkAllLang(checkValue) {
   for (var i = 0; i < document.langChooserForm.elements.length; i++) {
     var input = document.langChooserForm.elements[i]; 
     if (input.name != "lang") { continue; }
     if (input.checked != checkValue) {
       input.checked = checkValue;
       listToggleRow("row_" + input.value, checkValue);
     }
   }
 }
 var oldSearchedTextValue;
 function hideAndSeek() {
   var stext = document.langChooserForm.search.value;
   if (oldSearchedTextValue == stext) {
     return;
   }
   var regexp = new RegExp(stext, "gi");
   var languagesTable = document.getElementById("languages");
   var rows = languagesTable.getElementsByTagName("tr");
   for (var i = 0; i < rows.length; i++) {
     var match = (stext == "");
     var trEl = rows[i]; 
     if (trEl == undefined || trEl.id == undefined) { continue; }
     if (!match) {
       var cells = trEl.getElementsByTagName("td");
       // Try language code
       if (!match && cells[4] != undefined) {
         var lang = cells[4].innerHTML;
         match = (-1 != lang.search(stext));
       }
       // Try language name in userLang
       if (!match && cells[2] != undefined) {
         var userlangName = cells[2].innerHTML;
         match = userlangName != "" && (-1 != userlangName.search(regexp));
       }
       // Try language name in the language
       if (!match && cells[3] != undefined) {
         var nativeLangName = cells[3].innerHTML;
         match = nativeLangName != "" && (-1 != nativeLangName.search(regexp));
       }
     }
     // Hide or show column in 
     if (match) {
       if (trEl.style.display != "" || trEl.style.display != "table-row" || trEl.style.display != "block") {
         trEl.style.display = "";
       }
     } else {
       if (trEl.style.display != "none") {
         trEl.style.display = "none";
       }
     }
   }
   oldSearchedTextValue = stext; 
 }
 function clearAndReset() {
   document.langChooserForm.search.value = "";
   hideAndSeek();
 }
 function toggleShortList() {
   document.langChooserForm.shortList.value = "<%= !shortList %>";
   document.langChooserForm.submit();
 }
 function selectLanguagesAndClose() {
   var selectedLangsArray = new Array();
   var selectedLangsIdx = 0;
   for (var i = 0; i < document.langChooserForm.elements.length; i++) {
     var input = document.langChooserForm.elements[i]; 
     if (input.name != "lang") { continue; }
     if (input.checked) {
       selectedLangsArray[selectedLangsIdx++] = input.value;
     }
   }
   var selectedLangs = "";
   for (var i = 0; i < selectedLangsArray.length; i++) {
     selectedLangs += selectedLangsArray[i];
     if (i + 1 != selectedLangsArray.length) {
       selectedLangs += ",";
     }
   }
   if (selectedLangsArray.length == 0) {
     alert("<%= encodeForJavaScript(glp("ui.com.alt.lang-chooser")) %>");
     return;
   }
  <% final String jsCallback = getChooserParameter("jsCallback"); %>
  <% if (jsCallback != null) { %>
   if (window.opener.<%= jsCallback %>) {
     window.opener.<%= jsCallback %>(selectedLangs);
   }
  <% } %>
  <% final String targetInput = getChooserParameter("targetInput"); %>
  <% if (targetInput != null) { %>
   if (window.opener.<%= targetInput %>) {
     window.opener.<%= targetInput %> = selectedLangs;
   }
  <% } %>
   window.close();
 }
//-->
</script>
<form name="langChooserForm" style="margin:0; padding:0" onsubmit="return false;">
<input name="multiple" type="hidden" value="<%= isMultiple %>" />
<input name="all" type="hidden" value="<%= allLanguages %>" />
<input name="shortList" type="hidden" value="<%= shortList %>" />
<input name="jsCallback" type="hidden" value="<%= jsCallback %>" />
<table class='list'  height="25">
 <thead>
  <tr> 
    <td width="15"><%if (isMultiple) {%><input type="checkbox" name="selectall" onclick="checkAllLang(this.checked);" /><%}%></td>
    <td class="text-right">
      <%= glp("ui.work.query.txt.search") %>
      <input name="search" type="text" onkeyup="hideAndSeek();" autocomplete="OFF" class='formTextfield'/>
      <button onclick="clearAndReset();"><jalios:icon css="clickable" src="delete" title='<%= glp("ui.com.alt.clear") %>' /></button>
    </td>
  </tr>
 </thead>
</table>
<div style='overflow: auto; height:390px;'>
<table id="languages" class='list table-data table-condensed' >
 <tbody>
 <jalios:foreach collection='<%= langList %>' name='lang' type='String' counter='langCounter'>
  <% int rowNbr = langCounter.intValue(); %>
  <% String rowID = "row_" + lang; %>
  <% boolean isSelected = selectedLangSet.contains(lang); %>
  <tr id='<%= rowID %>' class="<%= isSelected ? "listSelectedRow" : ""%>"> 
   <td><input name="lang" id="<%= lang %>" value='<%= lang %>' type='<%= isMultiple ? "checkbox" : "radio" %>' <%= isSelected ? "checked='checked'" : ""%>
            onclick="checkLang('<%= lang %>', '<%= rowID %>');"/></td>
   <td class='clickable' onclick="checkLang('<%= lang %>', '<%= rowID %>');"><jalios:lang lang='<%= lang %>'/></td>
   <td id="lang_<%=lang %>" class='clickable userLangName' onclick="checkLang('<%= lang %>', '<%= rowID %>');"><%= glp("lang." + lang) %></td>
   <td class='clickable nativeLangName' onclick="checkLang('<%= lang %>', '<%= rowID %>');"><%= channel.getProperty(lang + ".lang", "") %></td>
   <td class='clickable codeLang' onclick="checkLang('<%= lang %>', '<%= rowID %>');"><%= lang %></td>
  </tr>
 </jalios:foreach>
  <tr style="visibility: hidden;"> 
    <td width="15"></td> 
    <td width="20"></td> 
    <td colspan="3"></td> 
  </tr>
 </tbody>
</table>
</div>
<table class='list'  height="30">
 <tfoot>
  <tr> 
    <td class="text-right">
     <% if (allLanguages) { %>
      <button type="button" class="btn btn-default" onclick="toggleShortList();">
        <%= glp("ui.work.language-chooser." + (shortList ? "full-list" : "short-list")) %>
      </button>
     <% } %>
     <% if (isMultiple) { %>
      <button type="button" class="btn btn-default" style='padding: 0 20px; border: 2px solid;'
              onclick="selectLanguagesAndClose();">
        <%= glp("ui.work.query-ch.btn.select") %>
      </button>
     <% } %>
    </td>
  </tr>
 </tfoot>
</table>
</form>

<%@ include file='/jcore/doEmptyFooter.jspf' %>