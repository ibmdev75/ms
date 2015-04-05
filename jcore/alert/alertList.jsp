<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import='com.jalios.jcms.alert.*' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.AlertListHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%--
--%></jsp:useBean><%--
--%> 
<% if (formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<%
List<Alert> alertList =  formHandler.getAlertList();
String commonParams = "";
if (Util.notEmpty(formHandler.getAvailableAlertReadMode())) {
  commonParams += "&amp;alertReadMode=" + formHandler.getAvailableAlertReadMode();
} 
if (formHandler.getAvailableAlertLevel() != null) {
  commonParams += "&amp;alertLevel=" + formHandler.getAvailableAlertLevel().getValue();
}
boolean isDataWriteEnabled = channel.isDataWriteEnabled();
%>
<jalios:modal css="modal-lg alert-modal" formHandler="<%= formHandler %>" title="alert.list.lbl.title" url="jcore/alert/alertList.jsp" picture="">
  <%-- Alert List --%>
  <div class="alert-modal-body">
    <% if (Util.isEmpty(alertList)) { %>
    <div class="alert alert-info"><%= glp("alert.list.lbl.no-alert") %></div><%-- NOTE:OD do not work with <jalios:message> --%>
    <% } %>
	  <div class="alert-modal-list">
	    <jalios:pager name='alertPagerHandler' action='init' declare='true' size='<%= Util.getSize(alertList) %>' pageSize='10'/>
      <jalios:foreach name="alert" type="Alert" collection="<%= alertList %>" skip='<%= alertPagerHandler.getStart() %>' max="<%= alertPagerHandler.getPageSize() %>">
		    <%
			    request.setAttribute("jcms.alertlist.alert", alert);
          request.setAttribute("jcms.alertlist.params", commonParams);
		    %> 
        <jalios:include jsp="<%= WebAlertChannel.getJspPath(alert) %>"/>
        <%
          request.removeAttribute("jcms.alertlist.alert");
          request.removeAttribute("jcms.alertlist.params");
        %>           
      </jalios:foreach>
      <jalios:pager name='alertPagerHandler' template="pqf"/>
      </div>
  </div>
  <%-- Filters --%>
  <jalios:buffer name="MODAL_MENU">
  <div class="modal-menu form-inline">
    <%-- Level Filter --%>
    <% Alert.Level alertLevel = formHandler.getAvailableAlertLevel(); %>
    <select class="form-control" name="alertLevel" data-jalios-action="ajax-refresh">
      <option value=""><%= glp("alert.level.all") %></option>
      <jalios:foreach name="itLevel" collection="<%= formHandler.getAlertLevelList() %>" type="Alert.Level">
      <option value="<%= itLevel.getValue() %>" class="<%= itLevel.getKey() %>" <%= alertLevel == itLevel ? "selected='selected'" : "" %>><%= itLevel.getLabel(userLang) %></option>
      </jalios:foreach>
    </select>  

    <%-- Read Mode filter --%>        
    <% String readMode = formHandler.getAvailableAlertReadMode(); %>
    <select class="form-control" name="alertReadMode" data-jalios-action="ajax-refresh">
      <jalios:foreach name="itReadMode" array="<%= formHandler.getReadModes() %>" type="String">
      <option value="<%= itReadMode %>" <%= itReadMode.equals(readMode) ? "selected='selected'" : "" %>><%= glp("alert.list.lbl.read-mode." + itReadMode) %></option>
      </jalios:foreach>
    </select>
  </div>
  </jalios:buffer>
  <jalios:buffer name="MODAL_BUTTONS">  
	  <% if (formHandler.showCustomize()) { %>
	  <input type="submit" class="ajax-refresh btn btn-default" name="opCustomize" value="<%= glp("alert.list.btn.customize") %>" <%= isDataWriteEnabled ? "" : "disabled='disabled'" %>/>
	  <% } %>
	  <% if (Util.notEmpty(alertList)) { %>
	  <input type="submit" class="ajax-refresh btn btn-default confirm" name="opMarkAllAsRead" value="<%= glp("alert.list.btn.mark-all-as-read") %>" <%= !isDataWriteEnabled || formHandler.isReadMode() ? "disabled='disabled'" : "" %>/>
	  <input type="submit" class="ajax-refresh btn <%= isDataWriteEnabled ? "btn-danger" : "btn-default" %> confirm" name="opDeleteAll" value="<%= glp("alert.list.btn.delete-all") %>" <%= isDataWriteEnabled ? "" : "disabled='disabled'" %>/>
	  <% } %>
	  <% if (formHandler.isDirty()) { %>
	  <input type="submit" class="btn btn-primary" name="opCancel" data-dismiss="modal" onclick="jQuery('.topbar-alert').refresh();" value="<%= glp("ui.com.btn.close") %>"/>      
	  <% } else { %>
	  <input type="submit" class="btn btn-primary" name="opCancel" data-dismiss="modal" value="<%= glp("ui.com.btn.close") %>"/>
	  <% } %>
	  <input type="hidden" name="dirty" value="<%= formHandler.isDirty() %>" /> 
	</jalios:buffer>
	
</jalios:modal>