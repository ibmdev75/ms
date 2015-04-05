<%@ include file="/jcore/doInitPage.jspf" %>
<section id="intro">
  <div class="page-header">
    <h1>Introduction <small>History, Frameworks, Best Practices</small></h1>
  </div>

  <h2>Modernizr</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>Introduction</h3>
      <p><a href="http://modernizr.com/">Modernizr</a> is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser.</p>
      <p>Modernizr runs quickly on page load to detect features; it then creates a JavaScript object with the results, and adds classes to the html element for you to key your CSS on. Modernizr supports dozens of tests.</p>
      <p>See also <a href="https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-Browser-Polyfills">a list of Polyfills</a> and an explanation <a href="http://lojjic.github.com/html5denver-polyfills/slides.html">when to use them</a></p>
    </div>
    <div class="col-md-6">
      <h3>JCMS</h3>
      <p>JCMS provides a very light version of Modernizr that should be overrided with project's requirement.</p>
      <p>Developers must generate convenient <a href="http://modernizr.com/download/">Modernizer</a></p>
      <ul>
        <li>and override <code>js/lib/modernizr/modernizr.js</code></li>
        <li>or with property: <code>channel.js.001: js/lib/modernizr/modernizr.js</code></li>
      </ul> 
    </div>
  </div>
  
  <h2>Bootstrap</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>JCMS</h3>
      <p>JCMS CSS Framework brings it's own components on top of Bootstrap library.</p>
      <p>Matching browsers:</p>
      <ul>
        <li>IE7+ with JavaScript shim</li>
        <li>Firefox latest version</li>
        <li>Chrome latest version</li>
        <li>Safari (mobile browser)</li>
      </ul>
      <p>This first relase aimed to be compatible with both worlds (old and new JCMS)</p>
    </div>
    <div class="col-md-6">
      <h3>FileSystem</h3>
      <p>The bootstrap framework is stored in <code>css/lib/bootstrap/</code> and the JCMS Framework is in <code>css/jalios/core/</code></p>
      <p>New assets (icons, background, ...) will be progressivly moved to <code>images/jalios/assets/16x16</code>...</p>
      <p>There is no TypeFace recommendation.</p>
    </div>
  </div>
  
  
  <h2>LESS</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>JCMS</h3>
      <p><a href="http://lesscss.org/">LESS</a> is a new native feature of JCMS 7.1</p>
      <p>Plugins must declare <code>.less</code> in properties resource to compile and import <code>css/jalios/core/init.less</code> to use variables and mixins. Sites can add custom variables in <code>css/custom.less</code></p>
<pre class="prettyprint linenums">
channel.less.path/file.css: path/file.less
channel.less.css/core.css: css/core.less
</pre>
      <p>All <code>.less</code> declaration will be compiled at startup or when parameter <code>?less-compile=true</code> is set in URL.</p>
      <p>Plugins should still include CSS files using <code>jcmsContext.addCSSHeader()</code></p>
    </div>
    <div class="col-md-6">
      <h3>Properties</h3>
      <p>JCMS introduce a new mechanism to handle bootstrap CSS and JS files using properties</p>
<pre class="prettyprint linenums">
channel.css.all.025:    css/.../core.css
channel.css.all.040:    css/.../lang.css
channel.css.all.050:    css/.../channel.css
channel.css.all.060.bo: css/.../admin.css
</pre>
      <ul>
        <li><code>all</code> is the css media.</li> 
        <li><code>050</code> is used to sort/override a declaration.</li>
        <li><code>bo</code> restricted the file to a custom area (backoffice, frontoffice, ...)</li>
      </ul>
      This also <strong>works with other header items</strong> ! HTTP-Equiv, Name, XMLNS, Lang, etc, ...
<pre class="prettyprint linenums">
channel.httpequiv.Content-Type: text/html; charset=UTF-8
channel.httpname.Generator: Jalios JCMS / 2001 - {year}
</pre>
    </div>
  </div>
  <div class="row">
	  <div class="col-md-6">
	    <h3>Variables</h3>
	    <p>JCMS add variables to complete Bootsrap's variables</p>
	    <p>Variables are declared in <code>jcms.less</code>.</p>
	    <ul>
	      <li><code>@basefont</code>  is a shortcut for <code>@baseFontSize</code></li>
	      <li><code>@baseline</code>  is a shortcut for <code>@baseLineHeight</code></li>
	      <li><code>@baseColor</code> is a semantic color default is <code>@blue</code></li>
	      <li><code>@emphasisColor</code> is an alternate base color</li>
	      <li><code>@complement</code> is a semantic color</li>
	      <li><code>@grayLightest</code> complete all gray colors</li>
	    </ul>
	    <p>Bootstrap mixins can be disabled for a flat design using variables:</p>
      <ul>
        <li><code>@mixBorderRadius:</code>  control border-radius mixins</li>
        <li><code>@mixGradient:</code>  control gradient mixins</li>
        <li><code>@mixBoxShadow:</code>  control box-shadow mixins</li>
        <li><code>@mixTextShadow:</code>  control text-shadow mixins</li>
        <li><code>@mixOutline:</code>  control outline mixins</li>
      </ul>
	  </div>
    
	  <div class="col-md-6">
	    <h3>Plugin Architecture</h3>
	    <p>LESS import order by Plugins</p>
	    <ul class="architecture">
	      <li>plugin.less
	        <ul>
	          <li><em>init.less</em></li>
	          <li>... plugin's mixins and variables ...</li>
	          <li><em>plugin.less</em></li>
	          <li>... plugin's code ...</li>
	        </ul>
	      </li>
	    </ul>
	    <p>Plugins must include <code>init.less</code> to use variables <strong>or</strong> <code>init-mixins.less</code> for mixins.</p>
	    <p>Plugins must include a hook <code>plugin.less</code> after custom variables declaration.</p>
	  </div>
	</div>
	
	<h2>Best Practices</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>Syntax</h3>
        <p>Some recommendation about how to write CSS/LESS</p>
        <ul>
          <li>Do not use <code>.camelCase</code> name. Use instead <code>.lower-case</code> notation</li>
          <li>Write tags in uppercase to improve readability: <code>SPAN.label</code></li>
          <li>Find and reuse scopped semantic's name
          <ul>
            <li>Modal: <code>modal-header</code>, <code>modal-body</code>, <code>modal-footer</code></li>
            <li>Box: <code>box-header</code>, <code>box-body</code>, <code>box-footer</code></li>
            <li>Active: Class <code>active</code> is used to activate all components (tab, pills, ...)</li>
          </ul>
          </li>
        </ul>
      </div>
      
    <div class="col-md-6">
      <h3>Blocks</h3>
      <p>All block elements will push down by <code>@baseline</code> do not use <code>&lt;br/&gt;</code>, <code>style="margin: ..."</code> or <code>&lt;p&gt;&nbsp&lt;/p&gt;</code></p>
      <p>The frameworks as been tuned to handle nested blocks and padding/margin on all widgets</p>
      <p>The <code>DIV.paragraph</code> mimic the <code>P</code> in case a <code>DIV</code> is required instead of a <code>P</code> (When the <code>jalios:wiki</code> is used)</p>
    </div>
  </div>
  
  
  <div class="row">
    <div class="col-md-6">
      <h3>Font & Baseline</h3>
      <p>Use predefined <code>@fontsize</code> and <code>@baseline</code> variables.</p>
      <ul>
        <li>A padding can be <code>@baseline/2</code></li>
        <li>Widget with a line-height of <code>@baseline*1.5</code> will use have a padding of <code>.padded</code>.</li>
      </ul>
      <p>New modern/fixed layout should really use <code>.span</code> grid mechanism</p>
    </div>
        
    <div class="col-md-6">
      <h3>Tables & Forms</h3>
      <p>Table used for layout purpose should have <code>.layout</code> class. Bootstrap styles are also available.</p>
      <p>Form components (INPUT, SELECT, ...) must be widgets. (not html, not DataChooser)</p>
      <p>Multilingual form should declare lang: <code>&lt;form class="lang-trigger" lang="en"&gt;</code> otherwise us JavaScript function <code>jQuery.jalios.I18N.toggleScope()</code></p>
    </div>
  </div>
  
  
  <div class="row br">
    <div class="col-md-6">
      <h3>Z-Index</h3>
      <p>JCMS Component's layer have dedicated values to mix correctly.</p>
      <ul>
        <li>Calendar chooser: 10001</li>
        <li>Autocomplete:     10000</li>
        <li>Modal & overlay :  9998</li>
        <li>Black top bar:     9000</li>
        <li>CtxMenu and Tooltip:  ?</li>
        <li>Ajaxwait:           100</li>
      </ul>
    </div>
    <div class="col-md-6">
      <h3>Transition & Animation</h3>
      <p>
        Do not use JavaScript/jQuery.
        Use instead CSS3 animation and transition 3D that relies on GPU.
      </p>
      <p>
        Ajax-Refresh provides helpers to postpone refresh and perform effects.
        The class <code>ajax-waiting-0.6</code> define the delay of 0.6s.
        The class <code>ajax-refresh-job</code> is set when DIV are refreshed.
      </p>
      <p>
        JCMS 8 provides sample CSS animation from <a href="http://daneden.me/animate/">animate.css</a>.
        A Portlet or DIV with <code>ajax-refresh-*</code> AND <code>{effect}</code> will trigger the effect on refresh. 
      </p>
    </div>
  </div>
</section>