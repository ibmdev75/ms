// -----------------------------------------------
// Caret & Selection's modifiers & accessors
// -----------------------------------------------

/**
 * Warning: this file is still used by Wiki Search/Spellcheck
 * it should be used as is and might be refactored with search/replace
 */


function setCaretTo(input, position) {
 setSelectionRange(input, position, position) ;
}
function setSelectionRange(input, selectionStart, selectionEnd) {
 input.focus();
 if (input.setSelectionRange) {
  // Set caret
  input.setSelectionRange(selectionStart, selectionStart);
  
  // Scroll to carret
  try {
    var evt = document.createEvent('KeyEvents'); 
    evt.initKeyEvent('keypress',true,true,window,false ,false,false,false,27,null);
    input.dispatchEvent(evt);
  } catch(ex) { }
  
  // Set selection
  input.setSelectionRange(selectionStart, selectionEnd);
 } else if (input.createTextRange) {
  var range = input.createTextRange();
  range.move('character', selectionStart);
  range.moveEnd('character', selectionEnd-selectionStart);
  range.select();
 }
}

function getSelectionStart(input) {
 if (input.setSelectionRange) {
  return input.selectionStart ;
 } else if (input.createTextRange) {
  if (! input.ownerDocument) { input.ownerDocument = document ; }
  var selection = input.ownerDocument.selection.createRange() ;
  if ( selection.parentElement().tagName!="TEXTAREA" ) {
   return 0 ;
  } else if ( selection.text.length == 0 ) {
   var backup = input.value ;
   var bookmark = "~JCMSwikiSearchAndReplaceBookmark~" ;
   selection.text = bookmark ;
   var index = input.value.search( bookmark );
   input.value = backup ;
   index -= input.value.substr(0,index).split('\n').length - 1 ;
   setCaretTo(input, index) ;
   return index ;
  } else {
   return ie_getSelectionBoundary(input, 'Start') ;
  }
 }
}
function getSelectionEnd(input) {
 if (input.setSelectionRange) {
  return input.selectionEnd ;
 } else if (input.createTextRange) {
  if (! input.ownerDocument) { input.ownerDocument = document ; } 
  var selection = input.ownerDocument.selection.createRange() ;
  if ( selection.text.length == 0 ) {
   return getSelectionStart(input) ;
  } else {
   return ie_getSelectionBoundary(input, 'End') ;
  }
 }
}
function ie_getSelectionBoundary(input, end) {
 if (! input.ownerDocument) { input.ownerDocument = document ; }
 var selection = input.ownerDocument.selection.createRange() ;
 var range = input.createTextRange() ;
 var selectionRange = input.createTextRange() ;
 var bookmark = selection.getBookmark() ;
 selectionRange.moveToBookmark(bookmark) ;
 range.setEndPoint('EndTo'+end, selectionRange) ;
 var index = range.text.length ;
 index -= range.text.split('\n').length - 1 ;
 selection.select();
 return  index ; 
}
function getSelectionText(input,n) {
 if (!n) { n = 0 ; }
 if (input.setSelectionRange) {
  return input.value.substring(input.selectionStart-n, input.selectionEnd+n);
 } else if (document.selection) {
  if (! input.ownerDocument) { input.ownerDocument = document ; }
  range = input.ownerDocument.selection.createRange() ;
  range.moveStart("character",-n) ;
  range.moveEnd("character",n) ;
  return range.text ;
 }
}

function replaceSelection(input, replaceString) {
 input.focus();
 if (input.setSelectionRange) {
  var selectionStart = input.selectionStart;
  var selectionEnd = input.selectionEnd;
  input.value = input.value.substring(0, selectionStart) + replaceString + input.value.substring(selectionEnd);
  if (selectionStart != selectionEnd) {
   setSelectionRange(input, selectionStart, selectionStart + replaceString.length);
  } else {
   setCaretTo(input, selectionStart + replaceString.length);
  }
 } else if (document.selection) {
  if (! input.ownerDocument) { input.ownerDocument = document ; }
  var range = input.ownerDocument.selection.createRange();
  var isCollapsed = range.text.length == 0;
  range.text = replaceString;
  if (!isCollapsed) {
   range.moveStart('character', -replaceString.length);
   range.select();
  }
 }
}

// -----------------------------------------------
// Search
// -----------------------------------------------

function parsePattern(string) {
 var reSpeChars = new Array( "\\" , "/" , "^" , "$" , "*" , "+" , "?" , "{" , "}" , "." , "(" , ")" , "|" , "[" , "]" ) ;
 for ( var i=0 ; i<reSpeChars.length ; i++ ) {
  var tmp_re = new RegExp('\\'+reSpeChars[i],'g') ;
  string = string.replace(tmp_re,'\\'+reSpeChars[i]) ;
 }
 return string ;
}
function search(input, string, start, end, sensitive, backward, wholeWord) {
 if ( (!start) || start > input.value.length ) {
  start = 0 ;
 }
 if ( (!end) ) {
  if (backward) {
   end = 0 ;
  } else {
   end = input.value.length ;
  }
 }
 if ( end < start ) {
  var tmp = end ;
  end = start ;
  start = tmp ;
 } else if ( end == start ) {
  if (backward) {
   start = 0 ;
  } else {
   end = input.value.length ;
  }
 }
 if (document.selection) {
  var lineOffset = input.value.substring(0,start).split('\n').length - 1
  start += lineOffset ;
  lineOffset = input.value.substring(0,end).split('\n').length - 1
  end += lineOffset ;
 }
 if (wholeWord) {
  var ww = "[^\\w\\xC0-\\xFF]" ;
  var regExp = "(^|"+ww+")("+parsePattern(string)+")($|"+ww+")" ;
 } else {
  var regExp = parsePattern(string) ;  
 }
 var reArgs = "g" ;
 if (!sensitive) {
  reArgs += "i" ;
 }
 regExp = new RegExp( regExp , reArgs ) ;
 var searchPlace = input.value.substring(start, end) ;
 var index ;
 if (backward) {
  while ( tmp = regExp.exec(searchPlace) ) {
   index = tmp.index ;
  }
 } else {
  index = regExp.exec(searchPlace) ;
  if (index) { index = index.index ; }
 }
 if ( index!== null && index>=0 ) {
  if ( wholeWord && RegExp.lastMatch.substr(0,1) != string.substr(0,1) ) {
   index++ ;
  }
  if ( document.selection ) {
   index -= input.value.substring(0,start+index).split('\n').length - 1 ;
  }
  setSelectionRange(input, start+index, start+index+string.length) ;
  return true ;
 } else {
  return false ;
 }
}
function searchIntoSelection(input, string, sensitive, backward, wholeWord) {
 if (! input.ownerDocument) { input.ownerDocument = document ; }
 if (document.selection && input.ownerDocument.selection.createRange().text.length == 0) { // IE loose the selection when it's empty
  var start = getSelectionStart(input) ;
  var  end  = start ;
 } else {
  var start = getSelectionStart(input) ;
  var  end  = getSelectionEnd(input) ;
 }
 return search(input, string, start, end, sensitive, backward, wholeWord) ;
}
function searchNext(input, string, sensitive, backward, wholeWord) {
 if ( search(input, string, backward?getSelectionStart(input):getSelectionEnd(input), null, sensitive, backward, wholeWord) ) {
  return true ;
 } else if (
       ( sensitive && getSelectionText(input) == string && input.value.lastIndexOf(string) == input.value.indexOf(string) )
      || ( !sensitive && getSelectionText(input).toLowerCase() == string.toLowerCase() && input.value.toLowerCase().lastIndexOf(string) == input.value.toLowerCase().indexOf(string) )
           ) {
  alert(onlyOneOccurenceMessage) ;
 } else if ( confirm(backward?loopSearchBackwardConfirmMessage:loopSearchForwardConfirmMessage) ) {
  return search(input, string, 0, input.value.length, sensitive, backward, wholeWord) ;
 }
}

// -----------------------------------------------
// Formats, links & images
// -----------------------------------------------

function clearSelection(input) { // enl�ve les blancs en d�but et en fin de selection ; renvoie vrai si la selection nettoy�e est vide
 if (input.setSelectionRange) {
  var selectionStart = input.selectionStart;
  var selectionEnd = input.selectionEnd;
  if (!(selectionStart<selectionEnd)) return true ;
  while (input.value.charAt(selectionStart)==" ") {
   selectionStart++;
  }
  while (input.value.charAt(selectionEnd-1)==" ") {
   selectionEnd--;
  }
  setSelectionRange(input, selectionStart, selectionEnd);
  if (!(selectionStart<selectionEnd)) return true ;
 } else if (document.selection) {
  var range = document.selection.createRange();
  if (range.text=="") return true ;
  //range.expand ("word") ;
  while (range.text.length>0&&range.text.charAt(0)==" ") {
   range.moveStart("character",1) ;
  }
  while (range.text.length>0&&range.text.charAt(range.text.length-1)==" ") {
   range.moveEnd("character",-1) ;
  }
  range.select() ;
  if (range.text=="") return true ;
 }
 return false ;
}
function expandSelectionRange(input, n) {
 if (!n) { return ; }
 if (input.setSelectionRange) {
  setSelectionRange(input, input.selectionStart-n, input.selectionEnd+n)
 } else if (document.selection) {
  range = document.selection.createRange() ;
  range.moveStart("character",-n) ;
  range.moveEnd("character",n) ;
  range.select() ;
 }
}

function parseSelection(input, parse, parses) {
 if ( parse.length <= 0 ) { return ; }
 if (clearSelection(input)) { return ; }
 found = false ;
 m = new Array(0,2,1) ;
 for ( j=0 ; (j<m.length&&!found) ; j++ ) {
  n = m[j] ;
  var text = getSelectionText(input,n) ;
  for ( i=0 ; i<parses.length ; i++ ) {
   if ( text.substr(0,parses[i].length)==parses[i] && text.substr(text.length-parses[i].length,parses[i].length)==parses[i] ) {
    text = text.substring(parses[i].length,text.length-parses[i].length) ;
    found = true ;
    if ( parses[i] == parse ) {
     parse = "" ;
    }
    break ;
   }
  }
 }
 if (found) expandSelectionRange(input, n) ;
 if (!found) { text = getSelectionText(input) ; }
 replaceSelection(input, parse + text + parse) ;
}
