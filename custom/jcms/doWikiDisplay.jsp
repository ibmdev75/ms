<%@ include file='/jcore/doInitPage.jspf' %><%

  Publication obj = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  if (obj == null){
    obj = (Publication) request.getAttribute("PortalElement");
  }
  
  String field = getAlphaNumParameter("field","abstract");
  Object value = obj.getFieldValue(field, userLang, true);
  if (Util.isEmpty(value)){
    return;
  }
%>
<div class="wikiDisplay">
  <jalios:include target="WIKIDISPLAY_HEADER" />
  <div class="abstract" <%= JcmsUtil.getFieldLangAttributes(obj, field, userLang) %>>
    <jalios:if predicate="<%= Util.notEmpty(value) %>">
      <% /* %>Lorem ipsum dolor sit amet.<% */ %>
      
      <%
      TypeFieldEntry tfe = channel.getTypeAbstractFieldEntry(obj.getClass());
      if (tfe != null && tfe.isWysiwyg()){ %>
        <jalios:wysiwyg><%= value %></jalios:wysiwyg>
      <% } else {  %>
        <jalios:wiki data="<%= obj %>" field="<%= field %>"><%= value %></jalios:wiki>
      <% } %>
      
    </jalios:if>
  </div>
  <jalios:include target="WIKIDISPLAY_FOOTER" />
</div>
