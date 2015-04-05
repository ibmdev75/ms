<%@page import="com.jalios.jcms.taglib.ControlType"%>
<%@page import="com.jalios.jcms.taglib.settings.*"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.*"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/forms/forms_section_widget.jsp")); %>
<div class="bs-docs-section form-horizontal">
  <h1 id="widget" class="page-header">Widget : Boolean, Enumerate and Language <a href="docs/jcms/forms/forms_section_modal.jsp?section=widget" class="modal btn btn-default" onclick="return false;">Open in modal</a></h1>

  <h3 id="widget-boolean">Boolean</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.BOOLEAN</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="boolean1" label="Boolean" value="true">
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <jalios:field name="boolean1" label="Boolean disable inline" value="true">
      <jalios:control settings='<%= new BooleanSettings().disableInline() %>' />
    </jalios:field>
    <jalios:field name="boolean2" label="Boolean select" value="false">
      <jalios:control settings='<%= new BooleanSettings().select() %>' />
    </jalios:field>
    <jalios:field name="boolean2" label="Boolean with custom labels and values" value="false">
      <jalios:control settings='<%= new BooleanSettings().enumLabels("Affirmative", "Especially not").enumValues(true, false) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-boolean") %></code></pre></div>

  <h3 id="widget-enumerate">Enumerate</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.ENUMERATE</li>
  </ul>
  <div class="bs-example">
    <% String[] enumerateValues = new String[] {"value1", "value2", "value3"}; %>
    <jalios:field name="enumerate1" label="Enumerate" value="value2">
      <jalios:control settings='<%= new EnumerateSettings().enumValues(enumerateValues) %>' />
    </jalios:field>
    <jalios:field name="enumerate2" label="Enumerate radio" value="value2">
      <jalios:control settings='<%= new EnumerateSettings().radio().enumValues(enumerateValues) %>' />
    </jalios:field>
    <jalios:field name="enumerate3" label="Enumerate radio inline" value="value2">
      <jalios:control settings='<%= new EnumerateSettings().radio().inline().enumValues(enumerateValues) %>' />
    </jalios:field>
    <jalios:field name="enumerate4" label="Enumerate checkbox" value="value2">
      <jalios:control settings='<%= new EnumerateSettings().checkbox().enumValues(enumerateValues) %>' />
    </jalios:field>
    <jalios:field name="enumerate5" label="Enumerate checkbox inline" value="value2">
      <jalios:control settings='<%= new EnumerateSettings().checkbox().inline().enumValues(enumerateValues) %>' />
    </jalios:field>
    <jalios:field name="enumerate6" value='true' label="Unique checkbox" description='Lorem Ipsum description'>  
      <jalios:control settings='<%= new EnumerateSettings().checkbox().enumValues("true").enumLabels("Lorem Ipsum label") %>' />
    </jalios:field> 
    <jalios:field name="enumerate7" label="Enumerate select" value="value2" required="true">
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(enumerateValues) %>' />
    </jalios:field>
    <jalios:field name="enumerate8" label="Enumerate select multiple" value='<%= new String[] {"value1", "value2"} %>'>
      <jalios:control settings='<%= new EnumerateSettings().select().multiple().enumValues(enumerateValues) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-enumerate") %></code></pre></div>

  <h3 id="widget-language">Language</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.LANGUAGE</li>
    <li><b>Control</b> - <b>enumValues</b> = the lang values (Collection or array of string ex: "fr","en"); Automatically retrieves the flag based on lang properties declared in jcms.prop</li>
  </ul>    
  <div class="bs-example">
    <% String[] languageValues = new String[] {"fr", "en", "es"}; %>
    <jalios:field name="language1" label="Language" value="en">
      <jalios:control settings='<%= new LanguageSettings().enumValues(languageValues) %>' />
    </jalios:field>
    <jalios:field name="language2" label="Language radio" value="en">
      <jalios:control settings='<%= new LanguageSettings().radio().enumValues(languageValues) %>' />
    </jalios:field>
    <jalios:field name="language3" label="Language radio inline" value="en">
      <jalios:control settings='<%= new LanguageSettings().radio().inline().enumValues(languageValues) %>' />
    </jalios:field>
    <jalios:field name="language4" label="Language checkbox" value="en">
      <jalios:control settings='<%= new LanguageSettings().checkbox().enumValues(languageValues) %>' />
    </jalios:field>
    <jalios:field name="language5" label="Language checkbox inline" value="en">
      <jalios:control settings='<%= new LanguageSettings().checkbox().inline().enumValues(languageValues) %>' />
    </jalios:field>
    <jalios:field name="language6" label="Language select" value="en">
      <jalios:control settings='<%= new LanguageSettings().select().enumValues(languageValues) %>' />
    </jalios:field>
    <jalios:field name="language7" label="Language select multiple" value='<%= new String[] {"en", "fr"} %>'>
      <jalios:control settings='<%= new LanguageSettings().select().multiple().enumValues(languageValues) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-language") %></code></pre></div>
  
  <h3 id="widget-country">Country</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.COUNTRY</li>
  </ul>    
  <div class="bs-example">
    <jalios:field name="country1" label="Country" value="FR">
      <jalios:control type="<%= ControlType.COUNTRY %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-country") %></code></pre></div>
	
</div>	   