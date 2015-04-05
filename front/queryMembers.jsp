<%@ include file="/jcore/doInitPage.jspf" %><%

if (!isLogged) {
  return;
}

if (!getBooleanParameter("searchInMembers", false)) {
  return;
}

if (!hasParameter("text")) {
  return;
}

if (jcmsContext.isAjaxRequest()) {
  AjaxRequestWrapper wrapper = (AjaxRequestWrapper)request;
  String servletPath = wrapper.getOriginalServletPath();
  if (!"/front/queryMembers.jsp".equals(servletPath)) {
    return;
  }
}

jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="front/queryMembers.jsp">
  <jsp:useBean id="amqh" scope="page" class="com.jalios.jcms.handler.AllMemberQueryHandler"><%
    %><jsp:setProperty name="amqh" property="request" value="<%= request %>"/><%
    %><jsp:setProperty name="amqh" property="*" /><%
    %><jsp:setProperty name="amqh" property="sort" value='name'/><%
  %></jsp:useBean><%
  
List<String> mids = amqh.getIdResultList();
request.setAttribute("query.memberIdList", mids);

if (Util.notEmpty(mids)) { %>
<div class="search-members responsive">
  <jalios:message msg='<%= glp("ui.work.query.txt.mbr-result", Util.getSize(mids)) %>' title="" dismissable="" />
  
  <jalios:pager name="queryMembersPagerHandler" action="init" declare="true" size="<%= Util.getSize(mids) %>" pageSize="4"/>
  
  <div class="row">
    <jalios:foreach collection="<%= mids %>" 
                    name="itMid" type="String"
                    skip='<%= queryMembersPagerHandler.getStart() %>' 
                    max="<%= queryMembersPagerHandler.getPageSize() %>" 
                    counter="itCounter">
      <% Member itMember = channel.getMember(itMid); %>  
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
      <%@ include file="/front/card/doMemberVerticalCard.jspf" %>        
      </div>      
  </jalios:foreach>
  </div><%-- EOF .row --%>
  
  <jalios:pager name='queryMembersPagerHandler' template="pqf"/>

</div>
<% } %>
</div><%-- EOF .ajax-refresh-div --%>