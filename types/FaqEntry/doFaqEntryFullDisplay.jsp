<%@ include file='/jcore/doInitPage.jspf' %>
<%
  FaqEntry obj = (FaqEntry)request.getAttribute("publication");
  Faq faq = obj.getFaq();
  boolean showVersion = hasParameter("vid");
  if (faq != null && faq.isInVisibleState() && !showVersion) {
    sendRedirect(ServletUtil.getAbsUrlWithUpdatedParam(request, "id", faq.getId()) + "&#" + obj.getId(), request, response);
    return;
  }
%>
<div class="fullDisplay FaqEntry">
<p class='title'>

<% /* %>Title<% */ %><%= obj.getTitle(userLang) %>

</p>
<table class="fieldList">
  <tr class="field answer textareaEditor abstract <%= Util.isEmpty(obj.getAnswer(userLang)) ? "empty" : "" %>">
    <td class='label'>Answer</td>
    <td class='data'>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAnswer(userLang)) %>'>
            
            <jalios:wiki data="<%= obj %>" field="answer"><% /* %>Answer<% */ %><%= obj.getAnswer(userLang) %></jalios:wiki>
            
            </jalios:if>
    </td>
  </tr>
  <tr class="field faq linkEditor  <%= Util.isEmpty(obj.getFaq()) ? "empty" : "" %>">
    <td class='label'>Faq</td>
    <td class='data'>
       <jalios:if predicate='<%= obj.getFaq() != null && obj.getFaq().canBeReadBy(loggedMember) %>'>
         <jalios:link data='<%= obj.getFaq() %>'/>
       </jalios:if>
    </td>
  </tr>
  <tr class="field order intEditor  ">
    <td class='label'>Order</td>
    <td class='data'>
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getOrder()) %>
    </td>
  </tr>
 
</table>
<table class="fieldList commonFields">
 <jalios:if predicate='<%= isAdmin %>'>
  <jalios:if predicate='<%= obj.getAuthor() != null %>'>
  <tr class="field author member">
    <td class='label'>
      <% /* %>Author<% */ %><%= glp("ui.com.lbl.author") %>
    </td>
    <td class='data'>
      <a href="<%= ResourceHelper.getQuery() %>?mids=<%=  obj.getAuthor().getId() %>"><% /* %>John Smith<% */ %><%= obj.getAuthor() %></a>
    </td>
  </tr>
  </jalios:if>
  <tr class="field cdate date">
    <td class='label'>
      <% /* %>CDate<% */ %><%= glp("ui.com.lbl.cdate") %>
    </td>
    <td class='data'>
      <jalios:date date='<%= obj.getCdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getCdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
  <tr class="field mdate date">
    <td class='label'>
      <% /* %>MDate<% */ %><%= glp("ui.com.lbl.mdate") %>
    </td>
    <td class='data'>
      <jalios:date date='<%= obj.getMdate() %>' format='<%= "short" %>'/> <jalios:time date='<%= obj.getMdate() %>' format='<%= "short" %>'/>
    </td>
  </tr>
 </jalios:if>
</table>
</div>