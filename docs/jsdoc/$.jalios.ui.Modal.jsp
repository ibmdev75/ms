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
          <h1>Namespace: Modal</h1>
        </div>
        
        



    
<header>
    <h2>
    Modal
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Manage Jalios Modals using Bootstrap framework.
<br/><br/>

<h5>Trigger</h5>
The trigger will be treadted as an Ajax-Refresh trigger for a given Modal. All ajax-refresh features applies.
<ul>
  <li>Must have class <code>modal</code> or attribute <code>data-jalios-action="modal"</code></li>
  <li>Classes <code>alert</code>, <code>confirm</code>, <code>prompt</code>, <code>warning</code> open a custom modal</li>
  <li>FIXME: data-jalios-modal="keyboard, static, ..."</li>
  <li>FIXME: prompt.jsp vs enter key</li>
  <li>FIXME; Resize on ajax-refresh </li>
</ul>

<h5>Data</h5>
<code>$.jalios.ui.Modal.latest</code> is an object with latest modal information.
<ul>
  <li>trigger: the trigger opening the modal</li>
  <li>value: information given by <code>$.jalios.ui.Modal.close()</code></li>
</ul>

<h5>Events</h5>
An event <code>jalios:modal</code> is trigged when a modal is closed with the following information.
<ul>
  <li>modal.type: closed is the event type</li>
  <li>modal.latest: references to <code>$.jalios.ui.Modal.latest</code></li>
</ul></div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 109</li></ul></dd>
	
    
    
	
	
	<dt class="tag-see">See:</dt>
	<dd class="tag-see">
        <ul>
            <li><a href="docs/jsdoc/$.jalios.DataBroker.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.DataBroker</strong></a></li>
        
            <li><a href="docs/jsdoc/$.jalios.AjaxRefresh.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.AjaxRefresh</strong></a></li>
        </ul>
	</dd>
	
	
	
</dl>

        
        
            <h3>Example</h3>
            
    <pre class="prettyprint">&lt;%@ include file='/jcore/doInitPage.jsp' %&gt;

&lt;% if (hasParameter("opSubmit")) { %&gt;
  &lt;%-- request.setAttribute("modal.redirect", "customRedirect.jsp"); --%&gt;
  &lt;%@ include file="/jcore/modal/modalRedirect.jspf" %&gt;
&lt;% } %&gt;

&lt;% 
if (hasParameter("opRefresh")) { 
  String text = getUntrustedStringParameter("text", "");
  jcmsContext.setInfoMsg("Your text: " + encodeForHTML(text));
}
%&gt;

&lt;div class="ajax-refresh-div"&gt;
  &lt;a href="debug/modal.jsp" class="ajax-refresh-url" style="display:none"&gt;&lt;/a&gt;
  &lt;form action="debug/modal.jsp" method="post" name="editForm"&gt;
  &lt;div class="modal-form" style="width:500px;"&gt;
  
    &lt;div class="modal-header"&gt;
      &lt;img src="images/jalios/logos/powered-by-jalios.gif" class="visual"/&gt;  
      &lt;h3&gt;Example of form modal&lt;/h3&gt;
    &lt;/div&gt;
  
    &lt;%--  
      int step = formHandler.getFormStep(); 
      int stepCount = formHandler.getFormStepCount();
      String stepPrefixProp = "jcmsplugin...steps.";
    %&gt;&lt;%@ include file='/jcore/doSteps.jspf' --%&gt;

    &lt;div class="modal-body"&gt;
      &lt;%@ include file='/jcore/doMessageBox.jsp' %&gt;
      &lt;div class="info"&gt;The introduction...&lt;/div&gt;

      &lt;input name="text" value="Enter some text" /&gt;
    &lt;/div&gt;
    
    &lt;div class="modal-footer"&gt;
      &lt;%-- @ include file='/jcore/doStepButtons.jspf' --%&gt;
      &lt;a href="#" class="ajax-refresh"&gt;Refresh Link&lt;/a&gt;
      &lt;input type="submit" class="btn" name="opCancel" onclick="return JCMS.window.Modal.close(false);" value="&lt;%= glp("ui.com.btn.cancel") %&gt;"/&gt;
      &lt;input type="submit" class="btn ajax-refresh" name="opRefresh" value="&lt;%= glp("ui.com.btn.refresh") %&gt;" /&gt;
      &lt;input type="submit" class="btn btn-primary ajax-refresh" name="opSubmit" value="&lt;%= glp("ui.com.btn.save") %&gt;" /&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;/form&gt;
  
  &lt;%@ include file='/jcore/doAjaxFooter.jspf' %&gt;
&lt;/div&gt;</pre>

        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="alert"><span class="type-signature">&lt;static> </span>alert</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Open an alert dialog with given message and call the callback with the given value.
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
            
                <td class="name"><code>msg</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the message to display</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>callback</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the callback to call (optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 423</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="close"><span class="type-signature">&lt;static> </span>close</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Close the current modal and store in <code>$.jalios.ui.Modal.latest.value</code> the given value.
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
            
                <td class="name"><code>value</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the value to store.</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 482</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
        <h5>Example</h5>
        
    <pre class="prettyprint"><button onClick="$.jalios.ui.Modal.close(true)" /></pre>

    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="closeAndFollow"><span class="type-signature">&lt;static> </span>closeAndFollow</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Close the current modal and follow link/button event.
<ul>
  <li>Link are called with parameter value=...</li>
  <li>Input/Button 'submit' are submited with their name and input hidden value</li>
  <li>Form are submited with their name and input hidden value</li>
</ul>
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
            
                <td class="name"><code>value</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the value to set (optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 524</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="closeAndRefresh"><span class="type-signature">&lt;static> </span>closeAndRefresh</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Close the current modal and trigger an ajax-refresh on the wrapper.
Should use closeAndFollow() that will trigger a click on trigger (with skip modal and call to next actions (like ajax-refresh)
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 508</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="closeAndReload"><span class="type-signature">&lt;static> </span>closeAndReload</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Close the current modal and reload the page.
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
            
            
            
            
            
            <td class="description last">to use for reload (optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 494</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="confirm"><span class="type-signature">&lt;static> </span>confirm</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Open a confirm dialog with given message and call the callback with the given value.
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
            
                <td class="name"><code>msg</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the message to display</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>callback</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the callback to call (optional)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>reverse</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>boolean</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the condition (optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 401</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="getModal"><span class="type-signature">&lt;static> </span>getModal</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Returns the Common Modal
    </div>
    
    
    
    
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 540</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    modal
</div>



        
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="open"><span class="type-signature">&lt;static> </span>open</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Open a modal to a given Trigger
<ul>
  <li>A common modal is created or reused</li>
  <li>An Ajax-Refresh is performed on modal with the given trigger</li>
</ul>

<h5>Custom classes:</h5>
<ul>
  <li><code>alert</code>: simple alert (ok)</li>
  <li><code>confirm</code>: simple confirm (ok/cancel)</li>
  <li><code>prompt</code>: simple prompt (ok/cancel/input)</li>
  <li><code>warning</code>: simple warnint (ok/cancel)</li>
</ul>
These custom class append a <code>msg-box</code> class to modal.

<h5>Images:</h5>
IMG source ending with jpg|jpeg|gif|png|bmp will open a custom modal (image.jsp).
The class <code>ajax-lazy-chunk</code> on a refreshed content trigger resize of the modal after loading.

<h5>IFrame:</h5>
Tags with a <code>rel</code> attribute will open a custom modal ({rel}.jsp).
<ul>
  <li><code>rel="iframe"</code>: open an iframe in a modal</li>
</ul>

<h5>data-*</h5>
The attribute <code>data-jalios-modal-url</code> is a workaround when <code>data-jalios-ajax-refresh-url</code> can't be used.
(Modal could be opened on DIV's clicks)

<ul>
  <li>FIXME: Handle CtxMenu Trigger</li>
</ul>
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
            
                <td class="name"><code>trigger</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>element</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the trigger</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>options</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>object</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">(optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 276</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="openFromUrl"><span class="type-signature">&lt;static> </span>openFromUrl</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Open a modal to a given URL
<ul>
  <li>A common modal is created or reused</li>
  <li>An Ajax-Refresh is performed on modal with the given URL</li>
</ul>

Options
<ul>
  <li>callback</li>
</ul>
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
            
            
            
            
            
            <td class="description last">the url to access</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>options</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>object</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">(optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 215</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="prompt"><span class="type-signature">&lt;static> </span>prompt</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Open a prompt dialog with given message and call the callback with the given value.
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
            
                <td class="name"><code>msg</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the message to display</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>callback</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the callback to call (optional)</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>defvalue</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the default value to fill prompt (optional)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-modal.js, line 375</li></ul></dd>
	
    
    
	
	
	
	
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