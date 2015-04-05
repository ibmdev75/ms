<%@page import="com.jalios.io.*"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>

<style>
  .doc-icon {
    position:relative;
    border: 1px solid #CCC;
    padding: 10px;
  }
  .icon-counter {
    position: absolute;
    right: 0px;
    top: 0px;
    background: #DDD;
    padding: 3px 6px;
    font-size: 12px;
  }
  .prop-name {
    font-weight:bold;
  }
</style>

<div class="bs-docs-section">
  
  <h1 id="icon-list" class="page-header">Icon list</h1>
  
  <p>The following icons are currently available.</p>
    
  <%-- TABS --%>
  <ul class="nav nav-tabs br">
    <li class="active"><a href="#core" onclick="return false;">Core Icons</a></li>
    <li><a href="#plugin" onclick="return false;">Plugin Icons</a></li>
  </ul>

  <div class="tab-content responsive">
  
    <%--  Core Icons --%>
    <% String JCMSPLUGIN_PREFIX = "jcmsplugin-"; %>
    <div class="tab-pane fade in active" id="core">
      <% 
      LangProperties iconProps = channel.getProperties(JcmsUtil.ICON_PREFIX_PROP);
      SortedMap<String,String> iconMap = new TreeMap<String,String>();
      iconMap.putAll(iconProps);
      {
        int counter = 0;
      %>
      <div class="row br">
      <% 
        int prefixLength = JcmsUtil.ICON_PREFIX_PROP.length();
        for (Iterator it  = iconMap.entrySet().iterator() ; it.hasNext() ; ){
          Map.Entry itEntry = (Map.Entry) it.next();
          String itName = ((String)itEntry.getKey()).substring(prefixLength);
          if (itName.startsWith(JCMSPLUGIN_PREFIX)) {
            continue;
          }
          String itProp = (String) itEntry.getValue();
      %>
        <div class="col-sm-3">
          <%@ include file="/docs/jcms/icon.jspf" %>
        </div>
      <% counter++; if (counter%4 == 0) { %></div><div class="row br"><% } %>
      <% } %>
      </div>
      <% } %>
    </div>
  
    <%--  Plugin Icons --%>
    <div class="tab-pane fade in" id="plugin">
      <%
      {
        int counter = 0;
        boolean first = true;
      %>
      <% 
        int prefixLength = JcmsUtil.ICON_PREFIX_PROP.length();
        String currPrefix = "";
        String prefix = null;
        for (Iterator it  = iconMap.entrySet().iterator() ; it.hasNext() ; ) {
          Map.Entry itEntry = (Map.Entry) it.next();
          String itName = ((String)itEntry.getKey()).substring(prefixLength);
          if (!itName.startsWith(JCMSPLUGIN_PREFIX)) {
            continue;
          }
          int dot1 = JCMSPLUGIN_PREFIX.length();
          int dot2 = itName.indexOf("-", dot1 + 1);
          if (dot1 >= 0) {
            if (dot2 > dot1) {
              prefix = itName.substring(dot1, dot2);
            } else if (dot2 == -1) {
              prefix = itName.substring(dot1);
            } else {
              prefix = "";
            }
          } else {
            prefix = "";
          }
      %>
      <% if (!currPrefix.equals(prefix)) { %>
      <%   if (!first) { %></div><% } %>
      <h2>Plugin <%= Util.recapitalize(prefix) %></h2>
      <div class="row br">
      <% 
      currPrefix = prefix;
      first = false;
      counter = 0;
      %> 
      <% } %>
      <%    String itProp = (String) itEntry.getValue();
       %>
        <div class="col-sm-3">
          <%@ include file="/docs/jcms/icon.jspf" %>
        </div>
      <% counter++; if (counter%4 == 0){ %></div><hr/><div class="row br"><% } %>
      <% } %>
      </div>
    <% } %>
    </div>
  </div>
</div>