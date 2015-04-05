
!function ($) {

  /**
   * Retrieve the key identifying current admin notes
   */
  var getAdminNoteKey = function() {
    return $('#admin-notes').attr('data-jalios-admin-notes-key');
  } 
  
  /**
   * Display the save message
   */  
  var displaySaveStatus = function() {
    $('#admin-notes-unsaved-message').show();
  }
  
  /**
   * Save the current admin notes
   */  
  var save = function() {    
    // JSON-RPC call to update notes
    var result = true;
    try {
      JcmsJsContext.getJsonRPC().AdminNotes.saveNote(getAdminNoteKey(), document.adminNotesForm.note.value);
      updateIcon();
    }
    catch(ex) {
      alert(I18N.glp("ui.adm.admin-notes.error"));
      return;
    }
    $('#admin-notes-unsaved-message').hide();
  }
  
  /**
   * Close and save the current admin notes
   */
  var close = function() {
    save(getAdminNoteKey());
    toggle();
  }
  
  /**
   * Minimize or maximize the admin notes content of the current page depending on its existing visibility
   */
  var minimize = function() {
    $('#admin-notes-content').toggle();
  }
  
  /**
   * Hide or show the admin notes of the current page depending on its existing visibility
   */
  var toggle = function() {
    $('#admin-notes').toggle();
  }
  
  /**
   * Update the admin notes icon in the header to reflect the content of the note.
   */
  var updateIcon = function() {
    var $adminNotesIcon = $("#admin-notes-icon");
    var hasContent = !(document.adminNotesForm.note.value == "");
    $adminNotesIcon.attr('src', "images/jalios/icons/" + ( hasContent ? "postit-marked.gif" : "postit.gif" ));
  }
  
  var register = function(){

    var $doc = $(document);
    $doc.on('click', 'A.admin-notes-toggle', toggle);
    $doc.on('click', 'A.admin-notes-close', close);
    $doc.on('click', 'A.admin-notes-minimize', minimize);
    $doc.on('click', 'A.admin-notes-save', save);
    $('#admin-notes-textarea').on('keyup', displaySaveStatus);
    $('#admin-notes').draggable({ handle: '#admin-notes-title' });
  }
    
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);