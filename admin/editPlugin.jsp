<%--
  @Summary: Plugin
  @Category: Admin / Plugin
  @Author: Jean-Philippe Encausse
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.7
--%>
<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/operation/plugin-mgr")) { 
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="editPluginHandler" scope="page" class="com.jalios.jcms.plugin.EditPluginHandler"><%
 %><jsp:setProperty name="editPluginHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="editPluginHandler" property="*" /><%
%></jsp:useBean><%

  if (editPluginHandler.validate()){
    return;
  }
  jcmsContext.addJavaScript("js/jalios/table.js");
  jcmsContext.addCSSHeader("css/jalios/plugin.css");
  
  Plugin itPlugin = editPluginHandler.getPlugin();
  if (itPlugin == null) {
    %><%@ include file='/admin/doAdminHeader.jspf' %><%
    %><%@ include file='/jcore/doMessageBox.jspf' %><%
    %><%@ include file='/admin/doAdminFooter.jspf' %><%
    return;
  }
  
  request.setAttribute("title", glp("ui.adm.plugin.lbl.plugin-mgr-edit", Util.getString(itPlugin.getLabel(userLang),"")));
  request.setAttribute("pluginManagerSubAdminMenu", "true");
  String warnFile = "<jalios:icon src='warning' alt='warn' title=\""+glp("ui.adm.plugin.alt.exists")+"\" />";
%>

<%@ include file='/admin/doAdminHeader.jspf' %>
<%@ include file='/jcore/doMessageBox.jspf' %>

<div class="page-header"><h1><% /* %>Plugin Manager<% */ %><%= glp("ui.adm.plugin.lbl.plugin-mgr-edit", Util.getString(itPlugin.getLabel(userLang),"")) %></h1></div>

<form name='editForm' action='admin/editPlugin.jsp' method='post' class="form-horizontal">

  <%-- LABEL --%>
 <jalios:field  name='label' label='ui.com.lbl.label' description='ui.adm.plugin.edit.label.h' required='true' ml='<%= channel.isMultilingual() %>' value='<%= editPluginHandler.getAvailableLabelMap() %>' >
   <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
 </jalios:field>

  <%-- NAME --%>
  <jalios:field  name='name' label='ui.adm.plugin.edit.internal-name' description='ui.adm.plugin.edit.internal-name.h' required='true' value='<%= editPluginHandler.getName() %>' disabled='<%= !editPluginHandler.isNewPlugin() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  <% if (!editPluginHandler.isNewPlugin()) { %>
  <input type='hidden' name='name' value="<%= editPluginHandler.getName() %>"/>
  <% } %>

  <%-- DESCRIPTION --%>
  <jalios:field  name='description' label='ui.adm.plugin.edit.description' required='true' ml='<%= channel.isMultilingual() %>' value='<%= editPluginHandler.getAvailableDescriptionMap() %>'>
    <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
  </jalios:field>


<br/>

<div class="tab-pane" id="editPlugin">
<div class="tab-page">
  
  <h2 class="tab"><%= glp("ui.com.tab.general") %></h2>

<%-- 
  Do not allow from this editior because it may perform side effects: initialised is modified when the XML is modified
 <jalios:field  name='<%= "initialized" %>' label='<%= glp("ui.adm.plugin.lbl.initialized") %>' value='<%= ""+editPluginHandler.getAvailableInitialized() %>'>
  <jalios:control type="<%= ControlType.BOOLEAN %>" />
</jalios:field>

--%>  
  <jalios:field  name='version' label='ui.com.lbl.version' required='true' value='<%= editPluginHandler.getAvailableVersion() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>


  <jalios:field  name='order' label='ui.adm.plugin.lbl.order' value='<%= ""+editPluginHandler.getAvailableOrder() %>'>
    <jalios:control type="<%= ControlType.NUMBER %>" />
  </jalios:field>


  <jalios:field  name='url' label='ui.com.lbl.url' value='<%= editPluginHandler.getAvailableUrl() %>'>
    <jalios:control type="<%= ControlType.URL %>" />
  </jalios:field>

  
  <jalios:field  name='author' label='ui.adm.plugin.lbl.author' required='true' value='<%= editPluginHandler.getAvailableAuthor() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

  
  <jalios:field  name='license' label='ui.com.lbl.license' required='true' value='<%= editPluginHandler.getAvailableLicense() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>


  <jalios:field  name='jcms' label='ui.adm.plugin.lbl.jcms' description='ui.adm.plugin.lbl.jcms.h' value='<%= editPluginHandler.getAvailableJcms() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>


  <jalios:field  name='jsync' label='ui.adm.plugin.lbl.jsync' value='<%= ""+editPluginHandler.getAvailableJSync() %>'>
    <jalios:control type="<%= ControlType.BOOLEAN %>" />
  </jalios:field>


  <jalios:field  name='appServer' label='ui.adm.plugin.lbl.appserver' value='<%= editPluginHandler.getAvailableAppServer() %>' mv='1'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

</div>
  
  <% if (!editPluginHandler.isNewPlugin()) { %> 
	<div class='tab-page'>
	  <h2 class="tab"><%= glp("ui.adm.plugin.lbl.files") %></h2>
	  
	  <div class="tab-pane" id="editPluginFiles">
	  
	  <%-- ||| TYPES ||||||||||||||||||||||||||||||||||||| --%>
	  <% 
	    Map typeMap = itPlugin.getTypesPath(true,false); 
	    if (Util.notEmpty(typeMap)) {
		%>
		<div class="tab-page">
	  <h2 class='tab'><%= glp("ui.adm.plugin.lbl.types") %></h2>
	  
	  <div class='tabinfo'><%= glp("ui.adm.plugin.doc.types") %></div>
	  
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed' colspan='2'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			  <th><%= glp("ui.com.lbl.type") %></th>
			</tr>
		</thead>
		<tbody>
		
		<jalios:foreach collection='<%= typeMap.entrySet() %>' type='Map.Entry' name='itEntry'>
		  <% 
		    String    itType       = (String) itEntry.getKey();
		    Set       itPathSet    = (Set)    itEntry.getValue();
		    Set       itAllPathSet = new TreeSet(itPathSet);
		    TypeEntry itTE = null;
        try {
          itTE = channel.getTypeEntry(channel.getClass(itType));
        } catch (ClassNotFoundException ex) {
          // empty
        }
		    if (itTE != null){
		      itAllPathSet.addAll(itTE.getFilesPathSet());
		    }
		    int itCounter2 = 0;
		  %>
		  <jalios:foreach collection='<%= itAllPathSet %>' type='java.lang.String' name='itPath' counter="itCounter2NotUsed">
		  <% 
		    File itFile = new File(channel.getRealPath(itPath));
		    String exists  = itFile.exists() ? "" : warnFile;
		    
		    // Is this file generated not modified ?
		    boolean generatedNotModifiedFile = false;
		    if ( ( itPath.endsWith(".jsp") && !TypeUtil.hasJspSignatureChanged(itFile) ) ||
		        ( itPath.endsWith(".java") && !TypeUtil.hasJavaSignatureChanged(itFile) ) ) {
		        generatedNotModifiedFile = true;
		    } else if (itPath.endsWith(".class")) {
		      String associatedJavaFilePath = itPath.substring(0, itPath.length() - 6) + ".java";
		      File associatedJavaFile = new File(channel.getRealPath(associatedJavaFilePath));
		      if (associatedJavaFile.exists() && !TypeUtil.hasJavaSignatureChanged(associatedJavaFile)) {
		        generatedNotModifiedFile = true;
		      }
		    }
		    if (itPath.startsWith("WEB-INF/classes/generated/")) {
		      // It is the case for StorableHandler.
		      // Actually nothing in generated is supposed to be modified
		      generatedNotModifiedFile = true;
		    }
		        
		    // Don't show generated not modified files
		    if (!generatedNotModifiedFile) {    
			    String checked = itPathSet.contains(itPath) ? "checked='checked'" : "";
			    itCounter2++;
		  %>
		  <tr>
		    <td><input type='checkbox' name='type' value="<%= itType+"|"+itPath %>" <%= checked %>/></td>
		    <td><%= itCounter %>.<%= itCounter2 %></td>
		    <td><%= itPath.substring(itPath.lastIndexOf("/")+1) %> <%= exists %></td>
		    <td><%= itPath %></td>
		    <td><%= itType %></td>
		  </tr>
		  <% } %>
		  </jalios:foreach>
		</jalios:foreach>
		</tbody>
		</table>
		</div>
		<% } %>
		
		
		
		<%-- ||| WORKFLOW ||||||||||||||||||||||||||||||||||||| --%>
		<% 
		  Set wfSet    = itPlugin.getWorkflowsPath();
		  Set allWfSet = PluginManager.getPluginManager().getWorkflowsPath();
		  
		  if (Util.notEmpty(wfSet)) {
		    allWfSet.addAll(wfSet);
		  }
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.com.lbl.workflow") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.workflow") %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed' colspan='2'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			</tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= allWfSet %>' type='java.lang.String' name='itPath'>
		  <% 
		    String exists  = new File(channel.getRealPath(itPath)).exists() ? "" : warnFile; 
		    String checked = wfSet.contains(itPath) ? "checked='checked'" : "";
		    String name    = itPath.substring(itPath.lastIndexOf("/")+1,itPath.length()-4);
		  %>
		  <tr>
		    <td><input type='checkbox' name='workflow' value="<%= name %>" <%= checked %>/></td>
		    <td><%= itCounter %>.</td>
		    <td><%= name  %> <%= exists %></td>
		    <td><%= itPath %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
		</div>
		
		<%-- ||| JARS ||||||||||||||||||||||||||||||||||||| --%>
		<% 
		  Set jarsSet    = itPlugin.getJarsPath(); 
		  Set allJarsSet = PluginManager.getPluginManager().getJarsPath();
		  if (Util.notEmpty(jarsSet)) {
		    allJarsSet.addAll(jarsSet);
		  }
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.jars") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.jar") %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed' colspan='2'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			</tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= allJarsSet %>' type='java.lang.String' name='itPath'>
		  <%
		    String checked   = "";
		    if (jarsSet.contains(itPath)){
		      checked = "checked='checked'";
		    }
		    String exists = new File(channel.getRealPath(itPath)).exists() ? "" : warnFile; 
		    String name   = itPath.substring(itPath.lastIndexOf("/")+1);
		  %>
		  <tr>
		    <td><input type='checkbox' name='jar' value="<%= name %>" <%= checked %>/></td>
		    <td><%= itCounter %>.</td>
		    <td><%= name %> <%= exists %></td>
		    <td><%= itPath %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
	  </div>
	  
	  <%-- ||| PRIVATE ||||||||||||||||||||||||||||||||||||| --%>
		<% 
		  Set privateSet = itPlugin.getPrivatesPath();
		  Set allPrivateSet = PluginManager.getPluginManager().getPluginPath(true, itPlugin.getName(), privateSet);
		  String rootPrivatePath = "WEB-INF/plugins/"+itPlugin.getName();
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.private") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.private", Util.getString(itPlugin.getName(),"{Name}")) %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed' colspan='2'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			</tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= allPrivateSet %>' type='java.lang.String' name='itPath'>
		  <% 
		    String exists  = new File(channel.getRealPath(itPath)).exists() ? "" : warnFile; 
		    String checked = privateSet.contains(itPath) ? "checked='checked'" : "";
		    String relPath = itPath.substring(rootPrivatePath.length()+1);
		  %>
		  <tr>
		    <td><input type='checkbox' name='private' value="<%= relPath %>" <%= checked %>/></td>
		    <td><%= itCounter %>.</td>
		    <td><%= itPath.substring(itPath.lastIndexOf("/")+1) %> <%= exists %></td>
		    <td><%= itPath %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
	  </div>
	  
	  <%-- ||| PUBLIC ||||||||||||||||||||||||||||||||||||| --%>
		<% 
		  Set publicSet = itPlugin.getPublicsPath();
		  Set allPublicSet = PluginManager.getPluginManager().getPluginPath(false, itPlugin.getName(),publicSet);
		  String rootPublicPath = "plugins/"+itPlugin.getName();
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.public") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.public", Util.getString(itPlugin.getName(),"{Name}")) %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed' colspan='2'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			</tr>
		</thead>
		<tbody>
		<% int pubCounter = 0; %>
		<jalios:foreach collection='<%= allPublicSet %>' type='java.lang.String' name='itPath'>
		  <% 
		    File   itFile  = new File(channel.getRealPath(itPath));
		    String exists  = itFile.exists() ? "" : warnFile; 
		    String checked = publicSet.contains(itPath) ? "checked='checked'" : "";
		    String relPath = itPath.substring(rootPublicPath.length()+1);
		  %>
		  <tr>
		    <td><input type='checkbox' name='public' value="<%= relPath %>" <%= checked %> <%= itFile.isDirectory() ? "style='display:none;'" : "" %> /></td>
		    <td><%= itCounter %>.</td>
		    <td><%= itPath.substring(itPath.lastIndexOf("/")+1) %> <%= exists %></td>
		    <td><%= itPath %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
	  </div>
	  
	  <%-- ||| WEBAPP ||||||||||||||||||||||||||||||||||||| --%>
		<% 
		  Set webappSet = itPlugin.getWebappsPath();
		  if (Util.notEmpty(webappSet)) {
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.webapp") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.webapp") %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			</tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= webappSet %>' type='java.lang.String' name='itPath'>
		  <% 
		    File   itFile  = new File(channel.getRealPath(itPath));
		    String exists  = itFile.exists() ? "" : warnFile; 
		  %>
		  <tr>
		    <td><%= itCounter %>.</td>
		    <td><%= itPath.substring(itPath.lastIndexOf("/")+1) %> <%= exists %></td>
		    <td><%= itPath %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
	  </div>
	  <% } %>
	  
	  <%-- ||| TEMPLATE |||||||||||||||||||||||||||||||||| --%>
	  <% 
		  List templateEntryList = itPlugin.getTypeTemplateEntries();
		  if (Util.notEmpty(templateEntryList)) {
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.templates") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.templates") %></div>
		<table class='colored' >
		<thead>
			<tr>
	      <th class='fixed'>&nbsp;</th>
	      <th><%= glp("ui.com.lbl.label") %></th>
	      <th><%= glp("ui.com.lbl.tmpl-usage") %></th>
	      <th><%= glp("ui.com.lbl.name") %></th>
	      <th><%= glp("ui.adm.plugin.lbl.path") %></th>
	    </tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= templateEntryList %>' type='TypeTemplateEntry' name='tte'>
		  <%
		    String itPath = tte.getPath();
        String itType = tte.getPath();
        String exists = new File(channel.getRealPath(itPath)).exists() ? "" : warnFile;
		  %>
		  <tr>
        <td><%= itCounter %>.</td>
        <td><%= exists %> <%= tte.getLabel(userLang) %></td>
        <td><%= tte.getUsage() %></td>
        <td><%= tte.getName() %></td>
        <td><%= itPath %></td>
      </tr>
		</jalios:foreach>
		</tbody>
		</table>
		</div>
	  <% } %>
	  
	  <%-- ||| PLUGIN ITEMS (listener / controlers / ...) |||||||||||| --%>
		<% 
		  Map itemMap = itPlugin.getPluginComponentPath(true); 
		  if (Util.notEmpty(itemMap)) {
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.component") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.pluginitem", itPlugin.getName()) %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			  <th><%= glp("ui.com.lbl.type") %></th>
			</tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= itemMap.entrySet() %>' type='Map.Entry' name='itEntry'>
		  <%
		    String itPath  = (String) itEntry.getKey();
		    String itType  = (String) itEntry.getValue();
		    String exists  = new File(channel.getRealPath(itPath)).exists() ? "" : warnFile; 
		  %>
		  <tr>
		    <td><%= itCounter %>.</td>
		    <td><%= itPath.substring(itPath.lastIndexOf("/")+1) %> <%= exists %></td>
		    <td><%= itPath %></td>
		    <td><%= itType %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
		</div>
	  <% } %>
	  
	  <%-- ||| JAVA ||||||||||||||||||||||||||||||||||||| --%>
		<% 
		  Set javaSet = itPlugin.getJavaPath(true); 
		  if (Util.notEmpty(javaSet)) {
		%>
		<div class="tab-page">
		<h2 class='tab'><%= glp("ui.adm.plugin.lbl.java") %></h2>
		<div class='tabinfo'><%= glp("ui.adm.plugin.doc.java", itPlugin.getName()) %></div>
		<table class='colored' >
		<thead>
			<tr>
			  <th class='fixed'>&nbsp;</th>
			  <th class='medium'><%= glp("ui.com.lbl.name") %></th>
			  <th><%= glp("ui.adm.plugin.lbl.path") %></th>
			</tr>
		</thead>
		<tbody>
		<jalios:foreach collection='<%= javaSet %>' type='java.lang.String' name='itPath'>
		  <% String exists  = new File(channel.getRealPath(itPath)).exists() ? "" : warnFile; %>
		  <tr>
		    <td><%= itCounter %>.</td>
		    <td><%= itPath.substring(itPath.lastIndexOf("/")+1) %> <%= exists %></td>
		    <td><%= itPath %></td>
		  </tr>
		</jalios:foreach>
		</tbody>
		</table>
		</div>
	  <% } %>
	  </div>
	</div>
<% } /* Is new plugin */ %>
</div>
  <input type='hidden' name='redirect' value="<%= editPluginHandler.getRedirect() %>" />
 <p>  
  <input type='submit' name='opSave'   value="<%= glp("ui.com.btn.save") %>"   class='btn btn-primary' />
  <input type='submit' name='opCancel' value="<%= glp("ui.com.btn.cancel") %>" class='btn btn-default' />
 </p> 
</form>

<%@ include file='/admin/doAdminFooter.jspf' %>