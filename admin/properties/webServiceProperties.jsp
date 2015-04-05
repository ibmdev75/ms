<%@ include file="/admin/properties/doCommonProp.jspf" %>
<div class="row">
  
  <%-- --- OPEN API ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>Configuration Open API<% */ %><%= glp("ui.adm.prop.rest.lgd.configuration") %></legend>
    
    <jalios:field label="ui.com.lbl.enabled" name='rest_enabled' value='<%= Util.toBoolean(formHandler.getRest_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.rest.readaccess.authorized" name='rest_readaccess_enabled' value='<%= Util.toBoolean(formHandler.getRest_readaccess_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.rest.readaccess.authorized.ip" name='<%= "rest_readaccess_ipfilter" %>' tooltip='<%= "ui.adm.prop.rest.readaccess.authorized.ip.h" %>' value='<%= formHandler.getRest_readaccess_ipfilter() %>' disabled='<%= formHandler.isDisabled("rest.readaccess.ipfilter") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.rest.writeaccess.authorized" name='rest_writeaccess_enabled' value='<%= Util.toBoolean(formHandler.getRest_writeaccess_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
        
    <jalios:field label="ui.adm.prop.rest.writeaccess.authorized.ip"  name='<%= "rest_writeaccess_ipfilter" %>' tooltip='<%= "ui.adm.prop.rest.writeaccess.authorized.ip.h" %>' value='<%= formHandler.getRest_writeaccess_ipfilter() %>' disabled='<%= formHandler.isDisabled("rest.writeaccess.ipfilter") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>

    <%-- 
    <jalios:field label="ui.adm.prop.rest.statsenabled.authorized" name='rest_stats_enabled' value='<%= Util.toBoolean(formHandler.getRest_writeaccess_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    --%>

  </fieldset>


  <%-- --- IMPORT ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>Misc<% */ %><%= glp("ui.adm.prop.mashup.lgd.import") %></legend>
  
    <jalios:field label="ui.com.lbl.enabled" name='importMgr_enabled' value='<%= Util.toBoolean(formHandler.getImportMgr_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.mashup.import.author" name='<%= "importMgr_importAuthor" %>' description='<%= "ui.adm.prop.mashup.import.author.h" %>' value='<%=  formHandler.getImportMgr_importAuthor() %>' disabled='<%= formHandler.isDisabled("$id.import-mgr.import-author") %>' css='jstoreOnly'>
      <jalios:control type="<%= ControlType.MEMBER %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.mashup.import.ws" name='<%= "importMgr_importWorkspace" %>' description='<%= "ui.adm.prop.mashup.import.ws.h" %>' value='<%= formHandler.getImportMgr_importWorkspace() %>' disabled='<%= formHandler.isDisabled("$id.import-mgr.import-ws") %>'>
      <jalios:control type="<%= ControlType.WORKSPACE %>" />
    </jalios:field>
    
    <% Category importRootCat = channel.getCategory(formHandler.getImportMgr_importRoot()); %>
    <jalios:field label="ui.adm.prop.mashup.import.root" name='<%= "importMgr_importRoot" %>' description='<%= "ui.adm.prop.mashup.import.root.h" %>' value='<%= importRootCat %>' disabled='<%= formHandler.isDisabled("$id.import-mgr.import-root") %>'>
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>

  </fieldset>     
            
  <%-- --- EXPORT ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>Misc<% */ %><%= glp("ui.adm.prop.mashup.lgd.export") %></legend>
    
    <jalios:field label="ui.com.lbl.enabled" name='exportMgr_enabled' value='<%= Util.toBoolean(formHandler.getExportMgr_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.mashup.export.ip" name='<%= "exportMgr_ipfilter" %>' tooltip='<%= "ui.adm.prop.mashup.export.ip.h" %>' value='<%= formHandler.getExportMgr_ipfilter() %>' disabled='<%= formHandler.isDisabled("export-mgr.ipfilter") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>

  </fieldset>    
   

  
</div>
