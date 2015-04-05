<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_panel.jsp")); %>
<div class="bs-docs-section">
     
  <h1 id="panel" class="page-header">Panel</h1>
  <p class="lead">How to write a panel with the new tag &lt;jalios:panel&gt; (See <a href="docs/jcms/components.jsp#panels">bootstrap panel</a> for style documentation)</p>
  <p>Here are the files used to display a panel : </p>
  <ul>
    <li>doPanel.jsp</li>
  </ul>        
  
  <h3 id="panel-simple">Simple panel</h3>
  <p>How to write a simple panel</p>
  <div class="bs-example">
   <jalios:panel title="ui.adm.mn.users" css="panel-default" id="users">
      <p>My own panel</p>
    </jalios:panel>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("panel-simple") %></code></pre></div>
  
  <h3 id="panel-attributes">Panel attributes</h3>
  <p>Attributes to define for a panel.</p>
  <ul>
    <li><b>title</b> : the title that will be displayed in the panel panel-header html tag</li>
    <li><b>picture</b> : the image that will be appended to the title in the panel-header</li>
    <li><b>id</b> : the html id attribute for the panel</li>
    <li><b>css</b> : css classes that will be added to panel html tag</li>
  </ul>
  
  <p>Attribute to add in the PanelTag body to replace some elements (Header,body,Footer...)</p>
  <ul>
    <li><b>PANEL_HEADING</b> : replaces the panel-header html tag and their content</li>
    <li><b>PANEL_HEADING_BTN</b> : allows to add html code in the panel-header tag</li>
    <li><b>PANEL_FOOTER</b> : allows to add code in the panel-footer html tag</li>
  </ul>            
  <p>A panel with a footer and a specific header :</p>
  <div class="bs-example">
   <jalios:panel id="users" css="panel-info">
      <p>My own panel</p>
      <jalios:buffer name="PANEL_HEADING">Custom Heading</jalios:buffer>
      <jalios:buffer name="PANEL_FOOTER">Custom footer</jalios:buffer>
    </jalios:panel>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("panel-attributes") %></code></pre></div>
  
  <h3 id="panel-navtabs-listgroup">Panel + navtabs + listgroup</h3>
  <p>A panel with navtabs and listgroup</p>
  <div class="bs-example">
    <jalios:panel id="users" title="My title" css="panel-info">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs">
        <li class="active" ><a href="#panelNav1" data-toggle="tab" onclick="return false;">List group</a></li>
        <li><a href="#panelNav2" data-toggle="tab" onclick="return false;">tab2</a></li>
        <li><a href="#panelNav3" data-toggle="tab" onclick="return false;">tab3</a></li>
      </ul>  
      <!-- Tab panes -->
      <div class="tab-content">
        <div class="tab-pane active" id="#panelNav1">
          <!-- List group -->
            <ul class="list-group sticky-bottom">
            <li class="list-group-item">Cras justo odio</li>
            <li class="list-group-item">Dapibus ac facilisis in</li>
            <li class="list-group-item">Morbi leo risus</li>
            <li class="list-group-item">Porta ac consectetur ac</li>
            <li class="list-group-item">Vestibulum at eros</li>
          </ul>
        </div>
        <div class="tab-pane" id="#panelNav2">An other tab</div>
        <div class="tab-pane" id="#panelNav3">An other tab2</div>
      </div>  
    </jalios:panel>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("panel-navtabs-listgroup") %></code></pre></div>    
  
  <h3 id="panel-hfb-tags">A panel with header/footer/body tags</h3>
  <p>A panel with the tags jalios:[panel-heading/panel-footer/panel-body].</p>
  <div class="bs-example">
    <jalios:panel>
      <jalios:panel-heading title="My header title" picture="add" css="dnd-header" />
      <%--
      It's possible to override whole panel-heading
      <jalios:panel-heading>
        <div class="panel-title">My header title</div>
      </jalios:panel-heading>
      --%>
    
      <jalios:panel-body>
        <p>Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
        <table class="table">
          <thead>
            <tr>
              <th>#</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Username</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Mark</td>
              <td>Otto</td>
              <td>@mdo</td>
            </tr>
            <tr>
              <td>2</td>
              <td>Jacob</td>
              <td>Thornton</td>
              <td>@fat</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Larry</td>
              <td>the Bird</td>
              <td>@twitter</td>
            </tr>
          </tbody>
        </table>
      </jalios:panel-body>
      
      <jalios:panel-footer>
        <a class="modal" href="#" onclick="return false;">
        <img class="icon ss_sprite ss_add" src="s.gif" alt="" />&nbsp;<%= glp("ui.com.btn.add") %></a>
      </jalios:panel-footer>
    </jalios:panel>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("panel-hfb-tags") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>