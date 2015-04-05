$(function() {

  module("jalios-i18n:glp()");
  
  test("should return i18n property for english", function() {
     same($.jalios.I18N.glp('error.unknown'), 'An unknown error occured, please contact an administrator.');
  });
  
  test("should handle parameters in properties", function() {
     I18N['hello.world'] = 'Hello {0} World {1}';
     same($.jalios.I18N.glp('hello.world','paramA','paramB'), 'Hello paramA World paramB');
  });
  
  test("I18N test should be run by accessing html test suite through appserver for proper validation, not with mock file", function() {
    same(undefined, I18N.mock);
  });
    
});