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
          <h1>Namespace: Sortable</h1>
        </div>
        
        



    
<header>
    <h2>
    Sortable
    </h2>
    
</header>  

<article>
    <div class="container-overview">
    
    
    
        
            <div class="description">Provides mechanisms to handle sortable (drag and drop) of list's items and container's boxes using jQueryUI Sortable Widget.
<br/><br/>

<h5>List</h5>
List with classes <code>UL.sortable</code> and <code>OL.sortable</code> will trigger this feature.
<ul>
  <li><code>.sortable-x</code> constraint horizontal drag</li>
  <li><code>.sortable-y</code> constraint vertical drag</li>
  <li><code>.sortable-handle</code> define drag handle and must be on sortable</li>
  <li><code>.sortable-disable</code> element to bypass</li>
</ul>

Attribute <code>data-jalios-sortable-connect</code> define the sortable to connect with

<h5>Boxes</h5>
DIV with classes <code>DIV.dnd-container</code> will trigger this feature.
<ul>
  <li><code>.dnd-horizontal</code> constraint horizontal drag</li>
  <li><code>.dnd-vertical</code> constraint vertical drag</li>
  <li><code>.dnd-single</code> prevent a connection with other dnd-container</li>
  <li><code>.dnd-single-update</code> will trigger only one jalios:sortable event and databroker event for all connection with other dnd-container</li>
  <li><code>.dnd-debug</code> will print update event in browser console</li> 
  <li><code>.dnd-noresponse</code> for portal ajax refresh, the DOM will not be refresh with the response.</li>
</ul>

<h5>Events</h5>
An event <code>jalios:sortable</code> is trigged when a drop has been performed.
<ul>
  <li>sortable.container: the container element (dnd-sortable forboxes)</li>
  <li>sortable.ui: the jQuery sortable ui event</code></li>
</ul>

A broker event is also performed to trigger listeners: ajax-refresh, modal, ...<br/>

The options's param is filled with the serialised content  

<h5>FIXME</h5>
<ul>
  <li>Handle connectWith on list</li>
  <li>Handle nested list</li>
</ul></div>
        
        
        
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	<dt class="tag-copyright">Copyright:</dt>
	<dd class="tag-copyright"><ul class="dummy"><li>Jalios SA</li></ul></dd>
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-sortable.js, line 113</li></ul></dd>
	
    
    
	
	
	<dt class="tag-see">See:</dt>
	<dd class="tag-see">
        <ul>
            <li><a href="docs/jsdoc/$.jalios.DataBroker.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.DataBroker</strong></a></li>
        
            <li><a href="docs/jsdoc/$.jalios.AjaxRefresh.jsp"><strong><i class="glyphicon-chevron-right"></i>$.jalios.AjaxRefresh</strong></a></li>
        </ul>
	</dd>
	
	
	
</dl>

        
        
            <h3>Examples</h3>
            
    <pre class="prettyprint">Drop will trigger action ajax-refresh on UL with parameters: key=HelloA&key=HelloB&key=HelloC&key=HelloD&sortable=key

&lt;ul id="key" class='sortable' data-jalios-action="ajax-refresh"&gt;
  &lt;li data-value="HelloA"&gt;&lt;a href='#'&gt;Hello World 1&lt;/a&gt;&lt;/li&gt;
  &lt;li id="HelloB"&gt;&lt;a href='#'&gt;Hello World 2&lt;/a&gt; Yep&lt;/li&gt;
  &lt;li data-value="HelloC"&gt;&lt;a href='#'&gt;Hello World 3&lt;/a&gt;&lt;/li&gt;
  &lt;li data-value="HelloD"&gt;&lt;a href='#'&gt;Hello World 4&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;</pre>

    <pre class="prettyprint">Drop on first column will trigger an ajax-refresh on dnd-container with parameters: bind1=c_1234&bind1=c_1234&bind1=c_1234&sortable=bind1.

This behavior simplifed by jalios-sortable-portal.js (data-jalios-action attribute is not required). PortletCollection includes doAjaxHandleSortable.jsp to updates portlet bindings 

&lt;jalios:buffer name="box"&gt;
  &lt;div class='box ID_c_1234'&gt;
    &lt;div class="box-header dnd-handle"&gt;&lt;h3&gt;Box title&lt;/h3&gt;&lt;/div&gt;
    &lt;div class="box-body"&gt;Box body&lt;/div&gt;
    &lt;div class="box-footer"&gt;Box footer&lt;/a&gt;&lt;/div&gt;
  &lt;/div&gt;
&lt;/jalios:buffer&gt;

&lt;div class='row-fluid'&gt;
  &lt;div id="bind1" class='span4 dnd-container'&gt;
    &lt;%= box %&gt; &lt;%= box %&gt; &lt;%= box %&gt;
  &lt;/div&gt;
  &lt;div id="bind2" class='span4 dnd-container'&gt;
    &lt;%= box %&gt; &lt;%= box %&gt; &lt;%= box %&gt;
  &lt;/div&gt;
  &lt;div id="bind3" class='span4 dnd-container'&gt;
    &lt;%= box %&gt; &lt;%= box %&gt; &lt;%= box %&gt;
  &lt;/div&gt;
&lt;/div&gt;</pre>

        
        
        
    
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <h3 class="subsection-title">Methods</h3>
        
        <dl>
            
<dt>
    <h4 class="name" id="buildSortable"><span class="type-signature">&lt;static> </span>buildSortable</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Build a sortable for the given element using css declaration of list (sortable-*).<br/> 
Used by sortable-widget.js to lazy kickstart sortable on focusin.
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
            
                <td class="name"><code>element</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the element to work with</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-sortable.js, line 265</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    
    
    
    
</dd>

        
            
<dt>
    <h4 class="name" id="serialize"><span class="type-signature">&lt;static> </span>serialize</h4>
    
    
</dt>
<dd>
    
    
    <div class="description">
        Serialize a given sortable with serialized children.<br/>
Do not use defaut serialisation because of JcmsID and other custom behavior.
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
            
                <td class="name"><code>container</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">the selector of the container</td>
        </tr>
	
	
	
        <tr>
            
                <td class="name"><code>key</code></td>
            
            
            <td class="type">
            
            </td>
            
            
            
            
            
            <td class="description last">optionnal parameter key to be used to send the container id</td>
        </tr>
	
	
	</tbody>
</table>
    
    
    
<dl class="details">
    
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<dt class="tag-source">Source:</dt>
	<dd class="tag-source"><ul class="dummy"><li>jalios-sortable.js, line 210</li></ul></dd>
	
    
    
	
	
	
	
</dl>

    
    
    
    
    
    
    <h5>Returns:</h5>
    
            
<div class="param-desc">
    a JSON object representation
</div>



        
    
    
    
    
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