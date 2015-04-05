<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/icons/icons_intro.jsp")); %>

<div class="bs-docs-section">
  <h1 id="principles" class="page-header">Principles</h1>
  
  <p>In JCMS, all icons are declared with properties. This approach insures that:</p>
  <ul>
    <li>for the same usage, the same icon is used</li>
    <li>the icon usage is disconnected with the icon format (image, sprite, glyph)</li>
    <li>all JCMS icons can be overrided</li>
  </ul>
  
  <p>Icons used in JCMS user interfaces are declared with the tag <code>&lt;jalios:icon src="" /&gt;</code></p>
      
  <p>The <code>src</code> attribut can be:</p>
  <ul>
    <li>An icon property (recommended):<br>Example <code>calendar</code></li>
    <li>A path:<br>Example:<code>images/jalios/icons/calendar.gif</code></li>
    <li>A sprite, prefixed with <code>sprite:</code><br>Example: <code>sprite: ss_sprite ss_add</code></li>
    <li>A glyph, prefixed with <code>glyph:</code><br>Example: <code>glyph: glyphicons-calendar</code></li>
  </ul>
  
  <div id="example-jalios-icon" class="bs-example">
    <p>Here is the 'calendar' icon: <jalios:icon src="calendar" />
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("example-jalios-icon") %></code></pre></div>

  
</div>

<div class="bs-docs-section">
  <h1 id="properties" class="page-header">Icon properties</h1>
  <p>Icons are declared with properties. Typically, the icons of a plugin must declared in the <code>plugin.prop</code> file of the plugin. 
  <p>If the icon property key starts with the prefix <code>icon.</code>, it is possible to use the suffix in the <code>src</code> otherwhise the full property key must be provided.</p>
  <p>The name of the icon should begin with the name of the plugin and it must not contain the "." (dot) character (since it will be provided as CSS class name). It is recommended to use the "-" (dash) character as name separator</p>
  <p>The icon property value can be :</p>
  <ul>
    <li>A path</li>
    <li>A sprite, prefixed with <code>sprite:</code></li>
    <li>A glyph, prefixed with <code>glyph:</code></li>
    <li>A reference to another icon, prefixed with <code>icon:</code></li>
  </ul>
  
  
  <div class="bs-example">
  <div class="highlight"><pre><code>
icon.myplugin-icon1: images/jalios/icons/image.gif
icon.myplugin-icon2: myplugin/images/myicon.png
icon.myplugin-icon3: sprite: ss_sprite ss_add
icon.myplugin-icon4: glyph: glyphicons-calendar
icon.myplugin-icon5: glyph: icomoon-calendar
icon.myplugin-icon6: glyph: fa fa-calendar
icon.myplugin-icon7: icon: image  
icon.myplugin-icon8: icon: myplugin-icon5
icon.myplugin.icon9: myplugin/images/myicon.png 
  </code></pre></div>
  </div>
</div>

<div class="bs-docs-section">
  <h1 id="libraries" class="page-header">Icon libraries</h1>
  <p>JCMS embeds the following librairies:</p>
  <ul>
    <li>
      <a href="http://glyphicons.com/">Glyphicons PRO</a> 
      <ul>
        <li><a href="docs/jcms/fonts/glyphicons/index.html">Glyphicons Regular PRO (1.9) : available icons in JCMS 9.1</a></li>
        <li><a href="docs/jcms/fonts/glyphicons-halflings/index.html">Glyphicons Halflings PRO (1.9) : available icons in JCMS 9.1</a></li>
      </ul>
      <p>We also furnish the two followings glyphicons icon set, which you have to enable in your custom.prop file.
      <ul>
        <li>Glyphicons Social PRO (1.9) : social icons (Facebook, Twitter...)</li>
        <li>Glyphicons File Types PRO (1.9) : icons for file types (PDF, JPG, AI, PS...)</li>
      </ul>
      <p>Add the following less file to enable these two files : </p>
      <div class="bs-example">
      <div class="highlight"><pre><code>      
        @import "init-mixins.less";

        /* ----------------------------------------------- */
        /*  GLYPHS                                         */
        /* ----------------------------------------------- */
        
        // Glyphicons Pro 1.9.0
        @import "../../lib/glyphicons/glyphicons-filetypes.less";
        @import "../../lib/glyphicons/glyphicons-social.less";
  </code></pre></div>
</div>

    </li>
    <li>
      <a href="https://icomoon.io/#preview-ultimate">Icomoon Ultimate Pack</a>
      <ul>
        <li><a href="docs/jcms/fonts/icomoon/demo.html">Icomoon : available icons in JCMS 9.1</a></li>
      </ul>
    </li>
    <li><a href="http://fortawesome.github.io/Font-Awesome/">Font Awesome</a></li>
    <li><a href="http://www.famfamfam.com/lab/icons/silk/">FamFamFam Silk Icons</a></li>
  </ul>
</div>


