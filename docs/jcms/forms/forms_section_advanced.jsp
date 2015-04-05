<%@page import="com.jalios.jcms.handler.EditDataHandler"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/forms/forms_section_advanced.jsp")); %>
<div class="bs-docs-section">
  <h1 id="widget-advanced" class="page-header">Advanced widget options and layouts <a href="docs/jcms/forms/forms_section_modal.jsp?section=advanced" class="modal btn btn-default" onclick="return false;">Open in modal</a></h1>
  <p class="lead">Advanced parameters and layouts for widget</p>

  <h3 id="widget-advanced-append">Text input with appended label</h3>
  <div class="bs-example form-horizontal">
    <jalios:field name="advancedWidgetPts" label="Custom label">
      <jalios:control type="<%= ControlType.TEXTFIELD %>">
        <jalios:buffer name="APPEND">Pts</jalios:buffer>
      </jalios:control>
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-advanced-append") %></code></pre></div>

  <h3 id="widget-advanced-prepend">Text input with prepended label</h3>
  <div class="bs-example form-horizontal">
    <jalios:field name="advancedWidgetPts" label="Custom label">
      <jalios:control type="<%= ControlType.TEXTFIELD %>">
        <jalios:buffer name="PREPEND">Pts</jalios:buffer>
      </jalios:control>
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-advanced-prepend") %></code></pre></div>

  <h3 id="widget-advanced-html">Text input with custom html after control</h3>
  <div class="bs-example form-horizontal">
  <jalios:field name="advancedWidgetPts" label="Custom label">
    <jalios:control type="<%= ControlType.TEXTFIELD %>" /> 
    <div class="input-group-addon">TEST</div>
    <div class="input-group-btn">
      <button type="button" class="btn btn-default btn-chooser" data-jalios-action="chooser:color">
        <jalios:icon src="color" />
      </button>
    </div>
  </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-advanced-html") %></code></pre></div>

  <h3 id="widget-advanced-responsive">3 fields on the same line (Responsive)</h3>
  <div class="bs-example">
    <div class="container-fluid">
      <div class="form-horizontal">
        <div class="row">
        <jalios:field name="advancedWidgetInline3-1" col="3" label="Custom label">
          <jalios:control type="<%= ControlType.TEXTFIELD %>">
            <jalios:buffer name="APPEND">Pts</jalios:buffer>
          </jalios:control>
        </jalios:field>
        <jalios:field name="advancedWidgetInline3-2" col="3" label="Custom label">
          <jalios:control type="<%= ControlType.TEXTFIELD %>">
            <jalios:buffer name="APPEND">Pts</jalios:buffer>
          </jalios:control>
        </jalios:field>
        <jalios:field name="advancedWidgetInline3-3" col="3" label="Custom label">
          <jalios:control type="<%= ControlType.TEXTFIELD %>">
            <jalios:buffer name="APPEND">Pts</jalios:buffer>
          </jalios:control>
        </jalios:field>
        </div>
      </div>
    </div>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-advanced-responsive") %></code></pre></div>

  <%!
  private static class UnkownFieldHandler extends EditDataHandler {
    public java.lang.Class<? extends Data> getDataClass() {
      return FileDocument.class;
    }
  }
  %>
  <% EditDataHandler formHandler = new UnkownFieldHandler(); %>
  <h3 id="widget-advanced-unkownfield">Unkown field</h3>
  <div class="bs-example form-horizontal">
    <h4>Unkown field with a standard template</h4>
    <jalios:field name="unkownField" label="Unkown Field" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    <h4>Unkown field with a custom template</h4>
    <jalios:field name="unkownField" formHandler="<%= formHandler %>" resource="field-light">
      <jalios:control />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-advanced-unkownfield") %></code></pre></div>

</div>