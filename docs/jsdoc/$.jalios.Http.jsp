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
          <h1>Namespace: Http</h1>
        </div>
        
        



    
<header>
    <h2>
    Http
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Jalios Http:<br/>
Static funtion missing in core librairies to manipulate: URL, QueryString, ... missing in core librairies.</div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 363</li></ul></dd>
	
    
    
	
	
	
	
</dl>

        
        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="decode"><span class="type-signature">&lt;static> </span>decode</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Decode QueryString parameters<br/>
Querystring parameters are always encoded and must be decoded before processed.
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
            
                <td class="name"><code>param</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the parameter or it's key</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 380</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    decoded parameter
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">string</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="encode"><span class="type-signature">&lt;static> </span>encode</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Encode QueryString parameters
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
            
                <td class="name"><code>param</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the parameter or it's key</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 391</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    encoded parameter
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">string</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="getBaseUrl"><span class="type-signature">&lt;static> </span>getBaseUrl</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Return browser base baseURL computed from base tag
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 442</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    the base URL
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">string</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="getContextPath"><span class="type-signature">&lt;static> </span>getContextPath</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Return browser context path<br/>

<strong>Implementation note:</strong> A JSP code (server side) set "document._contextPath" in document's head
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 455</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    the context path
</div>



        
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="getUrlWithUpdatedParam"><span class="type-signature">&lt;static> </span>getUrlWithUpdatedParam</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Update given url with given params/value pairs replace or add (using regexp)<br/>
Note: Develpers should use instead  toQueryParams(), jQuery.param() and jQuery.extend()
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
            
            
            
            
            
            <td class="description last">the url to start</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>param</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the param to update</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>value</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the value to update</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 472</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    the updated url
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">string</span> 
		
	</dd>
</dl>

        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="toQueryParams"><span class="type-signature">&lt;static> </span>toQueryParams</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Convert a QueryString to a JSON Object.<br/>
The oposite is <a href="http://api.jquery.com/jQuery.param/">jQuery.param()</a>
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
            
                <td class="name"><code>str</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the url to parse</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 408</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    a JSON object
</div>




<dl>
	<dt>
		Type
	</dt>
	<dd>
		
		<span class="param-type">object</span> 
		
	</dd>
</dl>

        
    
    
        <h5>Example</h5>
        
    <pre class="prettyprint">$.jalios.Http.toQueryParams("http://my.server/webapp/my.jsp?param1=value1&amp;param1=value3&amp;param2=value2")
=> { param1: ['value1','value3'] , param2: 'value2' }</pre>

    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
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