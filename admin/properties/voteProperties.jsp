<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  <div class="col-md-12">
  
  <fieldset class="col-md-12">
    <legend class='formLabel'><%= glp("ui.adm.prop.tab.vote") %></legend>
    
    <jalios:field label="ui.adm.prop.vote_default_value" name='<%= "vote_default_value" %>' value='<%= formHandler.getVote_default_value() %>' disabled='<%= formHandler.isDisabled("vote.default-value") %>'>
      <jalios:control type="<%= ControlType.NUMBER %>" />
    </jalios:field>  

    <jalios:field label="ui.adm.prop.vote_enabled" name='vote_enabled' value='<%= Util.toBoolean(formHandler.getVote_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.vote_anonymize" name='vote_anonymize' value='<%= Util.toBoolean(formHandler.getVote_anonymize(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.vote_anonymize_downvote" name='vote_anonymize_downvote' value='<%= Util.toBoolean(formHandler.getVote_anonymize_downvote(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.vote.notification.vote_received" name='vote_notification_vote_received' value='<%= Util.toBoolean(formHandler.getVote_notification_vote_received(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

  </fieldset>

  </div>
</div>