<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  
  <%-- --- JSYNC SERVER ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>Misc<% */ %><%= glp("ui.adm.prop.jsync.lgd.main") %></legend>
  
    <jalios:field label="ui.com.lbl.enabled" name='jsync_enabled' value='<%= Util.toBoolean(formHandler.getJsync_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

	<jalios:field label="ui.adm.prop.adv.urid" name='<%= "channel_urid" %>' tooltip='<%= glp("ui.adm.prop.adv.urid.h", new String[]{ com.jalios.jstore.Stamp.STAMP_SEPARATOR }) %>' value='<%= formHandler.getChannel_urid() %>' disabled='<%= formHandler.isDisabled("channel.urid") %>' css='inline-widget'>
	  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	</jalios:field>

	<jalios:field label="ui.adm.prop.jsync.replica-url" name='<%= "jsync_replica_url" %>' tooltip='<%= glp("ui.adm.prop.jsync.replica-url.h") %>' value='<%= formHandler.getJsync_replica_url() %>' disabled='<%= formHandler.isDisabled("jsync.replica.url") %>'>
	  <jalios:control type="<%= ControlType.URL %>" />
	</jalios:field>

	<jalios:field label="ui.adm.prop.jsync.leader-url" name='<%= "jsync_leader_url" %>' tooltip='<%= glp("ui.adm.prop.jsync.leader-url.h") %>' value='<%= formHandler.getJsync_leader_url() %>' disabled='<%= formHandler.isDisabled("jsync.leader.url") %>'>
	  <jalios:control type="<%= ControlType.URL %>"/>
	</jalios:field>

	<jalios:field label="ui.adm.prop.jsync.startup-join" name='<%= "jsync_startup_join" %>' tooltip='<%= glp("ui.adm.prop.jsync.startup-join.h") %>' value='<%= formHandler.getJsync_startup_join() %>' disabled='<%= formHandler.isDisabled("jsync.startup.join") %>'>
        <jalios:control type="<%= ControlType.DURATION %>" />
	</jalios:field>
    
    
    <jalios:field label="ui.adm.prop.jsync.update-mode" name='jsync_update_mode' tooltip="ui.adm.prop.jsync.update-mode.h" value='<%= formHandler.getJsync_update_mode() %>'>
      <jalios:control settings='<%= new EnumerateSettings()
                                          .select()
                                          .enumValues("auto", "manu")
                                          .enumLabels("ui.adm.prop.jsync.update-auto", "ui.adm.prop.jsync.update-manu") %>' />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.jsync.sync-files" name='jsync_sync_files' tooltip="ui.adm.prop.jsync.sync-files.h" value='<%= Util.toBoolean(formHandler.getJsync_sync_files(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

  </fieldset>

  <%-- --- ADVANCED ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>Dev Admin<% */ %><%= glp("ui.adm.prop.jsync.lgd.adv") %></legend>
  
    <jalios:field label="ui.adm.prop.jsync.can-be-joined" name='jsync_can_be_joined' tooltip="ui.adm.prop.jsync.can-be-joined.h" value='<%= Util.toBoolean(formHandler.getJsync_can_be_joined(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
  
    <jalios:field label="ui.adm.prop.jsync.can-leader-join" name='jsync_can_leader_join' tooltip="ui.adm.prop.jsync.can-leader-join.h" value='<%= Util.toBoolean(formHandler.getJsync_can_leader_join(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.jsync.stab-delay" name="jsync_stab_delay" tooltip='<%= "ui.adm.prop.jsync.stab-delay.h" %>' value='<%= formHandler.getJsync_stab_delay() %>' disabled='<%= formHandler.isDisabled("jsync.stab-delay") %>'>
      <jalios:control type="<%= ControlType.DURATION %>" />
    </jalios:field>
    
	<jalios:field label="ui.adm.prop.jsync.ip" name='<%= "jsync_ip" %>' tooltip='<%= "ui.adm.prop.jsync.ip.h" %>' value='<%= formHandler.getJsync_ip() %>' disabled='<%= formHandler.isDisabled("jsync.ip") %>'>
	  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	</jalios:field>

	<jalios:field label="ui.adm.prop.jsync.explicit-replica-list" name='<%= "jsync_explicit_replica_list" %>' tooltip='<%= "ui.adm.prop.jsync.explicit-replica-list.h" %>' value='<%= formHandler.getJsync_explicit_replica_list() %>' disabled='<%= formHandler.isDisabled("jsync.explicit-replica-list") %>'>
	  <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
	</jalios:field>

	<jalios:field label="ui.adm.prop.jsync.replica-startup-join" name='<%= "jsync_replica_startup_join" %>' tooltip='<%= "ui.adm.prop.jsync.replica-startup-join.h" %>' value='<%= formHandler.getJsync_replica_startup_join() %>' disabled='<%= formHandler.isDisabled("jsync.replica-startup-join") %>'>
	  <jalios:control type="<%= ControlType.DURATION %>" />
	</jalios:field>
		
  </fieldset>

</div>