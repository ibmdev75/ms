<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% String bootstrapUrl = "http://getbootstrap.com/"; %>
<% String docsUrl = "docs/jcms/custom-components.jsp"; %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_custom.jsp")); %>
<div class="bs-docs-section">
  <h1 id="list-inline" class="page-header">List inline</h1>
  <p class="lead">Extension of bootstrap listgroup component (<a href="<%= bootstrapUrl %>css/#type-lists">Documentation</a>)</p>
  <p>Less file : jalios-list.less</p>
  
  <h3 id="list-inline">List inline with text only</h3>
  <p>When the text is too long, an overflow is applied. To see the full text, click on the line.</p>
  <div class="bs-example">
    <div class="row">
      <div class="col-md-12">
        <ul class="list-inline list-inline-fixed">
          <li class="col-md-3">Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</li>
          <li class="col-md-3">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</li>
          <li class="col-md-3">Vestibulum at eros</li>
          <li class="col-md-3">Vestibulum at consectetur eros</li>
          <li class="col-md-3">Vestibulum at consectetur eros</li>
          <li class="col-md-3">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</li>
          <li class="col-md-3">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</li>
          <li class="col-md-3">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</li>
          <li class="col-md-3">Vestibulum at Morbi eros</li>
        </ul><%-- EOF .list-inline --%>
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("list-inline") %></code></pre></div>
      
  <h3 id="list-inline-label-input">List inline with label / input</h3>
  <p>When the text is too long, an overflow is applied. To see the full text, click on the line.</p>
  <div class="bs-example">
    <div class="row">
      <div class="col-md-12">
        <ul class="list-inline list-inline-fixed">
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-1" />
            <label for="list-inline-fixed-ex-2-1">Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-2" />
            <label for="list-inline-fixed-ex-2-2">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-3" />
            <label for="list-inline-fixed-ex-2-3">Vestibulum at eros</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-4" />
            <label for="list-inline-fixed-ex-2-4">Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-5" />
            <label for="list-inline-fixed-ex-2-5">Morbi leo risus Morbi leo ri leo risus</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-6" />
            <label for="list-inline-fixed-ex-2-6">Morbi leo risus Morbi leo</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-7" />
            <label for="list-inline-fixed-ex-2-7">Morbi leo risus</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-8" />
            <label for="list-inline-fixed-ex-2-8">Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-9" />
            <label for="list-inline-fixed-ex-2-9">Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</label>
          </li>
          <li class="col-md-2">
            <input type="checkbox" id="list-inline-fixed-ex-2-10" />
            <label for="list-inline-fixed-ex-2-10">Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</label>
          </li>
        </ul><%-- EOF .list-inline --%>
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("list-inline-label-input") %></code></pre></div>
        
  <h3 id="list-inline-gallery">List inline with a gallery of images (Same width & height)</h3>
  <p>List of images for a gallery</p>
  <div class="bs-example">
    <div class="row">
      <div class="col-md-12">
        <ul class="list-inline list-inline-fixed list-inline-gallery">
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/abstract/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/fashion/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/cats/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/sports/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/people/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/nature/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/technics/" alt=""></li>
          <li class="col-md-3"><img class="thumbnail" src="http://lorempixel.com/200/200/business/" alt=""></li>
        </ul>
        <%-- EOF .list-inline --%>
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("list-inline-gallery") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>

<div class="bs-docs-section">
  <h1 id="item-box" class="page-header">Item box</h1>
  <p class="lead">Custom jcms component for list</p>
  <p>Less file : jalios-itembox.less</p>            
                    
  <h3 id="itembox-list">Item box list</h3>
  <div class="bs-example">
    <div class="row">
      <div class="col-md-6">
        <jalios:panel title="item box list">
          <ul class="item-box">
            <li><jalios:icon src="publication"/> Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</li>
            <li><jalios:icon src="publication"/> Morbi leo risus Morbiisus</li>
            <li><jalios:icon src="publication"/> Lo risus Morbi leo risus</li>
            <li><jalios:icon src="publication"/> Tisus risus Morbi leo risus</li>
          </ul><%-- EOF .item-box --%>
        </jalios:panel>
      </div>
      <div class="col-md-6">
        <jalios:panel title="item box list with action">
          <% Article articleTest = new Article(); %>
          <ul class="item-box">  
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info">item-info</span> <jalios:icon src="publication"/> Porta ac consectetur ac Porta ac</li>
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info">item-info</span> <jalios:icon src="publication"/> Porta ac consectetur</li>
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info">item-info</span> <jalios:icon src="publication"/> Consectetur ac Porta</li>
          <li><div class="item-icons"><jalios:edit id="j_2"/></div> <span class="item-info item-date-new">item-date-new</span> <jalios:icon src="publication"/> Consectetur ac Porta consectetur</li>
          <li><span class="item-info item-date-today">item-date-today</span> <jalios:icon src="publication"/> Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</li>
          </ul>    
        </jalios:panel>
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("itembox-list") %></code></pre></div>
             
  <h3 id="itembox-table">Item box table</h3>
  <div class="bs-example">
    <div class="row">
      <div class="col-md-6">
        <jalios:panel title="Item box table">
          <div class="item-box">
            <table class="items">   
            <tr class="item"><td width="1%"><div class="item-info">item-info</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> <jalios:icon src="publication"/> Consectetur ac Porta consectetur</td></tr>
            <tr class="item"><td width="1%"><div class="item-info">item-info</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> <jalios:icon src="publication"/> Consectetur ac Porta consectetur</td></tr>
            <tr class="item"><td width="1%"><div class="item-info">item-info</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div> <jalios:icon src="publication"/> Consectetur ac Porta consectetur</td></tr>
            <tr class="item"><td width="1%"><div class="item-info item-date-new">item-date-new</div></td> <td><div class="item-icons"><jalios:edit id="j_2"/></div>  <jalios:icon src="publication"/> Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</td></tr>
            <tr class="item"><td width="1%"><div class="item-info item-date-today">item-date-today</div></td> <td><div class="item-icons">  ... </div> <jalios:icon src="publication"/> Consectetur ac Porta consectetur</td></tr>
            <tr>
            <td colspan="2" class="item-box-footer">
            <a href="#" onclick='return false;'><jalios:icon src="add" /> Consectetur ac Porta consectetur</a>
            </td>
            </tr>
            </table>
          </div>
        </jalios:panel>
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("itembox-table") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>

<div class="bs-docs-section">

  <h1 id="list-group" class="page-header">List group</h1>
  <p class="lead">Extension of bootstrap listgroup component (<a href="<%= bootstrapUrl %>components/#list-group">Documentation</a>)</p>
  <p>Less file : jalios-list.less</p>

  <h3 id="listgroup-collapsible">List group collapsible</h3>
  <p>When the text is too long, an overflow is applied. To see the full text, click on the line.</p>
  <div class="bs-example">
    <div class="row">
      <div class="col-md-6">
        <div class="list-group list-group-collapsible-1 list-group-collapsible">
          <a class="list-group-item list-group-item-1 list-group-item-collapsed" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".list-group-collapsible-1 .list-group-item-1" >Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</a>
          <a class="list-group-item list-group-item-2 list-group-item-collapsed" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".list-group-collapsible-1 .list-group-item-2">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</a>
          <a class="list-group-item list-group-item-3 list-group-item-collapsed" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".list-group-collapsible-1 .list-group-item-3">Vestibulum at eros</a>
        </div><%-- EOF .list-group --%>
      </div>
      <div class="col-md-offset-3 col-md-3">
        <div class="list-group list-group-collapsible-2 list-group-collapsible">
          <a class="list-group-item list-group-item-1 list-group-item-collapsed" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".list-group-collapsible-2 .list-group-item-1" >Morbi leo risus Morbi leo risus Morbi leo risus Morbi leo risus</a>
          <a class="list-group-item list-group-item-2 list-group-item-collapsed" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".list-group-collapsible-2 .list-group-item-2">Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac Porta ac consectetur ac</a>
          <a class="list-group-item list-group-item-3 list-group-item-collapsed" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".list-group-collapsible-2 .list-group-item-3">Vestibulum at eros</a>
        </div><%-- EOF .list-group --%>            
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("listgroup-collapsible") %></code></pre></div>

  <h3 id="listgroup-actions">List group actions</h3>
  <p>A list group with actions in a contextual menu on its right side</p>
  <div class="bs-example">
    <div class="list-group">
      <a href="#" class="list-group-item">Cras justo odio</a>
      <div class="list-group-item list-group-item-extended">
        <a href="#">Dapibus ac facilisis in</a>
        <div class="list-group-item-action dropdown">
          <a data-toggle="dropdown" href="#" class="dropdown-toggle center-block"><jalios:icon src="caret" /></a>
          <ul class="dropdown-menu" role="menu">
            <li>Menu1</li>
            <li>Menu2</li>
          </ul>
        </div>
      </div>
      <div class="list-group-item list-group-item-extended">
        <a href="#">Morbi leo risus</a>
        <div class="list-group-item-action dropdown">
          <a data-toggle="dropdown" href="#" class="dropdown-toggle center-block"><jalios:icon src="caret" /></a>
          <ul class="dropdown-menu" role="menu">
            <li>Menu1</li>
            <li>Menu2</li>
          </ul>
        </div>
      </div>
      <a href="#" class="list-group-item">Morbi leo risus</a>
      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
      <a href="#" class="list-group-item">Vestibulum at eros</a>
    </div><%-- EOF .list-group --%>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("listgroup-actions") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>

<jalios:include jsp="/docs/jcms/components/components_custom_table_data.jsp" />
<jalios:include jsp="/docs/jcms/components/components_custom_card.jsp" />
