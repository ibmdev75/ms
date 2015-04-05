/**
 * https://github.com/kayahr/jquery-fullscreen-plugin
 */
(function($) {
  
/**
 * Sets or gets the fullscreen state.
 * Inspired by https://github.com/kayahr/jquery-fullscreen-plugin
 * 
 * @example
 * jQuery('.fullscreen-btn').click(function() {
 *   $('.my-iframe').fullScreen({
 *     state: true,
 *     src: JcmsJsContext.getBaseUrl() + 'plugins/MyPlugin/jsp/fullscreen/fullscreen.jsp',
 *     use_window: true
 *   });
 * });
 * 
 * @param {Object} options (optional) : 
 *      - state
 *        True to enable fullscreen mode, false to disable it. If not
 *        specified then the current fullscreen state is returned.
 *        
 *      - src
 *        Specifies the URL of the page to open. 
 *        If no URL is specified and open_window option is true, a new window with about:blank is opened.
 *      
 *      - use_window
 *        true to force to use a new window, it doesn't use the native fullscreen.
 *        
 * @return {boolean|Element|jQuery|null}
 *            When querying the fullscreen state then the current fullscreen
 *            element (or true if browser doesn't support it) is returned
 *            when browser is currently in full screen mode. False is returned
 *            if browser is not in full screen mode. Null is returned if 
 *            browser doesn't support fullscreen mode at all. When setting 
 *            the fullscreen state then the current jQuery selection is 
 *            returned for chaining.
 * @this {jQuery}
 */
function fullScreen(options) {
    var e, func, doc;
    
    // Initialize options
    var defaults = {
        state: null,// 
        src: null,
        use_window: false
    };
    var options = jQuery.extend(defaults, options);
    
    var state = options.state;
    var src = options.src;
    var use_window = options.use_window;
    
    var window_instance;
    // Check if we must to use a new window or native fullscreen
    if(use_window && src) {
      // window_instance = window.open(src,"_blank","channelmode=yes,fullscreen=yes,scrollbars=no,width=" + screen.availWidth + ",height=" + screen.availHeight + ",left=0,top=0,location=no,titlebar=no,status=no,menubar=no,toolbar=no");
      window_instance = $(window.open(src,"_blank","width=" + screen.availWidth + ",height=" + screen.availHeight + ",left=0,top=0,channelmode=no,fullscreen=no,location=no,titlebar=no,status=no,menubar=no,toolbar=no"));
      window_instance.moveTo(0,0);
      window_instance.resize(screen.width, screen.height);
      return this;
    }
    
    // Do nothing when nothing was selected
    if (!this.length) return this;
    
    // We only use the first selected element because it doesn't make sense
    // to fullscreen multiple elements.
    e = (/** @type {Element} */ this[0]);
    
    // Find the real element and the document (Depends on whether the
    // document itself or a HTML element was selected)
    if (e instanceof Document) {
      doc = e;
      e = doc.documentElement;
    } else {
      doc = e.ownerDocument;
    }
    
    // When no state was specified then return the current state.
    if (state == null) {
      // When fullscreen mode is not supported then return null
      if (!runPrefixMethod(doc, "CancelFullScreen")) {
        return null;
      }

      state = !!runPrefixMethod(doc, "FullScreen") || !!runPrefixMethod(doc, "IsFullScreen");
      if (!state) return state;

      return runPrefixMethod(doc, "FullScreenElement") || runPrefixMethod(doc, "CurrentFullScreenElement") || state;
    }
    
    // When state was specified then enter or exit fullscreen mode.
    if (state) {
      // Enter fullscreen
      var success = runPrefixMethod(e, "RequestFullScreen");
      if (success) {
        // Use Element.ALLOW_KEYBOARD_INPUT parameter to enable keyboard input in, only when browser knows this constant
        if (Element["ALLOW_KEYBOARD_INPUT"]) {
          func.call(e, Element["ALLOW_KEYBOARD_INPUT"]);
        } else {
          func.call(e);
        }
      }
      return this;
    } else {
      // Exit fullscreen
      runPrefixMethod(doc, "CancelFullScreen")
      return this;
    }
}

/**
 * Toggles the fullscreen mode.
 * 
 * @return {!jQuery}
 *            The jQuery selection for chaining.
 * @this {jQuery}
 */
function toggleFullScreen() {
  return (/** @type {!jQuery} */ fullScreen.call(this, !fullScreen.call(this)));
}

/**
 * Handles the browser-specific fullscreenchange event and triggers
 * a jquery event for it.
 *
 * @param {?Event} event
 *            The fullscreenchange event.
 */
function fullScreenChangeHandler(event) {
  jQuery(document).trigger(new jQuery.Event("fullscreenchange"));
}

/**
 * Handles the browser-specific fullscreenerror event and triggers
 * a jquery event for it.
 *
 * @param {?Event} event
 *            The fullscreenerror event.
 */
function fullScreenErrorHandler(event) {
  jQuery(document).trigger(new jQuery.Event("fullscreenerror"));
}

/**
 * Installs the fullscreenchange event handler.
 */
function installFullScreenHandlers() {
  var e, change, error;
  
  // Determine event name
  e = document;
  
  var p = 0, method = "CancelFullScreen", m, t;
  while (p < pfx.length && !e[m]) {
    m = method;
    if (pfx[p] == "") {
      m = m.substr(0,1).toLowerCase() + m.substr(1);
    }
    m = pfx[p] + m;
    t = typeof e[m];
    if (t != "undefined" && e[m]) {
      change = pfx[p] + "fullscreenchange";
      error = pfx[p] + "fullscreenerror";
      break;
    }
    p++;
  }

  // Install the event handlers
  jQuery(document).bind(change, fullScreenChangeHandler);
  jQuery(document).bind(error, fullScreenErrorHandler);
}

var pfx = ["", "webkit", "moz", "ms", "o"];
function runPrefixMethod(obj, method) {
  var p = 0, m, t;
  while (p < pfx.length && !obj[m]) {
    m = method;
    if (pfx[p] == "") {
      m = m.substr(0,1).toLowerCase() + m.substr(1);
    }
    m = pfx[p] + m;
    t = typeof obj[m];
    if (t != "undefined") {
      pfx = [pfx[p]];
      var success = (t == "function" ? obj[m]() : obj[m]);
      return success || true;
    }
    p++;
  }
  return false;
}

jQuery.fn["fullScreen"] = fullScreen;
jQuery.fn["toggleFullScreen"] = toggleFullScreen;
installFullScreenHandlers();

})(jQuery);