<%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="java.util.*"%><%
%><%@page import="com.jalios.util.*"%><%
%><%@page import="com.jalios.jcms.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
AnalyticsManager instance = AnalyticsManager.getInstance();
List<AnalyzeListener> listenerList = instance.getCurrentAnalyzeListener();
String listenerId = getAlphaNumParameter("listenerId" , null);
AnalyzeListener currentListener = (AnalyzeListener) request.getAttribute("listenerObject");	
if(Util.notEmpty(listenerList) && currentListener == null && Util.notEmpty(listenerId)){
  for(AnalyzeListener listener : listenerList){
	  if(listenerId.equals(listener.getId())){
	    currentListener = listener;
	    break;
	  }
	}
}
if(currentListener != null){
	listenerId = currentListener.getId();
}
%><div class="ajax-refresh-div ajax-lazy analytics-current-analyze" data-jalios-ajax-refresh-url="admin/analytics/displayCurrentAnalyze.jsp?listenerId=<%=encodeForURL(listenerId)%>"<%
if(currentListener != null && currentListener.isRunning()){
      %> data-jalios-ajax-refresh-periodical="5" <%
}
else{
    %> data-jalios-ajax-refresh-periodical="0" <%
}
%>><%
if(currentListener != null){
    if(currentListener.isRunning()){
      	%><div class="br" style="min-width:100px;"><%=generateProgressBar(currentListener.getPercent())%></div><%
      	%><div><%=currentListener.getContentState()%> / <%=currentListener.getMaxSize()%>  ( <%=currentListener.getPercent()%>%)</div><%
    }
    else{
      Date analyzeEndDate = currentListener.getEndDate();
      %><%=glp("ui.analytics.analyze-list.done", channel.getDateTimeFormat(channel.getCurrentUserLang()).format(analyzeEndDate))%><%
	}
}
else{  
   %><%=glp("ui.analytics.analyze-list.no-data")%><%
}
%></div><%
%><%!String generateProgressBar(int percentValue) {
    StringBuffer buffer = new StringBuffer("<div class=\"gauge\">");
    buffer.append("<div class=\"comfort\" style=\"width: 100%;\"></div>");
    buffer.append("<div class=\"warning\" style=\"width: 0%;\"></div>");
    buffer.append("<div class=\"danger\" style=\"width: 0%;\"></div>");
    buffer.append("<div class=\"progress \" style=\"width: ").append(percentValue).append("%;\">");
    buffer.append("</div>");
    return buffer.toString();

  }%>