<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. --%>
<%--
  @Summary: SignUp report page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
SortedSet resultSet = channel.getPublicationSet(SignUp.class, loggedMember);
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
%>
<p class='t1'><%= channel.getTypeLabel(SignUp.class, userLang) %></p>
<%-- --- Summary ---------------------------------------------------------------------- --%>
<table class="table-data table-condensed">
  <tr>
    <th colspan="2"><% /* %>Summary<% */ %><%= glp("ui.work.report.lbl.summary") %></th>
  </tr>
  <tr>
    <td><% /* %>Submit count<% */ %><%= glp("ui.work.report.lbl.nb-submit") %></td>
    <td align='right'><% /* %>1234<% */ %><%= resultSet.size() %></td>
  </tr>
  <tr>
    <td><% /* %>First submit<% */ %><%= glp("ui.work.report.lbl.fst-submit") %></td>
    <td align='right'><jalios:date date='<%= firstDate %>' /> <jalios:time date='<%= firstDate %>' /></td>
  </tr>
  <tr>
    <td><% /* %>Last submit<% */ %><%= glp("ui.work.report.lbl.lst-submit") %></td>
    <td align='right'><jalios:date date='<%= lastDate %>' /> <jalios:time date='<%= lastDate %>' /></td>
  </tr>
  <tr>
    <td><% /* %>Duration<% */ %><%= glp("ui.work.report.lbl.duration") %></td>
    <td align='right'><jalios:duration begin='<%= firstDate %>' end='<%= lastDate %>' /></td>
  </tr>
</table>
<br />
  
  
<%-- --- Salutation ---------------------------------------------- --%>
<% enumReport = SignUp.getSalutationReport(resultSet); %>
<table class="table-data table-condensed">
  <tr>
    <th colspan="2"><%= channel.getTypeFieldLabel(SignUp.class, "salutation", userLang) %></th>
  </tr>
  <tr bgcolor='white'>
    <td class="formInfo">
      <table class='layout'>
  	<jalios:foreach array='<%= SignUp.salutationValues %>' name='itKey' type='String'>
  	<% int percent = (int)(enumReport.getPercent(itKey)); %>
  	<% double ratio = enumReport.getRatio(itKey); %>
  	<tr>
  	  <td nowrap="nowrap" class="formInfo" width='50%'>
            <jalios:truncate length='30' suffix='...'><%= itKey %></jalios:truncate>
          </td>
  	  <td nowrap="nowrap" class="formInfo" width='5%' align='right'><strong><%= percent %> %</strong></td>
  	  <td width='45%' class="formInfo" >
  	    <table class='layout'>
  	      <tr>
  	        <td bgcolor='blue' width='<%= percent %>%'><img src='s.gif' width='<%= percent %>' height='12'></td>
  	        <td bgcolor='lightblue' width='<%= 100 - percent %>%'><img src='s.gif' width='<%= (int)((1 - ratio) * 100) %>' height='12'></td>
  	      </tr>
  	    </table>
  	  </td>
  	</tr>    
        </jalios:foreach>
      </table>
    </td>
  </tr>
</table>
<br /><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- H6Rm5/wZi/ixqpJxzqVRTw== --%>