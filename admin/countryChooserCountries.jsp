<%@page import="java.util.regex.Pattern"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
List<String> countryCodeList = Util.splitToList(channel.getProperty("iso-3166-1-codes").toUpperCase(), ", ");

String searchText = "";
if("POST".equals(request.getMethod()) && getBooleanParameter("opSearchCountry", false)) {
  searchText = getUntrustedStringParameter("text", "");
}

Pattern matchPattern = Pattern.compile(".*" + Pattern.quote(searchText) + ".*", Pattern.CASE_INSENSITIVE);
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="admin/countryChooserCountries.jsp">
  <div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <form class="navbar-form navbar-right" method="POST" role="search">
      <jalios:field label="&nbsp;" name="text" value="<%= searchText %>" resource="field-light">
        <jalios:control settings='<%= new TextFieldSettings().placeholder("ui.work.country-chooser.search.placeholder") %>'>
          <jalios:buffer name="BTN_ACTION"><button type="submit" class="btn btn-default ajax-refresh" name="opSearchCountry" value="true"><jalios:icon src="search" /></button></jalios:buffer>
        </jalios:control>
      </jalios:field>
    </form>  
  </div>  
  <div class="navbar-placeholder"></div>
  <div class="container-fluid">
      <div class="row">
        <% for(String countryCode : countryCodeList) { %>
          <%
          String countryName = glp("country." + countryCode);
          String nativeCountryName = channel.getProperty("country." + countryCode);
          
          if (Util.isEmpty(searchText) || 
              countryCode.equalsIgnoreCase(searchText) || 
              matchPattern.matcher(countryName).matches() || 
              matchPattern.matcher(nativeCountryName).matches()) { %>
          <div class="col-sm-6 col-md-4">
            <label title="<%= nativeCountryName %>">
              <input type="radio" onclick="Popup.callback('<%= HttpUtil.encodeForJavaScript(countryCode) %>', '<%= HttpUtil.encodeForJavaScript(countryName) %>'); window.close();" />
              <jalios:country country="<%= countryCode %>" />
              <%= countryName %>
            </label>
          </div>
          <% } %>
        <% } %>
      </div>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>