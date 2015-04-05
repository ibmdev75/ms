<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">

	  <%-- --- Authentication ------------------------------ --%>
	  <fieldset class="col-md-12">
		  <legend><% /* %>Authentication<% */ %><%= glp("ui.adm.prop.acc.auth") %></legend>
		  
			<jalios:field label="ui.adm.prop.ch.auth" name='channel_is_authentication_required' tooltip='ui.adm.prop.ch.auth.h' value='<%= Util.toBoolean(formHandler.getChannel_is_authentication_required(),false) %>'>
			  <jalios:control type="<%= ControlType.BOOLEAN %>" />
			</jalios:field>
			
			<jalios:field  label='ui.adm.prop.ch.casesens' name='channel_case_sensitive' tooltip='ui.adm.prop.ch.casesens.h' value='<%= formHandler.getChannel_case_sensitive() %>'>
			  <jalios:control type="<%= ControlType.BOOLEAN %>" />
			</jalios:field>

			<jalios:field  label='ui.adm.prop.ch.accentsens' name='channel_accent_sensitive' tooltip='ui.adm.prop.ch.accentsens.h' value='<%= formHandler.getChannel_accent_sensitive() %>'>
			  <jalios:control type="<%= ControlType.BOOLEAN %>" />
			</jalios:field>

			<jalios:field  label='ui.adm.prop.ch.adminip' name='channel_admin_ip' tooltip='ui.adm.prop.ch.adminip.h' value='<%= formHandler.getChannel_admin_ip() %>' disabled='<%= formHandler.isDisabled("channel.admin-ip") %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>

			<jalios:field  label='ui.adm.prop.ch.workspacesip' name='channel_workspaces_ip' tooltip='ui.adm.prop.ch.workspacesip.h' value='<%= formHandler.getChannel_workspaces_ip() %>' disabled='<%= formHandler.isDisabled("channel.workspaces-ip") %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>
			
     </fieldset>
   
    <%-- --- Cookie ------------------------------ --%>
	  <fieldset class="col-md-12">
		  <legend><% /* %>Cookie<% */ %><%= glp("ui.adm.prop.auth-mgr.cookie") %></legend>
		  
			<jalios:field  label="ui.adm.prop.mbr.cookie" name='<%= "cookie_max_age" %>' description='<%= "ui.adm.prop.mbr.cookie.h" %>' value='<%= formHandler.getCookie_max_age() %>' disabled='<%= formHandler.isDisabled("cookie.max-age") %>'>
			  <jalios:control type="<%= ControlType.DURATION %>" />
			</jalios:field>  
		  
			<jalios:field label="ui.adm.prop.auth-mgr.persistent.show-option" name='authmgr_persistent_show_option' tooltip='ui.adm.prop.auth-mgr.persistent.show-option.h' value='<%= Util.toBoolean(formHandler.getAuthmgr_persistent_show_option(),false) %>'>
			  <jalios:control type="<%= ControlType.BOOLEAN %>" />
			</jalios:field>
			
		  <jalios:field label="ui.adm.prop.auth-mgr.persistent.default-value" name='authmgr_persistent_default_value' tooltip='ui.adm.prop.auth-mgr.persistent.default-value.h' value='<%= Util.toBoolean(formHandler.getAuthmgr_persistent_default_value(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
		  
		  <jalios:field label="ui.adm.prop.auth-mgr.allow-admin-cookie" name='authmgr_allow_admin_cookie' tooltip='ui.adm.prop.auth-mgr.allow-admin-cookie.h' value='<%= Util.toBoolean(formHandler.getAuthmgr_allow_admin_cookie(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
	  
	  </fieldset>

	  <%-- --- SSL ------------------------------ --%>
	  <fieldset class="col-md-12">
		  <legend><% /* %>SSL<% */ %><%= glp("ui.adm.prop.ch.ssl") %></legend>
		  
		  <p><% /* %>Help/Intro Text<% */ %><%= glp("ui.adm.prop.ch.ssl.intro") %></p>
		
		  <jalios:field label="ui.adm.prop.ch.ssl.enabled" name='channel_ssl_enabled' tooltip='ui.adm.prop.ch.ssl.enabled.h' value='<%= Util.toBoolean(formHandler.getChannel_ssl_enabled(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
		
			<jalios:field  label="ui.adm.prop.ch.ssl.port" name='<%= "channel_ssl_port" %>' tooltip='<%= "ui.adm.prop.ch.ssl.port.h" %>' value='<%= formHandler.getChannel_ssl_port() %>' disabled='<%= formHandler.isDisabled("channel.ssl.port") %>'>
        <jalios:control type="<%= ControlType.NUMBER %>" />
			</jalios:field>
	
    </fieldset>

	  <%-- --- SignUp ------------------------------ --%>
	  <fieldset class="col-md-12">
		  <legend><% /* %>Sign-Up<% */ %><%= glp("ui.adm.prop.ch.sign") %></legend>
		  
		  <jalios:field label="ui.adm.prop.ch.sign" name='channel_sign_up' tooltip='ui.adm.prop.ch.sign.h' value='<%= Util.toBoolean(formHandler.getChannel_sign_up(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
		  
		  <jalios:field label="ui.adm.prop.ch.signvalid" name='channel_sign_up_valid' tooltip='ui.adm.prop.ch.signvalid.h' value='<%= Util.toBoolean(formHandler.getChannel_sign_up_valid(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
		  
		  <jalios:field label="ui.adm.prop.ch.signcharter" name='channel_sign_up_charter' tooltip='ui.adm.prop.ch.signcharter.h' value='<%= Util.toBoolean(formHandler.getChannel_sign_up_charter(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
		
		  <jalios:field label="ui.adm.prop.ch.signdbmember" name='channel_sign_up_create_dbmember' tooltip='ui.adm.prop.ch.signdbmember.h' value='<%= Util.toBoolean(formHandler.getChannel_sign_up_create_dbmember(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
  
      <%
        List typeList = channel.getSubTypeList(Form.class, userLang);
        List typeNameList  = new ArrayList();
        List typeLabelList = new ArrayList();
        for (Iterator it = typeList.iterator() ; it.hasNext() ; ){
          Class itClass = (Class) it.next();
          typeNameList.add(Util.getClassShortName(itClass));
          typeLabelList.add(channel.getTypeLabel(itClass, userLang));
        }
      %>
      <jalios:field label="ui.adm.prop.ch.signform" name='channel_sign_form' tooltip='ui.adm.prop.ch.signform.h' value='<%=formHandler.getChannel_sign_form() %>'>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(typeNameList).enumLabels(typeLabelList) %>' />
      </jalios:field>
      
    </fieldset>  

    <%-- --- Webdav ------------------------------ --%>
	  <fieldset class="col-md-12">
		  <legend class='formLabel'><% /* %>Webdav<% */ %><%= glp("ui.adm.prop.webdav") %></legend>
		  
		  <jalios:field label="ui.com.lbl.enabled" name='channel_webdav_enabled' value='<%= Util.toBoolean(formHandler.getChannel_webdav_enabled(),false) %>'>
		    <jalios:control type="<%= ControlType.BOOLEAN %>" />
		  </jalios:field>
		  
			<jalios:field  label="ui.adm.prop.ch.webdavip" name='channel_webdav_ipfilter' tooltip='<%= "ui.adm.prop.ch.webdavip.h" %>' value='<%= formHandler.getChannel_webdav_ipfilter() %>' disabled='<%= formHandler.isDisabled("channel.webdav.ip-filter") %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>
    </fieldset>
</div>