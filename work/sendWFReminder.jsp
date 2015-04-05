<%--
  @Summary: page used to manually send a WF Reminder
  @Category: Work
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%>
<%@ include file='/jcore/doInitPage.jspf' %>

<%!
  public void sendReminder(Publication pub) {
    if (pub == null) {
      return;
    }
    WFState state = pub.getWFState();
    if (state == null || !state.hasReminder()) {
      return;
    }
    state.performActionIn(pub, true);
  }
%>
<% 
	if (!isWSAdmin){
		sendForbidden(request, response);
    return;
	}
	
	Publication pub = getPublicationParameter("id"); 
	sendReminder(pub);
  sendRedirect(Util.getString(getValidHttpUrl("redirect"), "work/workReport.jsp"), request, response);
%>