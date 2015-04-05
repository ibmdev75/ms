!function ($) {

  /**
   * Private utility class to check for availability and validity of 
   * friendly URLs on the server side.
   * 
   * Two entry points : 
   *  - FriendlyUrlChecker.isFriendlyURLAvailable(dataId, url)
   *  - FriendlyUrlChecker.isFriendlyURLValid(url)
   */
  var FriendlyUrlChecker = {

    // ------------------------------------------
    // AVAILABILITY
       
    // Cache availability to prevent unneeded requests
    _availabilityCache: {},
    _cacheAvailability : function(key, isAvailable) {
      this._availabilityCache[key] = isAvailable;
      return isAvailable;
    },

    /**
     * Perform a JSON-RPC call to check for availability of the url.
     * @param dataId the id of current data being edited to skip it from availability validation
     * @param url the friendly URL to check
     */ 
    isFriendlyURLAvailable : function(dataId, url) {
      // try to retrieve from cache
      var cachedValue = this._availabilityCache[url];
      if (cachedValue != undefined) {
        return cachedValue;
      }
      
      var result = true;
      try {
        var startTime = (new Date()).getTime(); 
        result = JcmsJsContext.getJsonRPC().FriendlyURLFilter.isFriendlyURLAvailable(dataId, url);
        var endTime = (new Date()).getTime(); 
      }
      catch(ex) { }
      // alert("The server replied: " + result);
      return this._cacheAvailability(url, !!result);
    },
    
    // ------------------------------------------
    // VALIDITY
     
    // Cache validity to prevent unneeded requests
    _validityCache : {},
    _cacheValidity : function(key, isValid) {
      this._validityCache[key] = isValid;
      return isValid;
    },

    /**
     * Perform a JSON-RPC call to check for validity of the url
     * @param url the friendly URL to check
     */ 
    isFriendlyURLValid : function(url) {
      // try to retrieve from cache
      var cachedValue = this._validityCache[url];
      if (cachedValue != undefined) {
        return cachedValue;
      }
      
      var result = true;
      try {
        var startTime = (new Date()).getTime(); 
        result = JcmsJsContext.getJsonRPC().FriendlyURLFilter.isFriendlyURLValid(url);
        var endTime = (new Date()).getTime(); 
      }
      catch(ex) { }
      // alert("The server replied: " + result);
      return this._cacheValidity(url, !!result);
    }
  };
  
  // Mininum interval (in millisecond) between each check on the server side
  var CHECK_FREQUENCY = 700;
  
   
  var observer = null; // timeoutID returned by window.setTimeout(= for the regular check to be performed after a keydown event
  var newFriendlyURLInputId = null; // DOM id of last input in which keydown occured and for which check must be performed
  
  var onkeydown = function(event) {
    if (observer) {
      clearTimeout(observer);
      observer = null;
    }
    observer = setTimeout(checkAndUpdateFriendlyURLGUINow, CHECK_FREQUENCY); 
    newFriendlyURLInputId = event.target.id;
  }


  var _furlOldValue = null;
  var checkAndUpdateFriendlyURLGUINow = function() {
    $.console.debug('EditFriendlyURL', 'checkAndUpdateFriendlyURLGUINow');
    
    var $invalidWarningDiv = $(".newFriendlyURLInvalidWarning");
    var $existWarningDiv = $(".newFriendlyURLExistWarning");
    var $newFriendlyURLInput = $("#" + newFriendlyURLInputId);
  
    if (!$newFriendlyURLInput.exists() || $newFriendlyURLInput.val() === "") {
      $.console.debug('EditFriendlyURL', 'checkAndUpdateFriendlyURLGUINow', 'missing or empty, hide all msgs');
      $invalidWarningDiv.addClass("hide");
      $existWarningDiv.addClass("hide");
      _furlOldValue = "";
      return;
    }
    
    if ($newFriendlyURLInput.val() === _furlOldValue) {
      $.console.debug('EditFriendlyURL', 'checkAndUpdateFriendlyURLGUINow', 'same value as before, skip');
      return;
    }
    
    if (_furlOldValue === null) {
      $.console.debug('EditFriendlyURL', 'checkAndUpdateFriendlyURLGUINow', 'overwrite old value ... ', _furlOldValue);
      _furlOldValue = $newFriendlyURLInput.val();
    }
    
    $.console.debug('EditFriendlyURL', 'checkAndUpdateFriendlyURLGUINow', 'check new value...', $newFriendlyURLInput.val());
    var isUrlValid = FriendlyUrlChecker.isFriendlyURLValid($newFriendlyURLInput.val());
    var isUrlAvailable = FriendlyUrlChecker.isFriendlyURLAvailable($newFriendlyURLInput.getJcmsId(), $newFriendlyURLInput.val());
    var isSlash = $newFriendlyURLInput.val() == '/';
    
    $.console.debug('EditFriendlyURL', 'checkAndUpdateFriendlyURLGUINow', 'isUrlValid', isUrlValid, 'isUrlAvailable', isUrlAvailable, 'isSlash', isSlash);    
    
    // Show/Hide Div
    if (isSlash || isUrlValid) {  
      $invalidWarningDiv.addClass("hide");
    } else {
      $invalidWarningDiv.removeClass("hide");
    }
    
    // Show/Hide Available Div
    if (isSlash || isUrlAvailable) { 
      $existWarningDiv.addClass("hide");
    } else {
      $existWarningDiv.removeClass("hide");
    }
    
    if (!isSlash && (!isUrlValid || !isUrlAvailable)) { 
      $newFriendlyURLInput.parent().addClass('has-error'); 
    } else {
      $newFriendlyURLInput.parent().removeClass('has-error'); 
    }
  }
  
  var setup = function() {
    $( "input[name=friendlyURL]" ).keydown(onkeydown);
  }
  
  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', setup);
  
}(window.jQuery);

