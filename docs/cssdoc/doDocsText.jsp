<%@page import="com.jalios.jcms.taglib.settings.impl.RichTextAreaSettings"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="text">
  <div class="page-header">
    <h1>Text <small>Wiki, Wysiwyg, ...</small></h1>
  </div>

  <h2>Wysiwyg</h2>
  <div class="row br">
    <div class="col-md-4">
      <h3>Usage</h3>
      <p> JCMS provides a wysiwyg editor to write HTML.</p>
      <p>
        The editor can be declared using <code>&lt;jalios:field&gt;</code> tag
        with editor type <code>AbstractWidget.UI_EDITOR_RICHTEXT</code>.
      </p>
      <p>The wysiwyg must then be printed using <code>&lt;jalios:wysiwyg&gt;</code> tag, 
       which will perform additionnal processing required to ensure proper rendering.</p>
      <p>
       All wysiwyg content are wrapped inside a div having <code>.wysiwyg</code> class and
       an additionnal class selected by user from classes defined in file <code>wysiwyg.less</code> 
       (this file is compiled to <code>wysiwyg.css</code> file and imported by <code>custom.css</code>)
      </p>
    </div>
    <div class="col-md-8">
      <% String someRichText = "<div class=\"wysiwyg classic\"><p><img style=\"float: left; margin: 10px;\" src=\"images/jalios/logos/jalios130x130.gif\" alt=\"\" width=\"100\" />Lorem ipsum <strong>dolor sit amet</strong>, <em>consectetur adipisicing elit</em>, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation<span style=\"text-decoration: underline;\">ullamco</span> laboris nisi ut aliquip ex ea <span style=\"font-size: medium; font-family: comic sans ms,sans-serif;\">commodo consequat</span>. </p><ol><li>un</li><li>deux</li><li>trois</li></ol><p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, suntin culpa qui officia deserunt mollit anim id est laborum.</p></div>"; %>

      <h3>Wysiwyg Editor Sample</h3>
      <p>Sample wysiwyg editor</p>
<pre>
&lt;% String someRichText = "&lt;strong>Hello World!&lt;/strong>"; %>
&lt;form name="testWysiwygForm" method="post">
  &lt;jalios:field  name="myRichTextField" value="&lt;%= someRichText %>">
    &lt;jalios:control settings='&lt;%= new RichTextAreaSettings().parameters(RichTextAreaSettings.ParameterValue.ALL) %>' />
  &lt;/jalios:field>
&lt;/form>
</pre>
      <form name="testWysiwygForm" method="post">
        <jalios:field  name="myRichTextField" value="<%= someRichText %>">
          <jalios:control settings='<%= new RichTextAreaSettings().parameters(RichTextAreaSettings.ParameterValue.ALL) %>' />
        </jalios:field>
       </form>
      
      <h3>Wysiwyg Rendering Sample</h3>
      <p>Sample wysiwyg text with classes <code>.wysiwyg</code> and <code>.classic</code></p>
      <pre>&lt;jalios:wysiwyg>&lt;%= someRichText %>&lt;/jalios:wysiwyg></pre>
      <jalios:wysiwyg><%= someRichText %></jalios:wysiwyg>
    </div>
  </div>
  
  <h2>Wikiwyg</h2>
  <div class="row br">
    <div class="col-md-4">
      <h3>Usage</h3>
      <p> JCMS provides a wikiwyg editor to write simple Wiki text.</p>
      <p>
        The editor can be declared using <code>&lt;jalios:field&gt;</code> tag 
        with editor type <code>AbstractWidget.UI_EDITOR_WIKIAREA</code>
        and the attribute <code>wikiwyg="true"</code>.
      </p>
      <p>The wiki must then be printed using <code>&lt;jalios:wiki&gt;</code> tag, 
       which will perform required processing to ensure proper conversion of wiki syntax to HTML.</p>
      <p>
       All wiki content are wrapped inside a div having <code>.wiki</code> class.
      </p>
    </div>
    <div class="col-md-8">
    
      <h3>Wikiwyg Editor Sample</h3>
      <p>Sample wikiwyg editor</p>
<pre>
&lt;% String someWikiText = "Programmers *love* to say =Hello World= !"; %>
&lt;form name="testWikiwygForm" method="post">
  &lt;% String someWikiText = "Programmers *love* to say =Hello World= !"; %>
  &lt;jalios:field  name='&lt;%= "myWikiField" %>' value='&lt;%= someWikiText %>'>
    &lt;jalios:control type="&lt;%= ControlType.WIKIAREA %>"  />
  &lt;/jalios:field>
&lt;/form>      
</pre>
      <form name="testWikiwygForm" method="post">
        <% String someWikiText = "Programmers *love* to say =Hello World= !"; %>
        <jalios:field  name='<%= "myWikiField" %>' value='<%= someWikiText %>'>
          <jalios:control type="<%= ControlType.WIKIAREA %>"  />
        </jalios:field>
      </form>
      <h3>Wiki Rendering Sample</h3>
      <p>Sample wiki text with </p>
      <pre>&lt;jalios:wiki>&lt;%= someWikiText %>&lt;/jalios:wiki></pre>
      <jalios:wiki><%= someWikiText %></jalios:wiki>
    </div>
  </div>
    
  <h2>Wiki</h2>
  <div class="row">
    <div class="col-md-12">
      <p>JCMS provides a wiki syntax to write HTML tags. The tag <code>&lt;jalios:wiki&gt;</code> convert and wrap result in <code>.wiki</code></p>
      <p>The <code>wiki.less</code> is compiled to <codewiki.css</code> file and imported by <code>custom.css</code></p>
      <div class="wiki"><jsp:include page="/work/howToTFR_en.jsp" /></div>
    </div>
  </div>

</section>