!function ($) {
  
  // Register
  var width, height;
  var setup = function(){
    //Wait for images to be loaded
    $("#cropImgWrap").imagesLoaded(function(){
      $(".cropper SELECT.ratio-controller").change(setZoom);
      $(".cropper SELECT.rotate-controller").change(setRotate);
      
      width  = $('#cropImgArea').width();
      height = $('#cropImgArea').height();
      
      if ($("#crop-preview").exists()) {
        var maxPreviewSize = $("#crop-preview").data("jalios-crop-max-size");
        
         if (width > height) {
          var tempWidth = (maxPreviewSize * width) / height;
          
          $("#crop-preview").css("width",tempWidth);
          $("#crop-preview").css("height",140);
        } else {
          var tempHeight = (maxPreviewSize * height) / width;
          
          $("#crop-preview").css("height",tempHeight);
          $("#crop-preview").css("width",140);
        }      
      }
      
      reset();      
    });
  }
  
  var myCrop = false; 
  var reset = function(forcedRatio){
    if (myCrop){ myCrop.destroy(); }

    var ratio = $('#cropImgArea').data("jalios-crop-ratio") ? $('#cropImgArea').data("jalios-crop-ratio") : ratio;
    
    if (forcedRatio) {
      ratio = forcedRatio;
    }
    
    var w = Math.ceil(width  * ratio);
    var h = Math.ceil(height * ratio);
    
    $('#cropDisable').hide();
    $('#cropImgArea').css('width',  w +'px').css('height', h +'px');
    
    myCrop = $.Jcrop('#cropImgArea', {
      onSelect:  setCoords, 
      onChange:  setCoords,
      aspectRatio: ratio
    });
    
    // Disable for rotate
    if (rotate != 0){
      myCrop.ui.holder.addClass('r'+rotate);
      myCrop.disable();
      $('#cropDisable').show();
    }
    
    // Reset coordinate
    var $w = $('#cropResults');
    $w.find('INPUT[name=x1]').val('');
    $w.find('INPUT[name=y1]').val('');
    $w.find('INPUT[name=x2]').val('');
    $w.find('INPUT[name=y2]').val('');
    $w.find('INPUT[name=width]').val('');
    $w.find('INPUT[name=height]').val('');
  }
  
  var setCoords = function(c){
    var $w = $('#cropResults');

    $w.find('INPUT[name=x1]').val(Math.ceil(c.x     * 1/ratio));
    $w.find('INPUT[name=y1]').val(Math.ceil(c.y     * 1/ratio));
    $w.find('INPUT[name=x2]').val(Math.ceil(c.x2    * 1/ratio));
    $w.find('INPUT[name=y2]').val(Math.ceil(c.y2    * 1/ratio));
    $w.find('INPUT[name=width]').val(Math.ceil(c.w  * 1/ratio));
    $w.find('INPUT[name=height]').val(Math.ceil(c.h * 1/ratio));
    
    var resultX = $w.data('jalios-crop-preview-width');
    var resultY = $w.data('jalios-crop-preview-height');
    
    resultX = resultX > 0 ? resultX : 100;
    resultY = resultY > 0 ? resultY : 100;
    
    var rx = resultX / c.w;
    var ry = resultY / c.h;
    
    var $initialImage = $("#cropImgArea");
    $('#crop-preview').css({
      width: Math.round(rx * $initialImage.width()) + 'px',
      height: Math.round(ry * $initialImage.height()) + 'px',
      marginLeft: '-' + Math.round(rx * c.x) + 'px',
      marginTop: '-' + Math.round(ry * c.y) + 'px'
    });
  }
  
  var ratio = 1;
  var setZoom = function(event){
    var $e = $(event.currentTarget);
    ratio = $e.val();
    reset(ratio);
  }
  
  var rotate = 0;
  var setRotate = function(event){
    var $e = $(event.currentTarget);
    rotate = $e.val();
    reset();
  }
  
  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', setup);
  
}(window.jQuery);