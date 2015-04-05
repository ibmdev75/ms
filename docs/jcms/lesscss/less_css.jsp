<%@page import="com.jalios.jcms.context.MessageLevel"%>
<%@page import="com.jalios.jcms.context.JcmsMessage"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/lesscss/less_css.jsp")); %>
<div class="bs-docs-section">
  <h1 id="less-compilation" class="page-header">Less compilation</h1>
  
  <h3 id="less-compilation-file">How to compile your less files to css</h3>
  <p>To compile a less file to css, you only have to declare it in your plugin.prop.</p>
  <div class="highlight"><pre><code>channel.less.plugins/CustomerPlugin/css/customer-core.css:    plugins/CustomerPlugin/css/customer-core.less</code></pre></div>
  
  <p>You can then use it in your jsp by calling the file with the following line.</p>
  <div class="highlight"><pre><code>&lt;% jcmsContext.addCSSHeader("plugins/CustomerPlugin/css/customer-core.css"); %&gt;</code></pre></div>
  <p>Or you can also declare it in properties if the file must be available on all pages (This can be only in front office or back office by adding "fo" or "bo" to the property).</p>
  <p>Warning: these properties must start after the number 100 in order to avoid override issues.</p>
  <ul>
    <li><code>channel.css.all.100: plugins/CustomerPlugin/css/customer-core.css</code> : Adds this css to all pages.</li>
    <li><code>channel.css.all.101.bo: plugins/CustomerPlugin/css/customer-bo.css</code> : Adds this css to all back pages.</li>
    <li><code>channel.css.all.102.fo: plugins/CustomerPlugin/css/customer-fo.css</code> : Adds this css to all front pages.</li>
  </ul>  
  
  <p>You can add the following file in your less file : <b>css/jalios/core/init-mixins.less</b></p>
  <p>This file contains the following utilities that you may use :</p>
  <ul>
    <li><b>variables.less</b> : bootstrap variables</li>
    <li><b>mixins.less</b> : bootstrap mixins</li>
    <li><b>jalios-mixins.less</b> : jcms mixins</li>
    <li><b>jcms-variables.less</b> : jcms variables</li>
    <li><b>css/custom.less</b> : this file is empty, and can be fulfilled by clients who want to override either jcms or bootstrap variables or mixins.</li>
  </ul>
  
  <h3 id="less-compilation-devtools">Less compilation with dev tools plugin</h3>
  <p>The dev tool plugin adds utilities in the topbar of jcms to compile your less files</p>
  <ul>
    <li><b>Less compilation : fast</b> :  Compile all parent (declared in properties) modified files.</li>
    <li><b>Less compilation : partial</b> : Performs a touch on the core.less file, and compiles it to core.css.</li>
    <li><b>Less compilation : full</b> : Recompile all the less files declared in the properties.</li>
  </ul>
  
  <h3 id="less-compilation-auto">Automatic less compilation</h3>
  <p>Needs the following properties to be set to "true"</p>
  <ul>
    <li><code>channel.less-compile.auto</code></li>
    <li><code>channel.dev-mode.enabled</code></li>
  </ul>
  <p>Each time a page is refreshed, the less compilation is launched on all modified parent less files (Declared in properties)</p>
  
  <h3 id="less-compilation-startup">Less compilation on Jcms startup</h3>
  <p>Needs the following properties to be set to "true"</p>
  <ul>
    <li><code>channel.less-compile.startup</code></li>
  </ul>
  <p>Recompiles all modified less files declared in properties on JCMS startup.</p>
  
   <h3 id="less-compilation-parameters">Less compilation through url parameters</h3>
  <p>Needs the following properties to be set to "true"</p>
  <ul>
    <li><code>channel.dev-mode.enabled</code></li>
  </ul>
  <p>Recompiles the less files by adding parameters in the url : </p>
  <ul>
  <li><code>less-compile=true</code> : Recompile all the less files declared in the properties.</li>
  <li><code>less-compile=false</code> : Compile all parent (declared in properties) modified files.</li>
  <li><code>less-compile=false&partial=true</code> : Compile all parent (declared in properties) modified files, and recompiles core.less.</li>
  </ul>
   
  
    
</div><%-- EOF .bs-docs-section --%>