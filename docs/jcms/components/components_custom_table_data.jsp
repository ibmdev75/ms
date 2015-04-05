<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% String bootstrapUrl = "http://getbootstrap.com/"; %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_custom_table_data.jsp")); %>
<div class="bs-docs-section">
<h1 id="custom-components-table-data" class="page-header">Table data</h1>
<p class="lead">Extension of bootstrap table component (<a href="<%= bootstrapUrl %>css/#table">Documentation</a>)</p>
<p>Less file : jalios-table-data.less</p>

<p>A table-data uses following bootstrap styles : </p>
<ul>
  <li>.table : default bootstrap style for table</li>
  <li>.table-hover : add a style when hovering a TR</li>
  <li>.table-striped : add an even/odd style</li>
  <li>.table-bordered : add border around the table</li>
</ul>
<p>You can use following utilities class to improve your table display : </p>
<ul>
  <li>.numeric : on a TD or a TH, align a numeric cell to the right</li>
  <li>.date-time : on a TD or a TH, align a date cell to the right</li>
  <li>.expand : on a TD or a TH, adds a 100% width on the target TD or TH. There should be only one of this class per row.</li>
  <li>.fit : on a TD or a TH, adds a 1% width on the target TD or TH.</li>
</ul>

<h3 id="table-data-simple">Simple Table data example</h3>
<div class="bs-example">
  <table class="table-data">
    <tr>
      <th>Iterator</th>
      <th class="expand">Title</th>
      <th>Numeric</th>
      <th>Actions</th>
    </tr>
    <tr>
      <td class="numeric">#1</td>
      <td>Lorem ipsum dolor sit amet</td>
      <td class="numeric">28$</td>
      <td><jalios:icon src="edit"/></td>
    </tr>
    <tr>
      <td class="numeric">#2</td>
      <td>Lorem dolor sit amet</td>
      <td class="numeric">33&euro;</td>
      <td><jalios:icon src="edit"/></td>
    </tr>    
    <tr>
      <td class="numeric">#3</td>
      <td>Lorem sit amet</td>
      <td class="numeric">25000&yen</td>
      <td><jalios:icon src="edit"/></td>
    </tr>        
  </table>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("table-data-simple") %></code></pre></div>

<h3 id="table-data-styled">Table data example with Bootstrap styles</h3>
<p>A table-data uses following bootstrap styles : </p>
<div class="bs-example">
  <table class="table-data">
    <tr>
      <th class="fit"></th>
      <th>Title</th>
      <th class="">Label</th>
      <th class="date-time">Date</th>
      <th class="fit">Actions</th>
    </tr>
    <tr>
      <td class="numeric">#1</td>
      <td>Lorem ipsum dolor sit amet</td>
      <td><span class="label label-danger">Danger</span></td>
      <td class="date-time"><jalios:date date="<%= new Date() %>"/></td>
      <td><jalios:icon src="edit"/></td>
    </tr>
    <tr>
      <td class="numeric">#2</td>
      <td>Lorem dolor sit amet</td>
      <td><span class="label label-success">Success</span></td>
      <td class="date-time"><jalios:date date="<%= new Date() %>" format="dateOrTime"/></td>
      <td><jalios:icon src="edit"/></td>
    </tr>    
    <tr>
      <td class="numeric">#3</td>
      <td>Lorem sit amet</td>
      <td><span class="label label-info">Todo</span></td>
      <td class="date-time"><jalios:date date="<%= new Date() %>" format="short"/></td>
      <td><jalios:icon src="edit"/></td>
    </tr>    
    <tr class="danger">
      <td class="numeric">#3</td>
      <td>Lorem sit amet</td>
      <td><span class="label label-info">Todo</span></td>
      <td class="date-time"><jalios:date date="<%= new Date() %>" format="short"/></td>
      <td><jalios:icon src="edit"/></td>
    </tr>          
    <tr class="warning">
      <td class="numeric">#3</td>
      <td>Lorem sit amet</td>
      <td><span class="label label-info">Todo</span></td>
      <td class="date-time"><jalios:date date="<%= new Date() %>" format="short"/></td>
      <td><jalios:icon src="edit"/></td>
    </tr>    
    <tr class="info">
      <td class="numeric">#3</td>
      <td>Lorem sit amet</td>
      <td><span class="label label-info">Todo</span></td>
      <td class="date-time"><jalios:date date="<%= new Date() %>" format="short"/></td>
      <td><jalios:icon src="edit"/></td>
    </tr>    
    <tr>
      <td class="danger numeric">#3</td>
      <td class="success">Lorem sit amet</td>
      <td class="info"><span class="label label-info">Todo</span></td>
      <td class="date-time danger"><jalios:date date="<%= new Date() %>" format="short"/></td>
      <td class="warning"><jalios:icon src="edit"/></td>
    </tr>                
  </table>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("table-data-styled") %></code></pre></div>
</div>