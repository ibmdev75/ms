<%--
  @Summary: Display publication schedule
  @Category: Work Area / Workflow
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.1
--%><%

%><%@ include file='/jcore/doInitPage.jspf' %><%!

  /********************************************************** *\
	|* METHODS ************************************************ *|
	\********************************************************** */
	
	private static final int PDATE_CAL = 1;
	private static final int EDATE_CAL = 2;
	private static final int ADATE_CAL = 3;
	
	private Date getPubDateFromCalType(Publication pub, int calendarType) {
	  switch (calendarType) {
	  	case PDATE_CAL:
	  	default:
	  		return pub.getPdate(); 
	  	case EDATE_CAL:
	  		return pub.getEdate(); 
	  	case ADATE_CAL:
	  		return pub.getAdate(); 
	  }
	}

%><%

	/********************************************************** *\
	|* VARS *************************************************** *|
	\********************************************************** */
	
	int								calendarType = PDATE_CAL;
	
	// layout 	
	String						waMenu		= null;
	String 						title			= null;
	String 						color			= null;
	String						ready			= null;
	String						notReady	= null;
	
	// calendar
	DateFormatSymbols dfs       = new DateFormatSymbols(userLocale);
	String[]          days      = dfs.getShortWeekdays();
	Calendar          current   = Calendar.getInstance(userLocale);
  Calendar          calendar  = null;
  int               thisMonth = current.get(Calendar.MONTH);

	Comparator   			comparator= null;
	DataSelector 			selector	= null;

	/********************************************************** *\
	|* GET PARAMETERS ***************************************** *|
	\********************************************************** */
	
  String type	= getAlphaNumParameter("type", "pdate");
	Date   date = new Date(getLongParameter("date", System.currentTimeMillis()));
  
  if (type.equals("pdate")) {
  	calendarType = PDATE_CAL;		// Publication Calendar
    request.setAttribute("whSuffix", "p");
  } else if (type.equals("edate")) {
  	calendarType = EDATE_CAL;
    request.setAttribute("whSuffix", "e");
  } else if (type.equals("adate")) {
  	calendarType = ADATE_CAL;
    request.setAttribute("whSuffix", "a");
  }
  
	/********************************************************** *\
	|* COMPUTE UI ********************************************* *|
	\********************************************************** */
 	
	switch (calendarType) {
	
		// Publication Calendar
		case PDATE_CAL:
		default:
	  	title = glp("ui.work.pub-cal.title");
	  	waMenu= "pubCalendarWAMenu";
	  	color = "#339933";
	  	ready = glp("ui.work.pub-cal.ready");
	  	notReady = glp("ui.work.pub-cal.not-ready");
			break;
			
		// Expiry Calendar
		case EDATE_CAL:
	  	title = glp("ui.work.exp-cal.title");
	  	waMenu= "expCalendarWAMenu";
	  	color = "#CC0000";
	  	ready = glp("ui.work.exp-cal.ready");
	  	notReady = glp("ui.work.exp-cal.not-ready");
			break;

		// Archiving Calendar
		case ADATE_CAL:
	  	title = glp("ui.work.arch-cal.title");
	  	waMenu= "archCalendarWAMenu";
	  	color = "#CCCCCC";
	  	ready = glp("ui.work.arch-cal.ready");
	  	notReady = glp("ui.work.arch-cal.not-ready");
			break;
	}
	
	// Attributes for doWorkHeader.jsp
	request.setAttribute("title", title);
	request.setAttribute(waMenu, "true");

%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

  /********************************************************** *\
	|* COMPUTE CALENDAR *************************************** *|
	\********************************************************** */
 	
	current.setTime(date);
	
  calendar = (Calendar) current.clone();
  calendar.set(Calendar.DAY_OF_MONTH , 1);
  // to force update of the calendar object as precised in javadoc
  calendar.getTime();
  calendar.set(Calendar.HOUR_OF_DAY, 0);
  // to force update of the calendar object as precised in javadoc
  calendar.getTime();
  calendar.set(Calendar.MINUTE, 0);
  // to force update of the calendar object as precised in javadoc
  calendar.getTime();
  calendar.set(Calendar.SECOND, 0);
  Date beginDate = calendar.getTime() ;

  calendar.set(Calendar.DAY_OF_MONTH , calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
  // to force update of the calendar object as precised in javadoc
  calendar.getTime();
  calendar.set(Calendar.HOUR_OF_DAY, 23);
  // to force update of the calendar object as precised in javadoc
  calendar.getTime();
  calendar.set(Calendar.MINUTE, 59);
  // to force update of the calendar object as precised in javadoc
  calendar.getTime();
  calendar.set(Calendar.SECOND, 59);
  Date endDate = calendar.getTime();
  
	calendar = (Calendar) current.clone();

	switch (calendarType) {
	
		// Publication Calendar
		case PDATE_CAL:
		default:
	    comparator = Publication.getPdateComparator();
	    selector = (DataSelector)Publication.getPdateSelector(beginDate, endDate);
	    selector = new AndDataSelector(selector, Publication.getPstatusSelector(WorkflowManager.SCHEDULED_PSTATUS, -1));
			break;
			
		// Expiry Calendar
		case EDATE_CAL:
	    comparator = Publication.getEdateComparator();
	    selector = (DataSelector)Publication.getEdateSelector(beginDate, endDate);
	    selector = new AndDataSelector(selector, Publication.getPstatusSelector(WorkflowManager.PUBLISHED_PSTATUS, -1));
			break;

		// Archiving Calendar
		case ADATE_CAL:
	    comparator = Publication.getAdateComparator();
	    selector = (DataSelector)Publication.getAdateSelector(beginDate, endDate);
			break;
	}

  if (wkspcFilter) {             
    selector = new AndDataSelector(selector, Publication.getWorkspaceSelector(workspace));
  }
%>
<div class="page-header">
	<h1><jalios:icon src="work-list"/> <%= title %></h1>
</div>

<jalios:query name="pubSet" dataset="<%= channel.getPublicationSet(Publication.class, loggedMember, false, null, true) %>" selector="<%= selector %>" comparator="<%= new ReverseComparator(comparator) %>" />

  <table class="table table-bordered grid br">
    <%-- *** TABLE HEADER ********************* --%>
    <tr bgcolor='<%= color %>'> 
      <td class="text-center" colspan="7">  
        <table class='layout'>
          <tr>
	        <td class="vMiddle text-left">
			<% calendar.add(Calendar.MONTH , -1); %>
			<a href="work/pubCalendar.jsp?type=<%= encodeForURL(type) %>&amp;date=<%= calendar.getTime().getTime() %>"><jalios:icon src="bullet-circle-left"/></a> 
            <% calendar = (Calendar) current.clone(); %>
			</td>
            <td class="text-center"> <b><font face="Arial, Helvetica, sans-serif" size="3" color="#FFFFFF"> 
              <%/*%>Janvier<%*/%>
              <%= dfs.getMonths()[current.get(Calendar.MONTH)] +" "+ current.get(Calendar.YEAR)%></font></b> 
            </td>
            <td class="vMiddle text-right"> 
			<% calendar.add(Calendar.MONTH , +1); %>
			<a href="work/pubCalendar.jsp?type=<%= encodeForURL(type) %>&amp;date=<%= calendar.getTime().getTime() %>"><jalios:icon src="bullet-circle-right"/></a> 
			<% calendar.add(Calendar.MONTH , -1); %>
            </td>
          </tr></table>
	</td>
  </tr>
<%
	// Remonter le calendrier jusqu'au debut du mois
	calendar.set(Calendar.DAY_OF_MONTH , 1);
	// to force update of the calendar object as precised in javadoc
	calendar.getTime();
	while (calendar.get(Calendar.DAY_OF_WEEK) != calendar.getFirstDayOfWeek()){
		calendar.add(Calendar.DAY_OF_MONTH , -1);
	}
%> 
        <%-- *** DAYS HEADER ********************* --%>
	<tr bgcolor="#FFFFFF">
        <% for (int i = 0 ; i < 7 ; i++){ %>
        <td class="text-center" bgcolor="#FFFFCC" width="14%"><font face="Arial, Helvetica, sans-serif" size="2"><b><%/*%>Lun.<%*/%><%= days[(i+calendar.getFirstDayOfWeek()-1)%7 +1] %></font></b></td> 
        <% } %>
	</tr>

        <%-- *** DAYS CELLS ********************* --%>
<%
        Iterator it        = pubSet.iterator(); 
        Publication itPub = null;
        Calendar itPubCal = null;
        if (it.hasNext()) { 
          itPub = (Publication)it.next(); 
          itPubCal = Calendar.getInstance(userLocale); 
          itPubCal.setTime(getPubDateFromCalType(itPub, calendarType)); 
        }
%>
	<% for (int j = 0 ; j < 6 ; j++) { %>
        <%   if (calendar.get(Calendar.YEAR) == current.get(Calendar.YEAR) && calendar.get(Calendar.MONTH) >  current.get(Calendar.MONTH)) { break; }%>

	<tr bgcolor="#EEEEEE">
          <jalios:foreach array="<%= days %>" type="String" name="itDay" skip="1">
<%
	boolean isToday = ((calendar.get(Calendar.MONTH) == thisMonth) && (calendar.get(Calendar.DAY_OF_MONTH) == current.get(Calendar.DAY_OF_MONTH)));
	boolean isWeekend = ((calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY || calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY));
	boolean isOtherMonth = ((calendar.get(Calendar.MONTH) != current.get(Calendar.MONTH)));
	String bgcolor =  (isToday ? "#CCCCCC" : (isWeekend ? "#EEEEEE" : "#FFFFFF"));
%>
          <% if (isOtherMonth) { %>
          <td  bgcolor='<%= bgcolor %>'>
            &nbsp;
          </td>
          <% } else { %>
          <td class="vTop" bgcolor='<%= bgcolor %>'>
            <table class='layout'>
              <tr>
                <td class="vTop">
                  <font face="Arial, Helvetica, sans-serif" size="2">
                  <b><%/*%>10<%*/%><%= calendar.get(Calendar.DAY_OF_MONTH) %></b>
                  </font>
                </td>
                <td class="vTop">
                  <font face="Arial, Helvetica, sans-serif" size="2">
                  <% while(itPubCal != null && itPubCal.get(Calendar.DAY_OF_MONTH) == calendar.get(Calendar.DAY_OF_MONTH)) { %>
                  <%
		                 boolean isPstatusCorrect;
                     switch (calendarType) {
						          	case PDATE_CAL:
						          	default:
						          		isPstatusCorrect = itPub.getPstatus() == WorkflowManager.SCHEDULED_PSTATUS;
						          		break;
						          	case EDATE_CAL:
						          		isPstatusCorrect = itPub.getPstatus() == WorkflowManager.PUBLISHED_PSTATUS;
						          		break;
						          	case ADATE_CAL:
						          		isPstatusCorrect = itPub.getPstatus() >= WorkflowManager.PUBLISHED_PSTATUS;
						          		break;
						          }
						          String iconSrc = isPstatusCorrect ? "images/jalios/icons/bulletCheck.gif":"images/jalios/icons/bulletWarn.gif";
									%>
									<jalios:buffer name="calCheckDate"><jalios:time date="<%= getPubDateFromCalType(itPub, calendarType) %>"/></jalios:buffer><%-- Kludge --%>
                  <jalios:icon src='<%= iconSrc %>'  title='<%= calCheckDate + " - " + itPub.getWFStateLabel(userLang) %>' />
                  &nbsp;<a href="work/displayWork.jsp?id=<%= itPub.getId() %>" title="<%= encodeForHTMLAttribute(itPub.getTitle(userLang), true) %>"><jalios:truncate length="17" suffix="..."><%= itPub.getTitle(userLang) %></jalios:truncate></a>
                  &nbsp;<jalios:edit pub="<%= itPub%>"/><br />
                  <%   if (it.hasNext()) { 
                         itPub = (Publication)it.next();
								         itPubCal.setTime(getPubDateFromCalType(itPub, calendarType)); 
                       } else { 
                         break;
                       }
                  %>
                  <% } %>
                  </font>
                </td>
              </tr>
            </table>
          </td>
          <% } %>

		<% calendar.add(Calendar.DAY_OF_MONTH  , 1); %>
		</jalios:foreach>
	</tr>
	<% } %>
</table>

<ul class="item-list">
  <li><jalios:icon src="bullet-check"  /> <%= ready %></li>
  <li><jalios:icon src="bullet-warn"  /> <%= notReady %></li>
</ul>

<%@ include file='/work/doWorkFooter.jspf' %> 
