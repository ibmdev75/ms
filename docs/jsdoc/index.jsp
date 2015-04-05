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
          <h1>Introduction</h1>
        </div>
        
        


    

<h2>Declaration</h2>

<div class="row-fluid">
  <div class="span6">
    <h3>JCMS</h3>
    <p>JCMS JS Framework brings it's own components to complete jQuery/Bootstrap libraries.</p>
    <p>Matching browsers:</p>
    <ul>
      <li>IE7+ with JavaScript shim</li>
      <li>Firefox latest version</li>
      <li>Chrome latest version</li>
      <li>Safari (mobile browser)</li>
    </ul>
    <p>This first relase aimed to be compatible with both worlds (old and new JCMS)</p>
  </div>
  <div class="span6">
    <h3>FileSystem</h3>
    
    <table class="table table-bordered table-striped table-condensed">
      <tr>
        <th>Name</th>
        <th>Path</th>
        <th>Description</th>
      </tr>
      <tr>
        <td>Libraries</td>
        <td><code>js/lib/</code></td>
        <td>All external librairies</td>
      </tr>
      <tr>
        <td>Core</td>
        <td><code>js/jalios/core/</code></td>
        <td>Core jQuery libraries</td>
      </tr>
      <tr>
        <td>UX</td>
        <td><code>js/jalios/ux/</code></td>
        <td>Dedicated jQuery GUI</td>
      </tr>
      <tr>
        <td>I18N</td>
        <td><code>js/languages/</code></td>
        <td>Core I18N properties</td>
      </tr>
      <tr>
        <td>Documenation</td>
        <td><code>docs/jsDoc/</code></td>
        <td>generated by <a href="https://github.com/jsdoc3/jsdoc">jsDoc 3</a></td>
      </tr>
      <tr>
        <td>Unit Tests</td>
        <td><code>js/test/</code></td>
        <td>handled by <a href="http://qunitjs.com/">QUnit</a></td>
      </tr>
    </table>
  </div>
</div>

<div class="row-fluid">
  <div class="span6">
    <h3>Libraries</h3>
    <p>Before JCMS 7.1.x all JavaScript code is based on:</p>
    <ul>
      <li><a href="http://www.prototypejs.org/">Prototype</a></li>
      <li><a href="http://script.aculo.us/">Scriptaculous</a></li>
      <li><a href="http://livepipe.net/">LivePipe</a></li>
    </ul>
    <p>After  JCMS 8.x JavaScript code is rewritten with:</p>
    <ul>
      <li><a href="http://jquery.com/">jQuery</a></li>
      <li><a href="http://twitter.github.com/bootstrap/">Bootstrap</a></li>
    </ul>
  </div>
  <div class="span6">
    <h3>Properties</h3>
    <p>JCMS introduce a new mechanism to handle JS files using properties</p>
<pre class="prettyprint linenums">
channel.js.002.fo:      js/lib/jquery/jquery-1.8.2.js
channel.js.003.fo:      js/lib/jquery/jquery-fix.js
channel.js.005:         js/jalios/languages/{lang}.js
channel.js.015:         js/lib/prototype.js
</pre>
    <ul>
      <li><code>050</code> is used to sort/override a declaration.</li>
      <li><code>bo</code> restricted the file to a custom area (backoffice, frontoffice, ...)</li>
    </ul>
  </div>
</div>

<div class="row-fluid">
  <div class="span6">
    <h3>Core</h3>
    <p>A shift from Prototype to jQuery has begun. Developers should now relies on jQuery code.</p>
    <p>Developers should be aware of JCMS core features:</p>
    <ul>
      <li>Ajax-Refresh</li>
      <li>Data-Broker Components</li>
    </ul>
    <p>
      A jQuery Event <code>jalios:ready</code> is trigged, after JavaScript files are loaded, when document is ready or ajax-refresh is finished.
      Modules should relies on this event instead of <code>dom:ready</code> to be available everywhere. 
    </p>
  </div>
  <div class="span6">
    <h3>Plugins</h3>
    <p>jQuery code must be declared <a href="http://jqueryboilerplate.com/">in module</a> to ensure compatibility between Prototype and jQuery. See plugin samples.</p>
    <p>Plugins must declare JavaScript files using <code>jcmsContext.addJavaScript(...)</code>. Or with properties.</p> 
  </div>
</div>

<p>&nbsp;</p>




        
      </section>
  
      <div>
        Documentation generated by <a href="https://github.com/jsdoc3/jsdoc">JSDoc 3</a> on Wed Jan 28 2015 19:03:32 GMT+0100 (CET)
      </div>

    </div>
  </div>
</div>

<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />