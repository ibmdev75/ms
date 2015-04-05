<%@ include file='/jcore/doInitPage.jspf' %><%

  Publication obj = (Publication)request.getAttribute(PortalManager.PORTAL_PUBLICATION); 
  if (obj == null) {
    return;
  }
  
%>
<table class="fields commonFields">
  <% if (isAdmin) { %>
  <jalios:if predicate='<%= obj.getAuthor() != null %>'>
  <tr class="field author member">
    <td class='field-label'>
      <% /* %>Author<% */ %><%= glp("ui.com.lbl.author") %>
    </td>
    <td class='field-data'>
      <jalios:link data="<%= obj.getAuthor() %>" />
    </td>
  </tr>
  </jalios:if>
  <tr class="field version textfield text-field">
    <td class='field-label'>
      <%= glp("ui.com.lbl.version") %>
    </td>
    <td class='field-data'>
      <%= obj.getVersionString() %>
    </td>
  </tr>
  <tr class="field cdate date">
    <td class='field-label'>
      <%= glp("ui.com.lbl.cdate-long") %>
    </td>
    <td class='field-data'>
      <jalios:date date='<%= obj.getCdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getCdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
  <% if (obj.getUdate() != null && (obj.getUdate().getTime() - obj.getCdate().getTime()) > 1000) { %>
  <tr class="field udate date">
    <td class='field-label'>
      <%= glp("ui.com.lbl.udate-long") %>
    </td>
    <td class='field-data'>
      <jalios:date date='<%= obj.getUdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getUdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
  <% } %>
  <% if ((obj.getMdate().getTime() - obj.getCdate().getTime()) > 1000) { %>
  <tr class="field mdate date">
    <td class='field-label'>
      <%= glp("ui.com.lbl.mdate-long") %>
    </td>
    <td class='field-data'>
      <jalios:date date='<%= obj.getMdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getMdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
  <% } 
    } %> <%-- end of isAdmin --%>
</table>