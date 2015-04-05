<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/forms/forms_section_introduction.jsp")); %>
<div class="bs-docs-section form-horizontal">
  <h1 id="widget-intro" class="page-header">Introduction <a href="docs/jcms/forms/forms_section_modal.jsp?section=introduction" class="modal btn btn-default" onclick="return false;">Open in modal</a></h1>
  <p class="lead">How to handle widgets</p>
  
  <h3 id="widget-intro-field">Basic attributes on Field tag</h3>
  <ul>
    <li><b>formHandler</b> : the formHandler of the field</li>
    <li><b>name</b> : the name of the field</li>
    <li><b>label</b> : the label of the field that will be displayed before the field</li>
    <li>Two ways to add a description on the field :
      <ul>
        <li><b>description</b> : the description of the field that will be displayed under the field</li>
        <li><b>tooltip</b> : the description of the field in a tooltip</li>
      </ul>
    </li>
    <li><b>value</b> : the value of the field (Check following examples)
      <ul>
        <li>the text value for a text field</li>
        <li>the member for a member chooser</li>
        <li>the category set for a category multivaluate</li>
      </ul>
    </li>
    <li><b>disabled (boolean)</b> : add a disabled style on the field (The user cannot interact with the field)</li>
    <li><b>required (boolean)</b> : adds a visual information that shows that the field is required</li>
    <li><b>tab (boolean)</b> : if the field is multivaluate, a tab will be displayed for each iteration of the field</li>
    <li><b>keyword (boolean)</b> : Defines if the tag must be a keyword tag. Only used in choosers (Category, Publication, Member, Group...).</li>
    <li><b>mv (int)</b> : Defines the number of items to display in the field. On a textfield for example, if "3" is set, there will be 3 textfields.</li>
    <li><b>ml (boolean)</b> : Defines if the field is multilingual.</li>
    <li>Html attributes (Added on wrapper) :
      <ul>
        <li><b>id (String)</b> : the html id of the field</li>
        <li><b>css (String)</b> : the css classes of the field</li>
        <%--<li><b>col (int)</b> : the col defines the size of the field in the grid (Add a div class "row"). If "2" is defined on two following fields, each field will take 6 on the 12 rows grid. </li>--%>
      </ul>
    </li>
    <li>Advanced :
      <ul>
        <li>
            <b>resource (String, property) / jsp (String)</b> : see field documentation. The resource is here automatically resolved when setting a type on the control tag. Example :
          <ul>
            <li>type="&lt;%= ControlType.BOOLEAN %&gt;" : will use the resource boolean.jsp</li>
            <li>type="&lt;%= ControlType.MEMBER %&gt;" : will use the resource doWidgetChooserData.jsp</li>
          </ul>
          </li>
      </ul>
    </li>
  </ul>

  <h3 id="widget-intro-control">Basic attributes on Control tag</h3>
  <ul>
    <li><b>name (String)</b> : overrides the name of the field if defined</li>
    <li><b>type</b> : the type of the control (See further sections to choose a control)</li>
    <li><b>placeholder (String or property)</b> : the placeholder for text fields</li>
    <li><b>enumValues (Collection or array)</b> : the values of the selectable elements. Available for :
      <ul>
        <li>boolean</li>
        <li>checkbox</li>
        <li>radio buttons</li>
        <li>lang</li>
        <li>List</li>
        <li>Combo</li>
        <li>Enumerate choose (Member,Workspace,Group and Category)</li>
      </ul>
    </li>
    <li><b>enumLabels (Collection or array)</b> : the labels for the above enumValues (Values can be displayed directly if no labels are set)</li>
    <li><b>resolution (long)</b> : TODO</li>
    <li><b>options (String)</b> : An option for chooser fields, used as a QueryString for the query that will be performed to retrieve data. Example:
      <ul>
        <li>"type=generated.Article" set as option in a publication chooser will only search on Article</li>
        <li>"cids=yourid" set as option in a publication chooser will only search publication on the given category</li>
      </ul>
    </li>
    <li>Html attributes (Added on the input) :
      <ul>
        <li><b>rows</b> (int) : rows for textarea input</li>
        <li><b>htmlAttributes (String)</b> : html attributes to add on the input (data-js,title,alt...)</li>
      </ul>
    </li>
  </ul>

  <h3 id="widget-intro-ex0">Basic Example</h3>
  <div class="bs-example">
    <jalios:field name="demoField0" label="Basic example">
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-intro-ex0") %></code></pre></div>

  <h3 id="widget-intro-ex1">Example with a custom field control (Radio)</h3>
  <div class="bs-example">
    <jalios:field name="demoField1" label="demoField1">
      <jalios:control settings='<%= new EnumerateSettings().radio().enumLabels("Value 1", "Value 2").enumValues("value1", "value2") %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-intro-ex1") %></code></pre></div>

  <h3 id="widget-intro-ex2">Example with a custom field control (Select) multivalued</h3>
  <div class="bs-example">
    <jalios:field name="demoField2" label="demoField2" mv="1">
      <jalios:control settings='<%= new EnumerateSettings().select().enumLabels("Value 1", "Value 2", "Value 3").enumValues("value1", "value2", "value3") %>' />
    </jalios:field>  
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-intro-ex2") %></code></pre></div>
  
  <h3 id="widget-intro-ex3">Example with a custom field content</h3>
  <div class="bs-example">
    <jalios:field name="demoField3" label="demoField3">
      <div>
      <label>Value 1 : <input type="checkbox" name="customControl1" /></label>
      <label>Value 2 : <input type="checkbox" name="customControl2" /></label>
      </div>
      <div>
        <select class="form-control">
          <option>1</option>
          <option>2</option>
          <option>3</option>
        </select>
      </div>
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-intro-ex3") %></code></pre></div>

</div>