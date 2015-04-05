<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="box">
  <div class="page-header">
    <h1>Boxes <small>Skin, Bubble, Area, ...</small></h1>
  </div>

  <h2>Default boxes</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>Usage</h3>
      <p>Basic building blocks are <code>&lt;div.box&gt;</code> with <code>&lt;div.box-body&gt;</code> to set a padding.</p>
      <p>You can also add a header and/or footer <code>&lt;div.box-header&gt;</code> and <code>&lt;div.box-footer&gt;</code></p>
      <p>It's also a mixin ! That can be called throught <code>.box(#000000, #FFFFFF);</code> with default variables <code>@boxBorder</code>, <code>@boxTxtLight</code>, <code@>boxTxtShadow</code></p>
      <p>The <code>@boxPadding</code> define the padding of all boxes (@baseline/2)</p>

<pre>
&lt;body&gt;
  &lt;div class="box"&gt;
    &lt;div class="box-header"&gt;
      &lt;h3&gt;...&lt;/h3&gt;
      ...
    &lt;/div&gt;
    &lt;div class="box-body"&gt;
      ...
    &lt;/div&gt;
    &lt;div class="box-footer"&gt;
      ...
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/body&gt;
</pre>
      <div class="br">
        <h4>Portlets</h4>
        <p>Box layout is used by JCMS default portlets. The reference skin is <code>types/AbstractportletSkinable/doDefaultSkin.jsp</code></p>
        <p>Templates can now append custom style and classes to the skin. The class <code>layout</code> will reset the body's padding.</p>
      </div>
     
      <div class="br">
        <h4>Components and Skins</h4>
        <p>Components and Skins must take care of <code>@boxPadding</code> when setting padding. Some convenient classes will help to set negative margin.</p>
        <ul>
          <li><code>.stick</code> Stick left/right</li>
          <li><code>.stick-footer</code> Stick bottom</li>
          <li><code>.stick-header</code> Stick top</li>
          <li><code>.item-box</code> Stick item-box to box</li>
          <li><code>.item-box-footer</code> Stick item-box-footer to bottom</li>
          <li><code>.inner-tabs</code> Stick left/right</li>
        </ul>
        <p>The mixin <code>#JCMS > .sticky(@boxPadding);</code> can generate classes for a given skin padding amount</p>
      </div>
     
      <h4>Box-Area</h4>
      <p>Convenient <code>.box-area</code> helper to wrap a content in a box. Adding <code>.form-area</code> will improve padding to wrap form's widget correctly</p>
      <div class="box-area br"><%= lorem %></div>
     
      <h4>Bubble</h4>
      <p>Bubble's tail use a background image that can be generic. <code>Tails should be added to images/jalios/assets/bubble</code></p> 
      <div class="box bubble br">
        <div class="box-body"><%= lorem %></div>
        <div class="bubble-tail"></div>
      </div>
    </div>
    <div class="col-md-6"> 
      <h3>Default</h3>
      
      <p>The default gray box <code>#JCMS > .box(#F7F8F8, #D7D7D7);</code></p>
      <div class="box">
        <div class="box-header"><h3>Box Heading</h3></div>
        <div class="box-msg">This is a sample message <strong>with strong</strong> content</div>
        <div class="box-body">The box body.</div>
      </div>
      
      <div class="box bo-table">
        <div class="box-header"><h3>Box Heading</h3></div>
        <div class="box-body">This is a box with <code>class="box bo-table"</code> property to be used with backoffice tables</div>
      </div>
      
      <h3>More options !</h3>
      
      <div class="box tint">
        <div class="box-body">
          <h3>Heading</h3>
          This is a box with <code>class="box tint"</code> property, without header.
          <div class="box-footer">A sample footer</div>
        </div>
      </div>
      
      <p>Boxes can handle many more options <code>#JCMS > .box(lighten(@baseColor, 25%), @baseColor, @white, 4px, 0px, @white, @box-txt-shadow);</code></p>
      <div class="box base-color">
        <div class="box-header"><h3>Box Heading</h3></div>
        <div class="box-edit">box-edit area where you could propose box options edition</div>
        <div class="box-body">body</div>
        <div class="box-footer">footer</div>
      </div>

      <p>Handle links, icons, badges <code>&lt;span class="badge badge-small"&gt;</code> in <code>&lt;div class="box-info"&gt;</code></p>
      <div class="box">
        <div class="box-header">
          <div class="box-info">info <span class="badge badge-small success">5</span>
            <a href="#">link</a>
            <a href="#" class="badge badge-small important">123</a>
            <a href="#"><jalios:icon src="add" alt='<%= glp("ui.com.alt.add") %>' /></a>
            <span class="badge badge-small">18</span>
          </div>
          <h3><jalios:icon src="images/jalios/icons/jalios.gif" alt="page" /> Box Heading <jalios:icon src="bell" alt="page" /></h3>
        </div>
        <div class="box-body">body</div>
        <div class="box-footer">
          <a href="#"><jalios:icon src="add" alt='<%= glp("ui.com.alt.add") %>' /></a>
          footer
          <a href="#">link</a>
        </div>
      </div>
      
      <h3>Sticky display</h3>
      
      <div class="box">
        <div class="box-header"><h4>Header</h4></div>
        <div class="box-body">
          
          <p>JCMS components like <code>inner-tabs</code> or <code>item-box-footer</code> stick to the edges of the box.</p>
          
          <div class="inner-tabs">
            <ul>
              <li>Sticky</li>
              <li class="active">Display</li>
            </ul>
          </div>
          
          <h5>An item-box sample:</h5>
          
          <div class="item-box">
            <ul class="items">  
              <li><span class="item-info">item-info</span> UL.items > item-icons</li>
              <li><span class="item-info item-date-new">item-date-new</span> <%= lorem %></li>
              <li><span class="item-info item-date-today">item-date-today</span> UL.items > item-icons</li>
            </ul>

            <p>A custom paragraph in an item-box</p>
                
            <div class="item-box-footer">  
              <a href="..." class="modal"><jalios:icon src="add" /> DIV.item-box-footer</a>  
            </div>
          </div>
          
        </div>
        <div class="box-footer">Footer</div>
      </div>
    </div>
  </div>
</section>