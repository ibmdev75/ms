<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="components">
  <div class="page-header">
    <h1>Components <small>Item box, ...</small></h1>
  </div>

  <h2>Carousel</h2>
  
  <p>
    Bootstrap <a href="docs/lib/bootstrap/javascript.html#carousel">Carousel</a> is available in JCMS. Developers must include <code>carousel.js</code> in their templates.
    PortletQueryForeach provides a simple Carousel template <code>doPortletQueryForeachCarousel.jsp</code> with custom layout for Publication with DataImage.
  </p> 
  <p>Nothing is done for Ajax-Refresh. Developers must add hooks to handle Ajax-Refresh if needed.</p>

  <h2>Item Box</h2>
  <div class="row br">
    <div class="col-md-6">
    <h3>List Item Box</h3>
      <p>Display a vertical list of items with date information and edit icon.</p>
      <div class="item-box">
        <ul class="items">  
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info">item-info</span> UL.items > item-icons</li>
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info">item-info</span> UL.items > item-icons</li>
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info">item-info</span> UL.items > item-icons</li>
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info item-date-new">item-date-new</span> <%= lorem %></li>
          <li><div class="item-icons">  ... </div> <span class="item-info item-date-today">item-date-today</span> UL.items > item-icons</li>
        </ul>
        <div class="item-box-footer">  
          <a href="#" onclick="return false;"><jalios:icon src="add" /> DIV.item-box-footer</a>  
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <h3>Table Item Box</h3>
      <p>Display a vertical list of items with date information and edit icon.</p>
      <div class="item-box">
        <table class="items">   
          <tr class="item"><td width="1%"><div class="item-info">item-info</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> TR.items > item-icons text</td></tr>
          <tr class="item"><td width="1%"><div class="item-info">item-info</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> TR.items > item-icons text</td></tr>
          <tr class="item"><td width="1%"><div class="item-info">item-info</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> TR.items > item-icons text</td></tr>
          <tr class="item"><td><div class="item-info item-date-new">item-date-new</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> <%= lorem %></td></tr>
          <tr class="item"><td><div class="item-info item-date-today">item-date-today</div></td> <td><div class="item-icons">  ... </div> TR.items > item-icons text</td></tr>
          <tr>  
            <td colspan="2" class="item-box-footer">  
              <a href="#" onclick="return false;"><jalios:icon src="add" /> TD.item-box-footer</a>  
            </td>  
          </tr>  
        </table>
      </div>
    </div>
  </div>
  
  <div class="row br">
    <div class="col-md-6">
      <h3>Form Item Box</h3>
      <p>Display vertical itembox with checkbox, fields, icons (for task features)</p>
      <div class="item-box">
        <ul class="items">
          <li>
            <form class="inline" action="#">
              <input type="checkbox" name="check"/>
              <a href="#">Msg 1</a>
              <input type="text"     name="demo" />
              <a href="#">Msg 2</a>
              <a href="#"><jalios:icon src="edit" /></a>
            </form>
          </li>
          <li>
            <form class="inline" action="#">
              <input type="checkbox" name="check" />
              <a href="#">Msg 1</a>
              <input type="text"     name="demo" />
              <a href="#">Msg 2</a>
              <a href="#"><jalios:icon src="bell" /></a>
            </form>
          </li>
          <li>Sample text <a href="#">Sample link</a></li>
          <li>
            <form class="inline" action="#">
              <input type="checkbox" name="check" />
              <a href="#">Msg 1</a>
              <input type="text"     name="demo" />
              <a href="#">Msg 2</a>
              <a href="#"><jalios:icon src="menu"  /></a>
            </form>
          </li>
        </ul>
      </div>
    </div>
    <div class="col-md-6">&nbsp;</div>
  </div>
    
  
  <h2>Gauge</h2>
  <div class="row br">
    <div class="col-md-6">
      <h3>Usage</h3>
      <p>Component to displays gauges</p>
<pre class="prettyprint linenums">
&lt;div class="gauge"&gt;
  &lt;span class="start"&gt;0%&lt;/span&gt;
  &lt;div class="comfort" style="width: 70%;"&gt;&lt;/div&gt;
  &lt;div class="warning" style="width: 20%;"&gt;&lt;/div&gt;
  &lt;div class="danger" style="width: 10%;"&gt;&lt;/div&gt;
  &lt;div class="progress" style="width: 50%;"&gt;
    &lt;span class="status"&gt;50%&lt;/span&gt;
  &lt;/div&gt;
  &lt;span class="end"&gt;100%&lt;/span&gt;
&lt;/div&gt;
</pre>
    </div>
    <div class="col-md-6">
      <h3>Sample</h3>
      <p>Large gauge to display status, steps, quota,...</p>
          
      <div class="gauge">
        <span class="start">0%</span>
        <span class="end">100%</span>
      </div>
      
      <div class="gauge">
        <span class="start">0%</span>
        <div class="progress" style="width: 5%;"><span class="status">5%</span></div>
        <span class="end">100%</span>
      </div>
      
      <div class="gauge">
        <span class="start">0%</span>
        <div class="progress" style="width: 50%;"><span class="status">50%</span></div>
        <span class="end">100%</span>
      </div>
      
      <div class="gauge">
        <span class="start">0%</span>
        <div class="progress" style="width: 95%;"><span class="status">95%</span></div>
        <span class="end">100%</span>
      </div>
      
      Gauge with section
      <div class="gauge">
        <span class="start">0%</span>
          <div class="comfort" style="width: 70%;"></div>
          <div class="warning" style="width: 20%;"></div>
          <div class="danger" style="width: 10%;"></div>       
        <div class="progress" style="width: 45%;"><span class="status">45%</span></div>
        <span class="end">100%</span>
      </div>

      <h4>Mini Gauge</h4>
      <p>Mini gauge for results, ...</p>
      
      &nbsp;Matching <div class="gauge tiny"></div><br/>
      &nbsp;Search <div class="gauge tiny"><div class="progress" style="width: 5%;"></div></div><br/>
      &nbsp;Result <div class="gauge tiny"><div class="progress" style="width: 50%;"></div></div><br/>
      &nbsp;Accuracy <div class="gauge tiny"><div class="progress" style="width: 95%;"></div></div>
    </div>
  </div>
  <h2>Ctxmenu</h2>
  <div class="row br">
    <div class="col-md-6">
      <h3>Ajax</h3>
      <p>Contextual Menu relies on Ajax-Refresh (and no longer use JSON-RPC). It relies to <a href="http://twitter.github.io/bootstrap/javascript.html#dropdowns">Bootstrap's Dropdown</a></p>
      <p>A common <code>UL#ctxAjaxMenu</code> is refreshed for the given trigger. (all Ajax-Refresh hooks are available)</p>
<pre class="prettyprint linenums">
&lt;a href="#" class="ctxmenu ID_c_1234"&gt;Link&lt;/a&gt;
&lt;a href="#" data-jalios-id="ID_c_1234" data-jalios-action="ctxmenu"&gt;Link&lt;/a&gt;
</pre>
      <p>Default refresh URL <code>ctxmenu.jsp</code> use resource helper <code>jcms.resource.ctxmenu.{id/type}</code> with <code>JcmsId</code> to dispatch request.</p>
      <p>Defined JSP provides hooks <code>CTXMENU_HEADER_PUBLICATION</code> <code>CTXMENU_FOOTER_PUBLICATION</code> to add menu.</p>
      <p>Classes <code>ctxmenu-right</code> can be used to handle right click</p>
    </div>
    <div class="col-md-6">
      <h3>Static</h3>
      <p>Contextual Menu can also be static using previous behavior (for backward compatibility)</p>
      <p>The trigger seek for a menu with an ID matching one of his className</p>
<pre class="prettyprint linenums">
&lt;a href="#" class="ctxWsMenu"&gt;Menu&lt;/a&gt;
&lt;ul id="ctxWsMenu" class="dropdown-menu topbar-menu"&gt;...&lt;/ul&gt;
</pre>
      <p>Links with class <code>ctxWsMenu</code> will trigger menu with id <code>ctxWsMenu</code></p>
    </div>
  </div>
  <h2>TreeCat</h2>
  <div class="row br">
    <div class="col-md-6">
      <h3>Usage</h3>
      <p>Tree of categories. For real use case use <code>&lt;jalios:treecat /&gt;</code> instead.</p>
<pre class="prettyprint linenums">
&lt;jalios:treecat
   rootSet="&lt;%= ... %&gt;"
   rootDisplay="&lt;%= false %&gt;"
   filterMember="&lt;%= TreeCat.FILTER_NONE %&gt;"
   nodeAjaxSuffix="&lt;%= "doc" %&gt;"
   level="&lt;%= 1 %&gt;"
   portalDisplay="&lt;%= false %&gt;"
   workspaceDisplay="&lt;%= false %&gt;"
/&gt;
</pre>  
    </div>
    <div class="col-md-3">
      <h3>Links</h3>
      <p>Sample very simple tree of links. 
      <ul class="TreeCat follow">
        <li class="tree-close">
          <img class="node" alt="+" src="s.gif">
          <jalios:icon src="folder" />
          <a href="#"><span class="title">Lorem ipsum</span></a>
        </li>
        <li class="tree-open">
          <img class="node" alt="+" src="s.gif">
          <jalios:icon src="folder" />
          <a href="#"><span class="title">Lorem ipsum</span></a>
          <ul>
            <li class="tree-leaf">
              <img class="node" alt="+" src="s.gif">
              <jalios:icon src="folder" />
              <a href="#"><span class="title">Lorem ipsum</span></a>
            </li>
          </ul>
        </li>
        <li class="tree-close">
          <img class="node" alt="+" src="s.gif">
          <jalios:icon src="folder" />
          <a href="#"><span class="title">Lorem ipsum</span></a>
        </li>
      </ul>
      
      <h3>Inputs</h3>
      <p>Sample tree of inputs.</p>
      <ul class="TreeCat follow">
        <li class="tree-close">
          <img class="node" alt="+" src="s.gif">
          <input type="checkbox" value="" name="cids" />
          <jalios:icon src="folder" />
          <a href="#"><span class="title">Lorem ipsum</span></a>
        </li>
        <li class="tree-open">
          <img class="node" alt="+" src="s.gif">
          <input type="checkbox" value="" name="cids" />
          <jalios:icon src="folder" />
          <a href="#"><span class="title">Lorem ipsum</span></a>
          <ul>
            <li class="tree-leaf">
              <img class="node" alt="+" src="s.gif">
              <input type="checkbox" value="" name="cids" />
              <jalios:icon src="folder" />
              <a href="#"><span class="title">Lorem ipsum</span></a>
            </li>
          </ul>
        </li>
        <li class="tree-close">
          <img class="node" alt="+" src="s.gif">
          <input type="checkbox" value="" name="cids" />
          <jalios:icon src="folder" />
          <a href="#"><span class="title">Lorem ipsum</span></a>
        </li>
      </ul>
    </div>
    <div class="col-md-3">
      <h3>&lt;jalios:treecat&gt;</h3>
      <p>Live sample with a treecat</p>
      <jalios:treecatview
            collection="<%= Arrays.asList(channel.getRootCategory().getChildrenSet()) %>"
            dragdrop="<%= dragdrop %>"
            showCtxMenu="false"
      />
    </div>
  </div>
    
  <h2>Tabs</h2>
	<div class="row">
	  <div class="col-md-6">
	  
	    <h3>TabPane</h3>
	    <p>The JCMS tabpane framework <strong>has been deprecated</strong> since JCMS 8. Developers must use <a href="http://twitter.github.com/bootstrap/components.html#navs" target="_blank">Bootstrap Tabs</a>.</p>
	    <p>A <a href="docs/jsdoc/$.jalios.ui.Tab.jsp">jQuery wrapper</a> ensure backward compatibility. Developpers should use new function in their code.</p>
	    
		  <div class="tab-pane">
		    <div class="tab-page">
		      <h2 class="tab"><a href="#" onclick="return false;">Tab 1</a></h2>
		      <p>Lorem ipsum dolor sit amet</p>
		    </div>
		    <div class="tab-page">
		      <h2 class="tab"><jalios:icon src="jalios" /> Tab 2</h2>
		      <p>An other TabPane in the TabPane:</p>
		      
		      <div class="tab-pane">
		        <div class="tab-page">
		          <h2 class="tab"><a href="#" onclick="return false;">Tab 2.1</a></h2>
		          <p>Lorem ipsum dolor sit amet</p>
		        </div>
		        <div class="tab-page">
		          <h2 class="tab"><a href="#" onclick="return false;"><jalios:icon src="jalios" /> Tab 2.1</a></h2>
		          <p>Lorem ipsum dolor sit amet</p>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="alert alert-info">
		    <strong>Note:</strong> Adding attribute <code>data-jalios-prefs</code> on nav-tabs will backup in a session cookie current opened tab.
		  </div>
		  
	  </div>
	  <div class="col-md-6">
	  
	    <h3>InnerTabs</h3>
	    <p>
	      The JCMS tabpane framework <strong>has been modified</strong> since JCMS 8. 
	      Developers must use <a href="http://twitter.github.com/bootstrap/components.html#navs" target="_blank">Bootstrap Tabs</a>.
	      Then wrap the Bootstrap's tabs by <code>DIV.inner-tabs</code> to get previous L&F.
	    </p>
	    <p>A JavaScript shim add <code>.nav .nav-tabs .nav-static</code> to old inner-tabs</p>
	    
	    <h4>Default</h4>
	    
	    <div class="inner-tabs sticky-bottom">
	    <ul>
	      <li><a href="#" class="ajax-refresh"><jalios:icon src="page" /> Ajax-Refresh - Tab 1 <span class="badge">8</span></a></li>
	      <li class="active"><a href="#" class="ajax-refresh">Ajax-Refresh - Tab 2</a></li>
	    </ul>
	  </div>
	  <p style="border: 1px solid #BFBFBF; border-top: none;"><%= lorem %></p>
	    
	    <h4>Reverse</h4>
	    
	    <div class="inner-tabs reverse sticky-bottom">
	    <ul>
	      <li><a href="#" class="ajax-refresh"><jalios:icon src="page" /> Ajax-Refresh - Tab 1</a></li>
	      <li><a href="#" class="ajax-refresh"><jalios:icon src="page" /> Ajax-Refresh - Tab 3</a></li>
	    </ul>
	  </div>
	  <p style="border: 1px solid #BFBFBF; border-top: none; background-color: #EBEFF5;"><%= lorem %></p>
	    
	    <h4>Glass</h4>
	    
	    <div style="padding-top: 36px; background-color: #CC3333;">
	      <div class="inner-tabs glass">
	        <ul>
	          <li><a href="#" class="ajax-refresh"><jalios:icon src="page" /> Ajax-Refresh - Tab 1</a></li>
	          <li class="active"><a href="#" class="ajax-refresh">Ajax-Refresh - Tab 2</a></li>
	        </ul>
	      </div>
	    </div>
	    <p style="border: 1px solid #BFBFBF; border-top: none;"><%= lorem %></p>
	  </div>
	</div>
    
  <h2>Autocomplete <small>(Typeahead...)</small></h2>
  <div class="row br">
    <div class="col-md-6">
      
      <p>The JCMS autocomplete framework has been deprecated since JCMS 8. Developers must use <a href="http://twitter.github.com/bootstrap/javascript.html#typeahead">Bootstrap Typeahead</a>.</p>
      <p>Now, autocomplete relies on ajax-refresh to display content</p>
      <ul>
        <li>Default behavior use <code>data-jalios-ajax-refresh-url</code> to perform refresh</li>
        <li>The <code>LI.ajax-refresh</code> will trigger refresh on sub link</li>
        <li>Use <code>data-jalios-target</code> attribute to refresh an other container</li>
      </ul>
      <p>Typeahead has been improved to handle autocomplete in TextArea.</p>
      
      <h3>Widget Chooser</h3>
      <p>Widget Chooser improve autocomplete to handle 2 fields:</p>
      <ul>
        <li>the input id</li>
        <li>the input placeholder</li>
      </ul>
      
      <h3>Wiki Autocomplete</h3>
      <p>The wiki improve autocomplete to handle <code>CTRL + SPACE</code> shortcut.</p>
      
    </div>
    <div class="col-md-6">
      <h3>Sample</h3>
      <p>The class <code>UL.typeahead-photo</code> extends layout to display photo. Element under <code>LI > A</code> may contains <code>SPAN</code> or <code>BR</code>.</p>
<pre class="prettyprint linenums">
  &lt;input class="typeahead" data-jalios-ajax-refresh-url="path/to/page.jsp"/&gt;
</pre>
<pre class="prettyprint linenums">
  &lt;ul class="dropdown-menu"&gt;
    &lt;li data-value="itemId1"&gt;&lt;a href="#"&gt;Matching Item 1&lt;/a&gt;&lt;/li&gt;
    &lt;li data-value="itemId2"&gt;&lt;a href="#"&gt;Matching Item 2&lt;/a&gt;&lt;/li&gt;
    &lt;li class="ajax-refresh"&gt;&lt;a href="path/jsp"&gt;text&lt;/a>&lt;/li&gt;
  &lt;/ul&gt;
</pre>
      <div class="typeahead-menu" style="position: static;">
			  <ul class="dropdown-menu typeahead-photo" style="display: block; position: static">
				  <li data-value="itemId1"><a href="#"><span class="thumb"><img src="s.gif" alt=""/></span> Matching Item 1 from autocompelte<br/><span class="info">Some informations about...</span></a></li>
				  <li data-value="itemId2"><a href="#"><span class="thumb"><img src="s.gif" alt=""/></span> Matching Item 2 from autocompelte<br/><span class="info">Some informations about...</span></a></li>
				  <li class="ajax-refresh next"><a href="#"><%= glp("ui.com.lbl.next-result") %></a></li>
				</ul>
		  </div>
    </div>
  </div>
</section>
