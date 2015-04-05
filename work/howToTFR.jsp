<%--
  @Summary: Dispatch on the page which explains Wiki formatting rules, in the right language
  @Category: Documentation
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  request.setAttribute("title","Text Formatting Rules"); 
  request.setAttribute("zone","InternalUI");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<form class="br">
<table class='table vMiddle'>
  <tr>
    <td class="text-left">
      <h3><%= glp("ui.work.wiki.howToTFR") %> <a href="#"  title='<%= glp("ui.work.wiki.print") %>' onclick="window.print();"><jalios:icon src="printer" alt='<%= glp("ui.work.wiki.print") %>'/></a></h3>
    </td>
    <td class="text-right"> 
      <input type="button" class="btn btn-default" value="<%= glp("ui.com.btn.close") %>" onclick="window.close()" name="button2" />
    </td>
  </tr>
</table>
<% if (userLang.equals("fr")) { %>
<jsp:include page='/work/howToTFR_fr.jsp' />
<% } else { %>
<jsp:include page='/work/howToTFR_en.jsp' />
<% } %>
<center>
  <p><input type="button" class="btn btn-default br" value="<%= glp("ui.com.btn.close") %>" onclick="window.close()" name="button" /></p>
</center>
</form>
<%@ include file='/jcore/doEmptyFooter.jspf' %>