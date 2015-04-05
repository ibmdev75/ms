!function ($) {

  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------
  
  var geocoder;
  
  function initialize() {
    var autoConvert = !!$.jalios.Properties.get('member.edit.auto-convert-address');
    if (autoConvert && typeof(google) != 'undefined' && typeof(google.maps) != 'undefined') {
      geocoder = new google.maps.Geocoder();
      
      $.jalios.ux.MemberEdit.autoDecodeAddress();
    }
  }
  
  function geocodeCallback(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      
      var streetNbr, route, locality, postalCode, poBox, region, country, countryCode;
      
      for (i = 0; i < results[0].address_components.length; ++i) {
          var component = results[0].address_components[i];
          
          if (!streetNbr && component.types.indexOf("street_number") > -1) {
            streetNbr = component.long_name;
          }
          if (!route && component.types.indexOf("route") > -1) {
            route = component.long_name;
          }
          else if (!locality && component.types.indexOf("locality") > -1) {
            locality = component.long_name;
          }
          else if (!postalCode && component.types.indexOf("postal_code") > -1) {
            postalCode = component.long_name;
          }
          else if (!poBox && component.types.indexOf("post_box") > -1) {
            poBox = component.long_name;
          }
          else if (!region && component.types.indexOf("administrative_area_level_1") > -1) {
            region = component.long_name;
          }
          else if (!country && component.types.indexOf("country") > -1) {
            country = component.long_name;
            countryCode = component.short_name;
          }
      }
      
      if (streetNbr && route) { 
        $('form[name=editForm] input[name=street]').val(streetNbr + " " + route);
      } else if (route) {
        $('form[name=editForm] input[name=street]').val(route);
      }
      
      if (locality) { 
        $('form[name=editForm] input[name=locality]').val(locality);
      }
      if (postalCode) { 
        $('form[name=editForm] input[name=postalCode]').val(postalCode);
      }
      if (poBox) { 
        $('form[name=editForm] input[name=poBox]').val(poBox);
      }
      if (region) { 
        $('form[name=editForm] input[name=region]').val(region);
      }
      if (country) { 
        $('#Id_country')
          .removeClass($('form[name=editForm] input[name=country]').val()+'-flag')
          .val(country)
          .addClass(countryCode + '-flag');
        $('form[name=editForm] input[name=country]').val(countryCode);
      }
      
      
    }
  }

  // ------------------------------------------
  //  PUBLIC
  // ------------------------------------------

  // Namespace
  if (!$.jalios)      { $.jalios    = {}; }
  if (!$.jalios.ux)   { $.jalios.ux = {}; }
  
  $.jalios.ux.MemberEdit = {
      
    autoDecodeAddress : function() {
      var addressVal = $('form[name=editForm] textarea[name=address]').val();
      if (addressVal !== "" &&
          $('form[name=editForm] input[name=street]').val() === "" &&
          $('form[name=editForm] input[name=locality]').val() === "" &&
          $('form[name=editForm] input[name=postalCode]').val() === "" &&
          $('form[name=editForm] input[name=poBox]').val() === "" &&
          $('form[name=editForm] input[name=region]').val() === "") {
        geocoder.geocode( { 'address': addressVal }, geocodeCallback);
      }
    }
    
  }

  // ------------------------------------------
  //  READY
  // ------------------------------------------
    
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    initialize();
  });
  
}(window.jQuery);
