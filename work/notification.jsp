<%--
  
  @Summary: This JSP is used by work/notificationText.jsp and work/notificationHtml.jsp
            to compute needed variable required to generate notification output.
  @Category: Notification
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  
--%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!isLogged) {
    return;
  }

  // Compute the collection variable added in the session attribute 
  // for doNotificationText.jsp
  {
  	int[]   periods = NotificationManager.getAvailablePeriods();
	  TreeSet  pubSet = new TreeSet(Data.getMdateComparator());

		Set mbrSet = new HashSet();
		mbrSet.add(loggedMember);
		// For each available periods
		for (int i = 0; i < periods.length; i++) {
		  // retrieve publications set
		  NotificationQuery nq = new NotificationQuery(periods[i]);
		  Set<Publication> mbrNotifiedPubSet = nq.getMemberPublicationSet(loggedMember);
		  // and add publications to the TreeSet
		  if (Util.notEmpty(mbrNotifiedPubSet)) {
		    pubSet.addAll(mbrNotifiedPubSet);
		  }
		}
    request.getSession().setAttribute(NotificationManager.CHANGES, pubSet);
  }
  
%>