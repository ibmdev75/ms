!function ($) {

  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------
  
  var runtimes    = 'html5,flash,silverlight,html4';
  var flashUrl    = $.jalios.Http.getContextPath()+'/js/lib/plupload-2.1.2/js/Moxie.swf';
  var silverUrl   = $.jalios.Http.getContextPath()+'/js/lib/plupload-2.1.2/js/Moxie.xap';
  var ajaxUrl     = $.jalios.Http.getContextPath()+'/jcore/plupload.jsp';
  var filters     = $.jalios.Properties.get("plupload-filters");
  for ( filterName in filters ) {
    var filter = filters[filterName];
    filter.title = $.jalios.I18N.glp("plupload-filters." + filterName) + " (" + filter.extensions + ")";
  }
  
  var isReady = false;
  var ready = function() {
  
    // Must wait for all plupload stuff to init things
    if (isReady){ return; }
    isReady = true;
    
    // Register to other ajax-refresh
    $(document).on('jalios:refresh', function(event){
      var refresh = $.jalios.Event.match(event, 'refresh', 'after')
      if (!refresh){ return; }
      setup();
    });
    
    // Then setup plupload
    setup();
  }
  
  var setup = function(){
    
    $('DIV.plupload').each(function() {
      var $this = $(this);
      var clazz = $this.attr('class');
      
      // Already initialized
      if ($this.data('plupload')){ return; }
      if ($this.parent().closest('DIV.plupload').exists()){ return; }

      // General settings
      var config = {
        url : ajaxUrl,
        runtimes : runtimes,
        max_file_size : '2000mb',
        
        /*chunk_size : '1mb',
        rename : true,
        dragdrop: true,*/
        
        multipart : true,
        // required_features: 'multipart',
        multipart_params: {},
        
        headers: {'X-Jcms-Plupload': 'true'},
        
        init: function(uploader){ // Hook to bind functions
          $this.data('plupload', uploader); // Store plupload for later
          uploader.bind('FileUploaded', $.proxy(bindFileUploaded, $this[0]));
          uploader.bind('FilesAdded', $.proxy(bindFilesAdded, $this[0]));
        },
        
        // Flash settings
        flash_swf_url : flashUrl,
        
        // Silverlight settings
        silverlight_xap_url : silverUrl
      }
      
      // Filter Media
      for ( filterName in filters ) {
        if ($this.hasClass('plupload-filter-' + filterName )) {
          config.filters = [ filters[filterName] ];
        }
      }
      
      // Single file
      if ($this.hasClass("plupload-single")) {
        config.multi_selection = false;
        config.max_file_count = 1;
      }
      
      // Resize Images
      var resize = clazz.match(/plupload-resize-(\d+)x(\d+)x(\d+)/)
      if (resize && resize.length > 1){ 
        config.resize = {width : resize[1], height : resize[2], quality : resize[3]};
      }
      
      // Set field name
      var field = clazz.match(/plupload-field-(\w+)/);
      if (field){ config.multipart_params.field = field[1] }
      
      // Token Ajax
      var ajaxId = document.body.id // Do not wrap request !
      var token  = clazz.match(/plupload-token-(\w+)/);
      config.multipart_params.token = token || ajaxId;
      $this.closest('FORM').append('<input name="plupload-token" type="hidden" value="'+(token || ajaxId)+'"/>');
      
      // Find Plupload Submit
      $this.closest('FORM').find('.plupload-submit').on('click', autostart);
      
      // Build Plupload
      $this.pluploadQueue(config);
    });
  }
  
  var bindFileUploaded = function(up, file, response) {
    $(this).append('<input name="'+up.settings.multipart_params.field+'" type="hidden" value="MultipartUpload"/>');
  }
  
  var bindFilesAdded = function(up, files){
    var max = up.settings.max_file_count;
    if (up.files.length <= max){ return; }
    while(up.files.length > max){
      if(up.files.length > max)
        up.removeFile(up.files[max]);
    }
  }
  
  var autostart = function(event){
    var trigger    = event.currentTarget;
    var $container = $(trigger).closest('FORM').find('DIV.plupload');
    var plupload   = $container.data('plupload');
    
    if (!plupload){ return; } 
    
    // Bind complete
    if (!$container.data('p-init')){
      $container.data('p-init',true);
      plupload.bind('UploadComplete', function(up, files){
        if (up.total.queued == 0){
          $.jalios.DOM.follow(trigger);
        }
      });
    }
    
    // Start upload
    if (plupload.total.queued != 0){
      plupload.start();
      event.preventDefault();
      event.stopPropagation();
      return false;
    }
  }
  
  // ------------------------------------------
  //  READY
  // ------------------------------------------
  
  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', ready);
  
}(window.jQuery);