// JCMS Wiki to HTML converter

var Wiki2HTML = function( wiki ) {
  if (!wiki) {
    return "";
  }
  
  var results = wiki;
  
  // -------------------
  
  function rep(re, str) {
    results = results.replace(re, str);
  };
  
  // -------------------
  
  var UNORDERED_LIST = 0;
  var ORDERED_LIST = 1;
  var DEFINITION_LIST = 2;

  function processWikiList() {
    var re = /^((   )+)(\#|\*|\d+|(([^\s:]+):)) (.+?)(\n|$)/gim;
    var idx = 0;
    var newText = '';
    var prevListLevel = 0;
    var typeList = UNORDERED_LIST;
    var listStack = [];
    
    while ((m = re.exec(results)) != null) {
        var preMatch = results.substr(idx, (m.index - idx));
        idx = re.lastIndex;
        
        // If preMatch not empty => leave list processing
        if (prevListLevel > 0 && preMatch && preMatch.trim().length > 0) {
          newText += "</li>\n";
          for (var i = 0; i < prevListLevel; i++) {
            var popped = listStack.pop();
            newText += popped;
          }
          prevListLevel = 0;
        }
        
        var match = m[0];
        var spaces = m[1];
        var marker = m[3];
        var content = m[6];

        if (spaces.length % 3 != 0) {
          continue;
        }

        var level = spaces.length / 3;
        var delta = level - prevListLevel;
        var isNewLine = marker.charAt(0) === '#';

        // Check New line first
        if (isNewLine && delta == 0) {
          newText += '<br />\n';
          newText += content;
          continue;
        }

        // if level change open/close the list markers
        if (delta > 0) {
          newText += preMatch;
          for (var i = 0; i < delta; i++) {
            var firstChar = marker.charAt(0);
            if (firstChar >= '0' && firstChar <= '9') {
              if (level > 1) {
                newText += '<ol>\n'; // TODO quid nested <dl> / <ol>
                listStack.push("</ol>\n</li>\n");
              } else {
                newText += "</p>\n<ol>\n";
                listStack.push("</ol>\n<p>\n");
              }
              typeList = ORDERED_LIST;
            }
            else if (firstChar == '*') {
              if (level > 1) {
                newText += "<ul>\n";  // TODO quid nested <dl> / <ul>
                listStack.push("</ul>\n</li>\n");
              } else {
                newText += "</p>\n<ul>\n";
                listStack.push("</ul>\n<p>\n");
              }
              typeList = UNORDERED_LIST;
            }
            else {
              newText += "<dl>\n"; // TODO nested issues ?
              listStack.push("</dl>\n<p>\n");
              typeList = DEFINITION_LIST;
            }
          }
        }
        else if (delta < 0) {
          if (typeList != DEFINITION_LIST) { newText += "</li>\n"; }// close the previous item
          newText += preMatch;
          for (var i = 0; i < -delta; i++) {
            var popped = listStack.pop();
            newText += popped;
          }
        }
        else /* delta == 0 */ {
          if (typeList != DEFINITION_LIST) { newText += "</li>\n"; } // close the previous item
          newText += preMatch;
        }

        // Print the list item
        if (typeList == DEFINITION_LIST) {
          newText += "<dt>" + results.group(5) + "</dt>\n<dd>" + content + "</dd>\n";
        }
        else {
          newText += "<li>" + content; // the </li> will be append at the next iteration, only if it is not a sub-level.
        }
        prevListLevel = level;

      }

      // Close the remaining open lists
      if (prevListLevel > 0 && typeList != DEFINITION_LIST) {
        newText += "</li>\n";
      }
      for (var i = 0; i < prevListLevel; i++) {
        var popped = listStack.pop();
        newText += popped;
      }
      var postMatch = results.substr(idx, (results.length - idx));      
      newText += postMatch;
      
      results = newText;
  };
  
  // -------------------
  
  function processWikiTable() {
    var re = new RegExp("^\s*([|\xa7](.+)[|\xa7])\s*$", "gim");
    var idx = 0;
    var newText = '';
    var processingTable = false;

    while ((m = re.exec(results)) != null) {
      var preMatch = results.substr(idx, (m.index - idx));
      var match = m[0];
      idx = re.lastIndex;
      
      // If preMatch not empty => leave table processing
      if (processingTable && !preMatch && preMatch.trim().length > 0) {
        newText += "</table>\n<p>\n";
        processingTable = false;
      }

      if (!processingTable) {
        newText += preMatch;
        newText += '</p>\n<table border="0" cellspacing="1">\n';
        processingTable = true;
      }

      newText += '  <tr>\n';
      
      var cells = match.split(/([|\xa7])/);
      var delim = null;      
      for (var i = 1; i < cells.length; i++) {
          var cell = cells[i];
          if (!delim) {
              delim = cell;
          } else {
        	if (i == cells.length -1) {
        		// skip last empty cell if any
        		break;
        	}
            var tag = (delim === '\xa7') ? 'th' : 'td';
            var lg = cell.length;
            var align;
            if (lg >= 2 && cell.charAt(lg - 1) == ' ' && cell.charAt(lg - 2) != ' ') {
                align = 'right';
            }
            else if (lg >= 2 && cell.charAt(1) == ' ') {
                align = 'center';
            }
            else {
                align = 'left';
            }
            newText += '    <' + tag + ' align="'+ align +'">' + cell.trim() + '</' + tag + '>\n';
            delim = null;
          }
      }
      newText += '  </tr>\n';
    }
    if (processingTable) {
      newText += "</table>\n<p>\n";
    }
    var postMatch = results.substr(idx, (results.length - idx));      
    newText += postMatch;
    
    results = newText;
  };
  
  // -------------------
  
  var VERBATIM_MARKER = "@@@VERBATIM@@@";
  var verbatimList = [];
  
  // First step, replace all verbatim with a marker
  function processVerbatim1() {
    var re = /\[verbatim\]([\s\S]*?)\[\/verbatim\]/gim;
    var idx = 0;
    var newText = '';

    while ((m = re.exec(results)) != null) {
      var preMatch = results.substr(idx, (m.index - idx));
      var verbatimContent = m[1];
      idx = re.lastIndex;
      
      newText += preMatch;
      newText += VERBATIM_MARKER;
      verbatimList.push(verbatimContent);
    }
    
    var postMatch = results.substr(idx, (results.length - idx));      
    newText += postMatch;
	    
    results = newText;
  };
  
  // Second & last step, replace all markers with their pre content
  function processVerbatim2() {
    var re = /@@@VERBATIM@@@/gim;
    var verbatimIdx = 0;
    var idx = 0;
    var newText = '';

    while ((m = re.exec(results)) != null) {
      var preMatch = results.substr(idx, (m.index - idx));
      idx = re.lastIndex;
      
      newText += preMatch;
      newText += '</p>\n<pre>' + verbatimList[verbatimIdx] + '</pre>\n<p>\n'; 
      verbatimIdx++;
    }
    
    var postMatch = results.substr(idx, (results.length - idx));      
    newText += postMatch;
	    
    results = newText;
  }
  
  // -------------------
  
  // Cleanup 
  // Remove windows line ending (fix JCMS-3892)
  rep( /\r\n/gi  , "\n" );  
  
  // Escape HTML
  rep( />/gi  , "&gt;" );
  rep( /</gi  , "&lt;" );

  // Verbatim - first step
  processVerbatim1();

  // List
  processWikiList();
  
  // Basic formatting   
  rep( /(^|[\s\(])__([^_]*?)__/gi  , "$1<strong><em>$2</em></strong>" );
  rep( /(^|[\s\(])_([^_]*?)_/gi    , "$1<em>$2</em>" );
  rep( /(^|[\s\(])\*([^\*]*?)\*/gi , "$1<strong>$2</strong>" );
  rep( /(^|[\s\(])==([^=]*?)==/gi  , "$1<code><strong>$2</strong></code>" );
  rep( /(^|[\s\(])=([^=]*?)=/gi    , "$1<code>$2</code>" );
  
  // Paragraph
  rep( /^\s*\n/gim , "\n</p>\n<p>\n" );
  rep( /#\s*\n/gi  , "<br/>\n" );
  
  // Separator
  rep( /^-------\n/gim , '</p>\n<hr/>\n<p>\n' );
  
  // Headings
  rep( /^---\+\+\s+(.*)$/gim , "</p>\n<h1>$1</h1>\n<p>\n" );
  rep( /^---\+\+\+\s+(.*)$/gim , "</p>\n<h2>$1</h2>\n<p>\n" );
  rep( /^---\+\+\+\+\s+(.*)$/gim , "</p>\n<h3>$1</h3>\n<p>\n" );
  
  // Images
  rep( /\[\[(([^\s\[\]]+?)\.(gif|jpg|png))\]\[(\d*)\s*x\s*(\d*)\]\]/gi ,
       '<img src="$1?w=$4&h=$5" alt="$2" width="$4" height="$5" />' );
  rep( /\[\[(([^\s\[\]]+?)\.(gif|jpg|png))\]\]/gi ,
       '<img src="$1" alt="$2" />' );
  
  // Links
  rep( /\[\[(([^\]@]+?)@([^\]]+?))\]\]/gi , '<a href="mailto:$1">$1</a>' );
  rep( /\[\[(([^\]@]+?)@([^\]]+?))\]\[([^\]]+?)\]\]/gi , '<a href="mailto:$1">$4</a>' );
  rep( /\[\[([^\]]+?)\]\]/gi , '<a href="$1">$1</a>' );
  rep( /\[\[([^\]]+?)\]\[([^\]]+?)\]\]/gi , '<a href="$1">$2</a>' );

  // Quote
  rep( /\[quote\]([\s\S]*?)\[\/quote\]/, '</p>\n<blockquote>\n$1</blockquote>\n<p>\n' );

  // Tables
  processWikiTable();

  // Verbatim - second & last step
  processVerbatim2();
  
  results = '<p class="first">\n' + results + '</p>\n';
  
  // Cleanup
  rep( /<p>[\n\s]*<\/p>\n/gim , '' );  // remove empty paragraph after heading
  rep( /^<p( class=\"first\")?>\s*<\/p>\n/gi , '' ); // remove first empty paragraph if any
  rep( /<p>\n\s*<\/p>\n$/gi , '' );  // remove empty paragraph at end if any
  rep( /(<p[^>]*>\s*)+(<p[^>]*>)/gi , '$2' );  
  
  return results;
};
