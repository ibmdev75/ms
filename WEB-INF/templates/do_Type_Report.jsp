<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");
Attribute categorizableAtt = typeElt.getAttribute("categorizable");
boolean categorizable = categorizableAtt != null && categorizableAtt.getBooleanValue();

// Get the fields (and the inherited fields)                             
ArrayList fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);

%>
[[%@ page contentType="text/html; charset=UTF-8" %]]
[[%-- This file was automatically generated. --%]]
[[%--
  @Summary: <%= className %> report page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%]]
[[%@ include file='/jcore/doInitPage.jspf' %]]

[[% 
SortedSet resultSet = channel.getPublicationSet(<%= className %>.class, loggedMember);
if (Util.isEmpty(resultSet)) {
  return;
}
Date firstDate = ((Data)resultSet.last()).getCdate();
Date lastDate = ((Data)resultSet.first()).getCdate();
int counter = 0;
DecimalFormat decimalFormat = new DecimalFormat("#.##");
int tableWidth = 400;
IntegerFormReport intReport;
EnumerateFormReport enumReport;
%]]

<p class='t1'>[[%= channel.getTypeLabel(<%= className %>.class, userLang) %]]</p>

[[%-- --- Summary ---------------------------------------------------------------------- --%]]
<table class="table-data table-condensed">
  <tr>
    <th colspan="2">[[% /* %]]Summary[[% */ %]][[%= glp("ui.work.report.lbl.summary") %]]</th>
  </tr>
  <tr>
    <td>[[% /* %]]Submit count[[% */ %]][[%= glp("ui.work.report.lbl.nb-submit") %]]</td>
    <td align='right'>[[% /* %]]1234[[% */ %]][[%= resultSet.size() %]]</td>
  </tr>
  <tr>
    <td>[[% /* %]]First submit[[% */ %]][[%= glp("ui.work.report.lbl.fst-submit") %]]</td>
    <td align='right'>[[jalios:date date='[[%= firstDate %]]' /]] [[jalios:time date='[[%= firstDate %]]' /]]</td>
  </tr>
  <tr>
    <td>[[% /* %]]Last submit[[% */ %]][[%= glp("ui.work.report.lbl.lst-submit") %]]</td>
    <td align='right'>[[jalios:date date='[[%= lastDate %]]' /]] [[jalios:time date='[[%= lastDate %]]' /]]</td>
  </tr>
  <tr>
    <td>[[% /* %]]Duration[[% */ %]][[%= glp("ui.work.report.lbl.duration") %]]</td>
    <td align='right'>[[jalios:duration begin='[[%= firstDate %]]' end='[[%= lastDate %]]' /]]</td>
  </tr>
</table>
<br />
  
<%-- ** FIELDS ******************************** --%>
<jalios:foreach collection="<%= fieldList %>" name="itField" type="org.jdom.Element">
<%
  String name = itField.getAttributeValue("name");
  String nameCap = Util.recapitalize(name);
  String label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + name + "\", userLang) %]]";
  String type = itField.getAttributeValue("type");
  String editor = itField.getAttributeValue("editor");
  if (editor == null) { editor = ""; }
  Attribute ml = itField.getAttribute("ml");
  boolean fieldML = ml != null && ml.getBooleanValue();

  Attribute searchable = itField.getAttribute("searchable");
  boolean fieldSearchable = searchable != null && searchable.getBooleanValue();

  Attribute openWindowAttr = itField.getAttribute("openWindow");
  boolean openWindow = openWindowAttr != null && openWindowAttr.getBooleanValue();

  String tmpStr = itField.getAttributeValue("dateOnly");
  boolean isDateOnly = (tmpStr != null && tmpStr.equals("true")); 
  String dateFormat = Util.getString(itField.getAttributeValue("dateFormat"), "short");

  String unit =       Util.getString(itField.getAttributeValue("unit"), "");
  String unitPos =    Util.getString(itField.getAttributeValue("unitPos"), "after");
  String unitBefore = Util.notEmpty(unit) && unitPos.equals("before") ? unit + "&nbsp;" : "";
  String unitAfter =  Util.notEmpty(unit) && unitPos.equals("after") ? "&nbsp;" + unit : "";
  int decimals = 2;
  Attribute decimalsAtt = itField.getAttribute("decimals");
  if (decimalsAtt != null) {
    decimals = decimalsAtt.getIntValue();
  }
  String rootCatId = itField.getAttributeValue("root");

  String arrayType = "";
  if (type.endsWith("[]")) {
   arrayType = type.substring(0, type.length() - 2);
  }

%>

<jalios:select>

<%-- ** ENUMERATE **************************************** --%>
<jalios:if predicate='<%= editor.equals("enumerate") %>'>
  
[[%-- --- <%= nameCap %> ---------------------------------------------- --%]]
[[% enumReport = <%= className %>.get<%= nameCap %>Report(resultSet); %]]
<table class="table-data table-condensed">
  <tr>
    <th colspan="2"><%= label %></th>
  </tr>
  <tr bgcolor='white'>
    <td class="formInfo">
      <table class='layout'>
  	[[jalios:foreach array='[[%= <%= className %>.<%= name %>Values %]]' name='itKey' type='String']]
  	[[% int percent = (int)(enumReport.getPercent(itKey)); %]]
  	[[% double ratio = enumReport.getRatio(itKey); %]]
  	<tr>
  	  <td nowrap="nowrap" class="formInfo" width='50%'>
            [[jalios:truncate length='30' suffix='...']][[%= itKey %]][[/jalios:truncate]]
          </td>
  	  <td nowrap="nowrap" class="formInfo" width='5%' align='right'><strong>[[%= percent %]] %</strong></td>
  	  <td width='45%' class="formInfo" >
  	    <table class='layout'>
  	      <tr>
  	        <td bgcolor='blue' width='[[%= percent %]]%'><img src='s.gif' width='[[%= percent %]]' height='12'></td>
  	        <td bgcolor='lightblue' width='[[%= 100 - percent %]]%'><img src='s.gif' width='[[%= (int)((1 - ratio) * 100) %]]' height='12'></td>
  	      </tr>
  	    </table>
  	  </td>
  	</tr>    
        [[/jalios:foreach]]
      </table>
    </td>
  </tr>
</table>
<br />
</jalios:if>

<%-- ** BOOLEAN **************************************** --%>
<jalios:if predicate='<%= type.equals("boolean") %>'>
  
[[%-- --- <%= nameCap %> ---------------------------------------------- --%]]
[[% enumReport = <%= className %>.get<%= nameCap %>Report(resultSet); %]]
<table class="table-data table-condensed">
  <tr>
    <th colspan="2"><%= label %></th>
  </tr>
  <tr bgcolor='white'>
    <td class="formInfo">
      <table class='layout'>
  	[[jalios:foreach array='[[%= new Boolean[] {Boolean.TRUE, Boolean.FALSE} %]]' name='itKey' type='Boolean']]
  	[[% int percent = (int)(enumReport.getPercent("" + itKey)); %]]
  	[[% double ratio = enumReport.getRatio("" + itKey); %]]
  	[[% TypeFieldEntry tfe = channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", false); %]]
  	
  	<tr>
  	  <td nowrap="nowrap" class="formInfo" width='50%'>
        [[jalios:truncate length='30' suffix='...']][[%= itKey.booleanValue() ? tfe.getOnLabel(userLang) : tfe.getOffLabel(userLang) %]][[/jalios:truncate]]
      </td>
  	  <td nowrap="nowrap" class="formInfo" width='5%' align='right'><strong>[[%= percent %]] %</strong></td>
  	  <td width='45%' class="formInfo" >
  	    <table class='layout'>
  	      <tr>
  	        <td bgcolor='blue' width='[[%= percent %]]%'><img src='s.gif' width='[[%= percent %]]' height='12'></td>
  	        <td bgcolor='lightblue' width='[[%= 100 - percent %]]%'><img src='s.gif' width='[[%= (int)((1 - ratio) * 100) %]]' height='12'></td>
  	      </tr>
  	    </table>
  	  </td>
  	</tr>    
        [[/jalios:foreach]]
      </table>
    </td>
  </tr>
</table>
<br />
</jalios:if>

<%-- ** INT ****************************************** --%>
<jalios:if predicate='<%= type.equals("int") %>'>
  
[[%-- --- <%= nameCap %> ---------------------------------------------------------------------- --%]]
[[% intReport = <%= className %>.get<%= nameCap %>Report(resultSet); %]]
<table class="table-data table-condensed">
  <tr>
    <th colspan="2"><%= label %></th>
  </tr>
  <tr>
    <td>[[% /* %]]Minimum[[% */ %]][[%= glp("ui.work.report.lbl.min") %]]</td>
    <td align='right'><%= unitBefore %>[[% /* %]]1234[[% */ %]][[%= intReport.getMin() %]]<%= unitAfter %></td>
  </tr>
  <tr>
    <td>[[% /* %]]Maximum[[% */ %]][[%= glp("ui.work.report.lbl.max") %]]</td>
    <td align='right'><%= unitBefore %>[[%= intReport.getMax() %]]<%= unitAfter %></td>
  </tr>
  <tr>
    <td>[[% /* %]]Average[[% */ %]][[%= glp("ui.work.report.lbl.avrg") %]]</td>
    <td align='right'><%= unitBefore %>[[%= decimalFormat.format(intReport.getAverage()) %]]<%= unitAfter %></td>
  </tr>
</table>
<br />
</jalios:if>

</jalios:select>

</jalios:foreach>

<% out.flush(); %>
