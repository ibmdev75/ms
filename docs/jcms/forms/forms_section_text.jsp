<%@page import="java.io.StringWriter"%>
<%@page import="com.jalios.jcms.HttpUtil"%>
<%@page import="com.jalios.jcms.taglib.ControlType"%>
<%@page import="com.jalios.jcms.taglib.settings.*"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.*"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/forms/forms_section_text.jsp")); %>
<div class="bs-docs-section form-horizontal">
  <h1 id="widget-text" class="page-header">Text widget <a href="docs/jcms/forms/forms_section_modal.jsp?section=text" class="modal btn btn-default" onclick="return false;">Open in modal</a></h1>
  <p class="lead">How to use a text widget in jcms</p>
  
  <h3 id="widget-text">Text field</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.TEXTFIELD</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="textfield1" label="Textfield">
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field name="textfield1" label="Textfield with id 'textfield1'" id="textfield1" tooltip="Show the DOM to check the ID">
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field name="textfield2" label="Textfield with placeholder">
      <jalios:control settings='<%= new TextFieldSettings().placeholder("Please enter your text here") %>' />
    </jalios:field>
    <jalios:field name="textfield3" label="Textfield with language chooser" ml="true">
      <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
    </jalios:field>
    <jalios:field name="textfield4" label="Textfield with append">
      <jalios:control settings='<%= new TextFieldSettings().append("&euro;") %>' />
    </jalios:field>
    <jalios:field name="textfield5" label="Textfield with prepend">
      <jalios:control settings='<%= new TextFieldSettings().prepend("$") %>' />
    </jalios:field>
    <jalios:field name="textfield6" label="Textfield with string to unescape" value="Foo &amp; &lt;/div>">
      <jalios:control settings='<%= new TextFieldSettings().prepend("$").append("&euro;").showLanguageChooser() %>' />
    </jalios:field>
    <jalios:field name="textfield7" label="Textfield with change event" description="<span class='label label-info'>Reversed string: <em class='reverse-string'></em></span>">
      <jalios:control settings='<%= new TextFieldSettings().onChange("reverse") %>' />
    </jalios:field>
    <jalios:field name="textfield8" label="Textfield with focusout event" description="<span class='label label-info'>Reversed string: <em class='reverse-string'></em></span>">
      <jalios:control settings='<%= new TextFieldSettings().onFocusOut("reverse") %>' />
    </jalios:field>
    <jalios:javascript>
    !function ($) {
      // Action regexp
      var pattern = /reverse/i;
      
      var callback = function(event) {
        var broker = $.jalios.Event.match(event, 'broker', pattern, true);
        if (!broker){ return; }
        
        // Element
        var elm = broker.source.currentTarget;
        broker.options._broked = true;
        
        var reverseString = $(elm).val().split('').reverse().join('');
        $(elm).closest('.widget-content').find('.help-block .reverse-string').html(reverseString);
      }
      
      var register = function() {
        // Register to broker
        $(document).on("jalios:broker", callback);
      }
      
      // Initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
    
    <jalios:field name="textfield9" label="Textfield disabled" ml="true" disabled="true">
      <jalios:control settings='<%= new TextFieldSettings().prepend("$").append("&euro;").showLanguageChooser() %>' />
    </jalios:field>
    
    <jalios:field name="textfield10" label="Textfield toggle disabled" ml="true" disabled="true">
      <jalios:control settings='<%= new TextFieldSettings().prepend("$").append("&euro;").showLanguageChooser() %>' />
    </jalios:field>
    <div class="clearfix br"><div class="pull-right"><button class="btn btn-primary text-toggle-button">Toggle Disabled</button></div></div>
    <jalios:javascript>
    !function ($) {
      var register = function() {
        $('.text-toggle-button').on('click', function() {
          $('.widget-name-textfield10').toggleDisabledField();
        });
      }
      
      // Initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
    <jalios:field name="textfield11" label="Textfield multivalued" mv="1" value='<%= Arrays.asList("My First Value", "My Second Value") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-text") %></code></pre></div>
  
  <h3 id="widget-url">URL</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.URL</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="url1" label="URL">
      <jalios:control type="<%= ControlType.URL %>" />
    </jalios:field>
    <jalios:field name="url2" label="URL with placeholder">
      <jalios:control settings='<%= new UrlSettings().placeholder("Please enter your URL here") %>' />
    </jalios:field>
    <jalios:field name="url3" label="URL toggle disabled" disabled="true" value="http://www.jalios.com">
      <jalios:control type="<%= ControlType.URL %>" />
    </jalios:field>
    <div class="pull-right"><button class="btn btn-primary url-toggle-button">Toggle Disabled</button></div>
    <jalios:javascript>
    !function ($) {
      var register = function() {
        $('.url-toggle-button').on('click', function() {
          $('.widget-name-url3').toggleDisabledField();
        });
      }
      
      // Initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-url") %></code></pre></div>
  
  <h3 id="widget-email">Email</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.EMAIL</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="email1" label="Email">
      <jalios:control type="<%= ControlType.EMAIL %>" />
    </jalios:field>
    <jalios:field name="email2" label="Email with placeholder">
      <jalios:control settings='<%= new EmailSettings().placeholder("Please enter your email here") %>' />
    </jalios:field>
    <jalios:field name="email3" label="Email toggle disabled" disabled="true" value="john.doe@jalios.com">
      <jalios:control type="<%= ControlType.EMAIL %>" />
    </jalios:field>
    <div class="pull-right"><button class="btn btn-primary email-toggle-button">Toggle Disabled</button></div>
    <jalios:javascript>
    !function ($) {
      var register = function() {
        $('.email-toggle-button').on('click', function() {
          $('.widget-name-email3').toggleDisabledField();
        });
      }
      
      // Initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-email") %></code></pre></div>

  <h3 id="widget-password">Password</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.PASSWORD</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="password1" label="Password">
      <jalios:control type="<%= ControlType.PASSWORD %>" />
    </jalios:field>
    <jalios:field name="password2" label="Password with placeholder">
      <jalios:control settings='<%= new PasswordSettings().placeholder("Please enter your password here") %>' />
    </jalios:field>
    <jalios:field name="password3" label="Password toggle disabled" disabled="true" value="myPassword">
      <jalios:control type="<%= ControlType.PASSWORD %>" />
    </jalios:field>
    <div class="pull-right"><button class="btn btn-primary password-toggle-button">Toggle Disabled</button></div>
    <jalios:javascript>
    !function ($) {
      var register = function() {
        $('.password-toggle-button').on('click', function() {
          $('.widget-name-password3').toggleDisabledField();
        });
      }
      
      // Initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-password") %></code></pre></div>

  <h3 id="widget-color">Color</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.COLOR</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="color1" label="Color">
      <jalios:control type="<%= ControlType.COLOR %>" />
    </jalios:field>
    <jalios:field name="color2" label="Color with value" value="#00d1ff">
      <jalios:control type="<%= ControlType.COLOR %>" />
    </jalios:field>
    <jalios:field name="color3" label="Color with placeholder">
      <jalios:control settings='<%= new ColorSettings().placeholder("Please enter your color here") %>' />
    </jalios:field>
    <jalios:field name="color4" label="Color toggle disabled" disabled="true" value="#00d1ff">
      <jalios:control type="<%= ControlType.COLOR %>" />
    </jalios:field>
    <div class="pull-right"><button class="btn btn-primary color-toggle-button">Toggle Disabled</button></div>
    <jalios:javascript>
    !function ($) {
      var register = function() {
        $('.color-toggle-button').on('click', function() {
          $('.widget-name-color4').toggleDisabledField();
        });
      }
      
      // Initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-color") %></code></pre></div>

  <h3 id="widget-textarea">Text area</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.TEXTAREA</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="textarea1" label="Textarea">
      <jalios:control type="<%= ControlType.TEXTAREA %>" />
    </jalios:field>
    <jalios:field name="textarea2" label="Textarea with placeholder">
      <jalios:control settings='<%= new TextAreaSettings().placeholder("Please enter your text here") %>' />
    </jalios:field>
    <jalios:field name="textarea3" label="Textarea with change event" description="<span class='label label-info'>140</span>">
      <jalios:control settings='<%= new TextAreaSettings().onChange("compute-limit") %>' />
    </jalios:field>
    <jalios:javascript>
    !function ($) {
      // Action regexp
      var pattern = /compute-limit/i;
      
      var callback = function(event) {
        var broker = $.jalios.Event.match(event, 'broker', pattern, true);
        if (!broker){ return; }
        
        // Element
        var elm = broker.source.currentTarget;
        broker.options._broked = true;
        
        var remainingChars = 140 - $(elm).val().length;
        var content = remainingChars < 0 ? '<span class="label label-warning">' + remainingChars + '</span>' : '<span class="label label-info">' + remainingChars + '</span>';
        $(elm).closest('.widget-content').find('.help-block').html(content);
      }
      
      var register = function() {
        // Register to broker
        $(document).on("jalios:broker", callback);
      }
      
      // Plugin initialization on DOM ready
      $(document).ready(function($) {
        register();
      });
      
    }(window.jQuery);
    </jalios:javascript>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-textarea") %></code></pre></div>

  <h3 id="widget-number">Number</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.INTEGER, ControlType.DOUBLE</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="number1" label="Integer">
      <jalios:control type="<%= ControlType.NUMBER %>" />
    </jalios:field>
    <jalios:field name="number2" label="Double">
      <jalios:control settings='<%= new NumberSettings().numberType(double.class) %>' />
    </jalios:field>
    <jalios:field name="number3" label="Long">
      <jalios:control settings='<%= new NumberSettings().numberType(long.class) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-number") %></code></pre></div>

  <h3 id="widget-richtextarea">RichText area</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.RICHTEXTAREA</li>
  </ul>
  <div class="bs-example">
    <% String wysiwygValue = "<div class=\"wysiwyg border\"><p><em><strong>This is an example</strong></em></p></div>"; %>
    <jalios:field name="richtextarea1" label="RichTextarea">
      <jalios:control type="<%= ControlType.RICHTEXTAREA %>" />
    </jalios:field>
    <jalios:field name="richtextarea2" label="RichTextarea with value" value="<%= wysiwygValue %>">
      <jalios:control type="<%= ControlType.RICHTEXTAREA %>" />
    </jalios:field>
    <jalios:field name="richtextarea3" label="RichTextarea popup edition (with disabled attribute)" disabled="true">
      <jalios:control type="<%= ControlType.RICHTEXTAREA %>" />
    </jalios:field>
    <jalios:field name="richtextarea4" label="RichTextarea popup edition">
      <jalios:control settings='<%= new RichTextAreaSettings().popupEdition() %>' />
    </jalios:field>
    <jalios:field name="richtextarea5" label="RichTextarea popup edition with value" value="<%= wysiwygValue %>">
      <jalios:control settings='<%= new RichTextAreaSettings().popupEdition() %>' />
    </jalios:field>
    <jalios:field name="richtextarea6" label="RichTextarea params">
      <jalios:control settings='<%= new RichTextAreaSettings().parameters(RichTextAreaSettings.ParameterValue.BASIC, RichTextAreaSettings.ParameterValue.FORMAT) %>' />
    </jalios:field>
    <jalios:field name="richtextarea7" label="RichTextarea rows">
      <jalios:control settings='<%= new RichTextAreaSettings().rows(20) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-richtextarea") %></code></pre></div>

  <h3 id="widget-wiki">Wiki area</h3>
  <ul>
	  <li><b>Control</b> - <b>type</b> = ControlType.WIKIAREA</li>
  </ul>  
  <%  
  StringWriter writer = new StringWriter();
  org.apache.commons.io.IOUtils.copy(getServletContext().getResourceAsStream("/docs/jcms/forms/forms_wikiText.txt"), writer, "utf-8");
  String wikiText = writer.toString();
  %>
  <div class="bs-example">
    <jalios:field name="wikiarea1" label="wiki text with value" value="<%= wikiText %>">
      <jalios:control type="<%= ControlType.WIKIAREA %>"/>
    </jalios:field>
    <jalios:field name="wikiarea2" label="empty wiki text">
      <jalios:control type="<%= ControlType.WIKIAREA %>"/>
    </jalios:field>			  
  </div>	
  <div class="highlight"><pre><code><%= exampleMap.get("widget-wiki") %></code></pre></div>

</div>