//
// importManager.js - since jcms-5.7.2
// This file is used by importManager.jsp
//
var ImportManager = {
  toggle: function(id) {
    
    var id = $(id);
    
    // Toggle this one 
    id.toggle();

    // Hide all the others
    var hide = function(node) { if (id != node) { node.hide(); }};
    $$('div.importForm').each(hide);
    
  }
} 

