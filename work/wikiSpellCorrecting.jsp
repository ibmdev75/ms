<%@page import="com.jalios.jcms.spellchecker.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jalios:buffer name='customHeader'>
  <style>
    BODY, TABLE, INPUT {
     background: #c0c0c0;
    }
    TD {
     white-space: nowrap; 
    }
    INPUT, SELECT {
     background: white;
    }
    INPUT, SELECT, BUTTON {
     margin: 4px;
    }
    A.selected IMG {
     border: 2px solid #FFFF70 ;
    }
  </style>
</jalios:buffer><%
%><%

  request.setAttribute("title",glp("ui.wiki.spellcheck")); 
  request.setAttribute("zone","InternalUI");
  jcmsContext.addCustomHeader(customHeader);
  jcmsContext.addJavaScript("js/wikispell.js");
  
%><%
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<%
  // Text to check
  String text = getUntrustedStringParameter("text", "");
  // Language - Ensure language exists, otherwise use default site language
  String lang = getAlphaNumParameter("lang", null);
  if (channel.getProperty(lang + ".lang", null) == null) {
    lang = channel.getLanguage();
  }
  // Text area
  String ti = getChooserParameter("ti") ;
%>
<jalios:javascript>
'JCMS.wiki.SpellCorrecting'._namespace({
  wrong: new Array(),
  correct: new Array(),
  startBound: 0,
  endBound: null,
  target: null,
  idx: -1,
  
  init: function() {
<jalios:foreach name="itSCR" type="SpellCheckResult" collection="<%= SpellCheckerManager.spellCheck(text,lang) %>" counter="c1">
    JCMS.wiki.SpellCorrecting.wrong[<%= c1.intValue() - 1  %>] = "<%= encodeForJavaScript(itSCR.word) %>" ;
    JCMS.wiki.SpellCorrecting.correct[<%= c1.intValue() - 1  %>] = new Array() ;
 <jalios:foreach name="itSuggestion" type="String" collection="<%= itSCR.suggestions %>" counter="c2">
    JCMS.wiki.SpellCorrecting.correct[<%= c1.intValue() - 1  %>][<%= c2.intValue() - 1  %>] = "<%= encodeForJavaScript(itSuggestion) %>" ;
 </jalios:foreach>
</jalios:foreach>

    <% if (Util.isEmpty(ti)) { // IE showModelessDialog %>
    var target = window.dialogArguments ;
    if ( target.ownerDocument.parentWindow ) {
     var wOpener = target.ownerDocument.parentWindow ;
    } else {
     var wOpener = target.ownerDocument.prntWindow ;
    }
    <% } else { %>
    var target = top.opener.<%= ti %> ;
    var wOpener = top.opener ;
    <% } %>
    JCMS.wiki.SpellCorrecting.target = target;
    
    var startBound = getSelectionStart(target) ;
    var endBound = getSelectionEnd(target) ;
    if ( endBound == startBound ) {
     startBound = 0 ;
     endBound = null ;
    }
    JCMS.wiki.SpellCorrecting.startBound = startBound;
    JCMS.wiki.SpellCorrecting.endBound = endBound;
    
    if ( JCMS.wiki.SpellCorrecting.wrong.length > 0 ) {
     setTimeout("JCMS.wiki.SpellCorrecting.nextMistake()",1) ;
    } else {
     alert("<%= glp("ui.wiki.spellcheck.msg.noError") %>") ;
     window.close();
    }
  },

  nextMistake: function() {
   // Increment to next error
   JCMS.wiki.SpellCorrecting.idx++ ;

   // End of correction reached, propose to restart again or to end
   if ( JCMS.wiki.SpellCorrecting.idx > JCMS.wiki.SpellCorrecting.wrong.length-1 ) {
    setSelectionRange(JCMS.wiki.SpellCorrecting.target,JCMS.wiki.SpellCorrecting.startBound,JCMS.wiki.SpellCorrecting.endBound) ;
    if ( confirm("<%= glp("ui.wiki.spellcheck.msg.redo") %>") ) {
     return document.location = "<%= contextPath %>/work/wikiSpellChecking.jsp?lang=<%= encodeForURL(lang) %><%= Util.isEmpty(ti)?"":"&ti="+encodeForURL(ti) %>" ;
    } else {
     return window.close() ;
    }
   }
   
   var curWrongWord = JCMS.wiki.SpellCorrecting.wrong[JCMS.wiki.SpellCorrecting.idx];
   
   // Find next error in the text
   var searchStartBound = JCMS.wiki.SpellCorrecting.firstMatchFound ? getSelectionEnd(JCMS.wiki.SpellCorrecting.target) : JCMS.wiki.SpellCorrecting.startBound;
   var searchEndBound = JCMS.wiki.SpellCorrecting.endBound;
   //JcmsLogger.info('WikiSpellCheck', 'nextMistake search', curWrongWord, searchStartBound, searchEndBound) ;
   var wrongWordFound = search(JCMS.wiki.SpellCorrecting.target, curWrongWord, searchStartBound, searchEndBound, true, false );
   if ( wrongWordFound ) {
    JCMS.wiki.SpellCorrecting.firstMatchFound = true; // indicate that next error will have to be searched from the end of current error
    document.getElementById("wrong_display").value = curWrongWord ;
    document.getElementById('correct_input').value = "" ;
    document.getElementById('correct_select').innerHTML = "" ;
    var suggestions = JCMS.wiki.SpellCorrecting.correct[JCMS.wiki.SpellCorrecting.idx];
    if ( suggestions && suggestions.length > 0 ) {
     document.getElementById('correct_input').value = suggestions[0] ;
     document.getElementById('correct_select').disabled = false ;
     for ( j = 0 ; j < suggestions.length ; j++ ) {
      var opt = document.createElement("option") ;
      opt.innerHTML = suggestions[j] ;
      document.getElementById('correct_select').appendChild(opt) ;
     }
     setTimeout("document.getElementById('correct_select').options[0].selected = true ;" , 1) ; // Sometimes IE works to fast for itself (sic)
    } else {
     var opt = document.createElement("option") ;
     opt.innerHTML = "(<%= glp("ui.wiki.spellcheck.lbl.no-suggestion") %>)" ;
     document.getElementById('correct_select').appendChild(opt) ;
     document.getElementById('correct_select').disabled = true ;
    }
   } else {
    JCMS.wiki.SpellCorrecting.nextMistake() ;
   }
  },

  replaceMistake: function() {
   replaceSelection( JCMS.wiki.SpellCorrecting.target, document.getElementById('correct_input').value ) ;
   JCMS.wiki.SpellCorrecting.nextMistake() ;
  },
  
  replaceAllMistake: function() {
   var caretBackPosition = getSelectionStart(JCMS.wiki.SpellCorrecting.target) ;
   caretBackPosition -= JCMS.wiki.SpellCorrecting.target.value.substring(0,caretBackPosition).split(JCMS.wiki.SpellCorrecting.wrong[JCMS.wiki.SpellCorrecting.idx]).length - 1 ;
   var wholeWord = "[^\\w\\xC0-\\xFF]" ;
   var regExp = new RegExp("(^|"+wholeWord+")("+JCMS.wiki.SpellCorrecting.wrong[JCMS.wiki.SpellCorrecting.idx]+")($|"+wholeWord+")","gi") ;
   JCMS.wiki.SpellCorrecting.target.value = JCMS.wiki.SpellCorrecting.target.value.replace(regExp, function ($0,$1,$2,$3) { return $1+JCMS.wiki.SpellCorrecting.capsReplace($2)+$3; } ) ;
   setCaretTo(JCMS.wiki.SpellCorrecting.target, caretBackPosition ) ;
   JCMS.wiki.SpellCorrecting.ignoreAll() ;
  },
  
  capsReplace: function(s) {
    if ( s.substr(0,2) == s.substr(0,2).toLowerCase() ) {
     return document.getElementById('correct_input').value.toLowerCase() ;
    } else if ( s.substr(0,2) == s.substr(0,2).toUpperCase() ) {
     return document.getElementById('correct_input').value.toUpperCase() ;
    } else if ( s.substr(0,1) == s.substr(0,1).toUpperCase() && s.substr(1,1) == s.substr(1,1).toLowerCase() ) {
     return document.getElementById('correct_input').value.substr(0,1).toUpperCase() + document.getElementById('correct_input').value.substr(1).toLowerCase() ;
    }
  },
  
  ignoreAll: function() {
   var ignored = JCMS.wiki.SpellCorrecting.wrong[JCMS.wiki.SpellCorrecting.idx].toLowerCase() ;
   for (var j=0; j < JCMS.wiki.SpellCorrecting.wrong.length; j++) {
    if ( JCMS.wiki.SpellCorrecting.wrong[j] && JCMS.wiki.SpellCorrecting.wrong[j].toLowerCase() == ignored ) {
     JCMS.wiki.SpellCorrecting.wrong[j] = null ;
     JCMS.wiki.SpellCorrecting.correct[j] = null ;
    }
   }
   JCMS.wiki.SpellCorrecting.nextMistake() ;
  }
});
JCMS.wiki.SpellCorrecting.init();
</jalios:javascript>

<table class='layout peer'>
  <tr>
    <td class="formLabel"><label for="wrong_display"><%= glp("ui.wiki.spellcheck.lbl.mistake") %> :</label></td>
    <td width="100%"><input id="wrong_display" disabled="disabled" class="formInput formDisabled" /></div></td>
  </tr>
  <tr>
    <td><label for="correct_input"><%= glp("ui.wiki.spellcheck.lbl.replaceWith") %> :</label></td>
    <td><input id="correct_input" type="text" value="" class="formInput" onkeyup="document.getElementById('correct_select').selectedIndex=-1;" /></td>
  </tr>
  <tr>
    <td class="vTop"><label for="correct_select"><%= glp("ui.wiki.spellcheck.lbl.suggestions") %> :</label></td>
    <td>
      <select id="correct_select" size="5" class="formSelectbox" multiple="multiple" onchange="document.getElementById('correct_input').value=this.options[this.selectedIndex].innerHTML;">
      </select>
    </td>
  </tr>
  <tr>
    <td>
      <jalios:foreach name="itLang" type="String" collection="<%= SpellCheckerManager.getLanguageList() %>" counter="c2">
        <a href="work/wikiSpellChecking.jsp?lang=<%= itLang %><%= Util.isEmpty(ti)?"":"&amp;ti="+ti %>"<% if(lang.equals(itLang)){ %> class="selected"<% } %>><jalios:lang lang='<%= itLang %>'/></a>
      </jalios:foreach>
    </td>
    <td>
     <table class="layou">
      <tr>
        <td><button class='btn btn-default' onclick="JCMS.wiki.SpellCorrecting.replaceMistake()" id="replace_button"><%= glp("ui.wiki.btn.replace") %></button></td>
        <td><button class='btn btn-default' onclick="JCMS.wiki.SpellCorrecting.replaceAllMistake()" id="replace_button"><%= glp("ui.wiki.btn.replaceAll") %></button></td>
      </tr>
      <tr>
        <td><button class='btn btn-default' onclick="JCMS.wiki.SpellCorrecting.nextMistake()" id="skip_button"><%= glp("ui.wiki.spellcheck.btn.ignore") %></button></td>
        <td><button class='btn btn-default' onclick="JCMS.wiki.SpellCorrecting.ignoreAll()" id="skip_button"><%= glp("ui.wiki.spellcheck.btn.ignoreAll") %></button></td>
      </tr>
    </td>
  </tr>
</table>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
