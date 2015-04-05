$(function() {

  module("jalios-single-submit:form");
  
    test("should disable/enable form", function() {  
      
      var $form  = $('#testForm');
      var $btn   = $('#testSubmit');
      var $ahref = $('#testlink');
      
      // Testing state
      ok(!$.jalios.form.SingleSubmit.processing,'form is ready');
      ok(!$btn.hasClass('disabled'),'submit button is not disabled');
      ok(!$ahref.hasClass('disabled'),'link button is not disabled');
      
      // Disable the form
      $.jalios.form.SingleSubmit.disable();
      
      ok($.jalios.form.SingleSubmit.processing,'form is not ready');
      ok($btn.hasClass('disabled'),'submit button is disabled');
      ok($ahref.hasClass('disabled'),'link button is disabled');
      
      // Enable the form
      $.jalios.form.SingleSubmit.enable();
      ok(!$.jalios.form.SingleSubmit.processing,'form is ready');
      ok(!$btn.hasClass('disabled'),'submit button is not disabled');
      ok(!$ahref.hasClass('disabled'),'link button is not disabled');
      
    });

    test("should not submit twice form", function() {
    
      var $form  = $('#testForm');
      var $btn   = $('#testSubmit');
      var cpt    = 0; 
      
      // Register submit event before
      $form.on('submit', function(event){ event.preventDefault(); });
      
      // Register submit event after
      $(document).on('submit','#testForm', function(event){ cpt++; });
      
      // Perform clicks
      $btn.trigger({ type: 'click', which: 1 });
      $btn.trigger({ type: 'click', which: 1 });
      $btn.trigger({ type: 'click', which: 1 });
      
      ok(cpt == 1,'testForm only submited once');
      ok($btn.hasClass('disabled'),'submit button is disabled');
      
    });

    test("should be submited N times with class noSingleSubmitButton", function() {

      var $form  = $('#testForm2');
      var $btn   = $('#testSubmit2');
      var cpt    = 0; 

      // Register submit event before
      $form.on('submit', function(event){ event.preventDefault(); });

      // Register submit event after
      $(document).on('submit','#testForm2', function(event){ cpt++; });

      // Perform clicks
      $btn.trigger({ type: 'click', which: 1 });
      $btn.trigger({ type: 'click', which: 1 });
      $btn.trigger({ type: 'click', which: 1 });

      ok(cpt == 3,'testForm submited '+cpt+' times');
      ok(!$btn.hasClass('disabled'),'submit button is not disabled');

    });
  
  module("jalios-single-submit:ajax-refresh");
  
    
    
});