<%@page import="com.jalios.jcms.accesscontrol.AccessControlList"%>
<%@page import="com.jalios.jcms.WorkflowConstants"%>
<%@page import="com.jalios.jcms.taglib.ControlType"%>
<%@page import="com.jalios.jcms.taglib.settings.*"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.*"%>
<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.CategoryTreeSettings"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/forms/forms_section_chooser.jsp")); %>
<div class="bs-docs-section form-horizontal">
  <h1 id="widget-chooser" class="page-header">Chooser widget <a href="docs/jcms/forms/forms_section_modal.jsp?section=chooser" class="modal btn btn-default" onclick="return false;">Open in modal</a></h1>
  <p class="lead">How to use a chooser widget in JCMS</p>

  <h3 id="widget-file">File</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.FILE</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="file1" label="File">
      <jalios:control type="<%= ControlType.FILE %>" />
    </jalios:field>
    <jalios:field name="file2" label="Simple File">
      <jalios:control settings='<%= new FileSettings().mode(FileSettings.Mode.SIMPLE_FILE) %>' />
    </jalios:field>
    <jalios:field name="file3" label="Single File">
      <jalios:control settings='<%= new FileSettings().singleFile() %>' />
    </jalios:field>
    <jalios:field name="file4" label="Image resize">
      <jalios:control settings='<%= new FileSettings().resizeImage(50, 50) %>' />
    </jalios:field>
    <jalios:field name="file5" label="Image filter">
      <jalios:control settings='<%= new FileSettings().filter(FileSettings.FileFilter.IMAGE) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-file") %></code></pre></div>

  <h3 id="widget-imagepath">Image path</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.IMAGEPATH</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="imagepath1" label="Imagepath">
      <jalios:control type="<%= ControlType.IMAGEPATH %>" />
    </jalios:field>
    <jalios:field name="imagepath2" label="Imagepath disabled" disabled="true">
      <jalios:control type="<%= ControlType.IMAGEPATH %>" />
    </jalios:field>
    <jalios:field name="imagepath3" label="Imagepath with forced Workspace">
      <jalios:control settings="<%= new ImagePathSettings().workspace(channel.getDefaultWorkspace()) %>" />
    </jalios:field>    
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-imagepath") %></code></pre></div>

  <h3 id="widget-mediapath">Media path</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.MEDIAPATH</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="mediapath1" label="Mediapath">
      <jalios:control type="<%= ControlType.MEDIAPATH %>" />
    </jalios:field>
    <jalios:field name="mediapath2" label="MediaPath with forced Workspace">
      <jalios:control settings="<%= new MediaPathSettings().workspace(channel.getDefaultWorkspace()) %>" />
    </jalios:field>    
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-mediapath") %></code></pre></div>

  <h3 id="widget-date">Date</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.DATE</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="date1" label="Date">
      <jalios:control type="<%= ControlType.DATE %>" />
    </jalios:field>
    <jalios:field name="date2" label="Date time">
      <jalios:control settings='<%= new DateSettings().displayTime() %>' />
    </jalios:field>
    <jalios:field name="date3" label="Date with tooltip" tooltip="This is my tooltip !">
      <jalios:control type="<%= ControlType.DATE %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-date") %></code></pre></div>

  <h3 id="widget-duration">Duration</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.DURATION</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="duration1" label="Duration">
      <jalios:control type="<%= ControlType.DURATION %>" />
    </jalios:field>
    <jalios:field name="duration2" label="Duration resolution" value="<%= 24 * 60 * 60 %>">
      <jalios:control settings='<%= new DurationSettings().resolution(DurationSettings.Resolution.MINUTE) %>' />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-duration") %></code></pre></div>

  <h3 id="widget-query">Query</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.QUERY</li>
  </ul> 
  <div class="bs-example">
    <jalios:field name="query1" label="Query">
      <jalios:control type="<%= ControlType.QUERY %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-query") %></code></pre></div>

  <h3 id="widget-member">Member</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.MEMBER</li>
  </ul>
  <div class="bs-example">
    <jalios:field name="member1" label="Member">
      <jalios:control type="<%= ControlType.MEMBER %>" />
    </jalios:field>
    <jalios:field name="member2" label="Member keyword" keyword="true">
      <jalios:control type="<%= ControlType.MEMBER %>" />
    </jalios:field>
    <jalios:field name="member3" label="Member with filter">
      <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ADMIN, MemberSettings.MemberFilter.JSTORE) %>' />
    </jalios:field>
    <%
    Set<Member> memberSet = new TreeSet(Member.getNameComparator());
    memberSet.addAll(channel.getDataSet(Member.class));
    %>
    <jalios:field name="member4" label="Member select">
      <jalios:control settings='<%= new MemberSettings().select().enumValues(memberSet) %>' />
    </jalios:field>
    <jalios:field name="member5" label="Member select multiple">
      <jalios:control settings='<%= new MemberSettings().select().multiple().enumValues(memberSet) %>' />
    </jalios:field>
    <jalios:field name="member6" label="Member radio">
      <jalios:control settings='<%= new MemberSettings().radio().enumValues(channel.getDefaultAdmin()) %>' />
    </jalios:field>
    <jalios:field name="member7" label="Member checkbox">
      <jalios:control settings='<%= new MemberSettings().checkbox().enumValues(channel.getDefaultAdmin()) %>' />
    </jalios:field>
    
    <jalios:field name="member8" label="Member multivalued" mv="2" value="j_2">
      <jalios:control settings='<%= new MemberSettings().chooser() %>' />
    </jalios:field>
    
    <jalios:field name="member9" label="Member with good value" value="<%= channel.getDefaultAdmin() %>">
      <jalios:control type="<%= ControlType.MEMBER %>" />
    </jalios:field>
    <jalios:field name="member10" label="Member with bad value" value="Bad value">
      <jalios:control type="<%= ControlType.MEMBER %>" />
    </jalios:field>
    <jalios:field name="member11" value="<%= channel.getDefaultAdmin() %>" keyword="true" resource="field-vertical" css="nodnd" description='This field is filtered'>
      <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>' />
    </jalios:field>
    <jalios:field name="member12" label="Member with forced Workspace">
      <jalios:control settings='<%= new MemberSettings().workspace(channel.getDefaultWorkspace()) %>' />
    </jalios:field>    
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-member") %></code></pre></div>

  <h3 id="widget-group">Group</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.GROUP</li>
  </ul>    
  <div class="bs-example">
    <jalios:field name="group1" label="Group">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
    <jalios:field name="group2" label="Group keyword" keyword="true">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
    <jalios:field name="group3" label="Group with filter">
      <jalios:control settings='<%= new GroupSettings().group(channel.getDefaultGroup()) %>' />
    </jalios:field>
    <jalios:field name="group4" label="Group select">
      <jalios:control settings='<%= new GroupSettings().select().enumValues(channel.getDefaultGroup()) %>' />
    </jalios:field>
    <jalios:field name="group5" label="Group select multiple">
      <jalios:control settings='<%= new GroupSettings().select().multiple().enumValues(channel.getDefaultGroup()) %>' />
    </jalios:field>
    <jalios:field name="group6" label="Group radio">
      <jalios:control settings='<%= new GroupSettings().radio().enumValues(channel.getDefaultGroup()) %>' />
    </jalios:field>
    <jalios:field name="group7" label="Group checkbox">
      <jalios:control settings='<%= new GroupSettings().checkbox().enumValues(channel.getDefaultGroup()) %>' />
    </jalios:field>
    
    <jalios:field name="group8" label="Group multivalued" mv="2" value="<%= channel.getDefaultGroup() %>">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
    
    <jalios:field name="group9" label="Group with good value" value="<%= channel.getDefaultGroup() %>">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
    <jalios:field name="group10" label="Group with bad value" value="Bad value">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
    <jalios:field name="group11" label="Group with forced Workspace">
      <jalios:control settings="<%= new GroupSettings().workspace(channel.getDefaultWorkspace()) %>" />
    </jalios:field>    
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-group") %></code></pre></div>

  <h3 id="widget-publication">Publication</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.PUBLICATION</li>
  </ul>    
  <div class="bs-example">
    <jalios:field name="pub1" label="Publication">
      <jalios:control type="<%= ControlType.PUBLICATION %>" />
    </jalios:field>
    <jalios:field name="pub2" label="Publication keyword" keyword="true">
      <jalios:control type="<%= ControlType.PUBLICATION %>" />
    </jalios:field>
    <jalios:field name="pub3" label="Publication super type">
      <jalios:control settings='<%= new PublicationSettings().superType(DBFileDocument.class) %>' />
    </jalios:field>
    <jalios:field name="pub4" label="Publication pstatus">
      <jalios:control settings='<%= new PublicationSettings().pstatus(WorkflowConstants.PUBLISHED_PSTATUS) %>' />
    </jalios:field>
    <jalios:field name="pub5" label="Publication workspace">
      <jalios:control settings='<%= new PublicationSettings().workspace(channel.getDefaultWorkspace()) %>' />
    </jalios:field>
    <jalios:field name="pub6" label="Publication no workspace filter">
      <jalios:control settings='<%= new PublicationSettings().noWorkspaceFilter() %>' />
    </jalios:field>
    <jalios:field name="pub7" label="Publication category">
      <jalios:control settings='<%= new PublicationSettings().category(channel.getRootCategory()) %>' />
    </jalios:field>
    <%
    Set<Article> articleSet = new TreeSet(Article.getTitleComparator(userLang));
    articleSet.addAll(channel.getDataSet(Article.class));
    %>
    <jalios:field name="pub8" label="Publication select">
      <jalios:control settings='<%= new PublicationSettings().select().enumValues(articleSet) %>' />
    </jalios:field>
    <jalios:field name="pub8" label="Publication select multiple">
      <jalios:control settings='<%= new PublicationSettings().select().multiple().enumValues(articleSet) %>' />
    </jalios:field>
    <jalios:field name="pub9" label="Publication radio">
      <jalios:control settings='<%= new PublicationSettings().radio().enumValues("j_300") %>' />
    </jalios:field>
    <jalios:field name="pub10" label="Publication checkbox">
      <jalios:control settings='<%= new PublicationSettings().checkbox().enumValues("j_300") %>' />
    </jalios:field>
    
    <%
    Set<FileDocument> fileDocumentSet = channel.getDataSet(FileDocument.class);
    FileDocument fd = fileDocumentSet != null && fileDocumentSet.size() > 0 ? fileDocumentSet.iterator().next() : null;
    %>
    <jalios:field name="group8" label="Publication multivalued" mv="2" value="<%= fd %>">
      <jalios:control settings='<%= new PublicationSettings().superType(FileDocument.class) %>' />
    </jalios:field>
    
    <jalios:field name="pub11" label="FileDocument with good value" value="j_300">
      <jalios:control settings='<%= new PublicationSettings().superType(Article.class) %>' />
    </jalios:field>
    <jalios:field name="pub12" label="FileDocument with bad value" value="Bad value">
      <jalios:control settings='<%= new PublicationSettings().superType(FileDocument.class) %>' />
    </jalios:field>
    <jalios:field name="pub13" label="FileDocument with forced workspace">
      <jalios:control settings='<%= new PublicationSettings().workspace(channel.getDefaultWorkspace()).superType(FileDocument.class) %>' />
    </jalios:field>
    <jalios:field name="pub14" label="FileDocument in ajax mode">
      <% request.setAttribute(JcmsConstants.AJAX_MODE_ATTR, true); %>
      <jalios:control settings='<%= new PublicationSettings().superType(FileDocument.class) %>' />
      <% request.removeAttribute(JcmsConstants.AJAX_MODE_ATTR); %>
    </jalios:field>
    <jalios:field name="pub15" label="FileDocument multivalued in ajax mode" mv="2">
      <% request.setAttribute(JcmsConstants.AJAX_MODE_ATTR, true); %>
      <jalios:control settings='<%= new PublicationSettings().superType(FileDocument.class) %>' />
      <% request.removeAttribute(JcmsConstants.AJAX_MODE_ATTR); %>
    </jalios:field> 
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-publication") %></code></pre></div>

  <h3 id="widget-workspace">Workspace</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.WORKSPACE</li>
  </ul>    
  <div class="bs-example">
    <jalios:field name="workspace1" label="Workspace">
      <jalios:control type="<%= ControlType.WORKSPACE %>" />
    </jalios:field>
    <jalios:field name="workspace2" label="Workspace keyword" keyword="true">
      <jalios:control type="<%= ControlType.WORKSPACE %>" />
    </jalios:field>
    <jalios:field name="workspace4" label="Workspace select">
      <jalios:control settings='<%= new WorkspaceSettings().select().enumValues(channel.getDefaultWorkspace()) %>' />
    </jalios:field>
    <jalios:field name="workspace5" label="Workspace radio">
      <jalios:control settings='<%= new WorkspaceSettings().radio().enumValues(channel.getDefaultWorkspace()) %>' />
    </jalios:field>
    <jalios:field name="workspace6" label="Workspace checkbox">
      <jalios:control settings='<%= new WorkspaceSettings().checkbox().enumValues(channel.getDefaultWorkspace()) %>' />
    </jalios:field>
    <jalios:include jsp="docs/jcms/forms/forms_section_chooser_ajaxrefresh.jsp" />
    
    <jalios:field name="workspace7" label="Workspace with good value" value="<%= channel.getDefaultWorkspace() %>">
      <jalios:control type="<%= ControlType.WORKSPACE %>" />
    </jalios:field>
    <jalios:field name="workspace8" label="Workspace with bad value" value="Bad value">
      <jalios:control type="<%= ControlType.WORKSPACE %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-workspace") %></code></pre></div>

  <h3 id="widget-category">Category</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.CATEGORY</li>
  </ul>    
  <div class="bs-example">
    <div class="example-ignore">
    <%
    List<String> list = new ArrayList<String>();
    Category noChildrenCategory = null;
    Set<Category> categories = channel.getRootCategory().getChildrenSet();
    if(Util.notEmpty(categories)) {
      boolean hasChild = false;
      boolean hasParent = false;
      for(Category cat : categories) {
        Set<Category> children = cat.getChildrenSet();
        if(!hasChild && Util.notEmpty(children)) {
          list.add(children.iterator().next().getId());
          hasChild = true;
        } else if(!hasParent && Util.notEmpty(children)) {
          list.add(cat.getId());
          noChildrenCategory = cat;
          hasParent = true;
        }
        
        if(list.size() == 2) {
          break;
        }
      }
    }
    String[] selectedCategoryIds = list.toArray(new String[]{});
    Category[] selectedCategories = JcmsUtil.stringArrayToDataArray(Category.class, selectedCategoryIds);
    %>
    <jalios:message level="<%= selectedCategoryIds.length < 2 ? MessageLevel.WARN : MessageLevel.INFO %>" dismissable="false">
      <% if(selectedCategoryIds.length < 2) { %>
        <p>Please create new categories and sub-categories in order to make the following examples work correctly.</p>
      <% } else { %>
        <p>Here are the categories used in the following examples to select / retain / remove them in the category fields:</p>
        <ul>
          <% for(Category selectedCat : selectedCategories) { %>
            <li><%= selectedCat.getName() + " ["+ selectedCat.getId() +"]" %></li>
          <% } %>
        </ul>
      <% } %>
    </jalios:message>
    </div>
    <jalios:field name="category1" label="Category">
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
    <jalios:field name="category2" label="Category multiple with one input" value='<%= Util.join(selectedCategoryIds, " ") %>'>
      <jalios:control settings='<%= new CategorySettings().multiple() %>' />
    </jalios:field>
    <jalios:field name="category3" label="Category multiple with multiple inputs" mv="2" value="<%= selectedCategoryIds %>">
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
    <jalios:field name="category4" label="Category keyword" keyword="true">
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
    <jalios:field name="category5" label="Category disable live creation" keyword="true">
      <jalios:control settings='<%= new CategorySettings().disableLiveCreation() %>' />
    </jalios:field>
    <jalios:field name="category6" label="Category member filter READ rights" keyword="true">
      <jalios:control settings='<%= new CategorySettings().filter(CategoryFilter.READ) %>' />
    </jalios:field>
    <jalios:field name="category7" label="Category member filter USE rights" keyword="true">
      <jalios:control settings='<%= new CategorySettings().filter(CategoryFilter.USE) %>' />
    </jalios:field>
    <jalios:field name="category8" label="Category member filter MANAGE rights" keyword="true">
      <jalios:control settings='<%= new CategorySettings().filter(CategoryFilter.MANAGE) %>' />
    </jalios:field>
    <jalios:field name="category9" label="Category select">
      <jalios:control settings='<%= new CategorySettings().select().enumValues(selectedCategoryIds) %>' />
    </jalios:field>
    <jalios:field name="category10" label="Category radio">
      <jalios:control settings='<%= new CategorySettings().radio().enumValues(selectedCategoryIds) %>' />
    </jalios:field>
    <jalios:field name="category11" label="Category checkbox">
      <jalios:control settings='<%= new CategorySettings().checkbox().enumValues(selectedCategoryIds) %>' />
    </jalios:field>
    
    <jalios:field name="category12" label="Category tree radio" value="<%= selectedCategoryIds.length > 0 ? selectedCategoryIds[0] : null %>">
      <jalios:control settings='<%= new CategorySettings().tree() %>' />
    </jalios:field>
    <jalios:field name="category13" label="Category tree checkbox" value="<%= selectedCategoryIds %>">
      <jalios:control settings='<%= new CategorySettings().tree().multiple() %>' />
    </jalios:field>
    <jalios:field name="category14" label="Category tree disabled" disabled="true">
      <jalios:control settings='<%= new CategorySettings().tree() %>' />
    </jalios:field>
    <jalios:field name="category15" label="Category tree level (2)">
      <jalios:control settings='<%= new CategorySettings().tree().level(2) %>' />
    </jalios:field>
    <jalios:field name="category16-1" label="Category tree removed">
      <jalios:control settings='<%= new CategorySettings().tree().removed(selectedCategoryIds) %>' />
    </jalios:field>
    <jalios:field name="category16-2" label="Category tree removed with level (1)">
      <jalios:control settings='<%= new CategorySettings().tree().level(1).removed(selectedCategoryIds) %>' />
    </jalios:field>
    <jalios:field name="category17-1" label="Category tree retained">
      <jalios:control settings='<%= new CategorySettings().tree().retained(selectedCategoryIds) %>' />
    </jalios:field>
    <jalios:field name="category17-2" label="Category tree retained with level (2)">
      <jalios:control settings='<%= new CategorySettings().tree().level(2).retained(selectedCategoryIds) %>' />
    </jalios:field>
    <jalios:field name="category18" label="Category tree disable dragdrop">
      <jalios:control settings='<%= new CategorySettings().tree().disableDragdrop() %>' />
    </jalios:field>
    <jalios:field name="category19" label="Category tree hide ctxmenu">
      <jalios:control settings='<%= new CategorySettings().tree().hideCtxMenu() %>' />
    </jalios:field>
    <jalios:field name="category20" label="Category tree disable search">
      <jalios:control settings='<%= new CategorySettings().tree().disableSearch() %>' />
    </jalios:field>
    
    <jalios:field name="category21" label="Category with good value" value="<%= channel.getRootCategory() %>">
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
    <jalios:field name="category22" label="Category with bad value" value="Bad value">
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
    <% if (noChildrenCategory != null) { %>
    <jalios:field name="category23" label="Category with no childrens" value="Bad value">
      <%
      CategoryTreeSettings settings = new CategorySettings().tree().root(noChildrenCategory.getChildrenSet());
      settings.addOption(CategoryTreeSettings.ORIGINAL_ROOT_CATEGORY, noChildrenCategory);
      %>
      <jalios:control settings='<%= settings %>' />
    </jalios:field>
    <% } %>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-category") %></code></pre></div>

  <h3 id="widget-acl">ACL</h3>
  <ul>
    <li><b>Control</b> - <b>type</b> = ControlType.ACL</li>
  </ul> 
  <div class="bs-example">
    <jalios:field name="acl1" label="ACL">
      <jalios:control type="<%= ControlType.ACL %>" />
    </jalios:field>
    
    <% Set<AccessControlList> aclList = channel.getDataSet(AccessControlList.class); %>
    <jalios:field name="acl2" label="ACL with good value" value="<%= aclList != null ? aclList.iterator().next() : null %>">
      <jalios:control type="<%= ControlType.ACL %>" />
    </jalios:field>
    <jalios:field name="acl3" label="ACL with bad value" value="Bad value">
      <jalios:control type="<%= ControlType.ACL %>" />
    </jalios:field>
  </div>
  <div class="highlight"><pre><code><%= exampleMap.get("widget-acl") %></code></pre></div>

</div>	   