<%@ include file='/jcore/doInitPage.jspf' %>
<%
String fieldDomId = (String)request.getAttribute("fieldDomId");
String step       = (String)request.getAttribute("step");
String newField   = (String)request.getAttribute("newField");
String oldField   = (String)request.getAttribute("oldField");

if ("action".equals(step)) { 
%>
      <p class="merge_fields">
        <%= glp("ui.work.ver.diff.merge_fields") %>
        - <a href='#' onclick="JCMS.Version.showFieldsMerged($('<%= fieldDomId %>')); return false;"><%= glp("ui.work.ver.diff.show_fields") %></a>
      </p>
      <p class="show_fields" style='display:none;'>      
        <a href='#' onclick="JCMS.Version.showFieldsCompared($('<%= fieldDomId %>')); return false;"><%= glp("ui.work.ver.diff.merge_fields") %></a>
        - <%= glp("ui.work.ver.diff.show_fields") %>
      </p>
<%
} else if ("show_fields".equals(step)) { 
%>
        <div class="show_fields" style='display:none;'>
          <table style="width: 100%;">
            <tr>
              <td style="width: 50%; vertical-align: top;"><%= newField %></td>
              <td style="width: 50%; vertical-align: top;"><%= oldField %></td>
            </tr>
          </table>
        </div>
<% } %>