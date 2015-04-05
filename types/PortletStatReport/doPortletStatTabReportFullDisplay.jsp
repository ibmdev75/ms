<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% 
  generated.PortletStatReport box = (generated.PortletStatReport) portlet;  
  workspace = Workspace.getSessionWorkspace(request.getSession());
  Workspace.setRequestWorkspace(request, workspace);
%>
<% boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView")); %>
<div style='margin-left: 10px; margin-top: 10px;'>
        <% if (!printView) { %>
	<%@ include file='../AbstractPortletStatReport/doActions.jspf' %>
        <% } %>
	
	<jalios:chart printCSS='<%= true %>' colors='<%= new String[]{"#EE7777","#CC5555","#91CFAE","#91B4CF","#B491CF","#CFC491","#A7CF91","#EBEA9A","#E2D57B","#7BE27D","#977BE2","#E27BD8"} %>'/>
	<style>
	 .report H1               { font: bold   11pt arial,helvetica,sans-serif; color: #000000; background-color: #DDDDDD; margin-bottom: 4px; padding: 4px; }
	 .report H2               { font: bold   10pt arial,helvetica,sans-serif; color: #000000;}
	 .report .label           { font: bold   09pt arial,helvetica,sans-serif; color: #000000;}
	 .report .text            { font: normal 09pt arial,helvetica,sans-serif; color: #000000;}
	 .report .stat            { padding: 3px; }
	 .report .border          { background-color: #999999; }
	 .report .border .even TD { background-color: #EEEEEE; }
	 .report .border .odd  TD { background-color: #DDDDDD; }
	 .report .border .head TD { background-color: #666666; color: white; }
	 .report TABLE.stat     { width: 98%; }
	 .report TD.stat        { border: 1px #666666 solid; background-color: #FFFFFF;}
	 .report TD.header        { font: bold 11pt arial,helvetica,sans-serif; color: #FFFFFF; background-color: #666666; }
	 .report TD.label         { text-align: left;  }
	 .report TD.text          { text-align: right; }
	</style>
	<%
	  int cols = 2;
		Map portletMap = new TreeMap();
		if (Util.notEmpty(box.getChildren())){
			for (int i = 0 ; i < box.getChildren().length ; i++){
				PortalElement elm = (PortalElement) box.getChildren()[i];
				if ((elm == null) || !(elm instanceof PortletStatMetrics))
					continue;
				PortletStatMetrics stat = (PortletStatMetrics) elm;
				Set set = (Set) portletMap.get(glp(stat.getTabGroup()));
				if (set == null){
					set = new TreeSet(Publication.getTitleComparator());
					portletMap.put(glp(stat.getTabGroup()), set);
				}
				set.add(stat);
			}
		}
	%>
	<div class='report'>
	
	<div class="<%= printView ? "" : "tab-pane" %>" id="report-tab-pane">
	  <jalios:foreach collection='<%= portletMap.entrySet() %>' type='Map.Entry' name='itEntry' counter='cpt1'>
		<div class="<%= printView ? "" : "tab-page" %>">
		<h2 class="<%= printView ? "" : "tab" %>" <%= printView ? "style='display: none;'" : "" %>><%= itEntry.getKey() %></h2>
		<table class='stat'  >	
			<tr>
			  <td colspan='<%= cols %>' class='header'>&nbsp;<%= itEntry.getKey() %></td>
			</tr>
			
<%-- +++++ GENERATE BUFFER +++++ --%>
<% TreeSet children   = (TreeSet)itEntry.getValue();  %>
<% ArrayList bufferList = new ArrayList(); bufferList.ensureCapacity(children.size()) ; %>
<jalios:foreach collection="<%= children %>" name="itChild" type="PortalElement" counter='itChildCounter'>
	<jalios:if predicate='<%= itChild != null %>'>
		<% request.setAttribute("ShowChildPortalElement",Boolean.TRUE); %>
		<jalios:buffer name='collectionBuffer'>
		  <% request.setAttribute("displayPortlet",itChild); %>
		  <jsp:include page='/jcore/portal/doDynIncludePortlet.jsp' flush='true'/>
		</jalios:buffer>
		<% bufferList.add(((Boolean)request.getAttribute("ShowChildPortalElement")).booleanValue() ? collectionBuffer : "");	%>
	</jalios:if>
	<jalios:if predicate='<%= itChild == null %>'><% bufferList.add("&nbsp;"); %></jalios:if>
</jalios:foreach>			
			
			
			<% int counter = 0; %>
			<jalios:foreach collection='<%= bufferList %>' type='java.lang.String' name='itStat' counter='itCounter'>
			<jalios:if predicate='<%= Util.notEmpty(itStat) %>'>
				<% counter++; %>
				<jalios:if predicate='<%= printView || ((counter-1) % cols  == 0) %>'><tr></jalios:if>
			    <td width='<%= 100/cols %>%' valign='top' class='stat'><%= itStat.trim() %></td>
			  <jalios:if predicate='<%= printView || ((counter-1) % cols  == cols-1) %>'></tr></jalios:if>
		  </jalios:if>
			</jalios:foreach>
			<% 
			  for (int i = counter ; i < cols ; i++){ out.println("<td>&nbsp;</td>"); } 
			  if (counter < cols) { out.println("</tr>"); }
			%>
			<tr>
			  <td colspan='<%= cols %>'>&nbsp;</td>
			</tr>
		</table>
		</div>
    </jalios:foreach>
	</div>
	</div>
</div>
