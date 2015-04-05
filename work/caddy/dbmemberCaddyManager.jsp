<%--
  @Summary: Manage db member of the caddy
  @Category: Admin Area / Caddy
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5.0
--%>
<%@page import="com.jalios.jcms.taglib.settings.SelectorSettings.SelectorType"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.DBMemberCaddyManagerHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
  request.setAttribute("caddyWAMenu", "true");
  request.setAttribute("caddyDBMemberMenu", "true");
  request.setAttribute("title", glp("ui.work.dbmbr-caddy.title", 0));
%>
<%@ include file='/work/doWorkHeader.jspf' %>
<h1 class='boTitle icon iconDbmember'><% /* %>Caddy Manager<% */ %><%= glp("ui.work.dbmbr-caddy.title", Caddy.getCaddy(request).getDBMemberListSize()) %></h1>
<form action='work/caddy/dbmemberCaddyManager.jsp' name='editForm' method='post' class="form-horizontal">

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <div class="tab-pane" id="mainTab">

      <%-- *** GENERAL TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><%= glp("ui.com.tab.general") %></h2>
        
        <%-- USAGE -------------------------------------------------------- --%> 
        <jalios:field name='usage' label='ui.adm.mbr-edit.lbl.usage' description='ui.adm.mbr-edit.lbl.usage.h'>
          <jalios:control settings='<%= new EnumerateSettings().select()
                                              .enumValues("0", "1")
                                              .enumLabels("ui.adm.mbr-edit.usage.0", "ui.adm.mbr-edit.usage.1") %>' />
        </jalios:field>
        
        
        <%-- E-MAIL VISIBLE -------------------------------------------------------- --%> 
        <jalios:field name="emailVisible" label="ui.adm.mbr-edit.lbl.mail-vis">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
         
        <%-- LANGUAGE ------------------------------------------------------------ --%> 
        <% if (channel.isMultilingual()) { %>
        <jalios:field name="language" label="ui.com.lbl.language">
          <jalios:control settings='<%= new LanguageSettings().inline().enumValues(channel.getLanguageList()) %>' />
        </jalios:field>
        <% } %>
        
        <%-- NO PHOTO -------------------------------------------------------- --%> 
        <jalios:field name="noRights" label="ui.adm.mbr-edit.lbl.photo"
                      value='<%= formHandler.getNoPhoto() %>'>
          <jalios:control settings='<%= new EnumerateSettings().multiple().enumValues("true").enumLabels("ui.adm.mbr-edit.lbl.no-photo") %>' />
        </jalios:field>
    
      </div>
    
      <%-- *** Groups TAB ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Groups<% */ %><%= glp("ui.adm.mbr-edit.tab.group") %></h2>
        <table id='groupTable' class="table-data table-condensed">
          <tr>
            <th nowrap="nowrap"></th>
            <th nowrap="nowrap"><%= glp("ui.adm.grp-list.lbl.grpglobal") %></th>
          </tr>
          <%
            Workspace wkspc = null;
            Set sortedGroupSet  = new TreeSet(Group.getWorkspaceComparator()); 
            sortedGroupSet.addAll(channel.getDataSet(Group.class));
          %>
          <jalios:foreach collection="<%= sortedGroupSet %>" name="itGroup" type="Group">
          <jalios:if predicate='<%= (itGroup.getWorkspace() != null) && (itGroup.getWorkspace() != wkspc) %>'>
          <% wkspc = itGroup.getWorkspace(); %>
          <tr><th colspan='2' ><%= wkspc.getTitle(userLang) %></th></tr>
          </jalios:if>
          <tr>
            <td nowrap="nowrap">
              <select name='gids' id="<%= itGroup.getId() %>" class='form-control'>
                <option value='<%= itGroup.getId() %>|true'><%= glp("ui.work.mbr-caddy.lbl.grp-selected") %></option>
                <option value='<%= itGroup.getId() %>|false'><%= glp("ui.work.mbr-caddy.lbl.grp-not-selected") %></option>
                <option value='<%= itGroup.getId() %>|<%= MemberCaddyManagerHandler.NOT_COMMON %>' selected="selected"><%= glp("ui.work.mbr-caddy.lbl.grp-not-common") %></option>
              </select>
              <% if (itCounter.intValue() == 1) { %>
               <a href='#' onclick='selectAllwithId(document.editForm, "gids"); return false;'><jalios:icon src='bullet-square-down-arrow' title='<%= glp("ui.com.alt.select-all") %>'/></a>
              <% }%>
            </td>
            <td width='100%'>
              <%= itGroup.getName(userLang) %>
              <jalios:edit id='<%= itGroup.getId() %>'/>
            </td>
          </tr>
          </jalios:foreach>
        </table>
      </div>
      
      <%-- *** Activation Mail TAB ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Activation Mail<% */ %><%= glp("ui.work.mbr-caddy.tab.activation-mail") %></h2>

          <% String activationMailSubjectLabel = glp("ui.adm.mail.lbl.subject"); %>
         <jalios:field  name='<%= "activationMailSubject" %>' label='<%= activationMailSubjectLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getActivationMailSubjectML() %>'>
           <jalios:control type="<%= ControlType.TEXTFIELD %>" />
         </jalios:field>
    
          <% String activationMailContentLabel = glp("ui.adm.mail.lbl.content"); %>
         <jalios:field  name='<%= "activationMailContent" %>' label='<%= activationMailContentLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getActivationMailContentML() %>'>
           <jalios:control settings='<%= new TextAreaSettings().rows(13) %>' />
           <jalios:buffer name="WIDGET_APPEND">
            <%= glp("ui.work.mbr-caddy.txt.activation-mail.h", "{0}","{1}","{2}","{3}","{4}","{5}") %>
           </jalios:buffer>
         </jalios:field>

      </div>
      
      <%-- *** Mail TAB ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Mail<% */ %><%= glp("ui.com.lbl.email") %></h2>
        
          <% String mailSubjectLabel = glp("ui.adm.mail.lbl.subject"); %>
         <jalios:field  name='<%= "mailSubject" %>' label='<%= mailSubjectLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getMailSubjectML() %>'>
           <jalios:control type="<%= ControlType.TEXTFIELD %>" />
         </jalios:field>
          
          <% String mailContentLabel = glp("ui.adm.mail.lbl.content"); %>
         <jalios:field  name='<%= "mailContent" %>' label='<%= mailContentLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getMailContentML() %>'>
           <jalios:control settings='<%= new TextAreaSettings().rows(13) %>' />
           <jalios:buffer name="WIDGET_APPEND">
            <%= glp("ui.work.mbr-caddy.txt.mail.h", "{0}","{1}","{2}","{3}","{4}","{5}") %>
           </jalios:buffer>
         </jalios:field>

      </div>
    </div>

  <% ArrayList<String> memberIdList = Caddy.getCaddy(request).getDBMemberList(); %>
  <jalios:pager name='caddyPagerHandler' declare='true' action='init' size='<%= memberIdList.size() %>'/>          
  
  <%
   boolean showExportCSV = true;
   String dataType = "DBMember";
  %>
  <%@ include file='/work/caddy/doCommonCaddyManagerButton.jspf' %>
  
  <div style="margin-top:10px;">
      <button type="button" class="btn btn-default" onclick="confirmSubmitFormLightBox(window,document.editForm,'opDisable', this.title)" title="<%= confirm %>" <%= disabled %>>
        <jalios:icon src="disable-account"  /> <%= glp("ui.work.mbr-caddy.btn.disable") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.disable.h" /> 
      
      <button type="button" class="btn btn-default" onclick="confirmSubmitFormLightBox(window,document.editForm,'opActivate', this.title)" title="<%= confirm %>" <%= disabled %>>
        <jalios:icon src="sign"  /> <%= glp("ui.work.mbr-caddy.btn.activate") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.activate.h" /> 

      &nbsp;

      <% String mailDisabled = (isDisabled || !channel.isMailEnabled()) ? "disabled=\"disabled\"": ""; %>
      <button type="button" class="btn btn-default" onclick="confirmSubmitForm(window,document.editForm,'opSendMail', this.title)" title="<%= confirm %>" <%= mailDisabled %>>
        <jalios:icon src="mail"  /> <%= glp("ui.work.mbr-caddy.btn.sendmail") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.sendmail.h" /> 

  </div>
  
  
  <%-- MEMBER CADDY CONTENT --------------------------------------------------------------- --%>
  <jalios:if predicate='<%= caddyPagerHandler.getItemsNbr() != 0 %>'>
    <div style="margin-top:15px;">
    
        <table id='mbrTable' class="table-data table-condensed">
          <tr>
            <th colspan="3"></th>
            <th nowrap="nowrap" width='100%'><% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %></th>
            <th nowrap="nowrap"><% /* %>#Pub.<% */ %><%= glp("ui.com.lbl.pub-cnt") %></th>
            <th nowrap="nowrap"><% /* %>Group<% */ %><%= glp("ui.com.lbl.groups") %></th>
            <th nowrap="nowrap"><% /* %>Email<% */ %><%= glp("ui.adm.mbr-edit.lbl.mail") %></th>
            <th nowrap="nowrap"><% /* %>Lang<% */ %><%= glp("ui.adm.mbr-list.lbl.lang") %></th>
          </tr>
          <jalios:foreach collection='<%= memberIdList %>' 
                          type='String' 
                          name='itMemberId'
                          max='<%= caddyPagerHandler.getPageSize() %>'
                          skip='<%= caddyPagerHandler.getStart() %>'> 
          <%
             Member itMember = channel.getMember(itMemberId);
             if (itMember != null) {
          %>
          <tr> 
            <%-- --- MBR / COUNTER --------------------------- --%>
            <td align="right" nowrap="nowrap">
              <%= caddyPagerHandler.getStart() + itCounter.intValue() %>.
            </td>
            <%-- --- MBR / EDIT --------------------------- --%>
            <td nowrap='nowrap'><jalios:edit id="<%= itMember.getId() %>" /></td>
            <%-- --- MBR / CADDY OUT --------------------------- --%>
            <td class="text-left" nowrap="nowrap">
              <a href="work/caddy/dbmemberCaddyManager.jsp?opRemoveCaddy=on&amp;removeIds=<%= itMember.getId() %>" onclick="this.href=JCMS.Security.getUrlWithCSRFToken(this.href); return true;"><jalios:icon src="caddy-out" title='<%= glp("ui.com.alt.out-caddy") %>'  /></a>
            </td>
            <%-- --- MBR / NAME --------------------------- --%>
            <td nowrap="nowrap">
              <%= itMember.getHtmlIcon(workspace,userLang) %>
              <a href='front/memberProfile.jsp?id=<%= itMember.getId() %>'>
                <font color='<%= itMember.isDisabled() ? "#ff0000" : "" %>'><%= itMember.getFullName() %></font>
              </a>
            </td>
            <%-- --- MBR / #PUB --------------------------- --%>
            <td align="right">  
              <%= Util.isEmpty(itMember.getPublicationSet()) ? ""+itMember.getPublicationSet().size() : ("<a href='work/queryWork.jsp?mids="+ itMember.getId() +"&amp;types=com.jalios.jcms.Publication'>"+ itMember.getPublicationSet().size() +"</a>") %>
            </td>
            <%-- --- MBR / GROUPS --------------------------- --%>
            <td class='vTop' nowrap="nowrap">
              <ul>
              <jalios:foreach array="<%= itMember.getDeclaredGroups() %>" name="itGroup" type="Group" counter="gCounter">
                  <li><%= itGroup.getIcon(userLang,true) %> <%= itGroup.getName(userLang) %></li>
                  <% if (itGroup.isSubGroup()) { %>
                  <ul>
                  <jalios:foreach collection='<%= itGroup.getAncestorSet(false) %>' name='itAncestor' type='Group' counter='ancestorCounter'>
                  <li><%= itAncestor.getIcon(userLang,true) %> <%= itAncestor %></li>
                  </jalios:foreach>
                  </ul>
                  <% } %>
                  </li>
              </jalios:foreach>
              </ul>
            </td>
            <%-- --- MBR / EMAIL --------------------------- --%>
            <td nowrap="nowrap"><%= itMember.getEmail() == null || itMember.getEmail().equals("") ? "&nbsp;" : itMember.getEmail() %></td>
            <%-- --- MBR / LANG --------------------------- --%>
            <td align='center'><jalios:lang lang='<%= itMember.getLanguage() %>' /></td>
          </tr>
          <% } %>
          </jalios:foreach>
        </table>
        
        <jalios:pager name='caddyPagerHandler'/>
    </div>
  </jalios:if>

</form>

<%@ include file='/work/doWorkFooter.jspf' %>