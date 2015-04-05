!function ($) {


  // ------------------------------------------
  //  PRIVATE
  // ------------------------------------------
  

  // Register to broker
  var register = function(){
    
    $.jalios.ux.AdminProperties.handleJcmsDB();
    
    // Change on #db_jcmsdb
    $(document).on("change", "#db_jcmsdb SELECT", function(event){
      $.jalios.ux.AdminProperties.handleJcmsDB(true);
    });
    
    // Click on name=derby_network_enabled
    $(document).on("click", "[name=derby_network_enabled]", function(event){
     $.jalios.ux.AdminProperties.handleJcmsDB();
    });
    
    // Click on db_check_cnx_jdbc
    $(document).on("click", "#db_check_cnx_jdbc", function(event){
      $.jalios.ux.AdminProperties.checkJDBC();
    });
     
    // Click on db_check_cnx_jdbc
    $(document).on("click", "#db_check_cnx_ds", function(event){
      $.jalios.ux.AdminProperties.checkDataSource();
    });

    
    // LDAP =====
     
    // Click on ldap_check_cnx
    $(document).on("click", "#ldap_check_cnx", function(event){
      $.jalios.ux.AdminProperties.checkLDAP();
    });
    
    // Change ldap_predefined_settings
    $(document).on("change", "#ldap_predefined_settings", function(event){
      $.jalios.ux.AdminProperties.handleLDAP();
    });
  }
  

  // ------------------------------------------
  //  JSON
  // ------------------------------------------
 
  var jcmsdb = {
    'mysql':        { 'db_url' : 'jdbc:mysql://localhost:3306/jcmsdb?jdbcCompliantTruncation=false&amp;useUnicode=true&amp;characterEncoding=UTF-8' },
    'oracle':       { 'db_url' : 'jdbc:oracle:thin:@host:port:SID' },
    'oracle-xe':    { 'db_url' : 'jdbc:oracle:thin:@localhost:1521:XE' },
    'postgresql':   { 'db_url' : 'jdbc:postgresql://localhost:5432/jcmsdb' },
    'sqlserver':    { 'db_url' : 'jdbc:jtds:sqlserver://localhost:1433/jcmsdb' },
    'derby-remote': { 'db_url' : 'jdbc:derby://localhost:1527/jcmsdb' },
    'derby':        { 'db_url' : '' }
  };
 
 var ldapPreset = {
 
   'active_directory': { 
     'ldap_server_userfilter' : '(&(objectClass=person)(objectClass=user)(sAMAccountName={0})(!(userAccountControl:1.2.840.113556.1.4.803:=2)))',
     'ldap_server_userobjectclass' : 'user',
     'ldap_mapping_login' : 'sAMAccountName',
     'ldap_mapping_name' : 'sn',
     'ldap_mapping_firstName' : 'givenName',
     'ldap_mapping_salutation' : '',
     'ldap_mapping_jobTitle' : 'title',
     'ldap_mapping_department' : 'department',
     'ldap_mapping_mail' : 'mail',
     'ldap_mapping_phone' : 'telephoneNumber',
     'ldap_mapping_mobile' : 'mobile',
     'ldap_mapping_street': 'streetAddress',
     'ldap_mapping_postalCode': 'postalCode',
     'ldap_mapping_poBox': 'postOfficeBox',
     'ldap_mapping_region': 'st',
     'ldap_mapping_locality': 'l',
     'ldap_mapping_country': 'c',     
     'ldap_mapping_address': '',
     'ldap_mapping_info' : 'description',
     'ldap_server_groupfilter' : '(&(objectClass=group)(member={0}))',
     'ldap_server_groupobjectclass' : 'group',
     'ldap_grpmapping_name' : 'cn',
     'ldap_grpmapping_member' :'member'
   },
   'open_ldap_posix': { 
      'ldap_server_userfilter' : '(&(objectClass=inetOrgPerson)(objectClass=posixAccount)(uid={0}))',
      'ldap_server_userobjectclass' : 'posixAccount',
      'ldap_mapping_login' : 'uid',
      'ldap_mapping_name' : 'sn',
      'ldap_mapping_firstName' : 'givenName',
      'ldap_mapping_salutation' : '',
      'ldap_mapping_jobTitle' : 'title',
      'ldap_mapping_department' : '',
      'ldap_mapping_mail' : 'mail',
      'ldap_mapping_phone' : 'telephoneNumber',
      'ldap_mapping_mobile' : 'mobile',
      'ldap_mapping_street': 'streetAddress',
      'ldap_mapping_postalCode': 'postalCode',
      'ldap_mapping_poBox': 'postOfficeBox',
      'ldap_mapping_region': 'st',
      'ldap_mapping_locality': 'l',
      'ldap_mapping_country': 'c',     
      'ldap_mapping_address': '',
      'ldap_mapping_info' : 'description',
      'ldap_server_groupfilter' : '(&(objectClass=posixGroup)(memberUid={0}))',
      'ldap_server_groupobjectclass' : 'posixGroup',
      'ldap_grpmapping_name' : 'cn',
      'ldap_grpmapping_member' :'memberUid'
    },
    'open_ldap_unique': {
      'ldap_server_userfilter' : '(&(objectClass=inetOrgPerson)(objectClass=posixAccount)(uid={0}))',
      'ldap_server_userobjectclass' : 'posixAccount',
      'ldap_mapping_login' : 'uid',
      'ldap_mapping_name' : 'sn',
      'ldap_mapping_firstName' : 'givenName',
      'ldap_mapping_salutation' : '',
      'ldap_mapping_jobTitle' : 'title',
      'ldap_mapping_department' : '',
      'ldap_mapping_mail' : 'mail',
      'ldap_mapping_phone' : 'telephoneNumber',
      'ldap_mapping_mobile' : 'mobile',
      'ldap_mapping_street': 'streetAddress',
      'ldap_mapping_postalCode': 'postalCode',
      'ldap_mapping_poBox': 'postOfficeBox',
      'ldap_mapping_region': 'st',
      'ldap_mapping_locality': 'l',
      'ldap_mapping_country': 'c',   
      'ldap_mapping_address': '',
      'ldap_mapping_info' : 'description',
      'ldap_server_groupfilter' : '(&(objectClass=groupOfNames)(member={0}))',
      'ldap_server_groupobjectclass' : 'groupOfUniqueNames',
      'ldap_grpmapping_name' : 'cn',
      'ldap_grpmapping_member' :'member'
    }
  }
 
  // ------------------------------------------
  //  PUBLIC
  // ------------------------------------------

  // Namespace
  if (!$.jalios)      { $.jalios    = {}; }
  if (!$.jalios.ux)   { $.jalios.ux = {}; }
  
  $.jalios.ux.AdminProperties = {
     
    handleJcmsDB: function(populate){
      var $combo = $('#db_jcmsdb SELECT');
      var $form  = $combo.closest('FORM');
      var $dbconf= $('.db_configuration');

      // Preset Form
      var db = $combo.val();
      if (populate){
        $form.populate(jcmsdb[db]);
      }
      
      // Check Input States
      var disabled = ('derby' == db) && $('[name=derby_network_enabled]:checked', $form).val() == 'false';
      
      // Disable all derby configuration
      $('#db_derby_configuration').toggleClass('disabled', disabled)
                                  .find('INPUT, SELECT, BUTTON')
                                  .attr('disabled',disabled);
      
      // Toggle derby related div
      $('.derby_network').toggle('derby' == db);
      $dbconf.toggle('derby' != db);
      
      // Handle derby-remote
      if ('derby-remote' == db){
        $dbconf.find('[name=db_username]').val('APP').attr('disabled', 'disabled').closest('DIV').find('A').hide();
      }
      // Others 
      else if ('derby != db'){
        $dbconf.find('[name=db_username]').attr('disabled', false).closest('DIV').find('A').show();
      }
    },
    
    handleLDAP: function(){
      
      var $form = $('#editForm');
      var sync = $('[name=ldap_synchronize_enable]:checked',$form).val() == 'false'; //$('#ldap_synchronize_enable_on').attr('checked') ? false : true;
      
      $form.named([
        'ldap_mapping_login',
        'ldap_mapping_name',
        'ldap_mapping_firstName',
        'ldap_mapping_salutation',
        'ldap_mapping_organization',
        'ldap_mapping_jobTitle',
        'ldap_mapping_mail',
        'ldap_mapping_phone',
        'ldap_mapping_mobile',
        'ldap_mapping_street',
        'ldap_mapping_postalCode',
        'ldap_mapping_poBox',
        'ldap_mapping_region',
        'ldap_mapping_locality',
        'ldap_mapping_country',   
        'ldap_mapping_address',
        'ldap_mapping_info',
        
        'ldap_server_groupsuffix',
        'ldap_server_groupfilter',
        'ldap_server_groupobjectclass',
        'ldap_synchronizegroups_enable',
        'ldap_grpmapping_name',
        'ldap_grpmapping_member'
      ]).attr('disabled',sync);
      
      var preset = $('#ldap_predefined_settings :selected').val() || 'active_directory';

      $form.populate(ldapPreset[preset]);
    },
    
    toggleStatus: function($btn, $icon, $span, status, msg){
      if (0 == status){
        $btn.addClass('disabled').attr('disabled',true)
        $icon.attr('src','images/jalios/icons/waitsmall.gif').show();
        $span.html('');
      } 
      else if (1 == status){
        $btn.removeClass('disabled').attr('disabled',false)
        $icon.attr('src','images/jalios/icons/tick.gif');
        $span.html('Connection established successfully.');
      }
      else if (-1 == status){
        $btn.removeClass('disabled').attr('disabled',false)
        $icon.attr('src','images/jalios/icons/warnSmall.gif');
        $span.html(msg);
      }
    },
     
    checkConnection: function($btn, $icon, $span, url, data){
        
      // Set status to default
      $.jalios.ux.AdminProperties.toggleStatus($btn, $icon, $span, 0);
       
      // Perform JSON request
      var $form = $('#editForm');
      var request = $.ajax({
        url:  url,
        data: $.param($form.serializeObject(data),true)
      }).done(function(msg){
        if ('ok' == msg){
          $.jalios.ux.AdminProperties.toggleStatus($btn,$icon, $span, 1);
        } else {
          $.jalios.ux.AdminProperties.toggleStatus($btn, $icon, $span, -1, msg);
        }
      });
       
      request.fail(function(jqXHR, textStatus) {
        $.jalios.ux.AdminProperties.toggleStatus($btn, $icon, $span, -1, textStatus);
      });
    },
     
    checkJDBC: function(){
      $.jalios.ux.AdminProperties.checkConnection(
        $('#db_check_cnx_jdbc'), $('#db_check_cnx_jdbc_icon'), $('#db_check_cnx_jdbc_msg'), 'admin/properties/ajaxJDBC.jsp',{
        'db_jcmsdb'   : '',
        'db_url'      : '',
        'db_username' : '',
        'db_password' : ''
      });
    },
     
    checkDataSource: function(){
      $.jalios.ux.AdminProperties.checkConnection(
        $('#db_check_cnx_ds'), $('#db_check_cnx_ds_icon'), $('#db_check_cnx_ds_msg'), 'admin/properties/ajaxDataSource.jsp', { 
          'db_jcmsdb'      : '', 
          'db_datasource'  : ''
        }
      );
    },
     
    checkLDAP:  function() {
      $.jalios.ux.AdminProperties.checkConnection(
        $('#ldap_check_cnx'), $('#ldap_check_cnx_icon'), $('#ldap_check_cnx_msg'), 'admin/properties/ajaxLDAP.jsp', {
          'ldap_server_hostname' : '', 
          'ldap_server_port'     : '',
          'ldap_server_ssl'      : '',
          'ldap_server_login'    : '',
          'ldap_server_password' : ''
        }
      );
    }
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);