<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>
<section id="images">
  <div class="page-header">
    <h1>Images <small>manage photo and thumbnails</small></h1>
  </div>
     
  <h2>Data Icon</h2>
  <p>You can display the data icon of a given Type or of a given Data.</p>
  <p>For a Publication the following code will return the default WebPage icon as defined in jcms.prop : <jalios:dataicon class="<%= WebPage.class %>"/></p>
  <pre>&lt;jalios:dataicon class="&lt;%= WebPage.class %&gt;" /&gt;</pre>
  <p>Icons must be defined in jcms.prop with the following syntax :</p>
<pre>
types.WebPage.icon:             images/jalios/icons/data/webpage.png
types.Publication.icon:         images/jalios/icons/publication.gif
</pre>
  <p>The tag can also be called on a instance of a Data. <br> As an example, calling the tag on the logged member will return an icon representing the Member : <jalios:dataicon data="<%= loggedMember%>"/></p>
  <pre>&lt;jalios:dataicon data="&lt;%= loggedMember %&gt;" /&gt;</pre>
  <p>There's some specific behavior for some types : </p>
  <ul>
    <li>FileDocument : there's an icon for each type of document (<img src="<%= channel.getProperty("file-document.icon.application/vnd.openxmlformats-officedocument.wordprocessingml.document") %>" alt="Word"> Word, <img src="<%= channel.getProperty("file-document.icon.application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") %>" alt="Excel"/> Excel, <img src="<%= channel.getProperty("file-document.icon.application/vnd.openxmlformats-officedocument.presentationml.presentation")%>" alt="Powerpoint"/> ppt...)</li>
    <li>Member : the icon representing the Member will be different depending on the Workspace, and the rights of the Member on this Workspace <jalios:icon src="mbr-admin" /> <jalios:icon src="mbr-writer" /></li>
    <li>Workspace : the icon will change based on state of Workspace (<jalios:icon src="<%= Workspace.WORKSPACE_CLOSED_ICON %>" /> Closed, <jalios:icon src="<%= Workspace.WORKSPACE_MODEL_ICON %>" /> model...) </li>
  </ul>
  
  <p></p>  
      
  <h2>Thumbnails</h2>
  <p>
    Since JCMS 8, Use <a href="docs/lib/bootstrap/components.html#thumbnails">bootstrap's thumbnail</a> to display images.
    The tag <code>jalios:thumbnail</code> provides thumbnail of images in an optimized size.
  </p>
  <div class="row">
    <div class="col-md-10">
<pre>
&lt;a href="images/jalios/logos/puzzle.jpg" class="modal thumbnail"&gt;
  &lt;jalios:thumbnail path="images/jalios/logos/puzzle.jpg" width="100" height="100"&gt;
    &lt;img src="images/jalios/icons/media/image.gif" alt="" /&gt;
  &lt;/jalios:thumbnail&gt;
&lt;/a&gt;
</pre>
    </div>
    <div class="col-md-2">
<a href="images/jalios/logos/puzzle.jpg" class="modal thumbnail"><jalios:thumbnail path="images/jalios/logos/puzzle.jpg" width="100" height="100"><jalios:icon src="image" /></jalios:thumbnail></a>
    </div>
  </div>

  <h2>Photos</h2>
  <% Member photoMember = loggedMember; int photoSize = 0; %>
	<div class="row">
	  <div class="col-md-6">
	    <h3>Photo wrapper</h3>
	    <p>Member's photo must be displayed using <code>doMemberPhoto.jspf</code> with convenient size</p>
	    <ul>
	      <li>JcmsConstants.PHOTO_LARGE</li>
	      <li>JcmsConstants.PHOTO_NORMAL</li>
	      <li>JcmsConstants.PHOTO_SMALL</li>
	      <li>JcmsConstants.PHOTO_TINY</li>
	      <li>JcmsConstants.PHOTO_ICON</li>
	    </ul>
	  </div>
	  <div class="col-md-6">
	    <h3>Photo icons</h3>
	    <% photoSize = JcmsConstants.PHOTO_ICON;
	    %><%@ include file="/jcore/doMemberPhoto.jspf" %> Photo of <%= loggedMember.getFullName() %>
	    <% photoSize = JcmsConstants.PHOTO_ICON;
	    %><%@ include file="/jcore/doMemberPhoto.jspf" %> Photo of <%= loggedMember.getFullName() %>
	    <% photoSize = JcmsConstants.PHOTO_ICON;
	    %><%@ include file="/jcore/doMemberPhoto.jspf" %> <%= lorem %>
	  </div>
	</div>
    
  <div class="row">
    <div class="col-md-6">
      <h3>Photo sizes</h3>
<pre>
&lt;% Member photoMember = loggedMember;
   int photoSize = JcmsConstants.PHOTO_LARGE;
%&gt;&lt;%@ include file="/jcore/doMemberPhoto.jspf" %&gt;
</pre>
      <% photoSize = JcmsConstants.PHOTO_LARGE;
      %><%@ include file="/jcore/doMemberPhoto.jspf" %>
        
      <% photoSize = JcmsConstants.PHOTO_NORMAL;
      %><%@ include file="/jcore/doMemberPhoto.jspf" %>
        
      <% photoSize = JcmsConstants.PHOTO_SMALL;
      %><%@ include file="/jcore/doMemberPhoto.jspf" %>
    
      <% photoSize = JcmsConstants.PHOTO_TINY;
      %><%@ include file="/jcore/doMemberPhoto.jspf" %>
        
      <%  photoSize = JcmsConstants.PHOTO_ICON;
      %><%@ include file="/jcore/doMemberPhoto.jspf" %>
    </div>
    <div class="col-md-6">
      <h3>Photo tables</h3>
      <table class="layout">
        <tr>
          <td class="fit">
            <% photoMember = loggedMember;
            photoSize = JcmsConstants.PHOTO_TINY;
            %><%@ include file="/jcore/doMemberPhoto.jspf" %>
          </td>
          <td><%= lorem %></td>
        </tr>
        <tr>
          <td class="fit">
            <% photoMember = loggedMember;
            photoSize = JcmsConstants.PHOTO_TINY;
            %><%@ include file="/jcore/doMemberPhoto.jspf" %>
          </td>
          <td><%= lorem %></td>
        </tr>
        <tr>
          <td class="fit">
            <% photoMember = loggedMember;
            photoSize = JcmsConstants.PHOTO_TINY;
            %><%@ include file="/jcore/doMemberPhoto.jspf" %>
          </td>
          <td><%= lorem %></td>
        </tr>
      </table>
    </div>
  </div>
</section>