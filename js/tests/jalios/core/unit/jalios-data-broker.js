
/**
 * Convenient wrapper
 * - Stop the flow of test
 * - Build a wrap() function to handle broker event
 * - Build a fail() function to handle fail of function
 * 
 * @param func the function testing the event
 * @return fail() function to call after a given timeout
 */
var mock = function(func){

  // Stop Testing Flow
  stop(5000);
  
  // Set a wrapper
  var wrap = function(event){
    ok(func(event));
    $(document).off("jalios:broker", wrap);
    start();
  }
  
  var fail = function(event){
    ok(!func(event));
    $(document).off("jalios:broker", wrap);
    start();
  }
  
  $(document).on("jalios:broker", wrap);
  return fail;
};

$(function() {

  module("jalios-data-broker:link");

    test("should trigger action on left click on link", function() {     
      mock(function(event){ return event.broker; });
      $('#link1').trigger({ type: 'click', which: 1 });
    });
    
    test("should not trigger action on right click on link", function() { 
      var success = mock(function(event){ return false; });
      $('#link1').trigger({ type: 'click', which: 3 });
      setTimeout(function(){ success(); }, 1000);
    });
    
    test("should trigger action on click on img's link", function() {     
      mock(function(event){ return $(event.broker.source.currentTarget).prop('tagName') == 'A'; });
      $('#img1').trigger({ type: 'click', which: 1 });
    });

  module("jalios-data-broker:button");
  
    test("should trigger action on left click on button", function() {     
      mock(function(event){ return event.broker; });
      $('#btn1').trigger({ type: 'click', which: 1 });
    });
    
    test("should trigger action on left click on input button", function() {     
      mock(function(event){ return event.broker; });
      $('#btn2').trigger({ type: 'click', which: 1 });
    });
  
    test("should trigger action on left click on input submit", function() {     
      mock(function(event){ return event.broker; });
      $('#btn3').trigger({ type: 'click', which: 1 });
    });
    
    test("should NOT trigger action on change on Buttons", function() {     
      var success = mock(function(event){ return false; });
      $('#btn1').trigger({ type: 'change' });
      setTimeout(function(){ success(); }, 1000);
    });
    
    test("should NOT trigger action on focusin on Buttons", function() {     
     var success = mock(function(event){ return false; });
      $('#btn1').trigger({ type: 'focusin' });
      setTimeout(function(){ success(); }, 1000);
    });
    
  module("jalios-data-broker:div");  
    
    test("should trigger action on left click on DIV", function() {     
      mock(function(event){ return event.broker; });
      $('#div1').trigger({ type: 'click', which: 1 });
    });
    
  module("jalios-data-broker:input");
    
    test("should trigger action on focusin on Input", function() {     
      mock(function(event){ return event.broker; });
      $('#input1').trigger({ type: 'focusin'});
    });
    
    test("should trigger action on focusout on Input", function() {     
      mock(function(event){ return event.broker; });
      $('#input1').trigger({ type: 'focusout'});
    });
    
    test("should trigger action on focusin on textarea", function() {     
      mock(function(event){ return event.broker; });
      $('#input2').trigger({ type: 'focusin'});
    });
    
    test("should trigger action on focusout on textarea", function() {     
      mock(function(event){ return event.broker; });
      $('#input2').trigger({ type: 'focusout'});
    });
    
    test("should trigger action on change on select", function() {     
      mock(function(event){ return event.broker; });
      $('#input3').trigger({ type: 'change'});
    });
    
    test("should trigger action on change on checkbox", function() {     
      mock(function(event){ return event.broker; });
      $('#check1').trigger({ type: 'change'});
    });
    
    test("should trigger action on change on radio", function() {     
      mock(function(event){ return event.broker; });
      $('#radio1').trigger({ type: 'change'});
    });
    
  module("jalios-data-broker:data");
    
    test("should trigger action 'unit-action'", function() {     
      mock(function(event){
      
        var broker = event.broker;
        if (!broker){ 
          return false;
        }
        
        var source = broker.source;
        if (!source){ 
          return false;
        }
        
        var $target = $(source.currentTarget);
        if (!$target){ 
          return false;
        }
        
        equal($target.prop('tagName'), 'A',   'Check the tagName');
        equal(broker.type,     'unit-action', 'Check the broker action');
        equal(broker.target,   'A#link2',     'Check the broker target expresion');
        equal(broker.position, 'html',        'Check the broker position');
        
        return true; 
      });
      
      $('#link2').trigger({ type: 'click', which: 1 });
    });
});