<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="plupload">
  <div class="page-header">
    <h1>Upload <small>Plupload, in modal ...</small></h1>
  </div>
  <p>JCMS provides multiple framework to handle file upload throught Ajax-Request and cassic forms.</p>
  <h2>Plupload</h2>
  <div class="br">
    <div class="row br">
      <div class="col-md-6">
        <p>JCMS provides <a href="http://www.plupload.com/">Plupload</a>, a cross browser upload framwork compatible with ajax-refresh.</p>
        <p>Files can be uploaded in JCMS throught 2 components:</p>
        <ul>
          <li>The plain old <a href="work/docChooser.jsp?nbElt=1&pstatus=0&type=FileDocument&refresh=true" onClick="return jQuery.jalios.Browser.popup(this.href)"><jalios:icon title="Upload a document"  src="upload"/> DocChooser</a> in a popup</li>
          <li>The ajax new <a href="work/docChooserModal.jsp?nbElt=1&pstatus=0&type=FileDocument&refresh=true" class="modal"><jalios:icon title="Upload a document"  src="upload"/> DocChooser</a> in a modal</li>
        </ul>
        <p>In modal, files are uploaded on the server using componen's XHR request. Then bind to Document or DBDocument when the form is submited.</p>
      </div>
      <div class="col-md-6">
        <p>Plupload can also be integrated into a dedicated modal using the following code.</p>
        <ul>
          <li>Class <code>DIV.plupload</code> define the plupload area.</li>
          <li>Class <code>plupload-field-documents</code> define the name <code>documents</code> of the form's field.</li>
          <li>Class <code>plupload-submit</code> define the button to trigger upload (works with ajax-refresh)</li>
        </ul>
      </div>
    </div>
    <div class="row br">
<pre>
  &lt;% UploadManager.getInstance().addUploadComponentScripts(jcmsContext); %&gt;
  &lt;div id="plupload-modal" class="plupload plupload-field-documents"&gt;
    &lt;p&gt;&lt;%= glp("ui.com.lbl.plupload.error.init") %&gt;&lt;/p&gt;
  &lt;/div&gt;
  &lt;input class="btn btn-default ajax-refresh plupload-submit" type="submit" name="opUpload" /&gt;
</pre>
    </div>
      <h2>Files</h2>
      <div class="row br">
        <p>
          Uploaded files to JCMS are already decoded by a ServletFilter. JSP can retrive files using <code>jcmsContext.getUploadedFile()</code>.
          Request's parameters are fully available, uploaded file content is replaced by <code>MultipartUpload</code> fake parameter.
        </p>
        <p>FormHandlers generated for JCMS Types automatically create and link FileDocument to the content.<p>
      </div>
  </div>
</section>
