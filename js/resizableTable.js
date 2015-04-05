/**
 * Provides all the logic (ajax and other javascript) of the resizable Panel.
 */

'JCMS.resizable.panel'._namespace();

// Create class 
JCMS.resizable.panel.ResizableTable = Class.create({
  
  /**
   * Constructor, builds a new ResizableTable instance for the specified table.
   * @param panelId the table or table id
   */
  initialize : function(table) {
  	table = $(table);
  	
    // Do not provide resize bar for IE 6 as it can crash the browser.
    if (JcmsJsContext.isIE6) {
      return;
    }

    JcmsLogger.info('ResizableTable', 'Init ResizableTable', table.id);
    JcmsLogger.ResizableTable = false; // debug log
    
    // Store ID and not DOM element to prevent browser memory leak
    this.id = table.id;
    this.sidebarId = this.id + 'Sidebar';
    this.sidebarWrapperId = this.id + 'SidebarWrapper';
    this.sidebarResizerId = this.id + 'SidebarResizer';
    this.contentId = this.id + 'Content';

    // Store callback in member variables to be able to clean them on each ajax:refresh and dispose
    this.eventMouseDown = this.sidebarResizerStartDrag.bindAsEventListener(this);
    this.eventMouseUp   = this.sidebarResizerEndDrag.bindAsEventListener(this);
    this.eventMouseMove = this.sidebarResizerUpdate.bindAsEventListener(this);
    
    // Sidebar Resize
    Event.observe(document, "mouseup", this.eventMouseUp);
    Event.observe(document, "mousemove", this.eventMouseMove);
    
    // register event listener on ResizableTable html elements
    this._registerEventListeners();
    
    Event.observe(document, 'refresh:before',  this._cleanEventListeners.bind(this));
    Event.observe(document, 'refresh:after',  this._registerEventListeners.bind(this));
  },
  
  dispose: function() {
    Event.stopObserving(document, 'mouseup', this.eventMouseUp);
    Event.stopObserving(document, 'mousemove', this.eventMouseMove);
    this._cleanEventListeners();
  },
  
  // --------------------------------------------------------------------------------
  
  /**
   * Register all event listener on ResizableTable html elements.
   * !!!This method can only be called once again after a refresh all, otherwise
   * events listener will be registered multiple times!!!
   */  
  _registerEventListeners: function() {
    var sidebarResizer = $(this.sidebarResizerId);
    if (sidebarResizer) {
      Event.observe(sidebarResizer, 'mousedown', this.eventMouseDown);
    }
  },
  
  _cleanEventListeners:function() {
    var sidebarResizer = $(this.sidebarResizerId);
    if (sidebarResizer) {
      Event.stopObserving(sidebarResizer, 'mousedown', this.eventMouseDown);
    }
  },

  // --------------------------------------------------------------------------------
  // Resize code
  
  sidebarResizerStartDrag: function(event) {
    if (Event.isLeftClick(event)) {
      Event.stop(event);
      // Set sidebar start width to compute delta on drag
      var offsets = Position.cumulativeOffset($(this.sidebarResizerId)); 
      this.start_pointer  = [Event.pointerX(event), Event.pointerY(event)];
      this.start_sidebar_width = $(this.sidebarId).getWidth();
      this.resize_active = true;
    }
  },

  sidebarResizerEndDrag: function(event) {
    if (this.resize_active) {
      this.resize_active = false;
      this.doResizeRightContainer();
      Event.stop(event);
    }
  },
  
  doResizeRightContainer: function(){
	var parentDiv = $(this.sidebarId).fastUp("DIV");
    if(parentDiv){
      var parentWidth = parentDiv.offsetWidth;
      var newWidth = (parentWidth - $(this.sidebarResizerId).offsetWidth -  $(this.sidebarWrapperId).offsetWidth )-20;
      //$(this.contentId).style.width = newWidth +"px";
      var insideDiv = $(this.contentId).down();
      if(insideDiv ){
    	insideDiv.style.width = newWidth +"px";
      }
    }
  },
  
  sidebarResizerUpdate: function(event) {
    if (!this.resize_active) {
      return;
    }
    
    // Compute Delta from start width
    var pointer  = [Event.pointerX(event), Event.pointerY(event)];
    var delta = pointer[0] - this.start_pointer[0];
    
    // Calculate new leftcol width
    var new_sidebar_width = this.start_sidebar_width + delta;
    if (new_sidebar_width < 100) {
      return;
    }
    
    // resize/position the td
    $(this.sidebarId).style.width = new_sidebar_width + "px";
    $(this.sidebarWrapperId).style.width = new_sidebar_width + "px";  
    Event.stop(event);
  }
});
