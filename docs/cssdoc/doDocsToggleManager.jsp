<%@ include file="/jcore/doInitPage.jspf" %>
<section id="togglemanager">
  <div class="page-header">
    <h1>ToggleManager <small>Replace simple JavaScript by CSS</small></h1>
  </div>
  
  <div class="row">
    <p>
      The <a href="docs/jsdoc/$.jalios.ToggleManager.jsp">ToggleManager</a> is a new component of JCMS 8. It is bound to DataBroker like Modal, Ajax-Refresh, etc, ...
      The goal is to replace custom simple JS code by CSS classes.
    </p>

<pre>
&lt;a href="#" data-jalios-action="toggle:clazz"&gt;Link&lt;/a&gt;  
</pre>    
    
    <p>
      The <code>data-*</code> attribute is processed in 2 parts: {action}:{value} and toggle (add/remove) the class <code>clazz</code> on element.
    </p>
    <div class="row">
      <div class="col-md-6">
          <h5>{action}</h5>
          <ul>
            <li><code>toggle</code>: add/remove {value}</li>
            <li><code>add</code>: add {value}</li>
            <li><code>remove</code>: remove {value}</li>
            <li><code>sync</code>: synchronize {value}</li>
            <li><code>run</code>: run window.{value}(elm)</li>
          </ul>
      </div>
      <div class="col-md-6">
          <h5>{value}</h5>
          <ul>
            <li><code>class</code>: any classes</li>
            <li><code>data-*</code>: any data attribute</li>
            <li><code>disabled</code>: toggle class/status disable</li>
            <li><code>checked</code>: toggle state class</li>
            <li><code>title</code>: works with title</li>
          <li><code>longdesc</code>: works with longdesc</li>
          <li><code>value</code>: works with value</li>
          </ul>
      </div>
    </div>

<pre>
&lt;a href="#" data-jalios-action="toggle:hide" data-jalios-target="#MyId"&gt;Link&lt;/a&gt;
</pre>
    
    <p>
      The Toggle Manager use secondary attribute to perform toggle on third party elements. In this sample code the class <code>hide</code> is toggled on <code>#MyId</code>.
      <ul>
        <li><code>data-jalios-target</code>: CSS selector of target elements (could be split by | for multiple action)</li>
        <li><code>data-jalios-target-position</code>: jQuery expression to run selector relatively (closest(), next(), prev(), ...) (could be split by | for multiple action)</li>
        <li><code>data-jalios-target-attribute</code>: define the target attribute if different from source. Can be a jQUery function.</li>
      </ul>
    </p>
    
    <h3>Examples</h3>
    
    <h4>Select DIV</h4>
    <div class="row br">
      <div class="col-md-3">
        <style type="text/css">
          BODY.body .val1 .v1 { display: block; }
          BODY.body .val2 .v2 { display: block; }
          BODY.body .val3 .v3 { display: block; }
        </style>
		        <select name="debug" data-jalios-action="sync:value" data-jalios-target="#debug" data-jalios-target-attribute="class">
		          <option value="val1">Option 1</option>
		          <option value="val2">Option 2</option>
		          <option value="val3">Option 3</option>
		        </select>
		        <div id="debug" class="val1">
		          <div class="v1 hide" style="background: red;">Option 1</div>
		          <div class="v2 hide" style="background: green;">Option 2</div>
		          <div class="v3 hide" style="background: yellow;">Option 3</div>
		        </div>
          </div>
          <div class="col-md-9">
            <p>
              Set a class on <code>#debug</code> according to Select <code>value</code> (val1, val2, val3). 
              Very usefull to show/hide panel according to given option. Inspect code to see CSS styles.
            </p>
          </div>
    </div>
<pre class="br">
&lt;select name="debug" data-jalios-action="toggle:value" data-jalios-target="#debug" data-jalios-target-attribute="class"&gt;
  &lt;option value="val1"&gt;opt1&lt;/option&gt;
  &lt;option value="val2"&gt;opt2&lt;/option&gt;
  &lt;option value="val3"&gt;opt3&lt;/option&gt;
&lt;/select&gt;
&lt;div id="debug"&gt;&lt;/div&gt;
</pre>
    
    <h4>Emphasis radio</h4>
    <div class="row">
      <div class="col-md-3">
              <ul>
                <li><input name="sync1" type="checkbox" data-jalios-action="sync:badge sync:badge-info"    data-jalios-target="SPAN" data-jalios-target-position="next"/> <span>Sync 1</span></li>
                <li><input name="sync2" type="checkbox" data-jalios-action="sync:badge sync:badge-success" data-jalios-target="SPAN" data-jalios-target-position="next"/> <span>Sync 2</span></li>
                <li><input name="sync3" type="checkbox" data-jalios-action="toggle:badge toggle:badge-warning" data-jalios-target="SPAN" data-jalios-target-position="next"/> <span class="badge badge-warning">Toggle 3</span></li>
              </ul>
          </div>
          <div class="col-md-9">
            This demo will toggle classes <code>badge</code> and <code>badge-*</code> on next <code>SPAN</code> of given checkbox.
            The <code>toggle:</code> will switch state but the <code>sync:</code> will toggle according to checkbox state.
          </div>
      </div>
<pre class="br">
&lt;ul&gt;
  &lt;li&gt;&lt;input  data-jalios-action="sync:badge sync:badge-info" name="sync1" type="checkbox"    
              data-jalios-target="SPAN" data-jalios-target-position="next"/&gt; &lt;span&gt;Sync 1&lt;/span&gt;&lt;/li&gt;
  &lt;li&gt;&lt;input  data-jalios-action="sync:badge sync:badge-success" name="sync2" type="checkbox" 
              data-jalios-target="SPAN" data-jalios-target-position="next"/&gt; &lt;span&gt;Sync 2&lt;/span&gt;&lt;/li&gt;
  &lt;li&gt;&lt;input  data-jalios-action="toggle:badge toggle:badge-warning" name="sync3" type="checkbox" 
              data-jalios-target="SPAN" data-jalios-target-position="next"/&gt; &lt;span&gt;Toggle 3&lt;/span&gt;&lt;/li&gt;
&lt;/ul&gt;
</pre>

    <h4>Check/Uncheck All</h4>
    <div class="row">
      <div class="col-md-3">
        <ul id="checkall">
          <li><input name="sync1" type="checkbox" data-jalios-action="sync:checked"  data-jalios-target="#checkall :checkbox"> <span>Check All</span></li>
          <li><input name="sync2" type="checkbox"> <span>Check 1</span></li>
          <li><input name="sync3" type="checkbox"> <span>Check 2</span></li>
        </ul>
      </div>
      <div class="col-md-9">
        An other <code>sync</code> demo with attribute <code>checked</code> to check/uncheck all checkbox.
      </div>
    </div>
<pre class="br">
&lt;ul id="checkall"&gt;
  &lt;li&gt;&lt;input  data-jalios-action="sync:checked"  name="sync1" type="checkbox"
              data-jalios-target="#checkall :checkbox"&gt; &lt;span&gt;Check All&lt;/span&gt;&lt;/li&gt;
  &lt;li&gt;&lt;input name="sync2" type="checkbox"&gt; &lt;span&gt;Check 1&lt;/span&gt;&lt;/li&gt;
  &lt;li&gt;&lt;input name="sync3" type="checkbox"&gt; &lt;span&gt;Check 2&lt;/span&gt;&lt;/li&gt;
&lt;/ul&gt;
</pre>


    <h4>Toggle Description</h4>
    <div class="row">
      <div class="col-md-3">
	      <a href="#" data-jalios-action="toggle:hide-scroll toggle:animated" data-jalios-target=".desc2" data-jalios-target-position="next">Toggle Hide-Scroll</a>
	      <div class="desc2 hide-scroll tada br">
	        <textarea rows="1">TextArea Hide-Scroll</textarea>
	      </div> 
	      
	      <a href="#" data-jalios-action="toggle:hide"        data-jalios-target=".desc1" data-jalios-target-position="next">Toggle Hide</a>
	      <div class="desc1 hide br">
	        <textarea rows="1">TextArea Hide</textarea>
	      </div> 
      </div>
      <div class="col-md-9">
        <p>Link will toggle class <code>hide</code> on <code>DIV.desc</code>.</p>
      </div>
    </div>
    
<pre class="br">
&lt;a href="#" data-jalios-action="toggle:hide" data-jalios-target=".desc" data-jalios-target-position="next"&gt;Click me&lt;/a&gt;  
&lt;div class="desc hide"&gt;lorem Ipsum dolor sit amet&lt;/div&gt; 
</pre>
    
    <div class="row">
      <div class="col-md-3">
        <style type="text/css">
          .desc-div            { display: none; }
          .desc-show .desc-div { display: block; }
          .desc-show .desc-link{ display: none; }
        </style>
        <div class="wrapper"> 
          <a   class="desc-link" href="#" data-jalios-action="toggle:desc-show" data-jalios-target=".wrapper" data-jalios-target-position="closest">Show</a>  
          <div class="desc-div">
            lorem Ipsum dolor sit amet<br/>
            <a href="#" data-jalios-action="toggle:desc-show" data-jalios-target=".wrapper" data-jalios-target-position="closest">Hide</a>
          </div>  
        </div>
      </div>
      <div class="col-md-9">
        <p>Links will toggle a class <code>desc-show</code> on <code>DIV.wrapper</code>. Inspect code to see CSS styles.</p>
      </div>
    </div>
    
<pre class="br">
&lt;div class="wrapper"&gt; 
  &lt;a class="desc-link" data-jalios-action="toggle:desc-show" data-jalios-target=".wrapper"
                       data-jalios-target-position="closest" href="#"&gt;Show&lt;/a&gt;  
  &lt;div class="desc-div"&gt;
    lorem Ipsum dolor sit amet&lt;br/&gt;
    &lt;a data-jalios-action="toggle:desc-show" data-jalios-target=".wrapper"
       data-jalios-target-position="closest" href="#"&gt;Show&lt;/a&gt;  
  &lt;/div&gt;  
&lt;/div&gt;
</pre>
    
    <h4>Gotcha</h4>
    <div class="row">
      <div class="col-md-3">
        <input name="debug" size="15" type="text" data-jalios-action="sync:value" data-jalios-target=".gotcha1" data-jalios-target-attribute="html"/>
          <div class="gotcha1">HTML to update</div>
                <div class="gotcha1">HTML to update</div>
                <div class="gotcha1">HTML to update</div>
      </div>
      <div class="col-md-9">
        <p>On textfield, <code>focusin</code>/<code>focusout</code> trigger ToggleManager. In this demo, the input <code>value</code> is synchronized with <code>html()</code>of <code>DIV.gotcha</code></p>
      </div>
    </div>
<pre class="br">
&lt;input data-jalios-action="sync:value" data-jalios-target=".gotcha1" 
       data-jalios-target-attribute="html" name="debug" type="text"/&gt;
&lt;div class="gotcha1"&gt;HTML to update&lt;/div&gt;
&lt;div class="gotcha1"&gt;HTML to update&lt;/div&gt;
&lt;div class="gotcha1"&gt;HTML to update&lt;/div&gt;
</pre>

    <h4>2 Actions in one trigger</h4>
    <div class="row">
      <div class="col-md-3">
        <input type="button" class="btn btn-default" value="Click Me" 
               data-jalios-action="sync:action1 sync:action2"
               data-jalios-target=".target1|.target2"
               data-jalios-target-position="findNext"
               data-jalios-target-attribute="html"/>
        <div><p class="target1"></p></div>
        <div><p class="target2"></p></div>
      </div>
      <div class="col-md-9">
        <p>The <code>data-jalios-action</code> can have multiple action separated by space.</p>
        <p>The <code>data-jalios-target</code> and <code>data-jalios-target-position</code> can be separated by '|' and will be linked to action at the same index.</p>
      </div>
    </div>
<pre class="br">
&lt;input type="button" class="btn btn-default" value="Click Me" 
       data-jalios-action="sync:action1 sync:action2"
       data-jalios-target=".target1|.target2"
       data-jalios-target-position="findNext"
       data-jalios-target-attribute="html"/&gt;
&lt;div&gt;&lt;p class="target1"&gt;&lt;/p&gt;&lt;/div&gt;
&lt;div&gt;&lt;p class="target2"&gt;&lt;/p&gt;&lt;/div&gt;
</pre>
  </div> 
</section>