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
          <h1>Namespace: AjaxRefresh</h1>
        </div>
        
        



    
<header>
    <h2>
    AjaxRefresh
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Ajax-Refresh listen to DataBroker to handle ajax-refresh action to perform on wrapping ajax-refresh-div.
The refreshed DIV is never removed but attributes of remote DIV are added to refreshed DIV. 
Classes with a pattern te-xt-number are overrided.

<h5>Classes</h5>
<ul>
  <li>ajax-refresh: Backward compatibility, see data-jalios-ajax-refresh</li>
  <li>ajax-refresh-div: DIV to wrap the refresh area</li>
  <li>ajax-lazy and ajax-lazy-custom: flag to refresh area when DOM is ready. Note: ajax-lazy-custom let Portlet return a default value.</li>
  <li>ajax-periodical-{0}: Backward compatibility, see data-jalios-ajax-refresh-periodical</li>
  <li>ajax-refresh-debug: Backward compatibility, DIV used to debug/display refreshed area</li>
  <li>confirm: Postpone the refresh, and delegate to modal</li>
  <li>ajax-live: Trigger ajax-refresh after 20s of innactivity</li>
  <li>ajax-include: Replace given link by it's content. (used by wiki))</li>
</ul>

<h5>Attributes</h5>
<ul>
  <li>data-jalios-action: Ajax-Refresh</li>
  <li>data-jalios-target: Targets wrapper to refresh. Used to refresh a given Portlet</li>
  <li>data-jalios-target-position: Relative match</li>
</ul>
<ul>
  <li>data-jalios-ajax-refresh: A list of options for ajax-refresh</li>
  <li>data-jalios-ajax-refresh-url: An URL (on Element, Wrapper, custom link) to override link's refresh (Magic Trick)</li>
  <li>data-jalios-ajax-refresh-periodical: Refresh periodically time in seconds. Should be use with ajax-lazy. Set on wrapper or element.</li>
  <li>data-jalios-ajax-refresh-timeout: Define a timeout on requests. Set on wrapper or element</li>
  <li>data-jalios-ajax-refresh-inner: The inner target to update. Default: use the full ajax-refresh-div. Used to append a refresh.</li>
  <li>data-jalios-ajax-refresh-waiting: the delay befor replacing dom (for CSS transition)</li>
</ul>
<p>
  Ajax-Periodical will run a delay() on function if duration &lt; 30s otherwise a postpone(). 
  Postpone do not trigger if browser is idle.
</p>

<h5>Options</h5>

A list of options of ajax-refresh value (space separated):  
<ul>
  <li>nohistory: replace class ajax-action</li>
  <li>nofocus: replace class ajax-nofocus, prevent scroll to top (ie noscroll)</li>
  <li>noerror: replace class ajax-noerror, prevent alert() for error</li>
  <li>isform: this link relies on FORM not DIV.</li>
  <li>waiting: display a gray area and animated gif.</li>
</ul>

<h5>Events</h5>
jalios:refresh: Fire an event when an ajax-refresh is performed
<ul>
  <li>jalios:refresh serialize:    called when serializing form into XHR params.</li> 
  <li>jalios:refresh before:       called before XHR.</li> 
  <li>jalios:refresh async:        FIXME: called for asynchronous job. Replace refresh:async</li> 
  <li>jalios:refresh success:      called before replacing DOM. Replace refresh:before</li>
  <li>jalios:refresh after:        called after replacing DOM. Replace refresh:after </li>
  <li>jalios:refresh fail:         called before if XHR fail</li>
  <li>jalios:refresh helper:target called if there is no ajax-refresh-div resolved o be handle by third party (ctxmenu under body, ...)</li>
</ul>

<h5>Technical</h5>
<ul>
  <li>The 'ajax-refresh:job' data is stored to lock the working wrapper</li>
  <li>FIXME: class 'ajax-lazy-chunk' monitor images</li>
  <li>ajax-lazy-load: CSS on Response used to remove JS, CSS initialisation</li>
  <li>disabled class on trigger prevents submit</li>
  <li>The <code>&lt;%@ include file='/jcore/doAjaxFooter.jspf' %&gt;</code> must be declared in DIV to handle <code>&lt;jalios:javascript&gt;</code> and <code>jcmsContext.addJavaScript()</code> </li>
</ul>

<h5>RFE/FIXME</h5>
<ul>
  <li>Add support to JSON response. Use template mechanism like jQuery or Mustache. Get the template from Refresh</li>
  <li>Add an option to append a Waiting DIV in refresh area</li>
  <li>Take the focus after refresh</li>
</ul></div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-ajax-refresh.js, line 524</li></ul></dd>
	
    
    
	
	
	<dt class="tag-see">See:</dt>
	<dd class="tag-see">
        <ul>
            <li><a href="docs/jsdoc/$.jalios.DataBroker.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.DataBroker</strong></a></li>
        </ul>
	</dd>
	
	
	
</dl>

        
        
            <h3>Examples</h3>
            
    <pre class="prettyprint">Clicking on link1 will replace the wrapper's innerHTML by the content of fragment.html?param1=value1

&lt;div id="wrapper1" class="ajax-refresh-div" data-jalios-ajax-refresh-url="fragment.html"&gt;
  &lt;div class="ajax-content"&gt;Hello HTML&lt;/div&gt;
  &lt;a id="link1" href="helloworld.jsp?param1=value1" class="ajax-refresh"&gt;Click to refresh&lt;/a&gt;
&lt;/div&gt;</pre>

    <pre class="prettyprint">Clicking on submit will replace the wrapper's innerHTML by the content of fragment.html?param1=value1&amp;opSubmit=true

&lt;div id="wrapper2" class="ajax-refresh-div"&gt;
  &lt;form action='fragment.html' method='POST'&gt;
    &lt;input type="text"   name="param1"   value="value1" /&gt;
    &lt;input type="submit" name="opSubmit" value="true"  class="ajax-refresh" id="link2"/&gt;
  &lt;/form&gt;
&lt;/div&gt;</pre>

    <pre class="prettyprint">Clicking on link3 will replace the wrapper's innerHTML by the content of fragment.html?param1=value1 every 3 seconds

&lt;div id="wrapper3" class="ajax-refresh-div" data-jalios-ajax-refresh-periodical="3"&gt;
  &lt;div class="ajax-content"&gt;Hello HTML&lt;/div&gt;
  &lt;a id="link3" href="fragment.html?param1=value1" class="ajax-refresh"&gt;Click to refresh&lt;/a&gt;
&lt;/div&gt;</pre>

    <pre class="prettyprint">Clicking on link4 will replace the wrapper's DIV.inner by the HTML content of fragment.html?param1=value1

&lt;div id="wrapper4" class="ajax-refresh-div" data-jalios-ajax-refresh-inner="DIV.inner"&gt;
  &lt;div class="ajax-content"&gt;Hello HTML&lt;/div&gt;
  &lt;div class="inner"&gt;
    &lt;a id="link4" href="fragment.html?param1=value1" class="ajax-refresh"&gt;Click to refresh&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;</pre>

    <pre class="prettyprint">Clicking on link5 will replace all DIV.outside innerHTML by the content of fragment.html?param1=value1

&lt;div id="wrapper5" class="ajax-refresh-div" data-jalios-target="DIV.outside"&gt;
  &lt;div class="ajax-content"&gt;Hello HTML&lt;/div&gt;
  &lt;a id="link5" href="fragment.html?param1=value1" class="ajax-refresh"&gt;Click to refresh&lt;/a&gt;
&lt;/div&gt;
&lt;div class="outside"&gt;&lt;/div&gt;</pre>

        
        
        
            <h3>Unit Tests</h3>
            <ul>

  <li><a href="js/tests/jalios/core/jalios-ajax-refresh.html" target="_blank">js/tests/jalios/core/jalios-ajax-refresh.html</a></li>

</ul>
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="refresh"><span class="type-signature">&lt;static> </span>refresh</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Refresh from given URL
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
            
                <td class="name"><code>target</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>element</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the target element</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>url</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the url to call</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>options</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>object</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">a list of options to apply. (see default_options)</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-ajax-refresh.js, line 693</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    <h5>Fires:</h5>
    <ul>
        <li>
    <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>jalios:refresh</strong></a>
</li>
    </ul>
    
    
    
    
    
    
    
        <h5>Example</h5>
        
    <pre class="prettyprint">$('#link1').refresh();</pre>

    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="refreshPortlet"><span class="type-signature">&lt;static> </span>refreshPortlet</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Refresh all the portlets with the given jcmsId
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
            
                <td class="name"><code>jcmsId</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>string</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">the Portlet's id to refresh</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>(optional)</code></td>
            
            
            <td class="type">
            
                        <a href="docs/jsdoc/undefined"><strong><i class="glyphicon-chevron-right"></i>function</strong></a>
                        
                    
            </td>
            
            
            
            
            
            <td class="description last">callback to call back</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-ajax-refresh.js, line 664</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="refreshTarget"><span class="type-signature">&lt;static> </span>refreshTarget</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Refresh a wrapper based on given element. Element is ONLY use to compute target.
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
            
            
            
            
            
            <td class="description last">the element to use</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-ajax-refresh.js, line 672</li></ul></dd>
	
    
    
	
	
	
	
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