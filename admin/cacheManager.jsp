<%--
  @Summary: Cache manager
  @Category: Admin / Cache
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/operation/cache-mgr")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.CacheManagerHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

request.setAttribute("title", glp("ui.adm.mn.op.cache-mgr")); 
request.setAttribute("cacheSubAdminMenu", "true"); 
if (formHandler.validate()) {
  return;
}
CacheManager cacheManager = channel.getCacheManager();

if (!channel.getBooleanProperty("cache-mgr.enabled", true)) {
   setWarningMsg(glp("msg.cache-mgr.disabled"), request);
}


%>
<%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><% /* %>Cache Manager<% */ %><%= glp("ui.adm.mn.op.cache-mgr") %> (<%= cacheManager.getSize() %>)</h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>

<%-- Actions --%>
<p>
<button class="btn btn-primary" type="button" onclick="JcmsJsContext.redirect('admin/cacheManager.jsp?opClearAll=true');" ><%= glp("ui.adm.cache.clr-all") %></button>
<button class="btn btn-default" type="button" onclick="JcmsJsContext.redirect('admin/cacheManager.jsp?opClearSession=true');" ><%= glp("ui.adm.cache.clr-sess") %></button>
</p>

<%-- CONFIGURATION COUNT / SIZE TABLE --%>
<%
ObjectIntTreeMap configurationMemSizeMap = new ObjectIntTreeMap();
ObjectIntTreeMap configurationMemCountMap = new ObjectIntTreeMap();
ObjectIntTreeMap configurationMemMaxMap = new ObjectIntTreeMap();

ObjectIntTreeMap configurationSessionSizeMap = new ObjectIntTreeMap();
ObjectIntTreeMap configurationSessionCountMap = new ObjectIntTreeMap();
ObjectIntTreeMap configurationSessionMaxMap = new ObjectIntTreeMap();

for(CacheManager.CacheEntry itCacheEntry: channel.getCacheManager().getCacheEntries()) {

  String conf = Util.getString(itCacheEntry.getConfiguration(),"");
  if (Util.isEmpty(conf)) {
    String id = itCacheEntry.getId();
    if (id.indexOf("_pe_") > 0) {
      conf = "portlet";
    } 
    else {
      conf = "other";
    }
  }
  
  if (itCacheEntry.getSessionScope()) {
    configurationSessionCountMap.inc(conf);
    
    int size = Util.getSize(itCacheEntry.getContent());
    configurationSessionSizeMap.inc(conf, size); 
    
    if (size > configurationSessionMaxMap.getInt(conf, 0)) {
      configurationSessionMaxMap.put(conf, size);
    }
  } else {
    configurationMemCountMap.inc(conf);
    
    int size = Util.getSize(itCacheEntry.getContent());
    configurationMemSizeMap.inc(conf, size); 
    
    if (size > configurationMemMaxMap.getInt(conf, 0)) {
      configurationMemMaxMap.put(conf, size);
    }
  }
  

}
%>
<div class="row">
  <div class="col-md-4">
  
    <h4>Memory Cache</h4>
      <table class="table-data auto">
        <tr>
          <th><%= glp("ui.adm.cache.lbl.configuration") %></th>
          <th>#</th>
          <th><%= glp("ui.adm.cache.lbl.size") %></th>
          <th><%= glp("ui.statreport.lbl.visitor.max") %></th>
          <th><%= glp("ui.statreport.lbl.average") %></th>
        </tr>
      
        <%
        int allMemCount = 0;
        int allMemSize = 0;
        %>
        <jalios:foreach collection="<%= configurationMemSizeMap.keySet() %>" type="String" name="configuration">
        <%
        int count = configurationMemCountMap.getInt(configuration, 0);
        int size = configurationMemSizeMap.getInt(configuration, 0);
        int max = configurationMemMaxMap.getInt(configuration, 0);
        
        allMemCount += count;
        allMemSize += size;
        %>
        <tr>
          <td><%= configuration %></td>
          <td class="text-right"><%=  count %></td>
          <td class="text-right"><jalios:filesize size='<%= size %>' /> </td>
          <td class="text-right"><jalios:filesize size='<%= max %>' /> </td>
          <td class="text-right"><% if (count > 0) { %><jalios:filesize size='<%= size / count %>' /><% } %></td>
        </tr>
        </jalios:foreach>
        <tr>
          <td><b>All</b></td>
          <td class="text-right"><%= allMemCount %></td>
          <td class="text-right"><jalios:filesize size='<%= allMemSize %>' /> </td>
          <td class="text-right"></td>
          <td class="text-right"><% if (allMemCount > 0) { %><jalios:filesize size='<%= allMemSize / allMemCount %>' /><% } %></td>
        </tr>
      </table>

</div><div class="col-md-4">

      <h4>Disk Cache</h4>
      <table class="table-data auto">
        <tr>
          <th><%= glp("ui.adm.cache.lbl.configuration") %></th>
          <th>#</th>
          <th><%= glp("ui.adm.cache.lbl.size") %></th>
          <th><%= glp("ui.statreport.lbl.visitor.max") %></th>
          <th><%= glp("ui.statreport.lbl.average") %></th>
        </tr>
      
        <%
        int allSessionCount = 0;
        int allSessionSize = 0;
        %>
        <jalios:foreach collection="<%= configurationSessionSizeMap.keySet() %>" type="String" name="configuration">
        <%
        int count = configurationSessionCountMap.getInt(configuration, 0);
        int size = configurationSessionSizeMap.getInt(configuration, 0);
        int max = configurationSessionMaxMap.getInt(configuration, 0);
        
        allSessionCount += count;
        allSessionSize += size;
        %>
        <tr>
          <td><%= configuration %></td>
          <td class="text-right"><%=  count %></td>
          <td class="text-right"><jalios:filesize size='<%= size %>' /> </td>
          <td class="text-right"><jalios:filesize size='<%= max %>' /> </td>
          <td class="text-right"><% if (count > 0) { %><jalios:filesize size='<%= size / count %>' /><% } %></td>
        </tr>
        </jalios:foreach>
        <tr>
          <td><b>All</b></td>
          <td class="text-right"><%= allSessionCount %></td>
          <td class="text-right"><jalios:filesize size='<%= allSessionSize %>' /> </td>
          <td class="text-right"></td>
          <td class="text-right"><% if (allSessionCount > 0) { %><jalios:filesize size='<%= allSessionSize / allSessionCount %>' /><% } %></td>
        </tr>
      </table>

  </div>
</div>



<%-- Content --%>
<h4>Cache details</h4>

<table id='cacheTable' class="table-data auto">
<tr>
  <th></th>
  <th><%= glp("ui.com.lbl.id") %></th>
  <th><%= glp("ui.adm.cache.lbl.session") %></th>
  <th><%= glp("ui.adm.cache.lbl.incom") %></th>
  <th><%= glp("ui.adm.cache.lbl.size") %></th>
  <th><%= glp("ui.adm.cache.lbl.timeout") %></th>
  <th><%= glp("ui.adm.cache.lbl.listen") %></th>
  <th><%= glp("ui.adm.cache.lbl.configuration") %></th>
  <th>&nbsp;</th>
</tr>

<jalios:pager name='cmPagerHandler' declare='true' action='init' size='<%= cacheManager.getSize() %>'/>
<jalios:foreach collection="<%= channel.getCacheManager().getCacheEntries() %>" 
                name="itCacheEntry" 
                type="CacheManager.CacheEntry"
                max="<%= cmPagerHandler.getPageSize() %>"
                skip="<%= cmPagerHandler.getStart() %>">

<tr> 
  <td class="text-right"><%= cmPagerHandler.getStart() + itCounter.intValue() %>.</td>
  <td>
    <span title='<%= itCacheEntry.getId() %>'><%
      %><jalios:truncate length="100" suffix="..."><%= itCacheEntry.getId() %></jalios:truncate><%
    %></span>
  </td>
  <td class="text-center"><%= itCacheEntry.getSessionScope() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
  <td class="text-right"><jalios:date date='<%= itCacheEntry.getDate() %>' format='<%= "short" %>'/> <jalios:time date='<%= itCacheEntry.getDate() %>' format='<%= "kk:mm:ss" %>'/></td>
  <td class="text-right">
    <% if (itCacheEntry.getContent() != null) { %>
    <jalios:filesize size='<%= itCacheEntry.getContent().length() %>' /> 
    <% } else {%>
    -
    <% } %>
  <td class="text-right">
    <% if (itCacheEntry.getTimeout() > 0) { %>
      <jalios:duration time='<%= itCacheEntry.getTimeout() %>' />
    <% } else { %>
      &nbsp;
    <% } %>
  </td>
 <td>
    <ul>
      <jalios:foreach array="<%= itCacheEntry.getClasses() %>" type="Class" name="itClass" counter="itCounter2">
      <li><%= channel.getTypeLabel(itClass, userLang) %></li>
      </jalios:foreach>
    </ul>
  </td>
 <td>
   <%= Util.getString(itCacheEntry.getConfiguration(),"") %>
 </td>
 <td>
   <a href="admin/cacheManager.jsp?opClear=true&amp;id=<%= itCacheEntry.getId() %>" class="modal confirm"><jalios:icon src='trash-empty'/></a>
  </td>
</tr>  
</jalios:foreach>
</table>
<jalios:pager name='cmPagerHandler'/><br />




<%@ include file='/admin/doAdminFooter.jspf' %>
