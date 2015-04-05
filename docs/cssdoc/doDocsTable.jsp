<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="tables">
  <div class="page-header">
    <h1>Tables <small>Layout, stripped, ...</small></h1>
  </div>
  
  <p>Since JCMS 7.1.1 and Bootstrap 2.0.x default tables are unstyled. In JCMS 7.1.0 and Bootstrap 1.4 the class <code>.layout</code> was required.</p>
  
  <h3>Helpers</h3>
  <div class="row br">
    <div class="col-md-8">
      <p>All CSS are scoped to the table using <code> > </code> and should not have side effects to sub tables</p>
      <p>See also Bootstrap Table section for more information.</p>
        
	    <ul>
	      <li>Add <code>TABLE.auto</code> to set a with to auto. (Default width is set to <code>100%</code> )</li>
	      <li>Add <code>TABLE.vTop</code> to set <code>vertical-align: top;</code> to all <code>TD</code></li>
	      <li>Add <code>TABLE.vMiddle</code> to set <code>vertical-align: middle;</code> to all <code>TD</code></li>
	      <li>Add <code>TABLE.vBottom</code> to set <code>vertical-align: bottom;</code> to all <code>TD</code></li>
	      <li>Add <code>TABLE.fit</code> to set <code>width: 1%;</code>and a padding to all <code>TD</code>. Class can be set on TD.</li>
	      <li>Add <code>TABLE.gutter</code> to set <code>width: 1%;</code>and a width of <code>@baseline</code>. Class can be set on TD.</li>
	      <li>Add <code>TD.spacer</code> or <code>TH.spacer</code> to set <code>width: 100%;</code></li>
	      <li>The attribute <code>align=*</code> has been backed by <code>TD.txt-*</code> classes. 
	      <li>The attribute <code>nowrap</code> has been backed by <code>TD.nowrap</code> classes.
	    </ul>
        
    </div>
    <div class="col-md-4">
      <h4>Cleanup</h4>
      <ul>
        <li>Remove all <code>listHeader</code> and wrap with <code>THEAD</code></li>
        <li>Rename all <code>.table table-striped table-bordered table-hover</code> to <code>.table-data</code></li>
        <li>Remove all even / odd / highlight code declaration</li>
        <li>Replace <code>nowrap</code>, <code>align</code>, <code>BR</code>... with classes</li>
      </ul>
    </div>
  </div>

  <h3>Layout</h3>
  <p>The <code>TABLE.layout</code> should behave like <code>TABLE</code> but class allow a better scope/semantic.</p>
  <table class="layout" style="border: 1px solid #DDD">
    <tr>
      <td><jalios:icon src="jalios"  alt="Jalios"/> Title 1</td>
      <td>Title 2</td>
      <td>Title 3</td>
    </tr>
    <tr>
      <td nowrap="nowrap"><jalios:icon src="jalios"  alt="Jalios"/> Content 1</td>
      <td><%= lorem %></td>
      <td>Content 3 <jalios:icon src="jalios"  alt="Jalios"/></td>
    </tr>
    <tr>
      <td>Content 1</td>
      <td>Content 2 <jalios:icon src="jalios"  alt="Jalios"/></td>
      <td><%= lorem %></td>
    </tr>
  </table>
  
	<h3>BackOffice</h3>
	<p>Modified version of default table to display backoffice content. Colors are declared as variables: <code>@boTableHeaderColor</code>, <code>@boTableBgColorEven</code>, <code>@boTableBgColorOdd</code></p>
	<table class="table-data table-condensed">
	  <thead>
	    <tr>
	      <td><jalios:icon src="jalios"  alt="Jalios"/> Title 1</td>
	      <td>Title 2</td>
	      <td>Title 3</td>
	    </tr>
	  </thead>
	  <tr>
	    <td nowrap="nowrap"><jalios:icon src="jalios"  alt="Jalios"/> Content 1</td>
	    <td><%= lorem %></td>
	    <td>Content 3
	      <ul>
	        <li>Item 1</li>
	        <li>Item 2</li>
	        <li>Item 3</li>
	        <li>Item 4</li>
	        <li>Item 5</li>
	        <li>Item 6</li>
	      </ul>
	    </td>
	  </tr>
	  <tr>
	    <td>Content 1</td>
	    <td>Content 2 <jalios:icon src="jalios"  alt="Jalios"/></td>
	    <td><%= lorem %></td>
	  </tr>
	</table>


  <h3>Peer</h3>
  <div class="row">
    <div class="col-md-6">
      <p>Key/Value Table really usefull for Forms.</p>
      <p><strong>Note:</strong> The <code>.formLabel</code> might be renamed. A big cleanup is required. formLabel do not have the same style than widget's label.</p>
      <table class="layout peer">
        <tr>
          <th>Label TH</th>
          <td>
         <jalios:field  name="textfield_list" description="Sample field description" required="true" value="Sample value">
  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
</jalios:field>

          </td>
        </tr>
        <tr>
          <td><span class="formLabel">formLabel</span></td>
          <td>
         <jalios:field  name="textfield" description="Sample field description" value="Sample value" mv="1">
  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
</jalios:field>

          </td>
        </tr>
        <tr>
          <th><label>Label TH</label></th>
          <td class="widget-auto">
            <jalios:field  name="fromBCC">
              <jalios:control type="<%= ControlType.BOOLEAN %>" />
            </jalios:field>
          </td>
        </tr>
        <tr>
          <th>Label TH</th>
          <td>
         <jalios:field  name="textfield_list" description="Sample field description" required="true" value="Sample value">
  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
</jalios:field>

          </td>
        </tr>
      </table>
	    <p>Use default class <code>TABLE.peer</code>. Widgets should always be <code>&lt;jalios:field&gt;</code>. A kludge workaroud is to wrap inputs with <code>DIV.widget</code></p>
	  </div>
	  <div class="col-md-6">
	    <h4>Peer List</h4>
	    <p>Use custom class <code>TABLE.peer.strongLabel</code></p>
	    <table class="layout peer strongLabel">
	      <tr>
	        <th>This is a Key</th>
	        <td>This is a Value</td>
	      </tr>
	      <tr>
	        <td class="formLabel">This is a Key</td>
	        <td>This is a Value</td>
	      </tr>
	      <tr>
	        <td class="formLabel">This is a Key</td>
	        <td>This is a Value</td>
	      </tr>
	      <tr>
	        <td class="formLabel">This is a Key</td>
	        <td>This is a Value</td>
	      </tr>
	    </table>
    </div>
  </div>
</section>