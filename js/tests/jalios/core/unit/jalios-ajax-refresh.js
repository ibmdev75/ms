
var register = function($target, url, trigger, method, before, after){

  var cb = function(event){
  
    var refresh = event.refresh;
    ok(refresh,'Event had refresh infos');
    if (!refresh){ return;}

    // Before
    if (refresh.type == 'before'){
      equals(refresh.url, url, 'url decode from magic trick data-jalios-ajax-refresh-url');
      equals(refresh.target[0], $target[0], 'target is ajax-refresh-div wrapper');
      
      equals(refresh.options.method, method,  'performs a '+method);
      ok(!refresh.options.periodical, 'is not periodical');
      equals(refresh.options.trigger, trigger, 'has a trigger based on input id');
      
      before(refresh);
      
    // After
    } else if (refresh.type == 'after'){
      
      if (after){ after(refresh); } 
      else     {  equals($('.ajax-content',$target).html(), 'Hello Fragment','has been updated by fragment content'); }
      
      $(document).off('jalios:refresh', cb);
      start();
    }
  };
  
  $(document).on('jalios:refresh', cb);
};

$(function() {

  module("jalios-ajax-refresh");
  
    test("should refresh from a given link", function() {  
      stop(5000);
      register($('#wrapper1'), 'assets/jalios-ajax-refresh-fragment.html', '#link1', undefined, function(refresh){  
        ok(refresh.options.params, 'has parameters');
        equals(refresh.options.params.param1, 'value1','has parameters param1=value1');
      });
      $('#link1').refresh();
    });
    
    test("should refresh from a given form", function() {  
      stop(5000);
      register($('#wrapper2'), 'assets/jalios-ajax-refresh-fragment.html', '#link2', 'POST', function(refresh){  
        ok(refresh.options.params, 'has parameters');
        equals(refresh.options.params.param1, 'value1','has parameters param1=value1');
        equals(refresh.options.params.opSubmit, 'true','has parameters opSubmit=true');
      });
      $('#link2').refresh();
    });
    
    test("should refresh from a given link", function() {  
      stop(5000);
      register($('#wrapper3'), 'assets/jalios-ajax-refresh-fragment.html', '#link3', 'POST', function(refresh){
        ok(refresh.options.nohistory, 'nohistory is true');
        ok(refresh.options.nofocus,   'nofocus is true');
        ok(refresh.options.noscroll,  'noscroll is true');
        ok(refresh.options.noerror,   'noerror is true');
        ok(refresh.options.isform,    'isform is true');
      });
      $('#link3').refresh();
    });
    
    test("should refresh from DIV", function() {  
      stop(5000);
      register($('#wrapper4'), 'assets/jalios-ajax-refresh-fragment.html', '#wrapper4', undefined, function(refresh){  });
      $('#wrapper4').refresh();
    });
    
    test("should refresh and append to DIV.ajax-append", function() {  
      stop(5000);
      register($('#wrapper5'), 'assets/jalios-ajax-refresh-fragment.html', '#wrapper5', undefined, function(refresh){}, function(refresh){
        var $target  = refresh.target;
        equals($('.ajax-content',$target).html(), 'Hello HTML','has not been updated by fragment content');
        equals($('.ajax-inner',$target).html(), 'Hello Fragment','has been append');
        ok(!$('.ajax-append').exists(), 'ajax-append has been removed/repmlaced');
      
      });
      $('#wrapper5').refresh();
    });
});