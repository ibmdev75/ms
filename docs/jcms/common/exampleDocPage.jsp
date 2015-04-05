<%@ include file="/docs/jcms/common/doInitChapter.jspf" %>

<div class="bs-docs-header" id="content">
      <div class="container">
        <h1>Example Header</h1>
        <p>Example header description</p>
      </div>
    </div>

<div class="container bs-docs-container">
	<div class="row">
		<div class="col-md-9" role="main">
		
			<div class="bs-docs-section">
			  <h1 id="overview" class="page-header">Example section</h1>
			  <p class="lead">Example description</p>
			  <h3 id="overview-doctype">Example subtitle</h3>
			  <p>Example subtext</p>
				<div class="highlight"><pre><code>Example highlight code</code></pre></div>
			
			  <h3 id="overview-mobile">Example subtitle</h3>
			  <p>Example description</p>
	    </div>
	    
	    
	  </div>
    <div class="col-md-3">
	  <div class="bs-docs-sidebar hidden-print" role="complementary">
			<ul class="nav bs-docs-sidenav">
		    <li>
				  <a href="#overview">Example sidenav item</a>
				  <ul class="nav">
					    <li><a href="#overview-doctype">Example sidenav item link</a></li>
					    <li><a href="#overview-mobile">Example sidenav item link</a></li>
				  </ul>
				</li>
	    </ul>
	    <a class="back-to-top" href="#top">
	      Back to top
	    </a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/docs/jcms/common/doDocsFooter.jsp" />