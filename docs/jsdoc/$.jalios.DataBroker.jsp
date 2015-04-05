<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>
<%@ include file='/jcore/doMessageBox.jsp' %>

<% request.setAttribute("docs-active", "jcms"); %>

<jalios:javascript>
  var url = window.location.pathname;
  var txt = url.substr(url.indexOf('docs'));
  jQuery("A.list-group-item[href$='" + txt + "']").addClass('active');
</jalios:javascript>

<div class="bs-docs-header" id="content">
  <div class="container">
    <h1>JCMS Javascript API</h1>
    <p>Here's a list of all our javascript API.</p>
  </div>
</div>

<div id="docs" class="container">
  <div class="row">
    <div class="col-md-3">
      <ul class="list-group sidemenu"><a href="docs/jsdoc/index.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Introduction</strong></a><a href="docs/jsdoc/$.fn.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>fn</strong></a><a href="docs/jsdoc/$.jalios.Ajax.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Ajax</strong></a><a href="docs/jsdoc/$.jalios.AjaxRefresh.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>AjaxRefresh</strong></a><a href="docs/jsdoc/$.jalios.Browser.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Browser</strong></a><a href="docs/jsdoc/$.jalios.Common.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Common</strong></a><a href="docs/jsdoc/$.jalios.DataBroker.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>DataBroker</strong></a><a href="docs/jsdoc/$.jalios.DOM.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>DOM</strong></a><a href="docs/jsdoc/$.jalios.Event.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Event</strong></a><a href="docs/jsdoc/$.jalios.form.SingleSubmit.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>SingleSubmit</strong></a><a href="docs/jsdoc/$.jalios.Http.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Http</strong></a><a href="docs/jsdoc/$.jalios.I18N.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>I18N</strong></a><a href="docs/jsdoc/$.jalios.Properties.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Properties</strong></a><a href="docs/jsdoc/$.jalios.Sortable.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Sortable</strong></a><a href="docs/jsdoc/$.jalios.ToggleManager.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>ToggleManager</strong></a><a href="docs/jsdoc/$.jalios.ui.Modal.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Modal</strong></a><a href="docs/jsdoc/$.jalios.ui.Popin.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Popin</strong></a><a href="docs/jsdoc/$.jalios.ui.Tab.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Tab</strong></a><a href="docs/jsdoc/Function.jsp" class="list-group-item"><strong><span class="glyphicon-chevron-right pull-right"></span>Function</strong></a></ul>
    </div>
    
    <div class="col-md-9">
      
      <section>
        <div class="page-header">
          <h1>Namespace: DataBroker</h1>
        </div>
        
        



    
<header>
    <h2>
    DataBroker
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">DataBroker forward events on DOM Elements with HTML5 data-* attributes to dedicated listener

<h5>Attributes:</h5>
<ul>
  <li>data-jalios-action: (required) a list of action to perform separated by spaces
    <ul>
      <li>modal: open a modal</li>
      <li>popin: trigger a popin</li>
      <li>ajax-refresh: trigger the ajax-refresh</li>
      <li>toggle-*: toggle elements values</li>
      <li>...</li>
    </ul>
  </li>
  <li>data-jalios-target: CSS expression to apply action</li>
  <li>data-jalios-target-position: jQuery function to apply CSS expression (closest, next, prev, ...)</li>
  <li>data-jalios-event: define the not default event to trigger</li>
  <li>data-jalios-options: the option object in JSON format</li>
</ul>

<h5>Default Events:</h5>
<ul>
  <li>A: click (or contextmenu)</li>
  <li>INPUT, BUTTON: click</li>
  <li>DIV: click</li>
  <li>INPUT, TEXTAREA: focusin focusout (or change)</li>
  <li>INPUT[checkbox,radio] SELECT change (or focusin focusout)</li>
</ul>

Modules must listen to jalios:broker Events on document. Events provides following hints:
<ul>
  <li>event.broker.type:     the action</li>
  <li>event.broker.target:   the css expression</li>
  <li>event.broker.source:   the source event (be carefull of memory leaks vs element references)</li>
  <li>event.broker.position: the jQuery function name</li>
</ul>

<p>Modules must call "event.stopPropagation()" to trap the event and stop bubbling</p>
<p>Modules can trigger (click) event with attribute 'skip' to forward an event. The function <code>$.jalios.DOM.follow()</code> trigger a click on given element. It is called by Modal module to follow actions after a prompt.</p>

<h5>RFE/FIXME</h5>
<ul>
  <li>Add Data-Broker to handle all popup, modal,... (fron input, links, ...)</li>
</ul></div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-data-broker.js, line 108</li></ul></dd>
	
    
    
	
	
	<dt class="tag-see">See:</dt>
	<dd class="tag-see">
        <ul>
            <li><a href="docs/jsdoc/$.jalios.ToggleManager.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.ToggleManager</strong></a></li>
        
            <li><a href="docs/jsdoc/$.jalios.AjaxRefresh.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.AjaxRefresh</strong></a></li>
        </ul>
	</dd>
	
	
	
</dl>

        
        
            <h3>Example</h3>
            
    <pre class="prettyprint">&lt;a href="..." data-jalios-action="anything"&gt;Click me&lt;/a&gt;

var listener = function(event){
  ...
  var broker = event.broker;
  alert(broker.type);   // ajax-refresh, toggle-clazz, anything
  event.stopPropagation() // stop propagation on other handlers
  ...
}
$(document).on("jalios:broker", listener);</pre>

        
        
        
            <h3>Unit Tests</h3>
            <ul>

  <li><a href="js/tests/jalios/core/jalios-data-broker.html" target="_blank">js/tests/jalios/core/jalios-data-broker.html</a></li>

</ul>
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="trigger"><span class="type-signature">&lt;static> </span>trigger</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Explicit trigger of a DataBroker Event for given element.
Usefull for jalios custom event on document
    </div>
    
    
    
    
    
        <h5>Parameters:</h5>
        

<table class="params table table-bordered table-striped">
    <thead>
	<tr>
		
		<th>Name</th>
		
		
		<th>Type</th>
		
		
		
		
		
		<th class="last">Description</th>
	</tr>
	</thead>
	
	<tbody>
	
	
        <tr>
            
                <td class="name"><code>$e</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the working element</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>event</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the initial event</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-data-broker.js, line 190</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        </dl>
    
    
    
    
    
</article>





        
      </section>
  
      <div>
        Documentation generated by <a href="https://github.com/jsdoc3/jsdoc">JSDoc 3</a> on Wed Jan 28 2015 19:03:32 GMT+0100 (CET)
      </div>

    </div>
  </div>
</div>

<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />