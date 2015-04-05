<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  <div class="col-md-6">
  <fieldset class="col-md-12">
    <jalios:field label="ui.adm.prop.portal.index" name="channel_default_index" tooltip="ui.adm.prop.portal.index.h" value='<%= formHandler.getChannel_default_index() %>' disabled='<%= formHandler.isDisabled("channel.default.index") %>'>
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>
  
    <% List navRootsList = JcmsUtil.stringToDataList(formHandler.getDisplay_navigate_root() , " "); %>
    <jalios:field label="ui.adm.prop.portal.nav" name='<%= "display_navigate_root" %>' tooltip="ui.adm.prop.portal.nav.h" value='<%= navRootsList %>' disabled='<%= formHandler.isDisabled("display.navigate-root") %>'>
      <jalios:control type="<%= ControlType.CATEGORY %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.adv.adminicon" name='channel_default_show_adminicon' value='<%= Util.toBoolean(formHandler.getChannel_default_show_adminicon(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
  </fieldset>
  </div>
  <div class="col-md-6">   
    <fieldset class="col-md-12">
      <jalios:field label="ui.adm.prop.portal.defportal" name="channel_default_portal" value='<%= channel.getPublication(formHandler.getChannel_default_portal()) %>' disabled='<%= formHandler.isDisabled("channel.default-portal") %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class).noWorkspaceFilter() %>' />
      </jalios:field>

      <jalios:field label="ui.adm.prop.portal.printportal" name="channel_default_printportal" value='<%= channel.getPublication(formHandler.getChannel_default_printportal()) %>' disabled='<%= formHandler.isDisabled("channel.default-printportal") %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class).noWorkspaceFilter() %>' />
      </jalios:field>
    </fieldset>
  </div>
</div>
<div class="row">
  <div class="col-md-6">

    <%-- --- READER TRACKER ------------------------------ --%>
    <fieldset class="col-md-12">
      <legend><%= glp("ui.adm.prop.tab.readertracker") %></legend>
      
      <jalios:field label="ui.adm.prop.readertracker_types" name="readertracker_types" tooltip="ui.adm.prop.readertracker_types.h" value='<%= formHandler.getReadertracker_types() %>' disabled='<%= formHandler.isDisabled("readertracker.types") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field> 
      
      <jalios:field label="ui.adm.prop.readertracker_enabled" name='readertracker_enabled' value='<%= Util.toBoolean(formHandler.getReadertracker_enabled(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
      <jalios:field label="ui.adm.prop.readertracker_anonymize_enabled" name='readertracker_anonymize_enabled' value='<%= Util.toBoolean(formHandler.getReadertracker_anonymize_enabled(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
    </fieldset>

  </div>
</div>