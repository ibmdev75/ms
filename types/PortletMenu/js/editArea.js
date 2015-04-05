
/**
 * Called by PortletMenu to display/hide all 
 * area with editArea class.
 */
function toggleEditArea(img){
  
  var editIcon;
  var toggleArea = function(elm, idx){   
    // Show items
    if (elm.className.indexOf("hidden") >= 0){
      editIcon = true;
      elm.removeClassName("hidden");
      img.src = 'types/PortletMenu/images/editSelect.gif';
    }
    // Hide items
    else{
      editIcon = false;
      elm.addClassName("hidden");
      img.src = 'types/PortletMenu/images/edit.gif';
    }
  };
  
  // TODO: Find a faster way
  $$('A.editArea').each(toggleArea);
  $$('IMG.editArea').each(toggleArea);
  
  // Send AJAX Request to update session
  setTimeout(function(){
    try{
      Ajax.setWaitState(true);
      new Ajax.Request('types/PortletMenu/updateSessionEditState.jsp', {
        method: 'get',
        onSuccess: function(transport){ Ajax.setWaitState(false); },
        parameters: { editState:editIcon }
      });
    }
    catch(ex){
      alert(I18N.glp('warn.json.sessiontimeout'));
      Ajax.setWaitState(false);
    }
  },10);
}