/**
 * @copyright Jalios S.A.
 */

JcmsLogger.info('TinyMCE_JcmsPlugin', 'Loading TinyMCE JCMS plugin');

(function() {
  var DOM = tinymce.DOM;
  
  // Load plugin specific languages translation : 
  //  do not use language pack through *.js files,
  //  instead, declare properties using current JS translation of JCMS
  
  tinyMCE.addI18n(jQuery.jalios.I18N.glp('lang.tinymce') + '.jcms', {
    publink_desc:       jQuery.jalios.I18N.glp('tinymce.jcms.publink_desc'),
    media_desc:         jQuery.jalios.I18N.glp('tinymce.jcms.media_desc'),
    global_styles_desc: jQuery.jalios.I18N.glp('tinymce.jcms.global_styles_desc'),
    local_styles_desc:  jQuery.jalios.I18N.glp('tinymce.jcms.local_styles_desc'),
    invisible_desc:     jQuery.jalios.I18N.glp('tinymce.jcms.invisible_desc'),
    docchooser_desc:    jQuery.jalios.I18N.glp('tinymce.jcms.docchooser_desc'),
    wikicode_desc:      jQuery.jalios.I18N.glp('tinymce.jcms.wikicode_desc'),
    code_desc:          jQuery.jalios.I18N.glp('tinymce.jcms.code_desc')
  });

  tinymce.create('tinymce.plugins.JcmsPlugin', {
    
    /**
     * Returns information about the plugin as a name/value array.
     */
    getInfo : function() {
      return {
        longname : 'JCMS',
        author : 'Jalios S.A.',
        authorurl : 'http://support.jalios.com',
        infourl : 'http://support.jalios.com',
        version : '3.4.3.2-7'
      };
    },
    
    /**
     * Initializes the plugin, this will be executed after the plugin has been created.
     *
     * @param {tinymce.Editor} ed Editor instance that the plugin is initialized in.
     * @param {string} url Absolute URL to where the plugin is located. 
              e.g. : http://127.0.0.1:8083/en/js/tiny_mce/plugins/jcms
     */
    init : function(ed, url) {
      var t = this;
      
      t.editor = ed;
      t.url = url;
   
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [init] url:', url, '');
      
      // Load Plugin UI CSS (contains sprites for buttons)
      ed.onBeforeRenderUI.add(function() {
        DOM.loadCSS(url + '/css/ui.css');
      });
      
      // Wikiwyg ?
      // Wikiwyg status is kept in settings for compatibility with fullscreen editor
      // When the fullscreen editor is created it is a new editor with settings copied from the original
      // It also triggers the Jalios patch of "tiny_mce(_src)?.jsp" which prevents trim of content
      this.isWikiwyg = ed.isWikiwyg = ed.getParam('jcms_wikiwyg');  
      
      // ------------------------------------
      // Find the current workspace to be propagated in popup (mediabrowser, upload, ...)
      ed.wsId = $(ed.getElement()).getJcmsId('WSID_'); 
      ed.wsIdParam = (ed.wsId && ed.wsId != '') ? ('&ws=' + ed.wsId) : '';
      
      // ------------------------------------
      // Fix bug JCMS-2797 : TinyMCE content (wysiwyg or wikiwyg) is lost if any ajax request occurs before submitting the form
      // Setup a CSS class after initialization, this class is used in configuration as a
      // deselector to prevent reinitialization of editor already initialized properly
      // (eg during ajax refresh) 
      ed.onInit.add(function(ed) {      
        $(ed.getElement()).addClassName('tinyMceInitialized');
      });
      
      // ------------------------------------
      // Fix JCMS-2831 : Allow multiple CSS file inclusion in wysiwyg edition -> allow custom body class
      // Read "body_class" settings of TinyMCE, exactly like it is done in tiny_mce_src.js, store value
      // in editor to be reused when modifying body classes using JCMS global/local styles 
      var settingsBodyClass = ed.settings.body_class || '';
      if (settingsBodyClass.indexOf('=') != -1) {
        settingsBodyClass = t.getParam('body_class', '', 'hash');
        settingsBodyClass = bc[t.id] || '';
      }
      ed.settingsBodyClass = settingsBodyClass;
      
      // JCMS-4151 : In wysiwyg field, insert publication link in the language of the field being edited
      var chooserLangParam = (ed.getElement ? ("&lang=" + ed.getElement().getAttribute('lang')) : '');
      
      // ------------------------------------
      // Register commands
      ed.addCommand('jcmsPublink', function() {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsPublink]');
        // Workaround IE selection bug
        ed.jcmsPubChooserBookmark = ed.selection.getBookmark();
        ed.selection.getRng();

        ed.windowManager.open({
          file : JcmsJsContext.getBaseUrl() + '/work/pubChooser.jsp?jsFunc=tinymce.plugins.JcmsPluginCB.pubChooserCB&textFieldPubLink=true' + ed.wsIdParam + chooserLangParam,
          width : 900 + ed.getLang('jcms.delta_width', 0),
          height : 500 + ed.getLang('jcms.delta_height', 0),
          inline : 1,
          popup_css: false
        }, {
          plugin_url : url,
          resizable : "yes",
          scrollbars : "yes"
        });
      });
      ed.addCommand('jcmsMedia', function() {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsMedia]');
        // Workaround IE selection bug
        ed.jcmsMediaBookmark = ed.selection.getBookmark();
        ed.selection.getRng();

        ed.windowManager.open({
          file : JcmsJsContext.getBaseUrl() + '/work/mediaBrowser.jsp?jsFunc=tinymce.plugins.JcmsPluginCB.mediaBrowserCB&media=all' + ed.wsIdParam + chooserLangParam,
          width : 930 + ed.getLang('jcms.delta_width', 0),
          height : 570 + ed.getLang('jcms.delta_height', 0),
          inline : 1,
          popup_css: false
        }, {
          plugin_url : url,
          resizable : "no",
          scrollbars : "no"
        });
      });
      ed.addCommand('jcmsInvisible', function() {
          JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsInvisible]');
          ed.focus();
          ed.undoManager.add();
          var formatName = ed.selection.isCollapsed() ? 'jcms.local-style-block' : 'jcms.local-style-inline';
          var formatValue = { 'classname' : 'invisibleZone' };
          ed.formatter.toggle(formatName, formatValue );
          ed.undoManager.add();
      });
      ed.addCommand('jcmsDocChooser', function() {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsDocChooser]');
        
        // Workaround IE selection bug
        ed.jcmsPubChooserBookmark = ed.selection.getBookmark();
        ed.jcmsMediaBookmark = ed.jcmsPubChooserBookmark; // ed.selection.getBookmark();
        ed.selection.getRng();

        ed.windowManager.open({
          file : JcmsJsContext.getBaseUrl() + '/work/docChooser.jsp?nbElt=1&pstatus=0&jsFunc=tinymce.plugins.JcmsPluginCB.docChooserCB' + ed.wsIdParam + chooserLangParam,
          width : 640 + ed.getLang('jcms.delta_width', 0),
          height : 600 + ed.getLang('jcms.delta_height', 0),
          inline : 1,
          popup_css: false
        }, {
          plugin_url : url,
          resizable : "no",
          scrollbars : "no"
        });
      });
      ed.addCommand('jcmsWikiPreview', function() {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsWikiPreview]');
        ed.save();
        var formName   = getFormName(window.document, ed.getElement().form);
        var widgetCount = parseInt($(ed.getElement()).getJcmsId("POS_"), 10);
        var widgetPos  = getFormElementPos(ed.getElement().form,ed.getElement().name) + widgetCount;
        ed.windowManager.open({
          file : JcmsJsContext.getBaseUrl() + '/work/wikiPopup.jsp?targetInput=document.'+formName+'.elements['+widgetPos+'].value',
          width : parseInt(ed.getParam("plugin_preview_width", "550")),
          height : parseInt(ed.getParam("plugin_preview_height", "600")),
          resizable : "yes",
          scrollbars : "yes",
          popup_css : ed.baseURI.toAbsolute("themes/" + ed.settings.theme + "/skins/" + ed.settings.skin + "/content.css"),
          inline : ed.getParam("plugin_preview_inline", 1),
          popup_css: false
        }, {
          base : ed.documentBaseURI.getURI()
        });
      });
      // FOR DEBUGGING PURPOSE
      ed.addCommand('jcmsWikiLoad', function() {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsWikiLoad]');
        ed.load();
      });
      ed.addCommand('jcmsWikiSave', function() {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [execCommand, jcmsWikiSave]');
        ed.save();
      });
      
      // Code tag
      ed.addCommand('jcmsCode', function() {
        ed.execCommand('mceBeginUndoLevel');
        ed.execCommand('mceToggleFormat', false, 'jcmsCode');        
        ed.execCommand('mceEndUndoLevel');
      });
      

      // ------------------------------------
      // Register buttons
      ed.addButton('jcmsDocChooser',{ title : 'jcms.docchooser_desc', cmd : 'jcmsDocChooser', 'class' : 'mceJcmsIcon mceJcms_DocChooser' });
      ed.addButton('jcmsPublink',   { title : 'jcms.publink_desc',    cmd : 'jcmsPublink',    'class' : 'mceJcmsIcon mceJcms_Publink' });
      ed.addButton('jcmsInvisible', { title : 'jcms.invisible_desc',  cmd : 'jcmsInvisible',  'class' : 'mceJcmsIcon mceJcms_Invisible' });
      ed.addButton('jcmsMedia',     { title : 'jcms.media_desc',      cmd : 'jcmsMedia',      'class' : 'mceJcmsIcon mceJcms_Media' });

      ed.addButton('jcmsWikiCode',    { title : 'jcms.wikicode_desc',  cmd : 'mceCodeEditor',  'class' : 'mceJcmsIcon mceJcms_WikiCode' });
      ed.addButton('jcmsWikiPreview', { title : 'preview.preview_desc',  cmd : 'jcmsWikiPreview',  'class' : 'mce_preview' });
      // FOR DEBUGGING PURPOSE
      ed.addButton('jcmsWikiLoad',     { title : 'Load Wiki 2 HTML (I18N)',      cmd : 'jcmsWikiLoad',     'class' : 'mceJcmsIcon mceJcms_Wiki2Html' });
      ed.addButton('jcmsWikiSave',     { title : 'Save HTML 2 Wiki (I18N)',      cmd : 'jcmsWikiSave',     'class' : 'mceJcmsIcon mceJcms_Html2Wiki' });
      
      ed.addButton('jcmsCode',    { title : 'jcms.code_desc',  cmd : 'jcmsCode',  'class' : 'mceJcmsIcon mceJcms_Code' });
      
      
      // ------------------------------------
      // Register onInit event handler
      ed.onInit.add(function(ed) {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onInit] - Editor initialized');
        if (JCMS && JCMS.wysiwyg && JCMS.wysiwyg.TinyMceCB) {
          JCMS.wysiwyg.TinyMceCB.initInstanceCB(ed);
        }
        if (!t.isWikiwyg) {
          if ('formRichText' === ed.settings.editor_selector) {
            t._selectItemInGlobalStyleMenu(ed.jcmsGlobalStyle);
            t._hideToolbars();
          }
        } else {
          // Hide HTML path of status bar for wikiwyg
          var pathRow = $(ed.id+'_path_row');
          if (pathRow) {
           pathRow.hide();
          }
        }
      });


      // Initialization code specific to wysiwyg or wikiwyg
      if (t.isWikiwyg) {
        t._initWikiwyg(ed, url);
      } else {
        t._initWysiwyg(ed, url);
      }
      
    },
    
    _initWysiwyg : function(ed, url) {
      var t = this;

      // ------------------------------------
      // Retrieve global to local styles map (as defined in wysiwyg-init.jsp)
      // key = <String> global style name, value = <String[]> local style name array
      ed.jcmsStylesHash = $H(ed.settings['jcms_styles']);
      // Define default global style
      ed.jcmsGlobalStyle = ed.jcmsStylesHash.keys().first();
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [init] Default global style:', ed.jcmsGlobalStyle);    

      // ------------------------------------
      // Register onBeforeSetContent event
      // Invoked before each setContent (e.g on first initialization of editor, when saving content from html source view)
      // => Extract wysiwyg styles from content and update styles/select/dom
      ed.onBeforeSetContent.add(function(ed, o) {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onBeforeSetContent]');
        
        if (!o.content.startsWith('<div class="')) {
          // redefine body class to correct styles using default global style
          var bodyClasses = 'mceContentBody wysiwyg ' + ed.jcmsGlobalStyle + ' ' + ed.settingsBodyClass;
          ed.dom.setAttrib(ed.getBody(), 'class', bodyClasses);
          JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onBeforeSetContent] - (default) bodyClasses="',bodyClasses, '"');
          return;
        }

        // Retrieve all div's classes and store for this editor
        // => ed.jcmsEditorClasses
        var startOfClassIdx = '<div class="'.length;
        var endOfClassIdx = o.content.indexOf('">');
        var classes = o.content.substr(startOfClassIdx, endOfClassIdx-startOfClassIdx);
        ed.jcmsEditorClasses = classes;

        // Retrieve the global style from all thoses classes
        // => ed.jcmsGlobalStyle
        // Use previously saved style if any
        tinymce.each(ed.jcmsEditorClasses.split(' '), function(style) {
          if (!Object.isUndefined(ed.jcmsStylesHash.get(style))) {
            ed.jcmsGlobalStyle = style;
            JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onBeforeSetContent] - using previously saved global style:', style);
          }
        });
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onBeforeSetContent] - jcmsEditorClasses="',ed.jcmsEditorClasses,'", jcmsGlobalStyle="',ed.jcmsGlobalStyle,'"');

        // Select global style in list box
        t._selectItemInGlobalStyleMenu(ed.jcmsGlobalStyle);
        
        // redefine body class to correct styles
        var bodyClasses = 'mceContentBody wysiwyg ' + ed.jcmsGlobalStyle + ' ' + ed.settingsBodyClass;
        ed.dom.setAttrib(ed.getBody(), 'class', bodyClasses);
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onBeforeSetContent] - bodyClasses="',bodyClasses, '"');
        
        // Strip surrounding div tag from content 
        var startOfRealContent = o.content.indexOf('">') + ('">'.length);
        var endOfRealContent = o.content.lastIndexOf('</div>');
        // ensure no data loss if html is invalid by using arbitrary number for check
        if (startOfRealContent > 42) { startOfRealContent = 0; }
        if (endOfRealContent < (o.content.length - 10)) { endOfRealContent = o.content.length; }
        // strip
        o.content = o.content.substring(startOfRealContent, endOfRealContent);
        
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onBeforeSetContent] - o.content="',o.content,'"');
      });
    
    
      // ------------------------------------
      // Register onGetContent event
      // Invoked when content is retrieved (e.g in html view, and when saving editor back to textarea)
      // => wrapping content back with JCMS wysiwyg styles
      ed.onGetContent.add(function(ed, o) {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onGetContent]');
        o.content = t._wrapContentWithStyle(o.content, t._getCSSGroup());        
      });
 
 
      // ------------------------------------
      // Register onNodeChange event handler
      ed.onNodeChange.add(function(ed, cm, e) {
        //JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [onNodeChange]');
        
        var lcLB = ed.controlManager.get('jcmsLcStyles');
        var invisibleButton = ed.controlManager.get('jcmsInvisible');

        var testLocalStyle = !!lcLB;
        var testInvisibleZone = !!invisibleButton;
        if (!testLocalStyle && testInvisibleZone) {
          return;
        }
        
        var isInInvisibleElement = false;
        var node = e;
        do {
          if (testLocalStyle) {
            $w(ed.dom.getAttrib(node, 'class')).each(function(classname) {
              if (t._selectItemInLocalStyleMenu(classname)){
                    testLocalStyle = false;
              }
            });
          }
          
          if (testInvisibleZone && ed.dom.hasClass(node, 'invisibleZone')) {
            isInInvisibleElement = true;
            testInvisibleZone = false;
          }
        } while ((node = node.parentNode));
    
        if (invisibleButton) {
          invisibleButton.setActive(isInInvisibleElement);
        }
      });
    
    },
    
    _initWikiwyg : function(ed, url) {
      var t = this;
    
      ed.onBeforeSetContent.add(function(ed, o) {
        o.content = t._jcmswiki2html(o.content);
      });

      ed.onPostProcess.add(function(ed, o) {
        if (o.set) {
          o.content = t._jcmswiki2html(o.content);
        }

        if (o.get){
          o.content = t._html2jcmswiki(o.content);
        }
      });
    },
    
    /**
     * Creates control instances based in the incomming name. 
     *
     * @param {String} n Name of the control to create.
     * @param {tinymce.ControlManager} cm Control manager to use inorder to create new control.
     * @return {tinymce.ui.Control} New control instance or null if no control was created.
     */
    createControl : function(n, cm) {
      var t = this;
      var ed = this.editor;
      
      switch (n) {
        case 'jcmsGlStyles':
          JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [createControl, jcmsGlStyles] Create CSS Group (global styles) listbox');
          
          // Create global styles list box   
          var glLB = cm.createListBox('jcmsGlStyles', {
               title : 'jcms.global_styles_desc',
               onselect : function(value) {
                 JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [jcmsGlStyles] - style="',value,'"');
         
                 // update classes with new value
                 ed.jcmsEditorClasses = 'wysiwyg ' + value;
                 ed.jcmsGlobalStyle = value;
         
                 // redefine body class to correct styles
                 ed.dom.setAttrib(ed.getBody(), 'class', 'mceContentBody ' + ed.jcmsEditorClasses + ' ' + ed.settingsBodyClass);
         
                 // Update local menu with new choice corresponding to global css group
                 t._updateLocalStylesMenu();
               }
          });
          
          ed.jcmsStylesHash.each(function(style) { // key = global style name, value = local style array
            var glStyleName = style.key;
            glLB.add(glStyleName, glStyleName);
          });
          
          return glLB;
          
        case 'jcmsLcStyles':
          JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [createControl, jcmsLcStyles] Create CSS (local styles) listbox');
          
          // Create local styles list box   
          var lcLB = cm.createListBox('jcmsLcStyles', {
               title : 'jcms.local_styles_desc',
               onselect : function(value) {
                 var node = ed.selection.getNode();
                 JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [jcmsLcStyles] - node=',node, ' className="',value,'"');
                 ed.focus();
                 ed.undoManager.add();

                 var formatName = ed.selection.isCollapsed() ? 'jcms.local-style-block' : 'jcms.local-style-inline';

                 // 1. Remove previously selected  local style (if any)
                 //    (we skip the newly selected one which will be toggle just after)
                 if (ed.jcmsGlobalStyle && ed.jcmsStylesHash.get(ed.jcmsGlobalStyle)) {
                     $A(ed.jcmsStylesHash.get(ed.jcmsGlobalStyle)).each(function(lcStyleName) {
                       if (lcStyleName === value) {
                         return;
                       }
                         ed.formatter.remove(formatName, { 'classname' : lcStyleName });
                     });
                 }
                 // 2. Toggle the selected style
                 ed.formatter.toggle(formatName, { 'classname' : value });

                 ed.undoManager.add();
         ed.nodeChanged();
           
                 return true;
               }
          });
          return lcLB;
      }
      return null;
    },

    // Private methods
    
    // --------------------------------------------------------------
    // Styles manipulation (JCMS)
   
    /**
     * Update the specified html content to ensure it is surrounded with a div class with the specified style.
     * Content is left untouched if null, undefined or empty.
     * @return the updated content
     */
    _wrapContentWithStyle: function(content, style) {
      var ed = this.editor;
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_wrapContentWithStyle] - style: "', style, '"');
      if (!content || /^\s*$/.test(content)) {
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_wrapContentWithStyle] - no content or content empty');
        return content;
      }
      
      if (!content.startsWith('<div class="')) {
        var updated = '<div class="' + style + '">' + content + '</div>';
        JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_wrapContentWithStyle] - no surrounding div, adding one');
        return updated;
      }
      
      var startOfRealContent = content.indexOf('">') + ('">'.length);
      var updated = '<div class="' + style + '">' + content.substr(startOfRealContent);
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_wrapContentWithStyle] - existing surrounding div updated');
      return updated;
    },
   
    /**
     * Retrieve the css group used (or to use if not yet define) for the current editor
     */
    _getCSSGroup: function() {
      var ed = this.editor;
      var wysiwygClasses = ed.jcmsEditorClasses;
      // Class to use when never defined
      if (!wysiwygClasses) {
        wysiwygClasses = 'wysiwyg ' + (ed.jcmsGlobalStyle || '');
      }
 
      // Add 'wywisyg' class if not present
      if (wysiwygClasses.indexOf('wysiwyg') == -1) {
        wysiwygClasses = 'wysiwyg ' + wysiwygClasses;
      }
 
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_getCSSGroup] - returns "',wysiwygClasses,'"');
      return wysiwygClasses;
    },
    
    /**
     * Update the content of the local styles select menu using the value
     * selected in the global style menu
     */
    _updateLocalStylesMenu: function() {
      var ed = this.editor;
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_updateLocalStylesMenu]');
  
      // Retrieve global style value
      if (!ed.jcmsGlobalStyle || !ed.jcmsStylesHash.get(ed.jcmsGlobalStyle)) {
        return;
      }
      // Update local styles listbox
      var lcLB = ed.controlManager.get('jcmsLcStyles');
      if (lcLB) { // Fix JCMS-2948 allow global style select button to be used without local style select button
        // clear all existing entries and selection
        lcLB.items = []; 
        lcLB.selectedValue = null;
        if (lcLB.isMenuRendered) { // Fix JCMS-2640
          lcLB.menu.destroy();
          lcLB.menu = null;
          lcLB.isMenuRendered = false;
          lcLB.oldID = 0;
        }
        // add new items
        $A(ed.jcmsStylesHash.get(ed.jcmsGlobalStyle)).each(function(lcStyleName) {
          lcLB.add(lcStyleName, lcStyleName);
        });
      }
    },
    
    _selectItemInGlobalStyleMenu: function(glStyle) {
      var ed = this.editor;
      //JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_selectItemInGlobalStyleMenu("',glStyle,'")]');
      
      // Select global style the global styles listbox
      var glLB = ed.controlManager.get('jcmsGlStyles');
      if (!glLB) { // fix bug JCMS-2210
        return;
      }
      glLB.select(glStyle);
      
      // Update local style menu content
      this._updateLocalStylesMenu();     
      
      return !!glLB.selectedValue;
    },
    
    _selectItemInLocalStyleMenu: function(lcStyle) {
      var ed = this.editor;
      //JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_selectItemInLocalStyleMenu("',lcStyle,'")]');
      
      // Select global style the local styles listbox
      var lcLB = ed.controlManager.get('jcmsLcStyles');
      if (!lcLB) { // fix bug JCMS-2210
        return;
      }
      lcLB.select(lcStyle);
      
      return !!lcLB.selectedValue;
    },
    
    // --------------------------------------------------------------
    // Toolbar manipulation
    
    _hideToolbars: function() {
      var ed = this.editor;
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_hideToolbars]');
      
      // Toolbars options are stored in element title, but saved in current settings for compatibility with fullscreen editor
      // When the fullscreen editor is created it is a new editor with settings copied from the original
      var edTitle = ed.getParam('jcms_toolbars') || ed.getElement().getAttribute('title');  
      ed.settings.jcms_toolbars = edTitle;
      
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_hideToolbars] - textarea title:"', edTitle, '"');
      var features = $A(new Array('basic', 'format', 'style', 'font', 'table'));
      if (!edTitle) {
        return;
      }
      // Completely hide toolbar
      if (edTitle.indexOf('none') != -1) {
        var mceToolbar = $($(ed.id+'_toolbar1').parentNode);
        mceToolbar.hide();
        var iframe = $(ed.id + '_ifr');
        var height = parseFloat(iframe.style.height || 0);
        iframe.style.height = (4+(4*22) + height) + 'px';
        return;
      }
      // Special case for style and font 
      if (edTitle.indexOf('style') == -1 && edTitle.indexOf('font') == -1) {
         this._hideToolbarFeatureSet('styleandfont');
      }
      // Hide some toolbar only
      var t = this;
      features.each(function(feature) {
        if (edTitle.indexOf(feature) == -1) {
          t._hideToolbarFeatureSet(feature);
        }
      });
    },
    
    /** Hide all elements corresponding to the given feature set */
    _hideToolbarFeatureSet: function(featureSet) {
      var ed = this.editor;
      JcmsLogger.debug('TinyMCE_JcmsPlugin', '[', ed.id, '] [_hideToolbarFeatureSet("',featureSet,'")]');
      
      var toolbarId = null;
      var startId = ed.id + '_';
      var endId = ed.id + '_';
      switch (featureSet) {
        case "basic":          { toolbarId = ed.id + '_toolbar1'; break; }
        case "format":         { toolbarId = ed.id + '_toolbar2'; break; }
        case "style":          { startId += 'styleprops'; endId += 'jcmsLcStyles'; break; }
        case "font":           { startId += 'fontselect'; endId += 'backcolor';    break; }
        case "styleandfont" :  { toolbarId = ed.id + '_toolbar3'; break; }
        case "table":          { toolbarId = ed.id + '_toolbar4'; break; }
      }

      // Directly hide a whole toolbar (table)
      var toolbarElm = $(toolbarId);
      if (toolbarElm) {
        toolbarElm.hide();
        var iframe = $(ed.id + '_ifr');
        var height = parseFloat(iframe.style.height || 0);
        iframe.style.height = (23 + height) + 'px';
        return;
      }
  
      // Hide all elements from startId to endId
      var startElm = $(startId);
      var endElm = $(endId); 
      if (!startElm || !endElm) {
        return;
      }
      var hideOn = false;
      
      // Retrieve parent TR containing each toolbar element: 
      var toolbarsElm;
      // for simple button : <tr><td><a href="" class="mceButton">
      if (startElm.hasClassName('mceButton')) {
        toolbarsElm = startElm.parentNode.parentNode;
      } 
      // for select menu : <tr><td><span><table class="mceListBox">
      else if (startElm.hasClassName('mceListBox')) {
        toolbarsElm = startElm.parentNode.parentNode.parentNode;
      } else {
        // unexpected case        
        return;
      }
      
      for (var i = 0; i < toolbarsElm.childNodes.length; i++) { // Iterate on all TD
        var curTD = $(toolbarsElm.childNodes[i]);
        var curElm = $(curTD.firstChild);
        // retrieve button in TD
        // If span>table, its not a button, but certainly an mceListBox (fontselect or such)
        if (curElm.tagName.toLowerCase() === 'span' && 
            Object.isElement(curElm.firstChild) && 
            curElm.firstChild.tagName.toLowerCase() === 'table') {
          curElm = $(curElm.firstChild); // retrieve sub table, to check right id afterward
        }
        // start hiding when start of featureSet is found
        if (curElm.id === startId) {
          hideOn = true;
        }
        if (!hideOn) {
          continue;
        }
        curTD.hide(); // hide TD
        // stop hiding when end of featureSet is found
        if (curElm.id === endId) {
          hideOn = false;
          break;
        }
      }
    },
    
    // --------------------------------------------------------------
    // Wikiwyg manipulation
    
    // HTML -> JCMS wiki
    _html2jcmswiki : function(s) {
      s = HTML2Wiki(s);
      
      // Fix bug JCMS-4121 : Make sure no HTML entity is kept in the resulting wiki
      // Those entities are always encoded by TinyMCE and must therefore be
      // decoded before being saved in the textarea
      var entities = {
        '&lt;' : '<',
        '&gt;' : '>',
        '&quot;' : '"',
        '&apos;' : "'"
      };
      for (var entity in entities) {
        if (entities.hasOwnProperty(entity)) { 
          s = s.replace(new RegExp(entity, 'gi'), entities[entity]);
        }
      }
      s = s.replace(new RegExp('&amp;', 'gi'), '&');
      
      return s; 
    },

    // JCMS wiki -> HTML
    _jcmswiki2html : function(s) {

      // Fix bug JCMS-4121 : Make sure the following characters are properly encoded 
      // as it is expected by TinyMCE internals when re-editing HTML 
      s = s.replace(new RegExp('&', 'gi'), '&amp;');
      var entities = {
        '\"' : '&quot;',
        "'" : '&#39;',
        '<' : '&lt;',
        '>' : '&gt;'
      };
      for (var entity in entities) {
        if (entities.hasOwnProperty(entity)) { 
          s = s.replace(new RegExp(entity, 'gi'), entities[entity]);
        }
      }
      
      s = Wiki2HTML(s);
      return s; 
    }
    
  });

  // Register plugin
  tinymce.PluginManager.add('jcms', tinymce.plugins.JcmsPlugin);
})();


tinymce = tinymce || {};
tinymce.plugins = tinymce.plugins  || {};
tinymce.plugins.JcmsPluginCB = {
    
    // --------------------------------------------------------------
    // LinkInsertion

    /**
     * Callback function given as the 'jsFunc' argument of the pubChooser.
     * @param pubId the id of the Publication to link to.
     * @param linkLabel the label to use for the link to insert, == title of the Publication.
     * @param linkDisplayURL the URL to use to link to the publication (descriptive url).
     */
    pubChooserCB : function(pubId, linkLabel, linkDisplayURL) {
      var ed = tinyMCE.activeEditor;
      JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[', ed.id, '] [pubChooserCB] id=',pubId,', label="',linkLabel,'", url=',linkDisplayURL);
      if (!pubId && !linkDisplayURL) {
        JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[', ed.id, '] [pubChooserCB] no id or URL retrieved');
        return;
      }
      if (!linkDisplayURL) {
        linkDisplayURL = 'display.jsp?id=' + id;
        JcmsLogger.warn('TinyMCE_JcmsPluginCB', '[', ed.id, '] [pubChooserCB] displayURL missing, using ', linkDisplayURL);
      }
    
      // Retrieve selected element (anchor)
      var elm = ed.selection.getNode();
      elm = ed.dom.getParent(elm, 'A');
      
      ed.undoManager.add();
      
      // Create new anchor elements
      if (elm == null) {
        JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[', ed.id, '] [pubChooserCB] creating new <a> element');

        // Fix by JCMS-2116 by ensuring selection is restored correctly, before getContent() is invoked
        // work around IE selection bug, follow advice of following topic : 
        // http://tinymce.moxiecode.com/punbb/viewtopic.php?id=7552
        ed.selection.moveToBookmark(ed.jcmsPubChooserBookmark);
          
        var selectedHTML = ed.selection.getContent();
        var htmlToInsert = '<a href="'+linkDisplayURL+'">' + (!selectedHTML ? linkLabel : selectedHTML) + '</a>';

        ed.execCommand("mceInsertContent", false, htmlToInsert);
      }
      // Or update existing anchor
      else {
        JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[', ed.id, '] [pubChooserCB] updating href of existing <a> element');
        ed.dom.setAttribs(elm, { href : linkDisplayURL });
      }
      
      ed.undoManager.add();
    },
    
  
    // --------------------------------------------------------------
    // Media Insertion
    
    /**
     * Callback function given as the 'jsFunc' argument of the mediaBrowser.
     * @param fdId the id of the FileDocument to insert.
     * @param fdTitle the label to use for the tag to insert, == title of the FileDocument.
     * @param fdMediaType media type of the FileDocument being inserted
     *        ('image', 'video', 'audio', 'flash', 'other')
     * @param fdURL the relative URL to use to link to the FileDocument.
     * @param targetInput not used by wysiwyg
     * @param targetLabel not used by wysiwyg
     * @param p1 optionnal param, width for image
     * @param p2 optionnal param, height for image
     * @param p3 optionnal param
     * @param p4 optionnal param
     */
    mediaBrowserCB : function(fdId, fdTitle, fdMediaType, fdURL, targetInput, targetLabel, p1, p2, p3, p4) {
      var ed = tinyMCE.activeEditor;
      JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[', ed.id, '] [mediaBrowserCB] id=',fdId,', title="',fdTitle,'" mediaType="',fdMediaType,'", url="',fdURL,'", p1=',p1,'", p2=',p2,'", p3=',p3,'", p4=',p4);
  
      var htmlToInsert = '';
      switch (fdMediaType) {
        case 'image':
          var encodedFdTitle = tinymce.DOM.encode(fdTitle);
          htmlToInsert += '<img src="'+fdURL+'" alt="'+encodedFdTitle+'"'+' title="'+encodedFdTitle+'."';
          if (p1) { htmlToInsert += ' width="'+p1+'"'; }
          if (p2) { htmlToInsert += ' height="'+p2+'"'; }
          htmlToInsert += '/>';
          break;
        case 'video':
        case 'flash':
        case 'audio':
          htmlToInsert = tinymce.plugins.JcmsPluginCB._insertMedia(fdURL, fdMediaType);
          if (htmlToInsert == null) {
            JcmsLogger.warn('TinyMCE_JcmsPluginCB', '[', ed.id, '] [mediaBrowserCB] media type not yet supported', fdURL);
            return;
          }
          break;
        default:
          JcmsLogger.warn('TinyMCE_JcmsPluginCB', '[', ed.id, '] [mediaBrowserCB] invalid media type', fdMediaType);
          return;
      }
  
      // work around IE selection bug, follow advice of following topic : 
      // http://tinymce.moxiecode.com/punbb/viewtopic.php?id=7552
      ed.selection.moveToBookmark(ed.jcmsMediaBookmark);

      // Warning : "mceInsertContent" replace the selected content.
      // See svn history of this file for version which append after selection.
      ed.execCommand("mceInsertContent", false, htmlToInsert);
    },
    
    /**
     * Insert the specified media URL in the current context
     * 
     * @param mediaSrc the relative URL to use to link to the FileDocument.
     * @param mediaType JCMS media type of the FileDocument being inserted
     *        ('image', 'video', 'audio', 'flash', 'other')
     * @return the HTML to insert or null if it could not be generated
     */
    _insertMedia : function(mediaSrc, mediaType) {
      var ed = tinyMCE.activeEditor;
      JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[', ed.id, '] [_insertMedia] mediaSrc="',mediaSrc,'", mediaType="',mediaType,'"');

      // 1. Fill a JSON data structure for use by native TinyMCE methods
      var jsonData = {
          'params': {
            'src': mediaSrc
          }, 
          'video': {
              'sources': [ { src: mediaSrc } ]
          }, 
          'type': mediaType
       };
      
      // Use Long Tail Video Player when possible
      // Supported Video and Audio Formats
      // http://www.longtailvideo.com/support/jw-player/jw-player-for-flash-v5/12539/supported-video-and-audio-formats
      //   Video Formats
      //    MP4 (.mp4, .m4v, .f4v, .mov)
      //    WebM (.webm)
      //    FLV (.flv)
      //    OGG (.ogv)
      //   
      //   Audio Formats
      //    AAC (.aac, .m4a, .f4a)
      //    Vorbis (.ogg .oga)
      //    MP3 (.mp3)      
      var extension = mediaSrc.replace(/^.*\.([^.]+)$/, '$1');
      var jcms_video_selector = ed.getParam('jcms_video_selector', /(mp4|m4v|f4v|mov|webm|flv|ogv)/);
      var jcms_audio_selector = ed.getParam('jcms_audio_selector', /(aac|m4a|f4a|ogg|oga|mp3)/);
      if ('video' == mediaType && jcms_video_selector.test(extension)) {
        var jcms_video_data = ed.getParam('jcms_video_data', {
          'type' : 'flash',
          'params' : {
            'src' : 'flash/lib/player.swf',
            'flashvars' : 'file=${baseUrl}$url',
            'WMode' : 'opaque'
          },
          'width' : '320',
          'height' : '260'          
        });
        tinymce.extend(jsonData, jcms_video_data);
      }
      else if ('audio' == mediaType && jcms_audio_selector.test(extension)) {
        var jcms_audio_data = ed.getParam('jcms_audio_data', {
          'type' : 'flash',
          'params' : {
            'src' : 'flash/lib/player.swf',
            'flashvars' : 'file=${baseUrl}$url',
            'WMode' : 'opaque'
          },
          'width' : '230',
          'height' : '24'          
        });
        tinymce.extend(jsonData, jcms_audio_data);
      }
      
      // Otherwise default to TinyMCE media type handling
      else {
        // Find the TinyMCE regirested type by extension
        var typeInfo = ed.plugins.media.getType(extension);
        if (typeInfo) {
          var typeName = typeInfo.name.toLowerCase();
          jsonData.type = typeName;
        } else {
          return null;
        }
      }
      
      // 2. Invoke native TinyMCE methods for media insertion
      var html = ed.plugins.media.dataToHtml(jsonData, true);
      
      // Replace $url in HTML to support generic declaration of editor param
      html = html.replace(/\$url/g, mediaSrc);
      
      return html;
    },
    
  
    // --------------------------------------------------------------
    // Custom Filebrowser

    /**
     * Callback function given as the 'file_browser_callback' to tinyMCE.init.
     * See http://wiki.moxiecode.com/index.php/TinyMCE:Custom_filebrowser
     */
    jcmsFileBrowserCB : function(field_name, url, type, win) {
      JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[jcmsFileBrowser]', arguments);
      
      var options = {
          file : '',
          width : 930,
          height : 570,
          resizable : "no",
          scrollbars : "no",
          close_previous : "no",
          popup_css: false
      };
      
      var ed = tinyMCE.activeEditor;    
      
      // JCMS-4151 : In wysiwyg field, insert publication link in the language of the field being edited
      var chooserLangParam = (ed.getElement ? ("&lang=" + ed.getElement().getAttribute('lang')) : '');      

      switch (type) {
        case "image": {
          options.file = JcmsJsContext.getBaseUrl() + '/work/mediaBrowser.jsp?tinyMCEPopup=true&medias=image&media=image' + ed.wsIdParam + chooserLangParam;
          break;
        }
        case "media": {
          options.file = JcmsJsContext.getBaseUrl() + '/work/mediaBrowser.jsp?tinyMCEPopup=true&media=all' + ed.wsIdParam + chooserLangParam;
          break;
        }
        case "file": {
          options.file = JcmsJsContext.getBaseUrl() + '/work/pubChooser.jsp?tinyMCEPopup=true&textFieldPubLink=true&pubChooserMenu=true' + ed.wsIdParam + chooserLangParam;
          options.width = 900;
          options.height = 500;
          options.resizable = "yes";
          options.scrollbars = "yes";
          break;
        }
      }
      
      tinyMCE.activeEditor.windowManager.open(options, {
          window : win,
          input : field_name
      });
      
      return false;
    },
    
    // --------------------------------------------------------------
    // DocChooser button callback
    
    /**
     * Callback function given when invoking docChooser.jsp through 'jcmsDocChooser' button.
     * @param filesInfos an array of file information :
     * [
     *  {
     *   id: 'c_42',
     *   title: 'My File',
     *   filename: 'upload/docs/text/plain/2009/09/file.txt',
     *   displayUrl: 'jcms/c_42/my-file',
     *   mediaType: 'other',
     *   width: 640,
     *   height: 480
     *  }
     * ]
     */
    docChooserCB : function(filesInfos) {
      //var ed = tinyMCE.activeEditor;
      JcmsLogger.debug('TinyMCE_JcmsPluginCB', '[docChooserCB]', arguments);
      $A(filesInfos).each(function(fileInfos) {
        if (fileInfos.mediaType === 'other') {
          // pubChooserCB : function(pubId, linkLabel, linkDisplayURL) {
          tinymce.plugins.JcmsPluginCB.pubChooserCB(fileInfos.id, fileInfos.title, fileInfos.displayUrl);
        } else {
          //mediaBrowserCB : function(fdId, fdTitle, fdMediaType, fdURL, targetInput, targetLabel, p1, p2, p3, p4) {
          tinymce.plugins.JcmsPluginCB.mediaBrowserCB(fileInfos.id, fileInfos.title, fileInfos.mediaType, fileInfos.filename);
        }
      });
    }
};

