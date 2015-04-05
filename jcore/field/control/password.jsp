<%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.HttpUtil"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String css = getOption(BasicSettings.CSS, "");
css = "form-control" + (Util.notEmpty(css) ? " " + css : "");
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
String required = fieldRequired.booleanValue() ? "aria-required='true'" : "";

String disabled = Util.isEmpty(fieldName) && Util.toBoolean(fieldDisabled, false) ? "disabled='disabled'" : "";
String placeholder = formatAttribute("placeholder=\"%s\"", getOption(BasicSettings.PLACEHOLDER, ""));
%><%
%><% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>"
      type="password"
      autocomplete="off"
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(resolveValue(fieldValue)) %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= placeholder %>
      <%= disabled %>
      <%= required %>
      <%= dataAttributes %>
      <%= htmlAttributes %> />
<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>