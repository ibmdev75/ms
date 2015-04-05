<%@ include file='/jcore/doInitPage.jspf' %><%

  String ti = getChooserParameter("targetInput");
  
  jcmsContext.setPageTitle(glp("ui.wiki.search"));
  jcmsContext.addJavaScript("js/wikispell.js");
  jcmsContext.setPageZone("InternalUI");
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<div class="container-fluid">

 <form name="searchForm" id="searchForm" class="form-horizontal">
 
  <br/>
  
  <jalios:field name="toBeFound" id="toBeFound" label="ui.wiki.search.tobefound">
    <% String onChangeAction = "document.getElementById('replaceButton').disabled=true;"; %>
    <jalios:control settings='<%= new TextFieldSettings().onChange(onChangeAction) %>' />
  </jalios:field>
  <jalios:field name="replaceWith" id="replaceWith" label="ui.wiki.search.replacewith">
    <jalios:control settings='<%= new TextFieldSettings() %>' />
  </jalios:field>
  
  <div class="row">
    <div class="col-xs-6">
      <jalios:field name="direction" value="forward" resource="field-inline">
        <jalios:control settings='<%= new EnumerateSettings().radio().enumLabels("ui.wiki.search.forward", "ui.wiki.search.backward").enumValues("forward", "backward") %>'/>
      </jalios:field>
    </div>
  
    <div class="col-xs-6">
      <jalios:field name="sensitive" id="sensitive" resource="field-inline">
        <jalios:control settings='<%= new EnumerateSettings().checkbox().enumLabels("ui.wiki.search.sensitive").enumValues("sensitive") %>'/>
      </jalios:field>
      <jalios:field name="wholeword" id="wholeword" resource="field-light">
        <jalios:control settings='<%= new EnumerateSettings().checkbox().enumLabels("ui.wiki.search.wholeword").enumValues("wholeword") %>'/>
      </jalios:field>
    </div>
  </div>
  
  
  <br/>
  
  <div class="row">
    <div class="col-md-12 br">
      <button class="btn btn-primary" onclick="searchIt();return false;"  id="searchButton"><%= glp("ui.wiki.btn.search") %></button>
      
      <button class="btn btn-default" onclick="replaceIt();return false;" id="replaceButton" disabled="disabled"><%= glp("ui.wiki.btn.replace") %></button>
    </div>
    
    <div class="col-md-12">
      <button class="btn btn-default" onclick="findNreplaceAll();return false;" id="findNreplaceAllButton"><%= glp("ui.wiki.btn.replaceAll") %></button>
      
      <button class="btn btn-default" onclick="window.close(); return false;" ><%= glp("ui.com.btn.close") %></button>
    </div>
  </div>
  
 </form>
</div>

<%@ include file='/jcore/doEmptyFooter.jspf' %>

<script>
<% if (Util.isEmpty(ti)) { // IE showModelessDialog %>
var target = window.dialogArguments ;
if ( window.dialogArguments.ownerDocument ) { // IE6 : safer method
 var wOpener = window.dialogArguments.ownerDocument.parentWindow ;
} else { // IE5.5
 var wOpener = opener ;
}
<% } else { %>
var target = opener.<%= ti %> ;
var wOpener = opener ;
<% } %>
target.focus();
self.focus();
loopSearchForwardConfirmMessage = "<%= glp("ui.wiki.msg.loopsearch.forward") %>" ;
loopSearchBackwardConfirmMessage = "<%= glp("ui.wiki.msg.loopsearch.backward") %>" ;
onlyOneOccurenceMessage = "<%= glp("ui.wiki.msg.nomoreoccurence") %>" ;

var found ;
function searchIt() {
  // options
  var sensitive = jQuery('#searchForm input[name=sensitive]:checked').exists();
  var directionBackward = jQuery('#searchForm input[name=direction][value=backward]:checked').exists();
  var wholeWord = jQuery('#searchForm input[name=wholeword]:checked').exists();
  // Text
  var selectedText = getSelectionText(target);
  var toBeFoundText = document.searchForm.elements['toBeFound'].value;
  var replaceWithText = document.searchForm.elements['replaceWith'].value;
 
 // Determine if we are searching in current selection, or continuing search 
 var searchFunc = null;
 if (
     (  sensitive && selectedText == toBeFoundText )
  || ( !sensitive && selectedText.toLowerCase() == toBeFoundText.toLowerCase() )
  || (  sensitive && selectedText == replaceWithText.value )
  || ( !sensitive && selectedText.toLowerCase() == replaceWithText.toLowerCase() )
 ) {
   searchFunc = searchNext ;
 } else {
   searchFunc = searchIntoSelection ;
 }
 found = searchFunc(target, toBeFoundText, sensitive, directionBackward, wholeWord);

 // Update UI
 document.getElementById("replaceButton").disabled = !found;
 
 return found ;
}

function replaceIt() {
  // options
  var sensitive = jQuery('#searchForm input[name=sensitive]:checked').exists();
  var directionBackward = jQuery('#searchForm input[name=direction][value=backward]:checked').exists();
  var wholeWord = jQuery('#searchForm input[name=wholeword]:checked').exists();
  // Text
  var selectedText = getSelectionText(target);
  var toBeFoundText = document.searchForm.elements['toBeFound'].value;
  var replaceWithText = document.searchForm.elements['replaceWith'].value;
  
 if (( sensitive && selectedText == toBeFoundText ) || 
     ( !sensitive && selectedText.toLowerCase() == toBeFoundText.toLowerCase())) {
   replaceSelection(target, replaceWithText) ;
   return searchNext(target ,toBeFoundText, sensitive, directionBackward, wholeWord);
 } else {
  return false ;
 }
}

function findNreplaceAll() {
 var re = parsePattern( document.searchForm.elements['toBeFound'].value )
 if (document.searchForm.elements['wholeword'].checked) {
  var ww = "[^\\w\\xC0-\\xFF]" ;
  var re = "(^|"+ww+")("+re+")($|"+ww+")" ;
 } else {
  var re = "()("+re+")()" ;
 }
 if (document.searchForm.elements['sensitive'].checked) {
  var reArgs = 'g' ;
 } else {
  var reArgs = 'gi' ;
 }
 target.value = target.value.replace( new RegExp(re,reArgs) , function($0,$1,$2,$3) { return $1+document.searchForm.elements['replaceWith'].value+$3 ; } ) ;
}
</script>