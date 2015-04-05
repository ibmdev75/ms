<%--
  @Summary: Template used to display images
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

 %><a href="<%= mediaPath %>" class="modal"><jalios:thumbnail css="img-thumbnail" path='<%= mediaPath %>' format='jpeg'
                     width='<%= maxWidth %>' height='<%= maxHeight %>' alt='<%= mediaDescription %>'><%
   %><img class="img-thumbnail" src="<%= mediaPath %>" alt="<%= encodeForHTMLAttribute(mediaDescription) %>" style="max-width: <%= maxWidth %>;" /><%
 %></jalios:thumbnail></a><%

%>