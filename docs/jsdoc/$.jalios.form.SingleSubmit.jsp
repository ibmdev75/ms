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
          <h1>Namespace: SingleSubmit</h1>
        </div>
        
        



    
<header>
    <h2>
    SingleSubmit
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">SingleSubmit plugin will prevent forms and XHR to be submited more than once<br/>
<br/> 

<h5>Features</h5>
<ul>
  <li>Listen to Ajax-Request submits</li> 
  <li>Add global boolean to prevent multiple submit</li>
  <li>Activate feature with disable() / enable()</li>
  <li>FORM.noSingleSubmitButton bypass the process</li>
</ul>

<h5>Convention</h5>
<ul>
  <li>
    disable: new class convention to disable a given element. (do not use attribute because of side effects)
    <br/>=> Handled by Ajax-Refresh
  </li>
</ul></div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-single-submit.js, line 147</li></ul></dd>
	
    
    
	
	
	
	
</dl>

        
        
            <h3>Example</h3>
            
    <pre class="prettyprint">$.jalios.form.SingleSubmit.disable();</pre>

        
        
        
            <h3>Unit Tests</h3>
            <ul>

  <li><a href="js/tests/jalios/core/jalios-single-submit.html" target="_blank">js/tests/jalios/core/jalios-single-submit.html</a></li>

</ul>
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Members</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="initUnload"><span class="type-signature">&lt;static> </span>initUnload<span class="type-signature"></span></h4>
    
    
</dt>
<dd>
    
    <div class="description">
        Init an unload message before leaving form
    </div>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-single-submit.js, line 216</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
</dd>

        </dl>
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="disable"><span class="type-signature">&lt;static> </span>disable</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Disable all formButton of Forms without class 'noSingleSubmitButton'
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-single-submit.js, line 191</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="enable"><span class="type-signature">&lt;static> </span>enable</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Enable all formButton of Forms
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-single-submit.js, line 186</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="toggle"><span class="type-signature">&lt;static> </span>toggle</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Toggle availability of all formButton of Forms without class 'noSingleSubmitButton'
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
            
                <td class="name"><code>enable</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>boolean</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">to force state enbale/disable</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-single-submit.js, line 197</li></ul></dd>
	
    
    
	
	
	
	
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