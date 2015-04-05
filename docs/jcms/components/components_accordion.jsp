<%@page import="com.jalios.jcms.context.MessageLevel"%>
<%@page import="com.jalios.jcms.context.JcmsMessage"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_accordion.jsp")); %>
<div class="bs-docs-section">
  <h1 id="accordion" class="page-header">Accordion</h1>
  <p class="lead">How to write an accordion with the new tag &lt;jalios:accordion&gt; </p>
  <p>Here are the files used to display a modal : </p>
  <ul>
    <li>doAccordion.jsp</li>
    <li>doAccordionPanel.jsp</li>
  </ul>       
  
  <h3 id="accordion-presentation">Accordion presentation</h3>
  <p>Attributes to define for the accordion tag:</p>
  <ul>
    <li><b>multiOpen</b> : <i>Optional</i>. Whether the accordion can keep more than one accordion panel opened. Default is false.</li>
    <li><b>css</b> : <i>Optional</i>. The css class to apply to wrapper.</li>
    <li><b>resource</b> : <i>Optional</i>. The resource name bind to a property describing a JSP.</li>
  </ul>
  <p>Attributes to define for the accordion-panel tag:</p>
  <ul>
    <li><b>title</b> : <i>Optional</i>. The accordion panel header title.</li>
    <li><b>picture</b> : <i>Optional</i>. The visual representation of box (in header).</li>
    <li><b>active</b> : <i>Optional</i>. Whether the accordion panel is active.</li>
    <li><b>css</b> : <i>Optional</i>. The css class to apply to wrapper.</li>
    <li><b>resource</b> : <i>Optional</i>. The resource name bind to a property describing a JSP.</li>
  </ul>
  
  <h3 id="accordion-example">Simple example</h3>
  <div class="bs-example">
    <jalios:accordion>
      <jalios:accordion-panel title="Collapsible Group Item #1" >
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </jalios:accordion-panel>
      <jalios:accordion-panel title="Collapsible Group Item #2">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </jalios:accordion-panel>
      <jalios:accordion-panel title="Collapsible Group Item #3">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </jalios:accordion-panel>
    </jalios:accordion>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("accordion-example") %></code></pre></div>
  
  <h3 id="independant-panel-presentation">Independant accordion panels</h3>
  <p>Add 'multiOpen' attribute to keep more than one accordion panel opened:</p>
  <div class="bs-example">
    <jalios:accordion multiOpen="true">
      <jalios:accordion-panel title="Collapsible Group Item #1" active="true">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </jalios:accordion-panel>
      <jalios:accordion-panel title="Collapsible Group Item #2">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </jalios:accordion-panel>
      <jalios:accordion-panel title="Collapsible Group Item #3">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </jalios:accordion-panel>
    </jalios:accordion>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("independant-panel-presentation") %></code></pre></div>
  
  <h3 id="accordion-panel-footer">Accordion panels with footer</h3>
  <p>Add 'PANEL_FOOTER' buffer to define a footer in accordion panels:</p>
  <div class="bs-example">
    <jalios:accordion multiOpen="true">
      <jalios:accordion-panel title="Collapsible Group Item #1" active="true" css="panel-default panel1">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        <jalios:buffer name="PANEL_FOOTER">
          <button class="btn btn-default" data-toggle="collapse" data-target=".panel1 .panel-collapse">Collapse !</button>
        </jalios:buffer>
      </jalios:accordion-panel>
      <jalios:accordion-panel title="Collapsible Group Item #2" active="true" css="panel-default panel2">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        <jalios:buffer name="PANEL_FOOTER">
          <button class="btn btn-default" data-toggle="collapse" data-target=".panel2 .panel-collapse">Collapse !</button>
        </jalios:buffer>
      </jalios:accordion-panel>
      <jalios:accordion-panel title="Collapsible Group Item #3" css="panel-default panel3">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        <jalios:buffer name="PANEL_FOOTER">
          <button class="btn btn-default" data-toggle="collapse" data-target=".panel3 .panel-collapse">Collapse !</button>
        </jalios:buffer>
      </jalios:accordion-panel>
    </jalios:accordion>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("accordion-panel-footer") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>