
'JCMS.portal.PortalManager.Toolbar'._namespace({

  /**
   * Toggle preview on toolbar and send AJAX Request
   * @param link the clicked link
   */
  preview: function(link){
    link = $(link);
    var div = link.fastUp('DIV','Portlet');
    
    if (link.hasClassName('portletPreview')){
      link.removeClassName('portletPreview');
      div.removeClassName('portletPreview');
    } else { 
      link.addClassName('portletPreview');
      div.addClassName('portletPreview');
    }
    
    Ajax.performAjaxRequest(link.href);
    
    return false;
  },
  
  /**
   * Convenient callback method called by pubChooser
   * delegating work to  Call the DnDManager
   * @see JCMS.portal.PortalManager.openPubChooser()
   */
  add: function(jcmsId, label, displayURL){

    if (!jcmsId){ return; }
    
    var containerId = "#"+JCMS.portal.PortalManager.Toolbar._pubChooserCallback;
    if (!containerId){ return; }
    
    jQuery.jalios.Sortable.Portal.add(containerId, jcmsId);
  },
  
  /**
   * Remove an element calling DnD mechanism + Confirm
   * @param link the clicked link
   */
  remove: function(menu){
    var link       = $(CtxMenuManager.latestElement);
    var jcmsId     = link.findJcmsId();
    var container  = link.fastUp(null,'dnd-container');
    
    var msg       = jQuery(menu).text();
    jQuery.jalios.ui.Modal.confirm(msg, function(val){
      if (!val) return;
      jQuery.jalios.Sortable.Portal.remove(container, jcmsId);
    })
    
    return false;
  },
  
  /**
   * Convenient method that:
   * - Store the jcmsId in the Object 
   * - Open a PubChooser
   * INTERNAL function (do not start with '_')
   * @param url the url to the pubChooser
   * @see JCMS.portal.PortalManager.add()
   */
  openPubChooser: function(url){

    var link       = $(CtxMenuManager.latestElement);
    var wrapper    = link.fastUp(null,'Portlet');
    var container  = wrapper.down('.dnd-container');
    
    if (!container){
      JcmsLogger.warn('PortalManager.Toolbar','openPubChooser(): cannot find container',link,wrapper);
      return;
    }
    
    JCMS.portal.PortalManager.Toolbar._pubChooserCallback = container.id;
    return Popup.popupWindow(url,'pubChooser',900,500,false,true,true,false);
  },
  
  
  update: function(jcmsId, params){
    var url = 'jcore/portal/ajaxHandlePortletAction.jsp?id='+jcmsId+'&'+params;
    Ajax.performAjaxRequest(url,null, function(){ // Should be ajax-refresh
      jQuery.jalios.AjaxRefresh.refreshPortlet(jcmsId);
    });
    return false;
  }
});
