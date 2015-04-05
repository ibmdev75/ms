<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="forms">
  <div class="page-header">
    <h1>Forms <small>Buttons, Inputs, Area...</small></h1>
  </div>
  <form id="testForm" name="testForm" action="" method="post" class="lang-trigger"  lang="<%= channel.getLanguage() %>">
    <h2>Buttons</h2>
    <p>Since JCMS 8, the <code>.formButton</code> is deprecated. Developers should use instead Bootstrap <code>.btn</code>. The <code>.formButton</code> is still backward compatible.</p>
    <div class="row br">
      <div class="col-md-6">
        <h3>Types</h3>
        <p>Handle multiple tags: Input, Button and Links</p>
        <div class="br">
          <input  class="btn btn-default" name="opAction" value="Button" type="submit"/>
          <button class="btn btn-default" name="opAction" >Button</button>
          <a href="#" class="btn btn-default" >Button</a>
        </div>
        <div class="br">
          <button class="btn btn-default" name="opAction" ><jalios:icon src="jalios"  alt="Jalios"/> Button</button>
          <a href="#" class="btn btn-default" ><jalios:icon src="jalios"  alt="Jalios"/> Button</a>
        </div>
        <div class="br">
          <a href="#" class="btn btn-default demoBtnCtxMenu" onClick="return false;">Drop Button <jalios:icon src="dropdown" /></a>
          <ul class="ctxMenu click aligned" id="demoBtnCtxMenu" style="display: none;">
            <li><span>Hello</span></li>
            <li><span>World</span></li>
          </ul>
        </div>
      </div>
        
      <div class="col-md-6">
        <div class="br">
            <h3>Colors</h3>
            <p>Handle multiple bootstrap colors and : <code>btn-primary</code> and <code>btn-danger</code></p>
            <input  class="btn" name="opAction" value="Button" type="submit"/>
            <input  class="btn btn-primary" name="opAction" value="Button" type="submit"/>
            <input  class="btn btn-danger" name="opAction" value="Button" type="submit"/>
        </div>
      </div>
    </div>
          
    <h2>Inputs</h2>
    <p>New look and feel for all inputs. Input's size is defined by 'size' attribute and ca be overrided by <code>span-*</code> classes</p>
    <div class="row br">
      <div class="col-md-6">
        <h3>Usage</h3>
<pre>
&lt;jalios:field  name="kw_list" label="Sample Keyword" description="Sample field description" value="Sample keyword" mv="1" keyword="true"%&gt;
  &lt;jalios:control type="&lt;%= ControlType.TEXTFIELD %%&gt;" /%&gt;
&lt;/jalios:field%&gt;
</pre>

        <jalios:field  name="kw_list" label="Sample Keyword" description="Sample field description" value="Sample keyword" mv="1" keyword="true">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
          
        <h4>Search</h4>
    
        <div class="input-append">
          <input type="text" name="search" class="search" size="20" placeholder="Rechercher" value="" />
            <button type="submit" class="btn btn-default add-on">
              <jalios:icon src="magnifier"  />
            </button>
            <a href="front/search.jsp" class="btn btn-default add-on icon">
             <jalios:icon src="dropdown"  />
           </a>
        </div>

        <p class="clear">The class <code>.add-on</code> works like <code>.stick-btn</code> but to stick texfields (smaller height)</p>

        <h4>Select</h4>
          
        <select class="formSelect" name="classname">
          <option selected="selected" value="">All</option>
          <option value="1">Item 1</option>
          <option value="2">Item 2</option>
          <option value="3">Item 3</option>
          <option value="4">Item 4</option>
        </select>
          
        <input  class="btn btn-default" name="opAction" value="Button" type="submit"/>
        <button class="btn btn-default" name="opAction" >Button</button>
        <a href="#" class="btn btn-default" >Button</a>
          
      </div>
      <div class="col-md-6">
        <h3>Simple</h3>
        <jalios:field  name="textfield" label="Sample label" description="Sample field description" required="true" ml="true">
          <jalios:control settings='<%= new TextFieldSettings().placeholder("Sample Placeholder") %>' />
        </jalios:field>
              
        <jalios:field  name="textfield" label="Sample password" description="Sample field description" required="true" ml="false" value="Sample password">
          <jalios:control type="<%= ControlType.PASSWORD %>" />
        </jalios:field>
              
        <jalios:field  name="textfield" label="Sample Member" description="Sample field description" required="true" value="j_2">
          <jalios:control type="<%= ControlType.MEMBER %>" />
        </jalios:field>
              
        <jalios:field  name="textfield_list" label="Sample label" description="Sample field description" required="true" value="Sample value" mv="1">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
      </div>
    </div>
          
	<h2>TextArea</h2>
    <div class="row br">
      <div class="col-md-6">
        <h3>Usage</h3>
        <p>New look and feel for all areas.</p>
<pre>
&lt;jalios:field  name="textarea" label="Sample label" required="true" ml="true" value="Sample value"%&gt;
  &lt;jalios:control settings='&lt;%= new TextAreaSettings().rows(2) %%&gt;' /%&gt;
&lt;/jalios:field%&gt;
</pre>
      </div>
      <div class="col-md-6">
        <h3>Simple</h3>
        <jalios:field  name="textarea" label="Sample label" required="true" ml="true" value="Sample value">
          <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
        </jalios:field>

        <h3>Wiki</h3>
        <jalios:field  name="wikiarea" label="Sample Wiki" required="true" ml="true" value="Sample wiki value">
          <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
        </jalios:field>
          
        <h3>Multivalued</h3>
        <jalios:field  name="textarea_list" label="Sample label" description="Sample field description" required="true" value="Sample value" mv="1">
          <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
        </jalios:field>
      </div>
    </div>

    <h2>Helpers</h2>
    <div class="row">
      <div class="col-md-4">
        <h3>Miscs</h3>
        <p>Widget's DIVs have a width of 100% to be nowrap in table, tabs, ... </p>
        <p>The wrapping class <code>.widget-auto</code> will reset width to auto. Very usefull to align widgets.</p>
      </div>
      <div class="col-md-4">
        <h3>Form</h3>
        <p><code>FORM.layout</code> removes the padding/margin</p>
      </div>
      <div class="col-md-4">
      </div>
    </div>
  </form>
</Section>