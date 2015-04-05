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
          <h1>Namespace: ToggleManager</h1>
        </div>
        
        



    
<header>
    <h2>
    ToggleManager
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">ToggleManager listen to DataBroker to handle toggle action to perform on target elements (or self).<br/> 
<br/>

<h5>Actions: {toggle|add|remove|sync}-{class|disable|checked|...}</h5>
<ul>
  <li>toggle: Toggle Add or Remove the target value</li>
  <li>add:    Add or set to true the target value</li>
  <li>remove: Remove or set to false the target value</li>
  <li>sync:   Set the target value equals to self</li>
  <li>run:    Run given function (bind to window)</li>
</ul>

<ul>
  <li>class: a  class name</li>
  <li>data-* element's data attribute</li>
  <li>disabled: disabled/enabled</li>
  <li>checked:  check/uncheck</li>
  <li>title:    element's title</li>
  <li>longdesc: element's longdesc</li>
  <li>value:    element's value</li>
</ul>

<h5>Introduce custom field:</h5>
<ul>
  <li>data-jalios-target-attribute The target's field name to update. The name of the field can be a jQuery funcion like 'html', 'css' or 'after' ... </li>
</ul></div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-data-toggle.js, line 193</li></ul></dd>
	
    
    
	
	
	<dt class="tag-see">See:</dt>
	<dd class="tag-see">
        <ul>
            <li><a href="docs/jsdoc/$.jalios.DataBroker.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.DataBroker</strong></a></li>
        </ul>
	</dd>
	
	
	
</dl>

        
        
        
        
            <h3>Unit Tests</h3>
            <ul>

  <li><a href="js/tests/jalios/core/jalios-data-toggle.html" target="_blank">js/tests/jalios/core/jalios-data-toggle.html</a></li>

</ul>
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="toggle"><span class="type-signature">&lt;static> </span>toggle</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Toggle given attribute of given element with given options.<br/>
Toggle can be performed on self or targets elements.
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
            
                <td class="name"><code>elm</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the source element</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>attr</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the attribut to switch</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>options</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">option object</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-data-toggle.js, line 273</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
        <h5>Examples</h5>
        
    <pre class="prettyprint">var $elm = $('#link1');
var options = $.jalios.ToggleManager.getOption('toggle', false, false);      
$.jalios.ToggleManager.toggle($elm[0], 'clazz', options);

=> Toggle state of class 'clazz'</pre>

    <pre class="prettyprint">var $elm = $('#link4A');
var options = $.jalios.ToggleManager.getOption('sync', '#link4B', false);
$.jalios.ToggleManager.toggle($elm[0], 'clazz', options);

=> Synchronize state of class 'clazz' on #link4A with #link4B</pre>

    <pre class="prettyprint">var $elm = $('#input8');
var options = $.jalios.ToggleManager.getOption('sync', 'DIV.input8Div');
options.attr = 'html';

$elm.attr('value','typed values in input8');
$.jalios.ToggleManager.toggle(elm, 'value', options);

=> Value on #input8 is set to all $('DIV.input8Div').html(...) on focusin/focusout  </pre>

    
    
    
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