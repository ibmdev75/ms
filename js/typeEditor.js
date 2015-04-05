// This matrix defines which options are to be displayed when changing the editor
// -1 => do not display
//  0 => display, default value is off/disabled
//  1 => display, default value is on/disabled

edits1 = new Array();
editsOptions1       = new Array( "prop1", "prop2", "qty", "requir", "comp", "mlang", "search", "enumch", "treecat", "catch", "ds", "sqlr", "dbr"   );  
edits1["textfield"] = new Array( 1,        -1,      0,        0,     -1,       1,        1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["textarea"]  = new Array( 1,        -1,      0,        0,     -1,       1,        1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["wysiwyg"]   = new Array( 1,        -1,      0,        0,     -1,       1,        1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["document"]  = new Array( 1,        -1,      0,        0,     -1,       0,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["file"]      = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["image"]     = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["media"]     = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["url"]       = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["email"]     = new Array( 1,        -1,      0,        0,     -1,       0,        0,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["password"]  = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["enumerate"] = new Array( 1,         0,      0,       -1,     -1,      -1,       -1,        0,        -1,       -1,  -1,     -1,    -1   );
edits1["color"]     = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["query"]     = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["date"]      = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["boolean"]   = new Array( 1,        -1,      0,       -1,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["int"]       = new Array( 1,        -1,      0,       -1,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["double"]    = new Array( 1,        -1,      0,       -1,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["duration"]  = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["sqlquery"]  = new Array( 1,         1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,   0,     -1,    -1   );
edits1["sqlresult"] = new Array( -1,         0,     -1,       -1,     -1,      -1,       -1,       -1,        -1,       -1,   0,      0,    -1   );
edits1["dbrecord"]  = new Array( 1,         0,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,   0,     -1,     0   );
edits1["category"]  = new Array( 1,         0,      1,        0,     -1,      -1,       -1,       -1,         0,        0,  -1,     -1,    -1   );
edits1["member"]    = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["group"]     = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["link"]      = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );
edits1["default"]   = new Array( 1,        -1,      0,        0,     -1,      -1,       -1,       -1,        -1,       -1,  -1,     -1,    -1   );

edits2 = new Array();
editsOptions2       = new Array( "size", "rows", "cols", "wiki", "wikiwyg", "html", "checkHtml", "toolbars", "inline", "maxlength", "openwindow", "pattern", "imagemap",  "resize");  
edits2["textfield"] = new Array(      1,     -1,     -1,     -1,        -1,      0,           1,         -1,        -1,          1,           -1,         1,         -1,        -1);
edits2["textarea"]  = new Array(     -1,      1,      1,      1,         1,      0,           1,         -1,        -1,         -1,           -1,        -1,         -1,        -1);
edits2["wysiwyg"]   = new Array(     -1,      1,      1,     -1,        -1,     -1,           1,          1,         1,         -1,           -1,        -1,         -1,        -1);
edits2["file"]      = new Array(      1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,          1,           -1,        -1,         -1,        -1);
edits2["image"]     = new Array(      1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,          1,           -1,        -1,          0,         0);
edits2["media"]     = new Array(      1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,          1,           -1,        -1,         -1,        -1);
edits2["url"]       = new Array(      1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,          1,            1,         1,         -1,        -1);
edits2["email"]     = new Array(      1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,          1,           -1,         1,         -1,        -1);
edits2["password"]  = new Array(      1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,          1,           -1,        -1,         -1,        -1);
edits2["query"]     = new Array(     -1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,         -1,           -1,        -1,         -1,        -1);
edits2["color"]     = new Array(     -1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,         -1,           -1,        -1,         -1,        -1);
edits2["dbrecord"]  = new Array(     -1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,         -1,           -1,        -1,         -1,        -1);
edits2["sqlquery"]  = new Array(     -1,     -1,     -1,     -1,        -1,     -1,          -1,         -1,        -1,         -1,           -1,        -1,         -1,        -1);

function dispEditOptions1(selectedEdit) {
  dispEditOptions(selectedEdit, edits1, editsOptions1, true);
}

function dispEditOptions2(selectedEdit) {
  dispEditOptions(selectedEdit, edits2, editsOptions2, false);
}


function dispEditOptions(selectedEdit, edits, editsOptions, checkradio) {
 if (selectedEdit.indexOf("link_") == 0) {
   selectedEdit = "link";
 }
 edit = edits[selectedEdit] ;
 if (!edit) { 
  return;
 }
 for (i=0;i<editsOptions.length;i++) {
  option = document.getElementById(editsOptions[i]) ;
  if (option) {
   if (edit[i]<0) {
     option.style.display = "none";
   } else { 
     try {
       option.style.display = "block";
     } catch (ex) {
       option.style.display = "block";
     }
     if (checkradio) {
       radio = document.getElementById(editsOptions[i] + edit[i]) ;
       if (radio) radio.checked = true;
     }
   }
  }
 }
}

function clearTemplate(index) {
  window.document.editFormTemplates.elements[index - 1].value = "";
  window.document.editFormTemplates.elements[index - 2].value = "";
  window.document.editFormTemplates.elements[index - 3].value = "";
}

function toggleEltVisibility(elt, cond) {
  if (cond) {
    $(elt).show();
  } else {
    $(elt).hide();
  }
}


/**
 * Register an Event 'load' on document
 * Register an Event 'blur' on INPUT template file
 * Update Thumbnail by replacing .jsp to .jpg
 */
Event.observe(window, 'load'  , function() { 
  $$('DIV.tmplJsp INPUT.formTextfield').each(function(elm,idx){ 
    Event.observe(elm, 'blur'  , updateTemplateThumbnail.bindAsEventListener(elm));
  });
});

function updateTemplateThumbnail(evt){
  var elm      = $(this);
  var jsp      = elm.value;
  
  if (!jsp || jsp.length < 4){
    return;
  }
  
  var table    = elm.up('TABLE');
  var thumbTag = table.down('IMG.tmplThumbnail');
  var thumbFld = table.down('IMG.tmplFolder');
  
  
  // Update HTML page
  thumbTag.style.backgroundImage = 'url('+thumbFld.title + jsp.substring(0,jsp.length-3) + "jpg)";
}


function clearTemplate(elm){
  JCMS.window.Modal.confirm(elm.title , function(confirm){
    if (!confirm) return;
    elm.up('TABLE').select('INPUT[type="text"]','TEXTAREA').invoke('clear');
    simpleSubmitForm(window,elm.form,elm.name);
  });
}
