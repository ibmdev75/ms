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
          <h1>Namespace: DOM</h1>
        </div>
        
        



    
<header>
    <h2>
    DOM
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Jalios DOM:<br/>
A set of DOM static function to fill the gap between JCMS, jQuery and Prototype.</div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 760</li></ul></dd>
	
    
    
	
	
	
	
</dl>

        
        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Members</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="hasFocus"><span class="type-signature">&lt;static> </span>hasFocus<span class="type-signature"></span></h4>
    
    
</dt>
<dd>
    
    <div class="description">
        Displays information about browser state.
True indicate document is focused otherwise false
    </div>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 931</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
</dd>

        </dl>
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="_loadRegister"><span class="type-signature">&lt;static> </span>_loadRegister</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        <strong>Internal</strong><br/>
Called by &lt;jalios:javascript&gt; to trigger script at the end of javascript load
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
            
                <td class="name"><code>cb</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>function</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the callback to call once</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 923</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="follow"><span class="type-signature">&lt;static> </span>follow</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Follow given element with updated key/value and skip given data:broker event
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
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>element</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the element to work with</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>skip</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the component triggering the follow (avoid loop)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>key</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the key pair to update</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>value</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the value pair to update

FIXME: handle target = _blank (window.open(url,'_blank');)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 942</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="isInIFrame"><span class="type-signature">&lt;static> </span>isInIFrame</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Check if current code is running in IFrame or main window
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1005</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="loadJavaScript"><span class="type-signature">&lt;static> </span>loadJavaScript</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Load a JavaScript file from its relative path.<br/>
Fire Event jalios:ready when all the javascrip files has been loaded<br/> 
<br/>

Trigger event jalios:ready when all javascript has been added.
<ul>
  <li>&lt;jalios:javascript&gt; is already trigged on jalios:ready</li>
  <li>Custom code that relies on javascript loaded MUST wait for this event</li>
  <li>The event can be trigged multiple times</li>
</ul>

<br/>
<strong>Implementation:</strong><br/>
Use jQuery magic that do not add script tag in the header
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
            
                <td class="name"><code>path</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the JS path (absolute or relative)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>version</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">an optionnal version of this file, as defined through JCMS property channel.packer.version</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 874</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    <h5>Fires:</h5>
    <ul>
        <li>
    <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>jalios:ready</strong></a>
</li>
    </ul>
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    true if the javascript has been added
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">boolean</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="loadStyleSheet"><span class="type-signature">&lt;static> </span>loadStyleSheet</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Load a StyleSheet file from its relative path.
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
            
                <td class="name"><code>path</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the CSS path (absolute or relative)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>media</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">an optionnal media for this CSS (default to all)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>version</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">an optionnal version of this file, as defined through JCMS property channel.packer.version</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 810</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    true if the stylesheet has been added
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">boolean</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="markResource"><span class="type-signature">&lt;static> </span>markResource</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Mark the given resource as "loaded".
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
            
                <td class="name"><code>path</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">to resource</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 779</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    true if the resources is marked false if alread marked.
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">boolean</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="markResources"><span class="type-signature">&lt;static> </span>markResources</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Mark the given resources as "loaded".
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
            
                <td class="name"><code>paths</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string...</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">to resources</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 795</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="resizeIframeToViewport"><span class="type-signature">&lt;static> </span>resizeIframeToViewport</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Resize given jquery element to viewport with the given max height.
If no max height is providen, max height will be 400px.
Do not handle, but catch cross domain exceptions. Handle iFrame navigation.
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
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>element</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the IFrame</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>max</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>int</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the max height to apply. Set -1 for no max.</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1034</li></ul></dd>
	
    
    
	
	
	
	
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