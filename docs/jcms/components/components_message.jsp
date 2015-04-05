<%@page import="com.jalios.jcms.context.MessageLevel"%>
<%@page import="com.jalios.jcms.context.JcmsMessage"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_message.jsp")); %>
<div class="bs-docs-section">
        
  <h1 id="message" class="page-header">Message</h1>
  <p class="lead">How to write a message with the new tag &lt;jalios:message&gt; </p>
  <p>Here are the files used to display a modal : </p>
  <ul>
    <li>doMessage.jsp</li>
  </ul>       
  
  <h3 id="message-presentation">Message presentation</h3>
  <p>Attributes to define for the message:</p>
  <ul>
    <li><b>msg</b> : <i>Optional</i>. The message String which can be a message property key or a string. This attribute is optional because you can add the message string in the tag body.</li>
    <li><b>title</b> : <i>Optional</i>. The title of the message which can be a message property key or a string. If it's not defined, the tag uses default values according to the given level.</li>
    <li><b>level</b> : <i>Optional</i>. The level of the message you want to display. The default value is MessageLevel.INFO.</li>
    <li><b>dismissable</b> : <i>Optional</i>. Whether the message is dismissable. It displays a close button. The default value is 'false'.</li>
  </ul>
  
  <div class="bs-example">
    <jalios:message msg="This alert needs your attention, but it's not super important." />
    <%-- I18N property --%>
    <jalios:message msg="channel.data-write.status" title="ui.adm.data-write.prompt" level="<%= MessageLevel.WARN %>" />
    <jalios:message level="<%= MessageLevel.WARN %>"><p>Better check yourself, you're <a href="#" class="alert-link">not looking too good</a>.</p></jalios:message>
    <jalios:message msg="Change a few things up and try submitting again." title="Oh snap!" level="<%= MessageLevel.ERROR %>" />
    <jalios:message msg="You successfully read this important alert message." title="Well done!" level="<%= MessageLevel.SUCCESS %>" />
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("message-presentation") %></code></pre></div>


  <h3 id="message-dismissable">Dismissable message</h3>
  <p>Build on any message by adding the optional attribute 'dismissable' and close button.</p>
  <div class="bs-example">
    <jalios:message msg="Better check yourself, you're not looking too good." level="<%= MessageLevel.WARN %>" dismissable="true" />
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code><%= exampleMap.get("message-dismissable") %></code></pre></div>

  <h3 id="message-jcmscontext">Messages with JcmsContext - <i>jcmsContext.addMsg(...)</i></h3>
  <p>Build on any message in Java classes with the instance of JcmsContext.</p>
  <div class="bs-example java">
    <%
    jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.ERROR, "Change a few things up and try submitting again."));
    /* I18N property */
    jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, "channel.data-write.status"));
    jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, "Better check yourself, you're <a href=\"#\" class=\"alert-link\">not looking too good</a>."));
    jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.INFO, "This alert needs your attention, but it's not super important."));    
    jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.SUCCESS, "You successfully read this important alert message."));
    %><%@ include file='/jcore/doMessageBox.jspf' %>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code class="jsp"><%= exampleMap.get("message-jcmscontext") %></code></pre></div>
  
  <h3 id="message-jcmscontext-session">Messages with JcmsContext - <i>jcmsContext.addMsgSession(...)</i></h3>
  <p>Build on any message in Session in Java classes with the instance of JcmsContext.</p>
  <div class="bs-example java">
    <%
    jcmsContext.addMsgSession(new JcmsMessage(JcmsMessage.Level.ERROR, "Change a few things up and try submitting again."));
    /* I18N property */
    jcmsContext.addMsgSession(new JcmsMessage(JcmsMessage.Level.WARN, "channel.data-write.status"));
    jcmsContext.addMsgSession(new JcmsMessage(JcmsMessage.Level.WARN, "Better check yourself, you're <a href=\"#\" class=\"alert-link\">not looking too good</a>."));
    jcmsContext.addMsgSession(new JcmsMessage(JcmsMessage.Level.INFO, "This alert needs your attention, but it's not super important."));
    jcmsContext.addMsgSession(new JcmsMessage(JcmsMessage.Level.SUCCESS, "You successfully read this important alert message."));
    %><%@ include file='/jcore/doMessageBox.jspf' %>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code class="jsp"><%= exampleMap.get("message-jcmscontext-session") %></code></pre></div>

</div><%-- EOF .bs-docs-section --%>