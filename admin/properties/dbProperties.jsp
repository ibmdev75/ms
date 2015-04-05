<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  <div class="col-md-12">
	  <%-- --- DB ------------------------------ --%>
	  <%
		  Map<String,Object> jcmsdbMap = channel.getSubProperties(userLang + ".ui.adm.prop.db.jcmsdb.");
	    JProperties rdbmsProp = (JProperties)jcmsdbMap.get("rdbms");
	    if (rdbmsProp == null) {
	      jcmsdbMap = channel.getSubProperties("en.ui.adm.prop.db.jcmsdb."); 
	      rdbmsProp = (JProperties)jcmsdbMap.get("rdbms");
	    }
	    Map<String,String> rdbmsMap = new TreeMap<String,String>();
	    rdbmsMap.putAll(rdbmsProp); // sort
	  %>
	  <jalios:field label="ui.adm.prop.db.jcmsdb" name='db_jcmsdb' id='db_jcmsdb' value='<%= formHandler.getDb_jcmsdb() %>' tooltip="ui.adm.prop.db.jcmsdb.h">
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(rdbmsMap.keySet()).enumLabels(rdbmsMap.values()) %>' />
	  </jalios:field>

    <%-- --- CONF ------------------------------ --%>
    <div class="derby_network">
	    <jalios:field label="ui.adm.prop.db.enabled-derby-network-access" name='derby_network_enabled' value='<%= Util.toBoolean(formHandler.getDerby_network_enabled(),false) %>'>
	      <jalios:control type="<%= ControlType.BOOLEAN %>" />
	    </jalios:field>
    </div>
    
    <%-- 1. DERBY CONFIGURATION --%>
    <fieldset id="db_derby_configuration" class="derby_network col-md-12">   
      <legend><%= glp("ui.adm.prop.db.derby-network-configuration") %></legend>
      
		  <%-- URL --%>
		  <%
		    List<String> ifLabelList = new ArrayList<String>();
		    List<String> ifValueList = new ArrayList<String>();
		    ifValueList.add("0.0.0.0");
		    ifLabelList.add(glp("ui.adm.prop.db.all-network-interfaces")+" : :: , 0.0.0.0");
		    for (Enumeration niEnum = NetworkInterface.getNetworkInterfaces(); niEnum.hasMoreElements() ;) {
		      NetworkInterface ni = (NetworkInterface) niEnum.nextElement();
		      StringBuilder buffer = new StringBuilder();
		      buffer.append(ni.getName()).append(" : ");
		      String ipv4Address = null;
		      for (Enumeration inetAddrEnum = ni.getInetAddresses(); inetAddrEnum.hasMoreElements() ;) {
		         InetAddress inetAddr = (InetAddress) inetAddrEnum.nextElement();
		         String hostAddress = inetAddr.getHostAddress();
		         String cleanedIpAddress = hostAddress.contains("%")? hostAddress.substring(0,hostAddress.indexOf('%')):hostAddress;
		         if(!hostAddress.contains(":")){
		           ipv4Address = hostAddress;
		         }
		         buffer.append(cleanedIpAddress);
		         buffer.append(inetAddrEnum.hasMoreElements() ? ", " : "");
		      }
		      if(ipv4Address != null){
		        ifValueList.add(ipv4Address);
		        ifLabelList.add(buffer.toString());
		      }
		    }
		  %>
      
			<jalios:field label="ui.adm.prop.db.derby-listening-address" name='<%= "derby_listening_address" %>' description='' required='<%=true %>' value='<%=  formHandler.getDerby_listening_address() %>' disabled='<%= formHandler.isDisabled("derby.listening-address") %>'>
              <jalios:control settings='<%= new EnumerateSettings().select().enumValues(ifValueList).enumLabels(ifLabelList) %>' />
			</jalios:field>
      
      
      <jalios:field label="ui.adm.prop.db.derby-listening-port" name='<%= "derby_listening_port" %>' description='' required='<%=true %>' value='<%=  formHandler.getDerby_listening_port() %>' disabled='<%= formHandler.isDisabled("derby.listening-port") %>'>
        <jalios:control type="<%= ControlType.NUMBER %>" />
      </jalios:field>
      
      <%-- Password --%>
      <jalios:field label="ui.adm.prop.db.password" name='<%= "derby_password" %>' description='' required='<%=true %>' value='<%=  formHandler.getDerby_password() %>' disabled='<%= formHandler.isDisabled("derby.password") %>'>
        <jalios:control type="<%= ControlType.PASSWORD %>" />
      </jalios:field>
    
    </fieldset>
    
    <%-- 2.1 JCMS CONFIGURATION --%>
    <fieldset class="db_configuration col-md-12">   
	    <legend><%= glp("ui.adm.prop.db.lgd.conf-jdbc") %></legend>
	    
	     <%-- URL --%>
	    <jalios:field label="ui.adm.prop.db.url" name='<%= "db_url" %>' description='' value='<%=  formHandler.getDb_url() %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>
				
	    <%-- Username --%>
	    <jalios:field label="ui.adm.prop.db.username" name='<%= "db_username" %>' description='' value='<%=  formHandler.getDb_username() %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>
				        
	    <%-- Password --%>
	    <jalios:field label="ui.adm.prop.db.password" name='<%= "db_password" %>' description='' value='<%=  formHandler.getDb_password() %>'>
			  <jalios:control type="<%= ControlType.PASSWORD %>" />
			</jalios:field>
	    
	    <%-- Check connection --%>
	    <button id="db_check_cnx_jdbc" type="button" class="btn btn-default"><%= glp("ui.adm.prop.db.check-cnx") %></button>
	    <jalios:icon src="s.gif"  alt='wait...' htmlAttributes='id="db_check_cnx_jdbc_icon" style="display: none;"'/>
	    <span id="db_check_cnx_jdbc_msg"></span>
	
	  </fieldset>

    <%-- 2.2 DATASOURCE CONFIGURATION --%>
    <fieldset class="db_configuration col-md-12"> 
      <legend><%= glp("ui.adm.prop.db.lgd.conf-datasource") %></legend>
        
      <%-- Datasource --%>
		  <jalios:field label="ui.adm.prop.db.datasource" name='<%= "db_datasource" %>' description='' value='<%=  formHandler.getDb_datasource() %>'>
		    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	  	</jalios:field>
				
      <%-- Check connection --%>
      <button id="db_check_cnx_ds" type="button" class="btn btn-default"><%= glp("ui.adm.prop.db.check-cnx") %></button>
      <jalios:icon  src="s.gif"  alt='wait...' htmlAttributes='id="db_check_cnx_ds_icon" style="display: none;"'/>
      <span id="db_check_cnx_ds_msg"></span>

    </fieldset>

    <%-- --- OPTIONS ------------------------------ --%>
    <fieldset id="db_options" class="col-md-12">
      <legend><%= glp("ui.adm.prop.db.lgd.options") %></legend>
        
      <%-- 2nd Level Cache --%>
      <jalios:field label="ui.adm.prop.db.second-level-cache" name='hibernate_cache_use_second_level_cache' value='<%= Util.toBoolean(formHandler.getHibernate_cache_use_second_level_cache(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
        
      <%-- Query Cache --%>
      <jalios:field label="ui.adm.prop.db.query-cache" name='hibernate_cache_use_query_cache' value='<%= Util.toBoolean(formHandler.getHibernate_cache_use_query_cache(),false) %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
 
    </fieldset>
  </div>
</div>
