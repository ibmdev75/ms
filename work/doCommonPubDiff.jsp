<%--
  @Summary: Display diff info about common publication's fields
  @Category: Internal
  @Deprecated: False
  @Customizable: False
  @Requestable: False
--%>
<%@ include file='/jcore/doInitPage.jspf' %><%
Publication newObj = (Publication)request.getAttribute("newPub"); 
Publication oldObj = (Publication)request.getAttribute("oldPub"); 
int fieldCount = ((Integer)request.getAttribute("fieldCount")).intValue();
%>
  <%-- ** categories ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCategories(), oldObj.getCategories()) %>'>
  <tr class='vTop'>
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Categories<% */ %><%= glp("ui.com.lbl.categories") %></td>
    <td>
      <ol>
        <jalios:foreach array="<%= newObj.getCategories() %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getRootCategory(), " > ", true, userLang) %>
        </jalios:foreach>
      </ol>
    </td>
    <td>
      <ol>
        <jalios:foreach array="<%= oldObj.getCategories() %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getRootCategory(), " > ", true, userLang) %>
        </jalios:foreach>
      </ol>
    </td>
  </tr>
  </jalios:if>
    
  <%-- ** read rights ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAuthorizedGroupSet(), oldObj.getAuthorizedGroupSet()) || !Util.isSameContent(newObj.getAuthorizedMemberSet(), oldObj.getAuthorizedMemberSet()) %>'>
  <tr class='vTop'>
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Read Rights<% */ %><%= glp("ui.work.form.lbl.read-rights") %></td>
    <td>
      <ul>
      <jalios:foreach collection="<%= newObj.getAuthorizedGroupSet() %>" type="Group" name="itGrp" counter="grpCounter">
      <li><% if (itGrp != null) { %><%= itGrp.getIcon(userLang, true) %>&nbsp;<%= itGrp.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
      <ul>
      <jalios:foreach collection="<%= newObj.getAuthorizedMemberSet() %>" type="Member" name="itMbr" counter="mbrCounter">
      <li><% if (itMbr != null) { %><%= itMbr.getHtmlIcon(newObj.getWorkspace(), userLang) %>&nbsp;<%= itMbr.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
    </td>
    <td>
      <ul>
      <jalios:foreach collection="<%= oldObj.getAuthorizedGroupSet() %>" type="Group" name="itGrp" counter="grpCounter">
      <li><% if (itGrp != null) { %><%= itGrp.getIcon(userLang, true) %>&nbsp;<%= itGrp.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
      <ul>
      <jalios:foreach collection="<%= oldObj.getAuthorizedMemberSet() %>" type="Member" name="itMbr" counter="mbrCounter">
      <li><% if (itMbr != null) { %><%= itMbr.getHtmlIcon(oldObj.getWorkspace(), userLang) %>&nbsp;<%= itMbr.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
    </td>
  </tr>
  </jalios:if>
  
  <%-- ** update rights ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getUpdateGroupSet(), oldObj.getUpdateGroupSet()) || !Util.isSameContent(newObj.getUpdateMemberSet(), oldObj.getUpdateMemberSet()) %>'>
  <tr class='vTop'>
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Read Rights<% */ %><%= glp("ui.work.form.lbl.update-rights") %></td>
    <td>
      <ul>
      <jalios:foreach collection="<%= newObj.getUpdateGroupSet() %>" type="Group" name="itGrp" counter="grpCounter">
      <li><% if (itGrp != null) { %><%= itGrp.getIcon(userLang, true) %>&nbsp;<%= itGrp.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
      <ul>
      <jalios:foreach collection="<%= newObj.getUpdateMemberSet() %>" type="Member" name="itMbr" counter="mbrCounter">
      <li><% if (itMbr != null) { %><%= itMbr.getHtmlIcon(newObj.getWorkspace(), userLang) %>&nbsp;<%= itMbr.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
    </td>
    <td>
      <ul>
      <jalios:foreach collection="<%= oldObj.getUpdateGroupSet() %>" type="Group" name="itGrp" counter="grpCounter">
      <li><% if (itGrp != null) { %><%= itGrp.getIcon(userLang, true) %>&nbsp;<%= itGrp.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
      <ul>
      <jalios:foreach collection="<%= oldObj.getUpdateMemberSet() %>" type="Member" name="itMbr" counter="mbrCounter">
      <li><% if (itMbr != null) { %><%= itMbr.getHtmlIcon(oldObj.getWorkspace(), userLang) %>&nbsp;<%= itMbr.toString() %><% } %></li>
      </jalios:foreach>
      </ul>
    </td>
  </tr>
  </jalios:if>
  
  <%-- ** author ***************** --%>
  <jalios:if predicate='<%= newObj.getAuthor() != oldObj.getAuthor() %>'>
  <tr class='vTop'>
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Author<% */ %><%= glp("ui.com.lbl.author") %></td>
    <td><%= newObj.getAuthor() %></td>
    <td><%= oldObj.getAuthor() %></td>
  </tr>
  </jalios:if>

  <%-- ** opAuthor ***************** --%>
  <jalios:if predicate='<%= newObj.getOpAuthor() != oldObj.getOpAuthor() %>'>
  <tr class='vTop'>
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>OpAuthor<% */ %><%= glp("ui.com.lbl.op-author") %></td>
    <td><%= Util.getString(newObj.getOpAuthor(), glp("ui.com.lbl.no-op-author")) %></td>
    <td><%= Util.getString(oldObj.getOpAuthor(), glp("ui.com.lbl.no-op-author")) %></td>
  </tr>
  </jalios:if>

  <%-- ** opDelegate ***************** --%>
  <jalios:if predicate='<%= newObj.getOpDelegate() != oldObj.getOpDelegate() %>'>
  <tr class='vTop'>
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>OpDelegate<% */ %><%= glp("ui.com.lbl.op-delegate") %></td>
    <td><%= Util.getString(newObj.getOpDelegate(), "") %></td>
    <td><%= Util.getString(oldObj.getOpDelegate(), "") %></td>
  </tr>
  </jalios:if>
  
  <%-- ** pstatus ***************** --%>
  <jalios:if predicate='<%= newObj.getPstatus() != oldObj.getPstatus() %>'>
  <% Workflow wf = newObj.getWorkflow(); %>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Status<% */ %><%= glp("ui.com.lbl.status") %></td>
    <td><%= (null != wf) ? wf.getStateLabel(newObj.getPstatus(), userLang) : "" + newObj.getPstatus() %></td>
    <td><%= (null != wf) ? wf.getStateLabel(oldObj.getPstatus(), userLang) : "" + oldObj.getPstatus() %></td>
  </tr>
  </jalios:if>
  
  <%-- ** pdate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPdate(), oldObj.getPdate()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Publish Date<% */ %><%= glp("ui.com.lbl.pdate-long") %></td>
    <td><jalios:date date='<%= newObj.getPdate() %>'/> <jalios:time date='<%= newObj.getPdate() %>'/></td>
    <td><jalios:date date='<%= oldObj.getPdate() %>'/> <jalios:time date='<%= oldObj.getPdate() %>'/></td>
  </tr>
  </jalios:if>
    
  <%-- ** edate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getEdate(), oldObj.getEdate()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Expiry Date<% */ %><%= glp("ui.com.lbl.edate-long") %></td>
    <td><jalios:date date='<%= newObj.getEdate() %>'/> <jalios:time date='<%= newObj.getEdate() %>'/></td>
    <td><jalios:date date='<%= oldObj.getEdate() %>'/> <jalios:time date='<%= oldObj.getEdate() %>'/></td>
  </tr>
  </jalios:if>
  
  <%-- ** adate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAdate(), oldObj.getAdate()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Archive Date<% */ %><%= glp("ui.com.lbl.adate-long") %></td>
    <td><jalios:date date='<%= newObj.getAdate() %>'/> <jalios:time date='<%= newObj.getAdate() %>'/></td>
    <td><jalios:date date='<%= oldObj.getAdate() %>'/> <jalios:time date='<%= oldObj.getAdate() %>'/></td>
  </tr>
  </jalios:if>
    
  <%-- ** sdate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSdate(), oldObj.getSdate()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Sort Date<% */ %><%= glp("ui.com.lbl.sdate-long") %></td>
    <td><jalios:date date='<%= newObj.getSdate() %>'/> <jalios:time date='<%= newObj.getSdate() %>'/></td>
    <td><jalios:date date='<%= oldObj.getSdate() %>'/> <jalios:time date='<%= oldObj.getSdate() %>'/></td>
  </tr>
  </jalios:if>
  
  <%-- ** udate ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getUdate(), oldObj.getUdate()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Update Date<% */ %><%= glp("ui.com.lbl.udate-long") %></td>
    <td><jalios:date date='<%= newObj.getUdate() %>'/> <jalios:time date='<%= newObj.getUdate() %>'/></td>
    <td><jalios:date date='<%= oldObj.getUdate() %>'/> <jalios:time date='<%= oldObj.getUdate() %>'/></td>
  </tr>
  </jalios:if>
  
  <%-- ** Track Readers ***************** --%>
  <jalios:if predicate='<%= newObj.isTracked() != oldObj.isTracked() %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Track Readers<% */ %><%= glp("ui.work.form.lbl.track") %></td>
    <td><%= glp("ui.com.lbl." + newObj.isTracked()) %></td>
    <td><%= glp("ui.com.lbl." + oldObj.isTracked()) %></td>
  </tr>
  </jalios:if>
  
  <%-- ** Workspace ***************** --%>
  <jalios:if predicate='<%= newObj.getWorkspace() != oldObj.getWorkspace() %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Workspace<% */ %><%= glp("ui.com.lbl.workspace") %></td>
    <td><%= newObj.getWorkspace() %></td>
    <td><%= oldObj.getWorkspace() %></td>
  </tr>
  </jalios:if>
  
  <%-- ** Main Language ***************** --%>
  <jalios:if predicate='<%= !newObj.getMainLanguage().equals(oldObj.getMainLanguage()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Main Language<% */ %><%= glp("ui.work.form.lbl.main-language") %></td>
    <td><jalios:lang lang='<%= newObj.getMainLanguage() %>'/> <%= glp("lang." + newObj.getMainLanguage())%></td>
    <td><jalios:lang lang='<%= oldObj.getMainLanguage() %>'/> <%= glp("lang." + oldObj.getMainLanguage())%></td>
  </tr>
  </jalios:if>
  
  <%-- ** Friendly URLs ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFriendlyURLSet(), oldObj.getFriendlyURLSet()) %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td><% /* %>Friendly URLs<% */ %><%= glp("ui.com.lbl.friendly-urls") %></td>
    <td>
     <jalios:foreach name="friendlyURLNew" type="String" counter="fURlsCounterNew"
                     collection="<%= newObj.getFriendlyURLSet() %>">
       <jalios:icon src='www'  /> <%= friendlyURLNew %><br />
     </jalios:foreach>
    </td>
    <td>
     <jalios:foreach name="friendlyURLOld" type="String" counter="fURlsCounterOld"
                     collection="<%= oldObj.getFriendlyURLSet() %>">
       <jalios:icon src='www'  /> <%= friendlyURLOld %><br />
     </jalios:foreach>
    </td>
  </tr>
  </jalios:if>
    
  <%-- ** mdate ***************** --%>
  <jalios:if predicate='<%= newObj.getMdate() != oldObj.getMdate() %>'>
  
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Modified Date<% */ %><%= glp("ui.com.lbl.mdate-long") %></td>
    <td><jalios:date date='<%= newObj.getMdate() %>'/> <jalios:time date='<%= newObj.getMdate() %>'/></td>
    <td><jalios:date date='<%= oldObj.getMdate() %>'/> <jalios:time date='<%= oldObj.getMdate() %>'/></td>
  </tr>
  </jalios:if>
  
  
   <%-- ** Display ************** --%>
   <% if (newObj instanceof Portlet) { 
        Portlet newPortlet = (Portlet) newObj;
        Portlet oldPortlet = (Portlet) oldObj;
        if (!Util.isSameContent(newPortlet.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_BOX),  oldPortlet.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_BOX)) ||
            !Util.isSameContent(newPortlet.getDisplayCSS(), oldPortlet.getDisplayCSS()) ) {
   %>
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Display parameters<% */ %><%= glp("ui.editportlet.usage.box") %></td>
    <td>
       <% 
       {
         // Template
         TypeTemplateEntry tte = newPortlet.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_BOX,true);
                  
         // Inner CSS
         Map     cssMap        = PortalManager.getCSSMap(PortalManager.CSS_INNER , newPortlet.getClass());
         boolean hasCssDisplay = Util.notEmpty(cssMap.entrySet());
         String  cssDisplay    = hasCssDisplay ? Util.getString(newPortlet.getDisplayCSS(),"") : "";
       %>
        <div><strong><%= glp("ui.editportlet.usage.box") %> :</strong> 
        <%= tte.getLabel(userLang) %> (<%= tte.getName() %>)
        </div>
        <jalios:if predicate='<%= hasCssDisplay %>'>
          <div><strong><%= glp("ui.editportlet.displaycss") %> :</strong> <%= Util.isEmpty(cssDisplay) ? glp("ui.editportlet.no-display-css") : cssDisplay %></div>
        </jalios:if>
        <div class='tmplThumbnail'><img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= tte.getThumbnailPath() %>);"/></div>
        <div class='tmplDescription'><%= WikiRenderer.wiki2html(Util.getString(tte.getDescription(userLang),"") , userLocale, null) %></div>          
        <div><strong><%= glp("ui.com.lbl.jsp") %> :</strong> <span class='tmplFile'><%= tte.getPath() %></span></div>
      <% } %>
    </td>
    <td>
       <% 
       {    
         // Template
         TypeTemplateEntry tte = oldPortlet.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_BOX,true);
         
         // Inner CSS
         Map     cssMap        = PortalManager.getCSSMap(PortalManager.CSS_INNER , oldPortlet.getClass());
         boolean hasCssDisplay = Util.notEmpty(cssMap.entrySet());
         String  cssDisplay    = hasCssDisplay ? Util.getString(oldPortlet.getDisplayCSS(),"") : "";
       %>
        <div><strong><%= glp("ui.editportlet.usage.box") %> :</strong> 
        <%= tte.getLabel(userLang) %> (<%= tte.getName() %>)
        </div>
        <jalios:if predicate='<%= hasCssDisplay %>'>
          <div><strong><%= glp("ui.editportlet.displaycss") %> :</strong> <%= Util.isEmpty(cssDisplay) ? glp("ui.editportlet.no-display-css") : cssDisplay %></div>
        </jalios:if>
        <div class='tmplThumbnail'><img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= tte.getThumbnailPath() %>);"/></div>
        <div class='tmplDescription'><%= WikiRenderer.wiki2html(Util.getString(tte.getDescription(userLang),"") , userLocale, null) %></div>          
        <div><strong><%= glp("ui.com.lbl.jsp") %> :</strong> <span class='tmplFile'><%= tte.getPath() %></span></div>
      <% } %>
    </td>
  </tr>
   <% 
        }
      } else if (newObj instanceof Content) { 
        Content newContent = (Content) newObj;
        Content oldContent = (Content) oldObj;
        if (!Util.isSameContent(newContent.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_FULL), 
                                oldContent.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_FULL))) {
   %>
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Full template<% */ %><%= glp("ui.editportlet.usage.full") %></td>
    <td>
       <% 
       { // Template
         TypeTemplateEntry tte = newContent.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_FULL,true);
       %>
        <div><strong><%= glp("ui.editportlet.usage.full") %> :</strong> 
        <%= tte.getLabel(userLang) %> (<%= tte.getName() %>)
        </div>
        <div class='tmplThumbnail'><img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= tte.getThumbnailPath() %>);"/></div>
        <div class='tmplDescription'><%=  WikiRenderer.wiki2html(Util.getString(tte.getDescription(userLang),"") , userLocale, null) %></div>          
        <div><strong><%= glp("ui.com.lbl.jsp") %> :</strong> <span class='tmplFile'><%= tte.getPath() %></span></div>
      <% } %>
    </td>
    <td>
       <% // Template
       { TypeTemplateEntry tte = oldContent.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_FULL,true);
       %>
        <div><strong><%= glp("ui.editportlet.usage.full") %> :</strong> 
        <%= tte.getLabel(userLang) %> (<%= tte.getName() %>)
        </div>
        <div class='tmplThumbnail'><img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= tte.getThumbnailPath() %>);"/></div>
        <div class='tmplDescription'><%= WikiRenderer.wiki2html(Util.getString(tte.getDescription(userLang),"") , userLocale, null) %></div>          
        <div><strong><%= glp("ui.com.lbl.jsp") %> :</strong> <span class='tmplFile'><%= tte.getPath() %></span></div>
      <% } %>
    </td>
  </tr>
   <% 
        } // End of display template on contents
        // Query template on contents
        if ( !Util.isSameContent(newContent.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_QUERY),   
                                 oldContent.getTemplate(TypeTemplateEntry.USAGE_DISPLAY_QUERY))) {
   %>
  <tr class='vTop' >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td class='text-overflow'><% /* %>Query template<% */ %><%= glp("ui.editportlet.usage.query") %></td>
    <td>
       <% 
       { // Template
         TypeTemplateEntry tte = newContent.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_QUERY,true);
       %>
        <div><strong><%= glp("ui.editportlet.usage.query") %> :</strong> 
        <%= tte.getLabel(userLang) %> (<%= tte.getPath() %>)
        </div>
        <div class='tmplThumbnail'><img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= tte.getThumbnailPath() %>);"/></div>
        <div class='tmplDescription'><%= WikiRenderer.wiki2html(Util.getString(tte.getDescription(userLang),"") , userLocale, null) %></div>          
        <div><strong><%= glp("ui.com.lbl.jsp") %> :</strong> <span class='tmplFile'><%= tte.getPath() %></span></div>
      <% } %>
    </td>
    <td>
       <% 
       { // Template
         TypeTemplateEntry tte = oldContent.getTemplateEntry(TypeTemplateEntry.USAGE_DISPLAY_QUERY,true);
       %>
        <div><strong><%= glp("ui.editportlet.usage.query") %> :</strong> 
        <%= tte.getLabel(userLang) %> (<%= tte.getPath() %>)
        </div>
        <div class='tmplThumbnail'><img class='tmplThumbnail' src='s.gif' style="background-image: url(<%= tte.getThumbnailPath() %>);"/></div>
        <div class='tmplDescription'><%= WikiRenderer.wiki2html(Util.getString(tte.getDescription(userLang),"") , userLocale, null) %></div>          
        <div><strong><%= glp("ui.com.lbl.jsp") %> :</strong> <span class='tmplFile'><%= tte.getPath() %></span></div>
      <% } %>
    </td>
  </tr>
   <% 
        } 
      }
   %>

  
  
  
  
  

    