<%-- 
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Switch Context Interface
  @Category: Presentation / Popup
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.accessibility.SwitchAccessibilityContextHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>" /><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>" /><%
 %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
  
  if (formHandler.validate()) {
    return;
  }
  request.setAttribute("zone", "Public");
  if (trace != null) {
    trace.put("zone", request.getAttribute("zone"));
  }
  request.setAttribute("title", glp("ui.accessibility.accessibilitycontext.title"));
  int formElementCount = 0;
  
  AccessibilityContext currentContext = AccessibilityContextManager.getInstance().getCurrentAccessibilityContext(session);
  String currentContextId = currentContext != null ? currentContext.getId() : null;

%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<div id='switchcontextlayout'>

<form action="front/switchAccessibilityContext.jsp" name="switchcontextform" method="post">
  <% if (Util.notEmpty(formHandler.getRedirect())) { %>
  <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>" />
  <% } %>
  <% if (formHandler.isPopupEdition()) { %>
  <input type="hidden" name="popupEdition" value="true" />
  <% } %>  
	<fieldset>
		<legend><%= glp("ui.accessibility.accessibilitycontext.legend") %></legend>
<%@ include file='/jcore/doMessageBox.jspf' %>
	  <ul class="withoutbullet">
	  <jalios:foreach  name="itContext" 
	                   type="AccessibilityContext" 
	                   collection="<%= AccessibilityContextManager.getInstance().getContexts() %>">
	    <li style="list-style-type: none;">
	      <table class="layout">
	        <tr>
	          <td style="vertical-align: top;">
	            <input id="accessibilitycontext<%= itContext.getId() %>" 
                 type="radio" 
                 name="accessibilitycontext" 
                 value="<%= itContext.getId() %>"
                 tabindex="<%= formElementCount++ %>"
                 <%= (itContext.getId().equals(currentContextId)) ? "disabled='disabled' checked='checked'" : "" %>   
                 />
	          </td>
	          <td style="vertical-align: top;">
			        <label for="accessibilitycontext<%= itContext.getId() %>"><%= itContext.getLabel(userLang) %><%= (itContext.getId().equals(currentContextId)) ? "(" + glp("ui.accessibility.accessibilitycontext.currentcontext") + ")" : "" %></label>
			        <% if (Util.notEmpty(itContext.getDescription(userLang))) { %>
			        <div style="font-size: smaller; color: grey;"><%= itContext.getDescription(userLang) %></div>
			        <% } %>
	          </td>
	        </tr>
	      </table>
	    </li>
	  </jalios:foreach>
	  </ul>
	  <%= WidgetUtil.printHtmlButton("opSwitch", glp("ui.accessibility.accessibilitycontext.submitchangecontext"), true, null, true, formElementCount) %>
	  <% formElementCount++; 
	   if (formHandler.isPopupEdition()) {
	  %>
	    <input class='btn btn-default' name="opCancel" value='<%= glp("ui.com.btn.cancel") %>' type='submit' onclick='window.close(); return false;' tabindex='<%= formElementCount %>' />
	  <% } else { %>
	  <%= WidgetUtil.printSubmitButton(glp("ui.com.btn.cancel"),  "opCancel", formElementCount) %>
	  <% } %>
	</fieldset>
</form>
</div>
<% if (formHandler.isPopupEdition()) { %>
<jalios:javascript>
  Popup.autoResize('switchcontextlayout');
</jalios:javascript>
<% } %>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
