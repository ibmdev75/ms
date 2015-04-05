$(function() {

  module("jalios-data-toggle:toggle");

    test("should toggle class", function() {  
     
      var $elm = $('#link1');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('toggle', false, false);      
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok($elm.hasClass('clazz'), 'should add class clazz on #link1');
      
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok(!$elm.hasClass('clazz'), 'should remove class clazz on #link1');
    });
    
  module("jalios-data-toggle:add");
  
    test("should add class", function() {  
     
      var $elm = $('#link2');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('add', false, false);
      
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok($elm.hasClass('clazz'), 'should add class clazz on #link2');
      
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok($elm.hasClass('clazz'), 'should add class clazz on #link2');
    });
  
  
  module("jalios-data-toggle:remove");
  
    test("should remove class", function() {  
     
      var $elm = $('#link3');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('remove', false, false);
      
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok(!$elm.hasClass('clazz'), 'should remove class clazz on #link3');
      
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok(!$elm.hasClass('clazz'), 'should remove class clazz on #link3');
      
      $elm.addClass('clazz');
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok(!$elm.hasClass('clazz'), 'should remove class clazz on #link3');
      
    });
  
  module("jalios-data-toggle:sync");
    
    test("should sync class", function() {  
     
      var $elm = $('#link4A');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('sync', '#link4B', false);
      
      $elm.addClass('clazz');
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok($elm.hasClass('clazz'), '#link4A should have class clazz');
      ok($('#link4B').hasClass('clazz'), '#link4B should be sync and have class clazz');
      
      $elm.addClass('clazz');
      $.jalios.ToggleManager.toggle(elm, 'clazz', options);
      ok($elm.hasClass('clazz'), '#link4A should not have class clazz');
      ok($('#link4B').hasClass('clazz'), '#link4B should be sync and not have class clazz');
    });
    
   test("should sync value", function() {
     
      var $elm = $('#input4A');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('sync', '#input4B', false);
      var str = 'my value';
      
      $elm.attr('value',str);
      $.jalios.ToggleManager.toggle(elm, 'value', options);
      equals($elm.attr('value'), str, '#link4A should have value '+str);
      equals($('#input4B').attr('value'), str, '#input4B should be sync and have value '+str);
      
    });
    
    
    test("should sync title attribute", function() {
     
      var $elm = $('#input5A');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('sync', '#input5B', false);
      var str = 'my title';
      
      $elm.attr('title',str);
      $.jalios.ToggleManager.toggle(elm, 'title', options);
      equals($elm.attr('title'), str, '#link5A should have title '+str);
      equals($('#input5B').attr('title'), str, '#input5B should be sync and have title '+str);
      
    });
    
    test("should sync disabled attribute", function() {
     
      var $elm = $('#input6A');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('sync', '#input6B', false);
      var str = 'disabled';
      
      $elm.attr('disabled',str);
      $.jalios.ToggleManager.toggle(elm, 'disabled', options);
      equals($elm.attr('disabled'), str, '#input6A should have disabled '+str);
      equals($('#input6B').attr('disabled'), str, '#input6B should be sync and have disabled '+str);
      
    });
    
    test("should sync checked attribute", function() {
     
      var $elm = $('#input7A');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('sync', '#input7B', false);
      
      $elm.attr('checked',true);
      $.jalios.ToggleManager.toggle(elm, 'checked', options);
      ok($elm.attr('checked'), '#input7A should be checked');
      ok($('#input7B').attr('checked'), '#input7B should be sync and be checked');
      
    });
    
    test("should sync value attribute with html of all DIV.input8Div", function() {
     
      var $elm = $('#input8');
      var elm  = $elm[0];
      var options = $.jalios.ToggleManager.getOption('sync', 'DIV.input8Div');
      options.attr = 'html';
      
      var str = 'input 8 value';
      
      $elm.attr('value',str);
      
      $.jalios.ToggleManager.toggle(elm, 'value', options);
      equals($elm.attr('value'), str, '#input8 should have value ' + str);
      equals($('DIV.input8Div').html(), str, 'DIV.input8Div should be sync and have html ' + str);
      
    });
    
});