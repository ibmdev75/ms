<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  <fieldset class="col-md-12">
  
    <jalios:field label="ui.adm.prop.stat.enabled" name='statreporter_enabled' value='<%= Util.toBoolean(formHandler.getStatreporter_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.stat.analysis" name='statreporter_analysis' value='<%= Util.toBoolean(formHandler.getStatreporter_analysis(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.stat.exporter-cleaner-schedule" name='statreporter_exporterCleanerSchedule' value='<%= formHandler.getStatreporter_exporterCleanerSchedule() %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
  </fieldset>

  <fieldset class="col-md-12">
  
      <jalios:field label="ui.adm.prop.stat.dns" name='statreporter_resolvehost' tooltip="ui.adm.prop.stat.dns.h" value='<%= Util.toBoolean(formHandler.getStatreporter_resolvehost(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
  
      <jalios:field label="ui.adm.prop.stat.exporter-cleaner-retention-period" name="statreporter_exporterCleanerRetentionPeriod" description="ui.adm.prop.stat.exporter-cleaner-retention-period.h" value='<%= formHandler.getStatreporter_exporterCleanerRetentionPeriod() %>' disabled='<%= formHandler.isDisabled("exportRawData.retention-period") %>'>
        <jalios:control type="<%= ControlType.DURATION %>" />
      </jalios:field>
  
    </fieldset>
</div>