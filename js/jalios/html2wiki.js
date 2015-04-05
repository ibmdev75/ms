// HTML to JCMS Wiki parser, SAX - parser like

var HTML2Wiki = function( html ) {
    var results = "";
    
    var infos = {}; // map of misc stacks popped/pushed each time needed
    
    var prefixText = '';
    var surroundText = '';
    var suffixText = '';
    
    var listLevel = 0;
    var lastTableDivision = '|'; 
    
    // -------------------
    
    function isEmpty(str) {
      return str.trim() == '';
    };
    
    // -------------------
    
    function append(text) {
      if (!text) {
        return;
      }
      results += text;
    };
    
    // -------------------
    
    function pushTag(tag) {
      return pushInfo('tag', tag);
    };
    function popTag() {
      return popInfo('tag');
    };
    function getCurrentTag() {
      return getCurrentInfo('tag');
    };
    
    function pushTagAttributes(tagAttributes) {
      return pushInfo('tag-attributes', tagAttributes);
    };
    function popTagAttributes() {
      return popInfo('tag-attributes');
    };
    function getCurrentTagAttributes() {
      return getCurrentInfo('tag-attributes');
    };
    
    /**
     * Helper method which iterate the specified attributes
     * to look for the specified one and return its value
     */
    function getTagAttribute( attrs , attrName ) {
      if (!attrs) {
        return null;
      }
      for ( var i = 0; i < attrs.length; i++ ) {
        if (attrs[i].name === attrName) {
          return attrs[i].value;
        } 
      }
      return null;
    };
    
    // -------------------
    
    function pushInfo( infoName, infoValue ) {
      var infoArray = infos[infoName];
      if (infoArray == null) {
        infoArray = [];
        infos[infoName] = infoArray;
      }
      infoArray.push(infoValue);
    };
    function popInfo( infoName ) {
      var infoArray = infos[infoName];
      if (infoArray != null) {
        return infoArray.pop();
      }
      return null;
    };
    function getCurrentInfo( infoName ) {
      var infoArray = infos[infoName];
      if (infoArray != null) {
        return infoArray[infoArray.length-1];
      }
      return null;
    };
    function decodeHtmlEntity( html ) {
      var text = html.replace('&lt;', '<').replace('&gt;', '>');
      return text;
    };

    
    // -------------------
    
    HTMLParser(html, {
      start: function( tag, attrs, unary ) {
        if (unary) {
          switch (tag) {
            case 'br': {
              if (getCurrentTag() === 'li') {
                append('\n');
                for (var level = listLevel; level > 0; level--) {
                  append('   ');
                }
                append('# ');
              } else { 
                append('#\n');
              }
              break;
            }
            case 'hr': {
              append('-------\n');
              break;
            }
            case 'p': {
              append('\n\n');
              break;
            }
            case 'img': {
              var src = getTagAttribute(attrs, 'src');
              var width = getTagAttribute(attrs, 'width');
              var height = getTagAttribute(attrs, 'height');
              if (width && height) {
                var thumbnailParams = '?w=' + width + '&h=' + height;
                var thumbnailParams2 = '?w=' + width + '&amp;h=' + height;
                if (src.endsWith(thumbnailParams)) {
                  src = src.substr(0, src.length - thumbnailParams.length);
                } else if (src.endsWith(thumbnailParams2)) {
                    src = src.substr(0, src.length - thumbnailParams2.length);
                }
                append('[[' + src + ']['+ width + 'x' + height + ']]');
              } else {
                append('[[' + src + ']]');
              }
              return;
            }
          }
          return;
        }
        
        // NOT Unary
        switch (tag) {
          case 'h1': {
            append('---++ ');
            break;
          }
          case 'h2': {
            append('---+++ ');
            break;
          }
          case 'h3': {
            append('---++++ ');
            break;
          }
          case 'code': {
            if (getCurrentTag() === 'strong') surroundText = '==';
            else surroundText = '=';
            break;
          }
          case 'em': {
            if (getCurrentTag() === 'strong') surroundText = '__';
            else if (getCurrentTag() === 'code') surroundText = '==';
            else surroundText = '_';
            break;
          }
          case 'strong': {
            if (getCurrentTag() === 'em') surroundText = '__';
            else if (getCurrentTag() === 'code') surroundText = '==';
            else surroundText = '*';
            break;
          }
          case 'ul':
          case 'ol': {
            listLevel++;
            pushInfo('listType', tag);
            if (listLevel > 1) {
              pushInfo('listFirstItemPrefix', '\n');
            }
            break;
          }
          case 'li': {
            append(popInfo('listFirstItemPrefix'));
            for (var level = listLevel; level > 0; level--) {
              append('   ');
            }
            append((getCurrentInfo('listType') === 'ul') ? '* ' : '1 ');
            break;
          }
          case 'blockquote': {
            append('[quote]');           
            break;
          }
          case 'pre': {
            append('[verbatim]');           
            break;
          }
          
          case 'table': {           
            break;
          }
          case 'tr': {
            break;
          }
          case 'th':    
          case 'td': {
            var tableDivision = (tag === 'th') ? '§' : '|';   
            append(tableDivision); 
            lastTableDivision = tableDivision; 
            var align = getTagAttribute(attrs, 'align');
            switch (align) {
             case 'left': append(' '); break;       
             case 'right': append('  '); break;       
             case 'center': append('  '); break;       
            }    
            break;
          }
        }
        
        pushTag(tag);
        pushTagAttributes(attrs);
      },
      
      chars: function( text ) {
        if (isEmpty(text)) {
          return;
        }
        
        var tag = getCurrentTag();
        var attrs = getCurrentTagAttributes();
        
        switch (tag) {
          case 'a': {
            var href = getTagAttribute(attrs, 'href');
            if (href && href.startsWith('mailto:')) {
              href = href.substr('mailto:'.length);
            }
            if (href === text) {
              append('[[' + href + ']]');
            } else {
              append('[[' + href + '][' + text + ']]');
            }
            return;
          }
          case 'pre': {
            // - do not replace "\n" with verbatim
            // - decode html entity
            append(decodeHtmlEntity(text));
            return;
          }
          case 'p': {
            // For bug JCMS-2773 :
            //  trim paragraph content to prevent lines to be inserted and reinterpreted
            //  (those whitespace are not rendered by browser in HTML)
            // For bug JCMS-3104 : 
            //  do not use 'trim' (which remove all spaces) but instead ;
            //   - completely remove starting whitespace
            //   - replace ending whitespaces (spaces and line breaks) with only 1 space 
            //  This will prevent relevant space from being lost in HTML rendering while
            //  keeping the wanted one.
            text = text.replace(/^\s+/, '');
            text = text.replace(/\s+$/, ' ');
            break;
          }
        }
        
        append(prefixText);
        append(surroundText);
        append(text.replace('\n',' '));
        append(surroundText);
        append(suffixText);
        
      },
      
      end: function( tag ) {
        var attrs = getCurrentTagAttributes();
        switch (tag) {
          case 'h1':
          case 'h2':
          case 'h3':
            append('\n'); break;
          case 'p':
            append('\n\n'); break;
          case 'em':
          case 'code':
          case 'strong':
            break;
            
          case 'li': {
            var listItemHasSubList = popInfo('listItemHasSubList');
            if (!listItemHasSubList) { 
              append('\n');
            }
            break;
          }
          case 'ol': 
          case 'ul': {
            popInfo('listType');
            if (listLevel > 1) {
              pushInfo('listItemHasSubList', true);
            }
            listLevel--;
            break;
          }
          case 'blockquote': {
            append('[/quote]\n');           
            break;
          }
          case 'pre': {
            append('[/verbatim]\n');           
            break;
          }
          
          case 'table': {           
            break;
          }
          case 'tr': {
            append(lastTableDivision + '\n');           
            break;
          }
          case 'th':    
          case 'td': {   
            var align = getTagAttribute(attrs, 'align');
            switch (align) {
             case 'left': append('  '); break;       
             case 'right': append(' '); break;       
             case 'center': append('  '); break;       
            }    
            break;
          }
        }
        
        prefixText = '';
        surroundText = '';
        suffixText = '';
        popTag();
        popTagAttributes();
      },
      
      comment: function( text ) {
      }
    });
    
    return results;
  };
