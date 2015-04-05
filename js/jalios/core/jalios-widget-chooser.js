!function ($) {
  
  // Action regexp
  var pattern1 = /(chooser):([\w-]+)/i;
  var pattern2 = /(widget):([\w-]+)/i;

  var chooserConfiguration = {
      'acl' : {
        path : 'admin/aclChooser.jsp?',
        name : 'ACL'
      },
      'category' : {
        path : 'work/categoryChooser.jsp?cids={value}&',
        name : 'Category'
      },
      'country' : {
        path : 'admin/countryChooser.jsp?',
        name : 'Country'
      },
      'dbrecord' : {
        path : 'work/dbrecordChooser.jsp?',
        name : 'DBRecord'
      },
      'document' : {
        path : 'work/docChooser.jsp?nbElt=1&',
        name : 'Document'
      },
      'group' : {
        path : 'admin/groupChooser.jsp?',
        name : 'Group'
      },
      'image' : {
        path : 'work/mediaBrowser.jsp?selectMode=true&medias=image&', // use plural "medias" to restrict list
        name : 'Image',
        ref  : 'mediabrowser'
      },
      'media' : {
        path : 'work/mediaBrowser.jsp?selectMode=true&',
        name : 'Media',
        ref  : 'mediabrowser'
      },
      'member' : {
        path : 'admin/memberChooser.jsp?',
        name : 'Member'
      },
      'publication' : {
        path : 'work/pubChooser.jsp?',
        name : 'Publication'
      },
      'query' : {
        path : 'work/queryChooser.jsp?qs={value}&',
        name : 'Query'
      },
      'workspace' : {
        path : 'work/workspace/workspaceChooser.jsp?',
        name : 'Workspace'
      }      
  }
  
  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------
  
  var register = function(){
    // Register to broker
    $(document).on("jalios:broker", brokerCallback);
    
    // Fix duration chooser
    $(document).on('keyup', '.duration_user', function(event){
      var $e = $(event.currentTarget);
      updateDuration($e, 1000);
    });
    $(document).on('change', '.duration_unit', function(event){
      var $e = $(event.currentTarget);
      updateDuration($e, 1000);
    });
    $(document).on('change', '.jalios-country', function(event){
      var $e = $(event.currentTarget);
      $e.prev('INPUT.jalios-country-display').removeClass(event.previousValue + '-flag').addClass(event.currentVal + '-flag');
    });
    $(document).on('change', '.form-control-value.jalios-workspace', function(event){
      var $e = $(event.currentTarget);      
      var $widget =$e.closest(".widget");
      if(!$widget || !$widget.exists()){
        return;
      }
      var $wkChooser = $widget.find(".triggerWsChangeRefresh");
      if(!$wkChooser || !$wkChooser.exists()){
        return;
      }
      var $input = $widget.find(".workspaceChangeEvent");
      if(!$input || !$input.exists()){
        return;
      }
      $input.val(true);
      $e.refresh();
    });
    
  }
  
  // ------------------------------------------
  //  WIDGET
  // ------------------------------------------
  
  var brokerCallback = function(event){

    var broker = $.jalios.Event.match(event, 'broker');
    if (!broker){ return; }
    
    // No pattern
    var  regex1 = broker.type.match(pattern1);
    var  regex2 = broker.type.match(pattern2);
    if (!(regex1||regex2)){ return; }
    
    // No action
    var  regex = regex1 ? broker.type.match(pattern1) 
                        : broker.type.match(pattern2);
    var swtch  = regex[1];
    var attr   = regex[2];
    if (!swtch || !attr){ return; }
    
    // Element
    var $elm = $(broker.source.currentTarget);
    var $chooser = $elm.parent().prevAll('INPUT.form-control-value');
    var options  = broker.options;

    // Action
    if (chooserConfiguration[attr]) {
      openElementDataChooser($chooser, attr, options, $elm);
    }
    else if (attr == 'color') {
      if(!$chooser.exists() && $elm.is('INPUT')) {
        $chooser = $elm;
      }
      $chooser.colorpicker('show')
        .on('changeColor', function(ev) {
          var previousVal = $chooser.val();
          var currentVal = ev.color.toHex();
          $chooser.val(ev.color.toHex());
          $chooser.prev("SPAN.input-group-addon").css( "background-color", currentVal );
          $chooser.trigger(jQuery.Event("change", { "previousValue": previousVal, "currentVal": currentVal })); 
        })
        .on('hide', function(ev){ ev.preventDefault(); });
      // Clear color in addon if there is no value
      $chooser.keyup(function() {
        if (!this.value) {
          $chooser.prev("SPAN.input-group-addon").css("background", "");
        }
      });
    }
    else if (attr == 'duration') {
      // FIXME
    }
    else if (attr == 'date') {
      if(!$chooser.exists() && $elm.is('INPUT')) {
        $chooser = $elm;
      }
      openDateChooser($elm, $chooser);
    }
    else if (attr == 'clear') {
      $.jalios.ui.Widget.clear($chooser);
      
      // Clear color in addon
      if($chooser.hasClass('control-color') && !$chooser.val()) {
        $chooser.prev("SPAN.input-group-addon").css("background", "");
      }

      // Clear country flag
      if($chooser.hasClass('jalios-country') && !$chooser.val()) {
        var $countryDisplay = $chooser.prev('.control-country');
        var match = $countryDisplay[0].className.match(/\w*-flag/g);
        if (match) {
          for(var i = 0; i < match.length; i++) {
            $countryDisplay.removeClass(match[i]);
          }
          $countryDisplay.addClass('-flag');
        }
      }
    }
    else if ($elm.attr('data-jalios-chooser')) {
      options.customId = attr;
      openElementDataChooser($chooser, $elm.attr('data-jalios-chooser'), options, $elm);
    }
    
    return false;
  }
  
  var openElementDataChooser = function($chooser, chooserName, customParams, $elm) {
    
    var callback = function(id, title, media, url) {
      var $parent = $chooser.parent();
      var $input = $parent.find('INPUT.form-control-display');
      if ($input.exists()){
        var previousIdValue =  $chooser.val();
        $chooser.val(id || '').trigger(jQuery.Event( "change", {"previousValue": previousIdValue, "currentVal": id}));
        var previousTitleValue =  $input.val();
        $input.val(title || '').trigger(jQuery.Event( "change", {"previousValue": previousTitleValue, "currentVal": title}));
      } else {
        var previousValue =  $chooser.val();
        $chooser.val(url || '').trigger(jQuery.Event( "change", {"previousValue": previousValue, "currentVal": url}));
      }

      // Handle publication chooser with input file 
      var $fileInput = $parent.find('.jalios-publication-filebrowser');
      if($fileInput.exists()) {
        // Hide file input
        $fileInput.addClass('hide');
        // Disable file input
        if($fileInput.is(':input')) { // classic file input
          $fileInput.prop('disabled', true);  
        } else { // plupload
          $fileInput.find('INPUT[type="file"]').prop('disabled', true);
        }
        // Display publication input
        $input.removeClass('hide');
        // Enable publication/chooser inputs
        $input.prop('disabled', false);
        $chooser.prop('disabled', false);
      }
      
      var $widget = $chooser.closest('.widget');
      if($widget.exists() && $widget.hasClass('keyword')) {
        // Add new empty input for keyword field
        JCMS.form.Widget.add($input[0]);
      }
    }
    
    var options = {
      currentValue : $chooser.val(),
      params : customParams,
      popup : {}
    };
    
    if ($elm.data("jalios-chooser-popup-width")) {
      options.popup.width = $elm.data("jalios-chooser-popup-width");
    }
    
    if ($elm.data("jalios-chooser-popup-height")) {
      options.popup.height = $elm.data("jalios-chooser-popup-height");
    }
    
    $.jalios.ui.Widget.Chooser.openDataChooser(chooserName, callback, options);
  }
  
  // See also:
  // https://github.com/smalot/bootstrap-datetimepicker
  var openDateChooser = function($trigger, $chooser) {

    if ($trigger.data('datetimepicker')) {
      return;
    }
    
    var showTime = $trigger.closest('.widget').hasClass('jalios-date-time');
    $trigger.datetimepicker({
      language: document.documentElement.getAttribute('xml:lang'),
      format: getDateFormat(!showTime),
      autoclose: true,
      todayBtn: true,
      minuteStep: 15,
      minView: (showTime ? 0 : 2)
    })
    .on('changeDate', function(ev) {
      $chooser.val($(this).data('datetimepicker').getFormattedDate());
      $chooser.trigger(jQuery.Event( "change"));
    })
    .on('show', function(ev) {
      $chooser.data("jalios-previous-value", $chooser.val());
    })
    .datetimepicker('show');
    
    // Reset to field value
    $trigger.data('datetimepicker').update(_stringToDate($chooser.val(), showTime));
  }

  // ------------------------------------------
  //  DATE
  // ------------------------------------------
  
  $.jalios.ui.Widget.Chooser =  {
      
      /**
       * Open a Data chooser of the specified type, or a custom chooser if the 
       * specified type does not match any known chooser.
       * @param chooserTypeOrCustomPath a chooser type from one of the following values : 'acl', 'category', 'country', 'dbrecord', 'document', 'group', 'image', 'media', 'member', 'publication', 'query', 'workspace'
       * or a custom path to be opened in the chooser 
       * @param options an options object that may specify the following property 
       *  'currentValue' : for any current value being select
       *  'params' : an optionnal array or object that will be serialized in the choose URL if specified
       * @param callback a callback function invoked when chooser is closed with a value
       */
      openDataChooser : function(chooserTypeOrCustomPath, callback, options) {
        var options = options || {};
        options.currentValue = options.currentValue || '';
        options.params = options.params || {}
        var callback = callback || function(args) { };
        
        var chsrId, chsrUrl, chsrName;
        if (chooserConfiguration[chooserTypeOrCustomPath]) {
          chsrId = chooserConfiguration[chooserTypeOrCustomPath]['ref'] || chooserTypeOrCustomPath;
          chsrUrl = chooserConfiguration[chooserTypeOrCustomPath].path;
          chsrName = chooserConfiguration[chooserTypeOrCustomPath].name;
        }
        else {
          chsrId = options.params.customId || 'custom';
          chsrUrl = chooserTypeOrCustomPath;
          chsrName = 'Custom';
        }
        
        // Replace {value} in chooser path with the current chooser value if any
        chsrUrl = chsrUrl.replace(/{value}/, encodeURIComponent(options.currentValue));

        // An event (hack) can be trigger here to allow third party components to improve behavior
        chsrUrl = chsrUrl + $.param(options.params, true);
        
        // Add context path to complete the URL
        chsrUrl = $.jalios.Http.getContextPath() + '/' + chsrUrl;

        //Fallback on default popup width & height
        options = $.extend({
          popup: {
            width : 930,
            height: 570
          }
        }, options);

        // Compute chooser dimension
        var chsrWidth = options.popup.width;
        var chsrHeight = options.popup.height;
        
        // Open Chooser
        $.jalios.Browser.popupWindow(chsrUrl, chsrName, chsrWidth, chsrHeight, 
                                     false, true, true, false, false, callback);
      }
  }
  
  // ------------------------------------------
  //  DATE
  // ------------------------------------------
  
  var _stringToDate = function(str, showTime, lang) {
    if (!str){ // Set to to day 9AM
      var date = new Date();
      date.setMinutes(0);
      date.setHours(9);
      return date;
    }
    return stringToDate(str, showTime, lang);
  }
  
  /**
   * Parse the string value of date input to a Date object.
   * @param str the date to parse 
   * @param showTime true if the str contains date & time, false if str contains only the date 
   * @return a Date object or null if date could not be parsed
   */
  var stringToDate = function(str, showTime, lang) {
    if (!str){ 
      return;
    }
    
    var dformat = $.fn.datetimepicker.DPGlobal.parseFormat(getDateFormat(!showTime), 'standard');
    var date = $.fn.datetimepicker.DPGlobal.parseDate(str, dformat, lang || I18N['lang.datepicker'], 'standard');

    // Fix bootstrap-datetime not using the Timezone (known bug) compute timezone for the given date 
    return new Date(date.getTime() + date.getTimezoneOffset() * 60 * 1000);
  }
  
  /**
   * Retrieve a string representation of the specified Date object.
   * @param str the date to parse 
   * @param showTime true if the resulting str must contains date & time, false if str must constains only the date 
   * @return a string representation of the date or null if date could not be parsed
   */
  var dateToString = function(date, showTime, lang) {
    if (!date) { return; } 
    var dformat = $.fn.datetimepicker.DPGlobal.parseFormat(getDateFormat(!showTime), 'standard');
    
    date = new Date(date.getTime() - date.getTimezoneOffset() * 60 * 1000);
    return $.fn.datetimepicker.DPGlobal.formatDate(date, dformat, lang || I18N['lang.datepicker'], 'standard');
  }
  
  /**
   * Retrieve the date string format used in date input.
   * @param dateOnly true if the date format should contains only the date, false if the str must also contains the time
   * @return a date format   
   */
  var getDateFormat = function(dateOnly){
    return I18N.glp(dateOnly ? 'datechooser.js.date-format' : 'datechooser.js.date-time-format');
  }
  
  
  /**
   * Update the Date field convert the long to date
   * @param $trigger the trigger of the update
   */  
  var updateDate = function($e){
    var time = $e.closest('.widget').hasClass('jalios-date-time');
    var val  = $e.val(); if (!val) return;
      
    var lg = parseInt(val);
    var date = new Date(lg);
    $e.val(dateToString(date, time));
  }
  
  /**
   * Update the Duration field of Duration Chooser
   * @param $trigger the trigger of the update
   */  
  var updateDuration = function($trigger, resolution){
    var $wrapper  = $.jalios.ui.Widget.getWrapper($trigger);
    var $duration = $wrapper.find('INPUT.duration');
    var $time     = $wrapper.find('INPUT.duration_user');
    var $unit     = $wrapper.find('SELECT.duration_unit');
    
    if (!$time.exists()){ return; }
    
    $time.val($time.val().replace(/[^0-9\.]/, ""));
    var value = $time.val() ? parseInt(Math.round($time.val())) * parseInt($unit.val()) : "";
    $duration.val(value);
  }
  
  $.jalios.ui.Widget.Date = {
    'stringToDate'  : stringToDate,
    'dateToString'  : dateToString,
    'getDateFormat' : getDateFormat,
    'updateDuration': updateDuration,
    'updateDate'    : updateDate,
    'openDateChooser': openDateChooser
  }

  // ------------------------------------------
  //  REGISTER
  // ------------------------------------------

  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });

}(window.jQuery);