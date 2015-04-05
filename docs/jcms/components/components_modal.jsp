<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<div class="bs-docs-section">
  
  <h1 id="modal" class="page-header">Modal</h1>
  <p class="lead">How to write a modal with the new tag &lt;jalios:modal&gt; </p>
  <p>Here are the files used to display a modal : </p>
  <ul>
    <li>doModal.jsp</li>
    <li>doModalForm.jsp : used when a formHandler is passed as an argument to the modal tag</li>
  </ul>        
  
  <h3 id="modal-presentation">Modal presentation</h3>
  <p>Attributes to define for the modal presentation (Title, image...) .</p>
  <ul>
    <li><b>title</b> : the title of the modal</li>
    <li><b>picture</b> : the picture displayed in the right corner of the modal</li>
    <li><b>css</b> : css classes that will be added to the modal-dialog tag</li>
  </ul>
  
  <div class="bs-example">
    <p>Click on the link to open the example modal.</p>
    <a href="docs/jcms/components/components_modal_example1.jsp" class="modal btn btn-default">Modal presentation example</a>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code>&lt;%@ page contentType=&quot;text/html; charset=UTF-8&quot; %&gt;<br/>&lt;%@ include file='/jcore/doInitPage.jspf' %&gt;<br/>&lt;jalios:modal title=&quot;ui.recommendation&quot; css=&quot;customCss&quot; picture=&quot;images/jalios/icons/media/pdf64.gif&quot;&gt;<br/>  &lt;p&gt;My modal example #1&lt;/p&gt;<br/>&lt;/jalios:modal&gt;</code></pre></div>
  
  <h3 id="modal-form">Modal form on a generated type</h3>
  <p>Attributes to define for a modal form on a generated type(formHandler,url,op ...) .</p>
  <ul>
    <li><b>formHandler</b> : the title of the modal</li>
    <li><b>url</b> : the url to refresh on (Set as the "action" attribute on the form)</li>
  </ul>
  <p>In this example, we create a modal form on an article (generated.Article), for the summary field. The validate button is automatically set to "opCreate".</p>
  <p>If we add an "id" attribute to the formHandler bean, the button would be "opUpdate".</p>
  <p>Example : <small>&lt;jsp:setProperty name='formHandler' property='id' value="yourId" /&gt;</small></p>
  <p>The modal tag automatically retrieves : </p>
  <ul>
    <li><b>Type icon</b> (No picture attribute has to be set for a type edition)</li>
    <li><b>Title</b> (From the type name)</li>
    <li><b>Buttons</b> and language choice</li>
  </ul>
  <div class="bs-example">
    <p>Click on the link to open the example modal.</p>
    <a href="docs/jcms/components/components_modal_example2.jsp" class="modal btn btn-default">Modal form example</a>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code>&lt;%@ page contentType=&quot;text/html; charset=UTF-8&quot; %&gt;<br/>&lt;%@ include file='/jcore/doInitPage.jspf' %&gt;<br/>&lt;jsp:useBean id='formHandler' scope='page' class='generated.EditArticleHandler'&gt;<br/>  &lt;jsp:setProperty name='formHandler' property='request' value='&lt;%= request %&gt;'/&gt;<br/>  &lt;jsp:setProperty name='formHandler' property='response' value='&lt;%= response %&gt;'/&gt;<br/>  &lt;jsp:setProperty name='formHandler' property='*' /&gt;<br/>&lt;/jsp:useBean&gt;<br/>&lt;% <br/>// formHandler set as attribute for jalios:field tags<br/>request.setAttribute(&quot;formHandler&quot;, formHandler);<br/>if (formHandler.validate()) {<br/>  //Modal redirect if formHandler has been validated<br/>  request.setAttribute(&quot;modal.redirect&quot;, &quot;path/to/redirect.jsp&quot;); %&gt;<br/>  &lt;%@ include file=&quot;/jcore/modal/modalRedirect.jspf&quot; %&gt;<br/>  &lt;% <br/>  return; <br/>} <br/>formHandler.prepare(); <br/>%&gt;<br/>&lt;jalios:modal formHandler=&quot;&lt;%= formHandler %&gt;&quot;&gt;<br/>  &lt;%-- Summary Edition ------------------------------------------------------------ --%&gt;<br/>  &lt;jalios:field name=&quot;summary&quot; formHandler=&quot;&lt;%= formHandler %&gt;&quot;&gt;<br/>    &lt;jalios:control /&gt;<br/>  &lt;/jalios:field&gt;<br/>&lt;/jalios:modal&gt;</code></pre></div>
  
  <h3 id="modal-form-custom">Custom modal form</h3>
  <p>Custom modal form with a custom FormHandler</p>            
  <p>In the following example we have used following parameters : </p>
  <ul>
    <li><b>op</b> : to replace the primary button name</li>
    <li><b>button</b> : to replace the primary button value</li>
    <li><b>Buffer MODAL_BUTTON</b> : to add specific buttons between the cancel & the primary button</li>
    <li><b>Buffer MODAL_MENU</b> : to add specific menu between the modal header (and step buttons) and the modal content</li>    
  </ul>        
  <div class="highlight"><pre><code>&lt;jalios:modal title=&quot;yourTitleLanguageProperty&quot; formHandler=&quot;yourFormHandler&quot; css=&quot;customCss&quot; op=&quot;yourPrimaryButtonOp&quot; button=&quot;yourPrimaryButtonLabel&quot; picture=&quot;images/jalios/icons/media/pdf.gif&quot;&gt;<br/>  &lt;jalios:buffer name=&quot;MODAL_BUTTON&quot;&gt;Add here your custom buttons that are between cancel &amp; primary buttons&lt;/jalios:buffer&gt;<br/>&lt;/jalios:modal&gt;<br/></code></pre></div>
  
  <h3 id="modal-advanced">Modal form advanced</h3>    
  <p>Attributes for advanced modal form (op,button...)</p>
  <ul>
    <li><b>op</b> : replaces the name of the validate button, only in modal form (opCreate or opUpdate by default)</li>
    <li><b>button</b> : replaces the validate button value</li>
  </ul>
  <p>Attribute to add in the ModalTag body to replace some elements (Body,Footer,buttons...)</p>
  <ul>
    <li><b>Buffer MODAL_CONTENT</b> : replaces the modal-body and the modal-footer html tag and their content</li>
    <li><b>Buffer MODAL_BUTTONS</b> : replaces the inner html of the modal-footer html tag</li>
    <li><b>Buffer MODAL_BUTTON</b> : allows to add code before the buttons in the modal-footer html tag</li>
  </ul>        
  <div class="bs-example">
    <p>Click on the link to open the example modal.</p>
    <a href="docs/jcms/components/components_modal_example3.jsp" class="modal btn btn-default">Replaced body and footer example</a>
  </div><%-- EOF .bs-example --%>
  <div class="highlight"><pre><code>&lt;%@ include file='/jcore/doInitPage.jspf' %&gt;<br/>&lt;jalios:modal title=&quot;ui.recommendation&quot; css=&quot;customCss&quot; picture=&quot;images/jalios/icons/media/pdf.gif&quot;&gt;<br/>  &lt;jalios:buffer name=&quot;MODAL_CONTENT&quot;&gt;<br/>  &lt;div class=&quot;modal-custom-body&quot; style=&quot;padding:20px;&quot;&gt;MY OWN CONTENT&lt;/div&gt;<br/>  &lt;div class=&quot;modal-custom-footer&quot; style=&quot;padding:20px;&quot;&gt;<br/>    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary br&quot; data-dismiss=&quot;modal&quot;&gt;My own title&lt;/button&gt;<br/>  &lt;/div&gt;<br/>  &lt;/jalios:buffer&gt;<br/>&lt;/jalios:modal&gt;</code></pre></div>
  
  <h3 id="modal-size">Modal size (See <a href="docs/jcms/javascript.jsp#modals">bootstrap modal documentation</a>)</h3>
  <p>You can use predefined modal width by using one of the following css class as modal css attribute</p>
  <ul>
    <li><b>modal-lg</b> : 900px width as default bootstrap variable</li>
    <li><b>modal-md</b> : 600px width as default bootstrap variable</li>
    <li><b>modal-sm</b> : 300px width as default bootstrap variable</li>
  </ul>
  
</div><%-- EOF .bs-docs-section --%>