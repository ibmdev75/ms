<%@ include file='/jcore/doInitPage.jspf'    %><%

  boolean showTextInput = getBooleanParameter("showText", true);
  String  callback      = getChooserParameter("jsFunc");
  String  txt           = getUntrustedStringParameter("txt", ""); // ENCODE!!
  
  jcmsContext.setPageTitle(glp("ui.wiki.link.lbl.insertlink"));
  jcmsContext.addBodyAttributes("style","padding: 10px;");
  

%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<form name="linkForm" class="form-vertical">

<jalios:field label="ui.com.lbl.url" name="url" value='<%= "http://" %>' resource="field-vertical">
  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
</jalios:field>

<jalios:field label="ui.wiki.link.lbl.linklabel" name="txt" value='<%= txt %>' resource="field-vertical">
  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
</jalios:field>



<jalios:if predicate="<%= !showTextInput %>"><input type='hidden' name='txt' value='<%= encodeForHTMLAttribute(txt) %>' /></jalios:if>
<button class='btn btn-primary' onclick="opener.<%= callback %>(linkForm.url.value, linkForm.txt.value); window.close();"><%= glp("ui.com.btn.ok") %></button>
<button class='btn btn-default' onclick="window.close();"><%= glp("ui.com.btn.cancel") %></button>
</form>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
