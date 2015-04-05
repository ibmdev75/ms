$(function() {

  module("jalios-tab");
  
  test("should convert old tabpane", function() {  
  
    
    ok($('#rootPane').prev('UL').hasClass('nav-tabs'),'build UL tab');
    ok($('#rootPane').prev('UL').find('LI.tab').exists(),'convert H2 to LI in nav-tab');
    
    
    ok($('#rootPane').hasClass('tab-content'),'convert tab-pane to tab-content');
    ok($('#rootPane').children('.tab-pane').length == 4,'convert tab-page to tab-pane');
    
    
    ok($('#rootPane').prev('UL').find('LI:nth-child(1)').hasClass('active'),'Activate 1st tab');
    ok($('#rootPane .tab-pane:nth-child(1)').hasClass('active')            ,'Activate 1st pane');
    
  });
  
  test("should convert old sub tabpane", function() {
  
    ok($('#subTab').prev('UL').hasClass('nav-tabs'),'build UL tab');
    ok($('#subTab').prev('UL').find('LI.tab').exists(),'convert H2 to LI in nav-tab');
    
    ok($('#subTab').hasClass('tab-content'),'convert tab-pane to tab-content');
    ok($('#subTab').children('.tab-pane').length == 3,'convert tab-page to tab-pane');
    
  });
  
  test("should select 3rd pane", function() { 
    
    setSelectedTab('rootPane', 2); // index start at 0
    
    ok($('#rootPane').prev('UL').find('LI:nth-child(3)').hasClass('active'),'Activate 3rd tab');
    ok($('#rootPane .tab-pane:nth-child(3)').hasClass('active')            ,'Activate 3rd pane');
    
  });
});