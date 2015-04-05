<%@ include file="/jcore/doInitPage.jspf" %>
<section id="commons">
  <div class="page-header">
    <h1>Commons <small>Many little handy classes</small></h1>
  </div>
      
  <h2>Helpers</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>Text</h3>
      <p>Helpers to align text in the flow</p>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Class</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><code>.text-left</code></td>
            <td>Align text on left</td>
          </tr>
          <tr>
            <td><code>.text-right</code></td>
            <td>Align text on right</td>
          </tr>
          <tr>
            <td><code>.text-center</code></td>
            <td>Align text on center</td>
          </tr>
        </tbody>
      </table>
    </div>
        
    <div class="col-md-6">
      <h3>Images</h3>
      <p>Helpers to handle images's padding</p>
          
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Class</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><code>.icon</code></td>
            <td>Will set the default border paragraph alignement.</td>
          </tr>
          <tr>
            <td><code>.icon16</code></td>
            <td>Extends .icon and force 16x16</td>
          </tr>
          <tr>
            <td><code>.padded</code></td>
            <td>Extends .icon and Add convenient margin to be sized on a @baseline*1.5 (Inputs)</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  
  
  <h2>Miscs</h2>
  <div class="row">
    <div class="col-md-6">
      <h3>Badges</h3>
      The <code>.badge .badge-small</code> allow fancy <span class="badge badge-small">small badges</span>. Use it instead of <code>.label</code> or <code>.item-info</code> which is a <strong>conflicting</strong> term.
      <br />
      Compatibility test: 
      <span class="badge badge-small badge-success">success</span>, 
      <span class="badge badge-small badge-warning">warning</span>, 
      <span class="badge badge-small badge-important">important</span>,
      <span class="badge badge-small badge-info">info</span>,
      <span class="badge badge-small badge-inverse">inverse</span>
    </div>
    <div class="col-md-6">  
      <h3>Hightlight</h3>
      <p>Styles are declared as variables: <code>@highlightBorder</code>, <code>@highlightBackground</code></p>
      The <code>span.highlight</code> will <span class="highlight">highlight</span> the wrapped text.
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-6">
      <h3>Basics</h3>
      <p>Convenient generic helper (not mixin)</p>
      <ul>
        <li><code>.show</code>: display block</li>
        <li><code>.hide</code>: display none</li>
        <li><code>.inline</code>: display inline</li>
        <li><code>.clear</code>: clear both</li>
      </ul>
    </div> 
    <div class="col-md-6">
      <h3>Sortable</h3>
      <p>Provides mechanisms to handle sortable (drag and drop) of list's items and container's boxes.</p>
      <p>See <a href="docs/jsdoc/$.jalios.Sortable.jsp">JavaScript Sortable</a> for more informations.</p>
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-6">  
      <h3>BR</h3>
      <p>The <code>&lt;br&gt;</code> should no longer be used because all blocks add a <code>margin-bottom: @baseline</code>. The <code>.br</code> adds this behavior to a given block.</p>
    </div>
    <div class="col-md-6">  
      <h3>Focus</h3>
      <p>
        When a class <code>in</code>, <code>active</code>, <code>hide</code>, <code>hide-scroll</code> is added/removed (Ajax-Refresh, Modal, Tabs, etc...) 
        a <code>smarFocus()</code> is called to focus the first visible input.
        The search can be narrow to a sub <code>.focus</code>. A wrapping class <code>no-focus</code> will prevent this behavior.
      </p>
    </div>
  </div>
  
</section>