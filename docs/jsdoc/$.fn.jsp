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
          <h1>Namespace: fn</h1>
        </div>
        
        



    
<header>
    <h2>
    fn
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Add convenient function to jQuery function $()</div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1050</li></ul></dd>
	
    
    
	
	
	
	
</dl>

        
        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="exists"><span class="type-signature">&lt;static> </span>exists</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Check if a jQuery object has results
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1061</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="findNext"><span class="type-signature">&lt;static> </span>findNext</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Call the find() on each next() sibbling. Usefull with ToggleManager
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
            
                <td class="name"><code>selector</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the selector to match</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1093</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="findPrev"><span class="type-signature">&lt;static> </span>findPrev</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Call the find() on each next() sibbling. Usefull with ToggleManager
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
            
                <td class="name"><code>selector</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the selector to match</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1101</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="getJcmsId"><span class="type-signature">&lt;static> </span>getJcmsId</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Return the Jcms Id associated with the given element.<br/>
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
            
                <td class="name"><code>dataOnly</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">only check the data-jalios-id</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1236</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    the element's JcmsId. Or false if missing.
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
    <h4 class="name" id="getUsage"><span class="type-signature">&lt;static> </span>getUsage</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Return the template usage of a given element<br/>
FIXME: Should handle data-jalios-usage attribute
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1259</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    the element's template usage. Or false if missing.
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
    <h4 class="name" id="getWidget"><span class="type-signature">&lt;static> </span>getWidget</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Helper to retrieve wrapping widget of given element.
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-widget.js, line 406</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="identify"><span class="type-signature">&lt;static> </span>identify</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Build and set unique id for the given element with given prefix
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
            
                <td class="name"><code>prefix</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">{string} the to append (without '_')</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>force</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">{boolean} force new random id</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1070</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="isPortlet"><span class="type-signature">&lt;static> </span>isPortlet</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Check if the elment is a Portlet<br/>
<strong>Implementation note:</strong> check element has Class 'Portlet' and a JcmsId
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1219</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    true if the given element match
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
    <h4 class="name" id="matchClass"><span class="type-signature">&lt;static> </span>matchClass</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Returns the match for the given regexp on given element classes
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
            
                <td class="name"><code>regexp</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">to match</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>group</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the regexp group to match (default = 1)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1112</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    an array of match
</div>



        
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="max"><span class="type-signature">&lt;static> </span>max</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Return the max of the given applied function
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
            
                <td class="name"><code>selector</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">function to call on collection</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1297</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    the max
</div>



        
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="named"><span class="type-signature">&lt;static> </span>named</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Returns all form element with given names
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
            
                <td class="name"><code>names</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">an array of names</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1204</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="populate"><span class="type-signature">&lt;static> </span>populate</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Fill a form with a JSON Object
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
            
                <td class="name"><code>json</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the json object</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1193</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="refresh"><span class="type-signature">&lt;static> </span>refresh</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Call Ajax-Refresh on given element
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-ajax-refresh.js, line 911</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="serializeObject"><span class="type-signature">&lt;static> </span>serializeObject</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Serialize a Form to JSON using underlaying jQuery function and fill the gap.
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
            
                <td class="name"><code>filter</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">a subset of keys to retrieve</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1170</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-common.html" target="_blank">js/tests/jalios/core/jalios-common.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="smartFocus"><span class="type-signature">&lt;static> </span>smartFocus</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Helper to perform smart focus in the wrapping DIV
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-widget.js, line 413</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="toggleDisabledField"><span class="type-signature">&lt;static> </span>toggleDisabledField</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Toggle the field to be disabled or not.
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-widget.js, line 437</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="updateClass"><span class="type-signature">&lt;static> </span>updateClass</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Add all the given classes to the given Set. 
And update all classes with the following pattern: te-xt-number
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
            
                <td class="name"><code>classes</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">string classes separated by spaces</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 1142</li></ul></dd>
	
    
    
	
	
	
	
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