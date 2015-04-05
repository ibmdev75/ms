<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">

  <%-- --- PERFORMANCES ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend ><%= glp("ui.adm.prop.adv.perf") %></legend>
              
    <jalios:field label="ui.adm.prop.adv.gzipfilter" name='channel_gzip_filter_enabled' tooltip="ui.adm.prop.adv.gzipfilter.h" value='<%= Util.toBoolean(formHandler.getChannel_gzip_filter_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field> 
                
    <jalios:field label="ui.adm.prop.adv.jspacker" name='channel_jspacker_enabled' tooltip="ui.adm.prop.adv.js-css.merge.h" value='<%= Util.toBoolean(formHandler.getChannel_jspacker_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field> 

    <jalios:field label="ui.adm.prop.adv.jspacker.minify" name='channel_jspacker_compressor_enabled' tooltip="ui.adm.prop.adv.js-css.minify.h" value='<%= Util.toBoolean(formHandler.getChannel_jspacker_compressor_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field> 

    <jalios:field label="ui.adm.prop.adv.csspacker" name='channel_csspacker_enabled' tooltip="ui.adm.prop.adv.js-css.merge.h" value='<%= Util.toBoolean(formHandler.getChannel_csspacker_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.adv.csspacker.minify" name='channel_csspacker_compressor_enabled' tooltip="ui.adm.prop.adv.js-css.minify.h" value='<%= Util.toBoolean(formHandler.getChannel_csspacker_compressor_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.adv.packer.cache-expiration" name='<%= "channel_packer_cache_expiration" %>' tooltip='<%= "ui.adm.prop.adv.packer.cache-expiration.h" %>' value='<%= formHandler.getChannel_packer_cache_expiration() %>' disabled='<%= formHandler.isDisabled("channel.packer.cache-expiration") %>'>
      <jalios:control settings='<%= new DurationSettings().resolution(DurationSettings.Resolution.DAY) %>' />
    </jalios:field>

    <jalios:field label="ui.adm.prop.adv.packer.cache-version" name='<%= "channel_packer_version" %>' tooltip='<%= "ui.adm.prop.adv.packer.cache-version.h" %>' value='<%= formHandler.getChannel_packer_version() %>' disabled='<%= formHandler.isDisabled("channel.packer.cache.version") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>

  </fieldset>
            
  <%-- --- CACHE MANAGER ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend class='formLabel'><% /* %>Cache Manager<% */ %><%= glp("ui.adm.prop.adv.cache") %></legend>
    
    <jalios:field label="ui.com.lbl.enabled" name='cache_mgr_enabled' tooltip="ui.adm.prop.adv.cache.h" value='<%= Util.toBoolean(formHandler.getCache_mgr_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
        <jalios:field label="ui.adm.prop.adv.max-servers-cache-nbr" name='<%= "cache_mgr_max_servers_cache_nbr" %>' tooltip='<%= "ui.adm.prop.adv.max-servers-cache-nbr.h" %>' value='<%= formHandler.getCache_mgr_max_servers_cache_nbr() %>' disabled='<%= formHandler.isDisabled("cache-mgr.max-servers-cache-nbr") %>'>
          <jalios:control type="<%= ControlType.NUMBER %>" />
        </jalios:field>

  </fieldset>
                     
  <%-- --- CONTENT SECURITY POLICY (aka CSP) ------------------------------ --%>
  <fieldset class="col-md-12 hidden"><%-- TODO JCMS 10.0.0 display this UI --%>
    <legend class='formLabel'><% /* %>Content Security Policy<% */ %><%= glp("ui.adm.prop.adv.csp") %></legend>
    
    <jalios:field label="ui.com.lbl.enabled" name='csp_enabled' tooltip="ui.adm.prop.adv.csp.h" value='<%= Util.toBoolean(formHandler.getCsp_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

        <jalios:field label="ui.adm.prop.adv.csp-header" name='<%= "csp_header" %>' tooltip='<%= "ui.adm.prop.adv.csp-header.h" %>' value='<%= formHandler.getCsp_header() %>' disabled='<%= formHandler.isDisabled("channel.security.csp.csp-header") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
        
        <jalios:field label="ui.adm.prop.adv.csp-report-only-header" name='<%= "csp_report_only_header" %>' tooltip='<%= "ui.adm.prop.adv.csp-report-only-header.h" %>' value='<%= formHandler.getCsp_report_only_header() %>' disabled='<%= formHandler.isDisabled("channel.security.csp.csp-report-only-header") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>

  </fieldset>

  <%-- --- MISC ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><%= glp("ui.adm.prop.adv.misc") %></legend>
    
    <jalios:field label="ui.adm.prop.adv.major-update" name='major_update_default' tooltip="ui.adm.prop.adv.major-update.h" value='<%= Util.toBoolean(formHandler.getMajor_update_default(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.adv.store-backup" name='store_backup_enabled' tooltip="ui.adm.prop.adv.store-backup.h" value='<%= Util.toBoolean(formHandler.getStore_backup_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.adv.rss" name='jx_rss_enabled' value='<%= Util.toBoolean(formHandler.getJx_rss_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
        <jalios:field label="ui.adm.prop.adv.lock" name='<%= "channel_lock_timeout" %>' tooltip='<%= "ui.adm.prop.adv.lock.h" %>' value='<%= formHandler.getChannel_lock_timeout() %>' disabled='<%= formHandler.isDisabled("channel.lock-timeout") %>'>
          <jalios:control type="<%= ControlType.DURATION %>" />
        </jalios:field>
    
    <jalios:field label="ui.adm.prop.adv.dev-tools" name='channel_dev_tools_enabled' tooltip='ui.adm.prop.adv.dev-tools.h' value='<%= Util.toBoolean(formHandler.getChannel_dev_tools_enabled(),false) %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().enumValues("true", "false").enumLabels("ui.adm.prop.adv.dev-tools.yes", "ui.adm.prop.adv.dev-tools.no") %>' />
    </jalios:field>

    <jalios:field label="ui.adm.prop.adv.dev-mode" name='channel_dev_mode_enabled' tooltip='ui.adm.prop.adv.dev-mode.h' value='<%= Util.toBoolean(formHandler.getChannel_dev_mode_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.adv.thumbshot" name='tag_thumbnail_thumbshot_url' tooltip='ui.adm.prop.adv.thumbshot.h' value='<%= Util.getString(formHandler.getTag_thumbnail_thumbshot_url(),"") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>    
    
  </fieldset>
  <fieldset class="col-md-12">
    <legend class='formLabel'><%= glp("ui.adm.mn.files.quotas") %></legend>
    
    <jalios:field label="ui.adm.mn.files.quotas.enable" name='channel_quota_management_enabled' tooltip='ui.adm.mn.files.quotas.enable.h' value='<%= Util.toBoolean(formHandler.getChannel_quota_management_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.mn.files.quotas.reject-upload-over-quota" name='reject_upload_over_quota' tooltip='ui.adm.mn.files.quotas.reject-upload-over-quota.h' value='<%= Util.toBoolean(formHandler.getReject_upload_over_quota(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    
        <jalios:field label="ui.adm.mn.files.site-quota" name="siteQuota" value='<%= formHandler.getSiteQuota() %>' disabled='<%= formHandler.isDisabled("admin.quota.maximum-site-quota") %>' css=" field-number">
          <jalios:control type="<%= ControlType.NUMBER %>" />
          <div class="input-group-btn" style="min-width: 80px;">
            <jalios:control settings='<%= new EnumerateSettings()
                                                .name("siteQuotaUnit")
                                                .value(formHandler.getSiteQuotaUnit())
                                                .select()
                                                .enumValues(Util.getFileSizeUnitLabels(Locale.ENGLISH))
                                                .enumLabels(Util.getFileSizeUnitLabels(userLocale)) %>' />
          </div>
        </jalios:field> 
           
        <jalios:field label="ui.adm.mn.files.alert-threshold" name='<%= "siteAlertThreshold" %>' tooltip='<%= "ui.adm.mn.files.alert-threshold.description" %>' value='<%= formHandler.getSiteAlertThreshold() %>' disabled='<%= formHandler.isDisabled("admin.quota.site-alert-threshold") %>'>
          <jalios:control type="<%= ControlType.NUMBER %>">
            <jalios:buffer name='APPEND'>%</jalios:buffer>
          </jalios:control>
        </jalios:field>

        <jalios:field label="ui.adm.mn.files.default-workspace-quota" name='<%= "defaultWorkspaceQuota" %>' value='<%= formHandler.getDefaultWorkspaceQuota() %>' disabled='<%= formHandler.isDisabled("admin.quota.maximum-site-quota") %>' css=" field-number">
          <jalios:control type="<%= ControlType.NUMBER %>" />
          <div class="input-group-btn" style="min-width: 80px;">
            <jalios:control settings='<%= new EnumerateSettings()
                                                .name("defaultWorkspaceQuotaUnit")
                                                .value(formHandler.getDefaultWorkspaceQuotaUnit())
                                                .select()
                                                .enumValues(Util.getFileSizeUnitLabels(Locale.ENGLISH))
                                                .enumLabels(Util.getFileSizeUnitLabels(userLocale)) %>' />
          </div>
        </jalios:field>
    
    <%-- 
    <div class="fixme">
        <select class="formCombobox" name="defaultWorkspaceQuotaUnit">
          <% {
          String[] sizeUnit = Util.getFileSizeUnitLabels(Locale.ENGLISH);
          String[] sizeUnitLabel = Util.getFileSizeUnitLabels(userLocale);
          for(int index = 1; index < sizeUnit.length; index++){
          %>
            <option value="<%=sizeUnit[index]%>" <%=sizeUnit[index].equals(formHandler.getDefaultWorkspaceQuotaUnit())?"selected='selected'":"" %>><%=sizeUnitLabel[index] %></option>
         <% }} %>
        </select>
    </div>
    --%>
 
        <jalios:field label="ui.adm.mn.files.default-alert-threshold" name='<%= "defaultWorkspaceAlertThreshold" %>' tooltip='<%= "ui.adm.mn.files.alert-threshold.description" %>' value='<%= formHandler.getDefaultWorkspaceAlertThreshold() %>' disabled='<%= formHandler.isDisabled("admin.quota.default-workspace-alert-threshold") %>'>
          <jalios:control type="<%= ControlType.NUMBER %>">
            <jalios:buffer name='APPEND'>%</jalios:buffer>
          </jalios:control>
        </jalios:field>

  </fieldset>

</div>