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
          <h1>Namespace: Ajax</h1>
        </div>
        
        



    
<header>
    <h2>
    Ajax
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Jalios Ajax: <br/>

<ul>
  <li>Add hooks and filters to improve communication, security, ... between JCMS and Xhr</li>
  <li>Add convenient Ajax function </li>
</ul>

There is no wrapper on Ajax request. Developers should simply use <a href="http://api.jquery.com/jQuery.ajax/" />jQuery API</a>.</div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 514</li></ul></dd>
	
    
    
	
	
	
	
</dl>

        
        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="_fixHeader"><span class="type-signature">&lt;static> </span>_fixHeader</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        <strong>Internal</strong><br/>
Callback of jQuery.ajaxPrefilter() to override all jQuery XHR parameter by custom headers.
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
            
                <td class="name"><code>options</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>object</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the XHR options</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 537</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="_fixWait"><span class="type-signature">&lt;static> </span>_fixWait</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        <strong>Internal</strong><br/>
Callback of jQuery.ajaxPrefilter() to display waiting area.
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
            
                <td class="name"><code>options</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>object</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the XHR options</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 565</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="_history"><span class="type-signature">&lt;static> </span>_history</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        <strong>Internal</strong><br/>
Initialise history management for Ajax requests.<br/>

<ul>
  <li>Create HTML component based on Browser version in DIV#rshStorageDiv</li>
  <li>Trigger Event jalios:history on change</li>
  <li>Already bind to ajax-refresh events</li>
</ul>
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 628</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    <h5>Fires:</h5>
    <ul>
        <li>
    <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>jalios:history</strong></a>
</li>
    </ul>
    
    
    
    
    
    
    
    
    
        <h5>Unit Tests</h5>
        <ul>

  <li><a href="js/tests/jalios/core/jalios-ajax-refresh.html" target="_blank">js/tests/jalios/core/jalios-ajax-refresh.html</a></li>

</ul>
    
</dd>

        
            
<dt>
    <h4 class="name" id="addHistory"><span class="type-signature">&lt;static> </span>addHistory</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Add a new entry to Ajax History.
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
            
                <td class="name"><code>data</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the object to store</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 735</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="wait"><span class="type-signature">&lt;static> </span>wait</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Toggle the wait div according to given parameter
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
            
                <td class="name"><code>show</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>boolean</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">to display wait state</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>(optional)</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>element</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">trigger</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-common.js, line 581</li></ul></dd>
	
    
    
	
	
	
	
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