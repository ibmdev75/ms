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
          <h1>Namespace: Browser</h1>
        </div>
        
        



    
<header>
    <h2>
    Browser
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Jalios Browser:A set of static function to wrap all browser feature detection deprecated in jQuery.</div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 48</li></ul></dd>
	
    
    
	
	
	
	
</dl>

        
        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="autoResize"><span class="type-signature">&lt;static> </span>autoResize</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Resize the current window to the size of the given div.
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
            
                <td class="name"><code>divID</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the div of which to retrieve dimension and to use as a reference for the new window size</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>offsetHeight</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">an integer value that will be added to the new window height, use this value when you want to add some margin to the div height (default is 55 if not given)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>minimumHeight</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">an integer value indicating the minimum height to used after resize (default is 50).</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 258</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="callback"><span class="type-signature">&lt;static> </span>callback</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Internal callback use for communication with popup
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 230</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="isIE"><span class="type-signature">&lt;static> </span>isIE</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Check browser is IE in the given version.<br/>This function should be deprecated like jQuery because developers should check browser features instead of browser version. But there is exceptions...
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
            
                <td class="name"><code>version</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>int</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the version to check (optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 76</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    true if the browser match version or lower.
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">boolean</span> 
		
	</dd>
</dl>

        
    
    
        <h5>Examples</h5>
        
    <pre class="prettyprint">$.jalios.Browser.isIE();=> true if browser is IE</pre>

    <pre class="prettyprint">$.jalios.Browser.isIE(8);=> true if browser is IE5, IE6, IE7, IE8=> false if browser is IE9, IE10, ...</pre>

    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="isInPopup"><span class="type-signature">&lt;static> </span>isInPopup</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Check if the current window is a popup
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 289</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="isMobileSafari"><span class="type-signature">&lt;static> </span>isMobileSafari</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Check browser is Safari Mobile.<br/>This function should be deprecated like jQuery because developers should check browser features instead of browser version. But there is exceptions...
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 89</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    true if the browser match mobile safari
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">boolean</span> 
		
	</dd>
</dl>

        
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="popup"><span class="type-signature">&lt;static> </span>popup</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Simple version of popupWindow() functions
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 142</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="popupWindow"><span class="type-signature">&lt;static> </span>popupWindow</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Replace previous various popupWindow() functions
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 157</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="redirect"><span class="type-signature">&lt;static> </span>redirect</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Redirect current browser's window to given url
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
            
                <td class="name"><code>url</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">to redirect</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>(optional)</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>boolean</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">onOpener reload the window's opener</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>(optional)</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>boolean</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">post adds a csrf token if redirect for a POST</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 107</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="reload"><span class="type-signature">&lt;static> </span>reload</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Reload current browser's window.
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
            
                <td class="name"><code>(optional)</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>boolean</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">onOpener reload the window's opener</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-browser.js, line 97</li></ul></dd>
	
    
    
	
	
	
	
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