<%@ include file="/admin/properties/doCommonProp.jspf" %>  

  
  
  <fieldset class="col-md-12">
	 <legend><% /* %>LDAP Settings<% */ %><%= glp("ui.adm.prop.ldap.settings") %></legend>
    
   <div class="row">	  
	   <div class="col-md-6">
	  
		<jalios:field label="ui.com.lbl.enabled" name='ldap_enabled' tooltip='ui.adm.prop.ldap.enable.h' value='<%= Util.toBoolean(formHandler.getLdap_enabled(),false) %>'>
		  <jalios:control type="<%= ControlType.BOOLEAN %>" />
		</jalios:field>
		
		<jalios:field label="ui.adm.prop.ldap.host" name='<%= "ldap_server_hostname" %>' value='<%= formHandler.getLdap_server_hostname() %>' disabled='<%= formHandler.isDisabled("ldap.server.hostname") %>'>
		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
		</jalios:field>
	
		<jalios:field label="ui.adm.prop.ldap.port" name='<%= "ldap_server_port" %>' description='<%= "ui.adm.prop.ldap.port.h" %>' value='<%= formHandler.getLdap_server_port() %>' disabled='<%= formHandler.isDisabled("ldap.server.port") %>'>
      <jalios:control type="<%= ControlType.NUMBER %>" />
		</jalios:field>
	
		<jalios:field label="ui.adm.prop.ldap.ssl" name='ldap_server_ssl_on' tooltip='ui.adm.prop.ldap.ssl.h' value='<%= Util.toBoolean(formHandler.getLdap_server_ssl(),false) %>'>
		  <jalios:control type="<%= ControlType.BOOLEAN %>" />
		</jalios:field>
		
    </div><%-- col --%>
    <div class="col-md-6">

	  <%-- --- LDAP login/pass ------------------------------ --%>
	  <jalios:field label="ui.adm.prop.ldap.login" name='<%= "ldap_server_login" %>' description='<%= "ui.adm.prop.ldap.login.h" %>' value='<%= formHandler.getLdap_server_login() %>' disabled='<%= formHandler.isDisabled("ldap.server.login") %>'>
	    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	  </jalios:field>
	
		<jalios:field label="ui.adm.prop.ldap.pwd" name='<%= "ldap_server_password" %>' description='<%= "ui.adm.prop.ldap.pwd.h" %>' value='<%= formHandler.getLdap_server_password() %>' disabled='<%= formHandler.isDisabled("ldap.server.password") %>'>
		  <jalios:control type="<%= ControlType.PASSWORD %>" />
		</jalios:field>
	
    <jalios:field>
		  <button id="ldap_check_cnx" type="button" class="btn btn-default"><%= glp("ui.adm.prop.ldap.check-cnx") %></button>
		  <jalios:icon  src="s.gif"  alt='wait...' htmlAttributes='id="ldap_check_cnx_icon" style="display: none;"'/>
		  <span id="ldap_check_cnx_msg"></span>
	  </jalios:field>
	  
    </div><%-- col --%>
   </div><%-- row --%>
  </fieldset> 

  <fieldset class="col-md-12">
   <legend><% /* %>LDAP Periodic Sync<% */ %><%= glp("ui.adm.prop.ldap.periodic-sync") %></legend>
   <div class="row">    
     <div class="col-md-6">
      <jalios:field label="ui.com.lbl.enabled" name='ldap_periodic_sync_enabled' 
                    description='ui.adm.prop.ldap.periodic-sync.enable.h' 
                    value='<%= Util.toBoolean(formHandler.getLdap_periodic_sync_enabled(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
     </div>
     <div class="col-md-6">
      <jalios:field label="ui.adm.prop.ldap.periodic-sync.schedule" name='ldap_periodic_sync_schedule'
                    description='<%= "ui.adm.prop.ldap.periodic-sync.schedule.h" %>' 
                    value='<%= formHandler.getLdap_periodic_sync_schedule() %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
     </div><%-- col --%>
   </div><%-- row --%>
  </fieldset>

  <fieldset class="col-md-12">
    <legend><%= glp("ui.adm.prop.ldap.schema") %></legend>
  
    <%-- --- Schema template ------------------------------ --%>
    <div class="row">     
      <div class="col-md-12">
        <jalios:field name="ldap_predefined_settings" id="ldap_predefined_settings" resource="field-vertical">
            <jalios:control settings='<%= new EnumerateSettings().required()
                                                .select()
                                                .enumValues("active_directory", "active_directory", "open_ldap_posix", "open_ldap_unique")
                                                .enumLabels("ui.adm.prop.ldap.tpl.select", "ActiveDirectory", "OpenLDAP (posixGroup)", "OpenLDAP (groupOfUniqueNames)") %>' />
        </jalios:field>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6">
      
        <%-- --- LDAP USER SETTINGS ------------------------------ --%>
        <fieldset class="col-md-12">
      	  <legend><%= glp("ui.adm.prop.ldap.mbr-settings") %></legend>
      	
      		<jalios:field label="ui.adm.prop.ldap.suffix" name='<%= "ldap_server_suffix" %>' description='<%= "ui.adm.prop.ldap.suffix.h" %>' value='<%= formHandler.getLdap_server_suffix() %>' disabled='<%= formHandler.isDisabled("ldap.server.suffix") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      		
      		<jalios:field label="ui.adm.prop.ldap.userfilter" name='<%= "ldap_server_userfilter" %>' tooltip='<%= "ui.adm.prop.ldap.userfilter.h" %>' value='<%= formHandler.getLdap_server_userfilter() %>' disabled='<%= formHandler.isDisabled("ldap.server.userfilter") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      		<jalios:field label="ui.adm.prop.ldap.userobjectclass" name='<%= "ldap_server_userobjectclass" %>' description='<%= "ui.adm.prop.ldap.userobjectclass.h" %>' value='<%= formHandler.getLdap_server_userobjectclass() %>' disabled='<%= formHandler.isDisabled("ldap.server.userobjectclass") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      		<jalios:field label="ui.adm.prop.ldap.synchronize" name='ldap_synchronize_enable' tooltip='ui.adm.prop.ldap.synchronize.h' value='<%= Util.toBoolean(formHandler.getLdap_synchronize_enable(),false) %>'>
      		  <jalios:control type="<%= ControlType.BOOLEAN %>" />
      		</jalios:field>
      	
      	  <%-- --- USER FIELD MAPPING ------------------------------ --%>
      	  <p class="text-muted"><%= glp("ui.adm.prop.ldap.mapping.h") %></p>
      	  
      	  <%-- --- LOGIN ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.login" name='<%= "ldap_mapping_login" %>' value='<%= formHandler.getLdap_mapping_login() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.login") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>  
      	
      	  <%-- --- NAME ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.name" name='<%= "ldap_mapping_name" %>' value='<%= formHandler.getLdap_mapping_name() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.name") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>  
      		
      	  <%-- --- FIRST NAME ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.f-name" name='<%= "ldap_mapping_firstName" %>' value='<%= formHandler.getLdap_mapping_firstName() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.firstName") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	  
      	
      	  <%-- --- SALUTATION ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.salut" name='<%= "ldap_mapping_salutation" %>' value='<%= formHandler.getLdap_mapping_salutation() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.salutation") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>  
      	  
      	  <%-- --- ORGANIZATION ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.organization" name='<%= "ldap_mapping_organization" %>' value='<%= formHandler.getLdap_mapping_organization() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.organization") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      	  <%-- --- DEPARTMENT ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.department" name='<%= "ldap_mapping_department" %>' value='<%= formHandler.getLdap_mapping_department() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.department") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      	  <%-- --- JOB TITLE ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.job" name='<%= "ldap_mapping_jobTitle" %>' value='<%= formHandler.getLdap_mapping_jobTitle() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.jobTitle") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      	  <%-- --- EMAIL ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.mail" name='<%= "ldap_mapping_mail" %>' value='<%= formHandler.getLdap_mapping_mail() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.mail") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      	  <%-- --- PHONE ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.phone" name='<%= "ldap_mapping_phone" %>' value='<%= formHandler.getLdap_mapping_phone() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.phone") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	  
      	  <%-- --- MOBILE ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.mobile" name='<%= "ldap_mapping_mobile" %>' value='<%= formHandler.getLdap_mapping_mobile() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.mobile") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      
          <%-- --- STREET ---------------- --%>
          <jalios:field label="ui.adm.mbr-edit.lbl.street" name='<%= "ldap_mapping_street" %>' value='<%= formHandler.getLdap_mapping_street() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.street") %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field>  
      
          <%-- --- POSTAL CODE ---------------- --%>
          <jalios:field label="ui.adm.mbr-edit.lbl.postalCode" name='<%= "ldap_mapping_postalCode" %>' value='<%= formHandler.getLdap_mapping_postalCode() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.postalCode") %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field>  
      
          <%-- --- PO BOX ---------------- --%>
          <jalios:field label="ui.adm.mbr-edit.lbl.poBox" name='<%= "ldap_mapping_poBox" %>' value='<%= formHandler.getLdap_mapping_poBox() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.postOfficeBox") %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field>  
      
          <%-- --- LOCALITY ---------------- --%>
          <jalios:field label="ui.adm.mbr-edit.lbl.locality" name='<%= "ldap_mapping_locality" %>' value='<%= formHandler.getLdap_mapping_locality() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.locality") %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field>  
      
          <%-- --- REGION ---------------- --%>
          <jalios:field label="ui.adm.mbr-edit.lbl.region" name='<%= "ldap_mapping_region" %>' value='<%= formHandler.getLdap_mapping_region() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.region") %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field> 
           
          <%-- --- COUNTRY ---------------- --%>
          <jalios:field label="ui.com.lbl.country" name='<%= "ldap_mapping_country" %>' value='<%= formHandler.getLdap_mapping_country() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.country") %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field> 
      
      
      	
      	  <%-- --- ADDRESS ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.addr" name='<%= "ldap_mapping_address" %>' value='<%= formHandler.getLdap_mapping_address() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.address") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>  
      	  
      	  <%-- --- INFO ---------------- --%>
      		<jalios:field label="ui.adm.mbr-edit.lbl.info" name='<%= "ldap_mapping_info" %>' value='<%= formHandler.getLdap_mapping_info() %>' disabled='<%= formHandler.isDisabled("ldap.mapping.info") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      
        </fieldset> <%-- user fieldset --%>
      
      </div><%-- col-md-6 --%>
      <div class="col-md-6">
      
        <%-- --- LDAP GROUP SETTINGS ------------------------------ --%>
        <fieldset class="col-md-12">
      	  <legend class='formLabel'><% /* %>Group settings<% */ %><%= glp("ui.adm.prop.ldap.grp-settings") %></legend>
      	
      		<jalios:field label="ui.adm.prop.ldap.groupsuffix" name='<%= "ldap_server_groupsuffix" %>' description='<%= "ui.adm.prop.ldap.groupsuffix.h" %>' value='<%= formHandler.getLdap_server_groupsuffix() %>' disabled='<%= formHandler.isDisabled("ldap.server.groupsuffix") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      		<jalios:field label="ui.adm.prop.ldap.groupfilter" name='<%= "ldap_server_groupfilter" %>' tooltip='<%= "ui.adm.prop.ldap.groupfilter.h" %>' value='<%= formHandler.getLdap_server_groupfilter() %>' disabled='<%= formHandler.isDisabled("ldap.server.groupfilter") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      		<jalios:field label="ui.adm.prop.ldap.groupobjectclass" name='<%= "ldap_server_groupobjectclass" %>' description='<%= "ui.adm.prop.ldap.groupobjectclass.h" %>' value='<%= formHandler.getLdap_server_groupobjectclass() %>' disabled='<%= formHandler.isDisabled("ldap.server.groupobjectclass") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      	  <%-- --- GROUP SYNCHRONIZATION ------------------------------ --%>
      	  
      		<jalios:field label="ui.adm.prop.ldap.synchronizegroups" name='ldap_synchronizegroups_enable' tooltip='ui.adm.prop.ldap.synchronizegroups.h' value='<%= Util.toBoolean(formHandler.getLdap_synchronizegroups_enable(),false) %>'>
      		  <jalios:control type="<%= ControlType.BOOLEAN %>" />
      		</jalios:field>
      	  
      	  <%-- --- GROUP FIELD MAPPING ------------------------------ --%>
      	  <p class='text-muted'><%= glp("ui.adm.prop.ldap.grp-mapping.h") %></p>
      	  
      		<jalios:field label="ui.com.lbl.name" name='<%= "ldap_grpmapping_name" %>' value='<%= formHandler.getLdap_grpmapping_name() %>' disabled='<%= formHandler.isDisabled("ldap.grp-mapping.name") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field>
      	
      	  <%-- --- GROUP FIELD MAPPING ------------------------------ --%>
      	  <p class='text-muted'><%= glp("ui.adm.prop.ldap.grp-member.h") %></p>
      	  
      		<jalios:field label="ui.com.lbl.members" name='<%= "ldap_grpmapping_member" %>' value='<%= formHandler.getLdap_grpmapping_member() %>' disabled='<%= formHandler.isDisabled("ldap.grp-mapping.member") %>'>
      		  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      		</jalios:field> 
      
        </fieldset><%-- group fieldset --%>
        
      </div><%-- col-md-6 --%>
    </div><%-- row --%>

  </fieldset><%-- schema fieldset --%>

