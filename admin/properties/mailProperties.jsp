<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  
    <%-- --- MAIL OUT ------------------------------ --%>
    <fieldset class="col-md-12">
      <legend><%= glp("ui.adm.prop.ch.lgd.mail-out") %></legend>
  
      <jalios:field  label="ui.com.lbl.enabled" name='mail_enabled' value='<%= Util.toBoolean(formHandler.getMail_enabled(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
      <jalios:field  label="ui.adm.prop.ch.smtp" name='mail_smtp_host' description='ui.adm.prop.ch.smtp.h' value='<%= formHandler.getMail_smtp_host() %>' disabled='<%= formHandler.isDisabled(formHandler.getMail_smtp_host()) %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
      
      <jalios:field  label="ui.adm.prop.ch.smtp-port" name='mail_smtp_port' description='ui.adm.prop.ch.smtp-port.h' value='<%= formHandler.getMail_smtp_port() %>' disabled='<%= formHandler.isDisabled("mail.smtp.port") %>'>
        <jalios:control type="<%= ControlType.NUMBER %>" />
      </jalios:field>
      
      <jalios:field label="ui.adm.prop.ch.smtp-login" name='mail_smtp_login' description='ui.adm.prop.ch.smtp-login.h' value='<%= formHandler.getMail_smtp_login() %>' disabled='<%= formHandler.isDisabled("mail.smtp.login") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
      
      <jalios:field  label="ui.adm.prop.ch.smtp-pwd" name='mail_smtp_password' value='<%= formHandler.getMail_smtp_password() %>' disabled='<%= formHandler.isDisabled("mail.smtp.password") %>'>
        <jalios:control type="<%= ControlType.PASSWORD %>" />
      </jalios:field>
      
      <jalios:field  label="ui.adm.prop.ch.mail" name='channel_default_email' value='<%= formHandler.getChannel_default_email() %>' disabled='<%= formHandler.isDisabled("channel.default-email") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
      
      <jalios:field  label="ui.adm.prop.ch.send-with-site-email" name='mail_send_with_site_email' value='<%= Util.toBoolean(formHandler.getMail_send_with_site_email(),false) %>' tooltip="ui.adm.prop.ch.send-with-site-email.h">
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
    </fieldset>


    <%-- --- MAIL IN ------------------------------ --%>
    <fieldset class="col-md-12">
      <legend><% /* %>MAIL IN<% */ %><%= glp("ui.adm.prop.ch.lgd.mail-in") %></legend>
    
      <jalios:field label="ui.com.lbl.enabled" name='mail_incoming_enabled' value='<%= Util.toBoolean(formHandler.getMail_incoming_enabled(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
      <jalios:field label="ui.adm.mail-info.label" name='mail_incoming_label' description='ui.adm.mail-info.label.h' value='<%= formHandler.getMail_incoming_label() %>' disabled='<%= formHandler.isDisabled("mail.incoming.label") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
      
      <jalios:field  label="ui.adm.mail-info.suffix" name='mail_incoming_suffix' description='ui.adm.mail-info.suffix.h' value='<%= formHandler.getMail_incoming_suffix() %>' disabled='<%= formHandler.isDisabled("mail.incoming.suffix") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
  		
      <fieldset class="col-md-12">
        <legend><% /* %>Default Archive<% */ %><%= glp("ui.adm.mail-info.default-archive") %></legend>
  
        <jalios:field  label="ui.adm.mail-info.archive" name='mail_incoming_archive' description='ui.adm.mail-info.archive.h' value='<%= formHandler.getMail_incoming_archive() %>' disabled='<%= formHandler.isDisabled("mail.incoming.archive") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
        
        <jalios:field  label="ui.adm.mail-info.archive-check" name="mail_incoming_archive_check" description='ui.adm.mail-info.archive-check.h' value='<%= formHandler.getMail_incoming_archive_check() %>'>
          <jalios:control settings='<%= new EnumerateSettings()
                                              .select()
                                              .enumValues("member", "single", "authkey", "thread")
                                              .enumLabels("ui.adm.mail-info.archive-check.member", "ui.adm.mail-info.archive-check.single", "ui.adm.mail-info.archive-check.authkey", "ui.adm.mail-info.archive-check.thread") %>' />
          <jalios:buffer name="WIDGET_APPEND"><p class="help-block"><%= glp("ui.adm.mail-info.default-archive.h") %></p></jalios:buffer>
        </jalios:field>
      </fieldset>
  
      <fieldset class="col-md-12">
        <legend><% /* %>Default Account<% */ %><%= glp("ui.adm.mail-info.default-account") %></legend>
          
        <jalios:field  label="ui.adm.mail-info.account" name='mail_account_label_default' value='<%= formHandler.getMail_account_label_default() %>' disabled='<%= formHandler.isDisabled("mail.account.label.default") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
    			
        <jalios:field label="ui.com.lbl.enabled" name='mail_account_default_enabled' value='<%= Util.toBoolean(formHandler.getMail_account_default_enabled(),false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
    
        <jalios:field label="ui.adm.mail-info.host" name='mail_account_default_host' value='<%= formHandler.getMail_account_default_host() %>' disabled='<%= formHandler.isDisabled("mail.account.default.host") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
    	
        <jalios:field  label='ui.adm.mail-info.port' name='mail_account_default_port' value='<%= formHandler.getMail_account_default_port() %>' disabled='<%= formHandler.isDisabled("mail.account.default.port") %>'>
          <jalios:control type="<%= ControlType.NUMBER %>" />
        </jalios:field>
    
        <jalios:field  label="ui.adm.mail-info.protocol" name="mail_account_default_protocol"  value='<%= formHandler.getMail_account_default_protocol() %>'>
          <jalios:control settings='<%= new EnumerateSettings().select().enumValues("pop3", "imap").enumLabels("POP3", "IMAP") %>' />
        </jalios:field>
    	    
        <jalios:field label="ui.adm.mail-info.imapssl" name='mail_account_default_imapssl' value='<%= Util.toBoolean(formHandler.getMail_account_default_imapssl(),false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
    	    
        <jalios:field  label="ui.adm.mail-info.login" name='mail_account_default_login' value='<%= formHandler.getMail_account_default_login() %>' disabled='<%= formHandler.isDisabled("mail.account.default.login") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
    				
        <jalios:field  label="ui.adm.mail-info.password" name='mail_account_default_password' value='<%= formHandler.getMail_account_default_password() %>' disabled='<%= formHandler.isDisabled("mail.account.default.password") %>'>
          <jalios:control type="<%= ControlType.PASSWORD %>" />
        </jalios:field>
    
        <jalios:field label="ui.adm.mail-info.mbox" name='mail_account_default_mbox' description='ui.adm.mail-info.mbox.h' value='<%= formHandler.getMail_account_default_mbox() %>' disabled='<%= formHandler.isDisabled("mail.account.default.mbox") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
    
        <jalios:field label="ui.adm.mail-info.schedule" name='mail_account_default_schedule' tooltip='ui.adm.mail-info.schedule.h' value='<%= formHandler.getMail_account_default_schedule() %>' disabled='<%= formHandler.isDisabled("mail.account.default.schedule") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
        
        <jalios:field label="ui.adm.mail-info.author" name='mail_account_default_author' value='<%= formHandler.getMail_account_default_author() %>' disabled='<%= formHandler.isDisabled("mail.account.default.author") %>'>
          <jalios:control type="<%= ControlType.MEMBER %>" />
        </jalios:field>
        
        <jalios:field label="ui.adm.mail-info.workspace" name='mail_account_default_ws' value='<%= formHandler.getMail_account_default_ws() %>' disabled='<%= formHandler.isDisabled("mail.account.default.ws") %>'>
          <jalios:control type="<%= ControlType.WORKSPACE %>" />
        </jalios:field>
        
        <jalios:field label="ui.adm.mail-info.expunged" name='mail_account_default_expunge' description='ui.adm.mail-info.default-account.h' value='<%= Util.toBoolean(formHandler.getMail_account_default_expunge(),false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
    
      </fieldset>
      
      <p><jalios:icon src="mail-open"  /> <a href="admin/mailInfo.jsp"><%= glp("ui.adm.mn.info.mail") %></a></p>
    
    </fieldset>
</div>