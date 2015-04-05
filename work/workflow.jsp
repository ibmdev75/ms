<%
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/xml; charset=UTF-8"); 
%><?xml version="1.0" encoding="UTF-8"?>
<%@ include file='/jcore/doInitPage.jspf' %>
<%!
	public String getStateColor(Workflow wf , WFState state) {
		switch (state.getPstatus()) {
			case -10:	return "0xFFCC00"; 		// Scheduled
			case 0:		return "0x5CB800"; 		// Published
			case 10:	return "0x999999"; 		// Expired
			case 20:	return "0x555555"; 		// Archived
			default:	return state.isVisible() ? "0x5bc0de" : "0xFF8533";
		}
	}
%>
<%
	String wfid = getAlphaNumParameter("id", null);
	if (Util.isEmpty(wfid)) {
		return;
	}
	
	Workflow wf = WorkflowManager.getInstance().getCopyWorkflow(wfid);
	
	Set stateSet = wf.getStateSet();
	List stateList = new ArrayList();
%>
<workflow>
	<states>
	<jalios:foreach collection='<%= wf.getStateSet() %>' type='WFState' name='itState' counter='itStateCounter'>
		<% stateList.add(itState); %>
		<state label="<%= Util.unaccentuate(itState.getLabel(userLang)) %>"  pstatus='<%= itState.getPstatus() %>' stateColor='<%= getStateColor(wf,itState) %>' sendUser='<%= itState.isActionOut(WFAction.TYPE_ALERT_AUTHOR) %>' sendWorker='<%= itState.isActionOut(WFAction.TYPE_ALERT_WORKERS) %>' recUser='<%= itState.isActionIn(WFAction.TYPE_ALERT_AUTHOR) %>' recWorker='<%= itState.isActionIn(WFAction.TYPE_ALERT_WORKERS) %>' initState='<%= wf.getInitState() == itState %>' />
	</jalios:foreach>
	</states>
	
	<transitions>
		<jalios:foreach collection='<%= wf.getStateSet() %>' type='WFState' name='itState' counter='itStateCounter'>
    	<%
      boolean isExpress = itState.isExpress();
      int targetPstatus = itState.getTargetPstatus();
      boolean hasBeenDraw = false;
      %>
      <jalios:foreach collection='<%= itState.getTransitionSet() %>' type='WFTransition' name='itTransition' counter='itTransCounter'>
			<%
				int pos1  = stateList.indexOf(itTransition.getSource());
				int pos2  = stateList.indexOf(itTransition.getTarget());
        
        if (pos1 != pos2) {
          
  				StringBuffer sb = new StringBuffer();
  				for(Iterator it = itTransition.getRoleSet().iterator(); it.hasNext();) {
  				  WFRole role = (WFRole)it.next();
  				  sb.append(role.getName(userLang));
  				  sb.append("|");
  				}
  				String roles = Util.unaccentuate(sb.toString());
          if (isExpress )  {
            if (itTransition.getTarget().getPstatus() == targetPstatus)  {
              hasBeenDraw = true;
			%>
		        <transition wfSource='<%= itTransition.getSource().getPstatus() %>' wfTarget='<%= itTransition.getTarget().getPstatus() %>' wfLevel='<%= pos2 - pos1 %>' wfGroups="<%= roles + "|Express "+itState.getDuration() +" min" %>"/>
      <%
            }
            else  {
            %>
            <transition wfSource='<%= itTransition.getSource().getPstatus() %>' wfTarget='<%= itTransition.getTarget().getPstatus() %>' wfLevel='<%= pos2 - pos1 %>' wfGroups="<%= roles %>"/>
            <%
            }
          }
          else {
      %>
        <transition wfSource='<%= itTransition.getSource().getPstatus() %>' wfTarget='<%= itTransition.getTarget().getPstatus() %>' wfLevel='<%= pos2 - pos1 %>' wfGroups="<%= roles %>"/>
      <%
           }
        }
      %>
      </jalios:foreach>
     
     <%
      if (!hasBeenDraw && isExpress) {
        int i1 = stateList.indexOf(itState);
        int i2 = stateList.indexOf(wf.getState(itState.getTargetPstatus()));
        %>
        
          <transition wfSource='<%= itState.getPstatus() %>' wfTarget='<%= targetPstatus %>' wfLevel='<%=i2- i1 %>' wfGroups="Express <%= itState.getDuration() %> min"/>
        <%
      }
      %>
		
    </jalios:foreach>
	</transitions>
</workflow>
