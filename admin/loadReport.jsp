<%--
  @Summary: Display information about store load
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

 request.setAttribute("loadReportSubAdminMenu", "true"); 
 com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 

%><%@ include file='/admin/doAdminHeader.jspf' %>
<p><b><font face="Arial, Helvetica, sans-serif">Load info</font></b><br />
  Store file: <%= loadReport.getStoreFile() %><br />
  #op: <%= loadReport.getOpCount() %><br />
  #create: <%= loadReport.getCreateCount() %><br />
  #update: <%= loadReport.getUpdateCount() %><br />
  #delete: <%= loadReport.getDeleteCount() %><br />
  Progress table: <%= loadReport.getProgressTable() %><br />
  Load duration: <%= loadReport.getDuration() %> ms<br />
  Load errors: <%= loadReport.getErrorCount() %> errors</p>

<% if (loadReport.getErrorCount() > 0) { %>
<hr size="1" noshade="noshade"/>
<p>
<b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getClassErrorList().size() %> class error(s)</font></b><br />
A class error occurs when the corresponding class cannot be loaded or instanciated from the operation tag name.<br />
  <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getClassErrorList() %>">
<ul>
  <li><font color="#FF0000">Class Error at line <%= itLogEntry.getLineNumber() %> - Cannot instanciate class <b><%= itLogEntry.getName() %></b></font><br />
  <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
</ul>
</jalios:foreach>
<hr size="1" noshade="noshade"/>


<p>
<b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getCreateErrorList().size() %> create error(s)</font></b><br />
A create error occurs when the ID of this operation is already used.<br />
<jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getCreateErrorList() %>">
<ul>
  <li><font color="#FF0000">Create Error at </font><font color="#FF0000">line <%= itLogEntry.getLineNumber() %> - ID <b><a href="edit.jsp?id=<%= itLogEntry.getID() %>" style="text-decoration: none"><%= itLogEntry.getID() %></a></b> already used (<%= channel.getData(itLogEntry.getID()) != null ? channel.getData(itLogEntry.getID()).getClass().getName() : "null" %>).</font><br />
  <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
</ul>
</jalios:foreach>
<hr size="1" noshade="noshade"/>

<p>
<b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getMutationErrorList().size() %> mutation error(s)</font></b><br />
A mutation error occurs on update or delete operations if there is no data bound on the ID.<br />
  <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getMutationErrorList() %>">
<ul>
  <li><font color="#FF0000">Mutation Error at </font><font color="#FF0000">line <%= itLogEntry.getLineNumber() %></font><font color="#FF0000"> - No object bound on ID <%= itLogEntry.getID() %>.</font><br />
  <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
</ul>
</jalios:foreach>
<hr size="1" noshade="noshade"/>

<p>
<b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getStampErrorList().size() %> stamp error(s)</font></b><br />
A stamp error occurs if the current stamp is lower that the previous one.<br />
  <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getStampErrorList() %>">
<ul>
  <li><font color="#FF0000">Stamp Error at line <%= itLogEntry.getLineNumber() %> - Decreasing </font><font color="#FF0000"> stamp <%= itLogEntry.getStamp() %> for operation on ID <b><a href="edit.jsp?id=<%= itLogEntry.getID() %>" style="text-decoration: none"><%= itLogEntry.getID() %></a></b> (<%= channel.getData(itLogEntry.getID()) != null ? channel.getData(itLogEntry.getID()).getClass().getName() : "null" %>)</font><br />
  <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
</ul>
</jalios:foreach>
<hr size="1" noshade="noshade"/>

<p>
<b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getJavaErrorList().size() %> Java error(s)</font></b><br />
A Java error occurs if an exception is raised when a log entry is processed.<br />
  <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getJavaErrorList() %>">
<ul>
  <li><font color="#FF0000">Java Error at line <%= itLogEntry.getLineNumber() %> - <%= itLogEntry.getException().getClass().getName() %>: <%= itLogEntry.getException().getMessage() %></font><br />
  <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate><br />
  Exception:
  <% 
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw, true);
    itLogEntry.getException().printStackTrace(pw); 
  %>  
  <pre><%= sw %></pre>
</ul>
</jalios:foreach>
<% } %>
<hr size="1" noshade="noshade"/>
<br />
<%@ include file='/admin/doAdminFooter.jspf' %> 
