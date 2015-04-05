<%@ include file="/admin/properties/doCommonProp.jspf" %>
<div class="row">


  <%-- --- FORWARD PROXY ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>Forward Proxy<% */ %><%= glp("ui.adm.prop.ch.lgd.f-proxy") %></legend>         
    <p><%= glp("ui.adm.prop.ch.f-proxy.txt") %></p>
        <%
          boolean httpProxyEnabledDefaultValue = Util.notEmpty(formHandler.getHttp_proxyHost()); 
          boolean httpProxyEnabled = Util.toBoolean(formHandler.getHttp_proxy_enabled(), httpProxyEnabledDefaultValue);
        %>        
    <jalios:field label="ui.com.lbl.enabled" name='http_proxy_enabled' value='<%= httpProxyEnabled %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.ch.f-proxy.host" name='<%= "http_proxyHost" %>' tooltip='<%= "ui.adm.prop.ch.f-proxy.host.h" %>' value='<%= formHandler.getHttp_proxyHost() %>' disabled='<%= formHandler.isDisabled("http.proxyHost") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.ch.f-proxy.port" name='<%= "http_proxyPort" %>' tooltip='<%= "ui.adm.prop.ch.f-proxy.port.h" %>' value='<%= formHandler.getHttp_proxyPort() %>' disabled='<%= formHandler.isDisabled("http.proxyPort") %>'>
      <jalios:control type="<%= ControlType.NUMBER %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.ch.f-proxy.not" name='<%= "http_nonProxyHosts" %>' tooltip='<%= "ui.adm.prop.ch.f-proxy.not.h" %>' value='<%= formHandler.getHttp_nonProxyHosts() %>' disabled='<%= formHandler.isDisabled("http.nonProxyHosts") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.ch.f-proxy.login" name='<%= "http_proxy_login" %>' value='<%= formHandler.getHttp_proxy_login() %>' disabled='<%= formHandler.isDisabled("http.proxy.login") %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.ch.f-proxy.pwd" name='<%= "http_proxy_password" %>' value='<%= formHandler.getHttp_proxy_password() %>' disabled='<%= formHandler.isDisabled("http.proxy.password") %>'>
      <jalios:control type="<%= ControlType.PASSWORD %>" />
    </jalios:field>

  </fieldset>

  <%-- --- REVERSE PROXY ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend><% /* %>ReverseProxy<% */ %><%= glp("ui.adm.prop.ch.lgd.r-proxy") %></legend>
    <p><%= glp("ui.adm.prop.ch.r-proxy.txt") %></p>
              
    <jalios:field label="ui.com.lbl.enabled" name='channel_proxy_enabled' value='<%= Util.toBoolean(formHandler.getChannel_proxy_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>              
              
    <fieldset class="col-md-12">
      <legend><% /* %>Reverse Proxy Configuration 1<% */ %><%= glp("ui.adm.prop.ch.r-proxy.conf", 1)%></legend>
    
      <jalios:field label="ui.adm.prop.ch.r-proxy.addrs" name='<%= "channel_proxy_conf1_addrs" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.addrs.h" %>' value='<%= formHandler.getChannel_proxy_conf1_addrs() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf1.ip-addresses") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
      
      <jalios:field label="ui.adm.prop.ch.r-proxy.ctxt" name='<%= "channel_proxy_conf1_ctxt" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.ctxt.h" %>' value='<%= formHandler.getChannel_proxy_conf1_ctxt() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf1.context-path") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
      
      <jalios:field label="ui.adm.prop.ch.r-proxy.base-url" name='<%= "channel_proxy_conf1_baseurl" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.base-url.h" %>' value='<%= formHandler.getChannel_proxy_conf1_baseurl() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf1.base-url") %>'>
        <jalios:control type="<%= ControlType.URL %>" />
      </jalios:field>
      
      <jalios:field label="ui.adm.prop.ch.r-proxy.ssl-base-url" name='<%= "channel_proxy_conf1_sslbaseurl" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.ssl-base-url.h" %>' value='<%= formHandler.getChannel_proxy_conf1_sslbaseurl() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf1.ssl-base-url") %>'>
        <jalios:control type="<%= ControlType.URL %>" />
      </jalios:field>

    </fieldset>
    
    <fieldset class="col-md-12">
      <legend><% /* %>Reverse Proxy Configuration 2<% */ %><%= glp("ui.adm.prop.ch.r-proxy.conf", 2)%></legend>
      <p><%=glp("ui.adm.prop.ch.r-proxy.other")%></p>
      
			<jalios:field label="ui.adm.prop.ch.r-proxy.addrs"  name='<%= "channel_proxy_conf2_addrs" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.addrs.h" %>' value='<%= formHandler.getChannel_proxy_conf2_addrs() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf2.ip-addresses") %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>

			<jalios:field label="ui.adm.prop.ch.r-proxy.ctxt" name='<%= "channel_proxy_conf2_ctxt" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.ctxt.h" %>' value='<%= formHandler.getChannel_proxy_conf2_ctxt() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf2.context-path") %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>

			<jalios:field label="ui.adm.prop.ch.r-proxy.base-url" name='<%= "channel_proxy_conf2_baseurl" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.base-url.h" %>' value='<%= formHandler.getChannel_proxy_conf2_baseurl() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf2.base-url") %>'>
			  <jalios:control type="<%= ControlType.URL %>" />
			</jalios:field>

			<jalios:field label="ui.adm.prop.ch.r-proxy.ssl-base-url" name='<%= "channel_proxy_conf2_sslbaseurl" %>' tooltip='<%= "ui.adm.prop.ch.r-proxy.ssl-base-url.h" %>' value='<%= formHandler.getChannel_proxy_conf2_sslbaseurl() %>' disabled='<%= formHandler.isDisabled("channel.reverse-proxy.conf2.ssl-base-url") %>'>
			  <jalios:control type="<%= ControlType.URL %>" />
			</jalios:field>
			
    </fieldset>
    
  </fieldset>     


    
      
</div>