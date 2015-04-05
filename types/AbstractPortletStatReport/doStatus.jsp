<%@ include file='/jcore/doInitPage.jspf' %>
<%
	if (!isLogged){
		return;
	}
	AbstractPortletStatReport report = getDataParameter("id", AbstractPortletStatReport.class);
	if ((report == null) || (!report.canBeReadBy(loggedMember))){
		return;
	}
	StatAnalyser analyser  = StatManager.getStatAnalyser((StatReport)report,false);
	StatHandler  handler   = (StatHandler) request.getSession().getAttribute("StatHandler");
	int          status    = 100;
	long         spentTime = 0;
	
	if ((analyser == null) && (handler == null)){
		return;
	}
	
	if (analyser != null){
		status    = analyser.getStatus();
		spentTime = analyser.getSpentTime(false);
	}
	
	ObjectIntTreeMap chart = new ObjectIntTreeMap();
  chart.put(report.getTitle(userLang) , status);
  
  long freeMemory = Runtime.getRuntime().freeMemory();
	long totalMemory = Runtime.getRuntime().totalMemory();
	String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, userLocale); 
	String totalMemoryStr = Util.formatFileSize(totalMemory, userLocale); 
	int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);
	  
%>

<html>
  <head>
    <jalios:if predicate='<%= status < 100 %>'>
      <meta http-equiv=refresh content="5; URL=<%= ServletUtil.getUrl(request) %>">
    </jalios:if>
    <jalios:if predicate='<%= (analyser != null) && (status >= 100) %>'>
    	<script>parent.location = parent.location;</script>
    </jalios:if>
    <jalios:chart printCSS='<%= true %>' colors='<%= new String[]{"#5D9FD1"} %>'/>
  </head>
  <body scroll="auto" bgcolor="#FFFFFF" text="#000000" style='margin: 0px;' >
    <table class='layout'>
      <tr>
        <td width='70%'><jalios:chart dataMap='<%= chart %>' display='hchart'/></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
      	<td style='font: normal 8pt arial,helvetica,sans-serif; color: #000000;'>
      	  <%= usedMemoryStr %> / <%= totalMemoryStr %> (<%= percentMemory %>%)
      	  <jalios:if predicate='<%= spentTime > 0 %>'>
      	  <br /><%= glp("ui.statreport.lbl.remain") %>: <jalios:duration time='<%= spentTime %>' />
      	  </jalios:if>
      	</td>
      </tr>
    </table>
  </body>
</html>
