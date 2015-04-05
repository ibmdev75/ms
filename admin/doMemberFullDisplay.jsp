<%@include file='/jcore/doInitPage.jspf' %><%-- 
--%><%@include file='/jcore/doHeader.jspf' %><%-- 
--%><% { %>
<% 
Member member = getMemberParameter("mid");
if (member == null) {
  member = (Member) request.getAttribute("member");  
}
Member obj = member; // for doMemberExtensionFullDisplay.jsp

if (member == null) {
  member = loggedMember;
}

if (member == null) {
  return;
}

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("title", member.getFullName()); 
boolean hasPhoto = member.hasPhoto();
jcmsContext.addCSSHeader("css/jalios/member.css");
int mbrStatus = member.getStatus();

String memberPhotoRelativePath = "images/jalios/layout/silhouette.jpg";
if (Util.notEmpty(member.getPhoto()) && (new File(channel.getRealPath(member.getPhoto()))).exists()) {
  memberPhotoRelativePath = member.getPhoto();
}
%>

<jalios:panel>
  <div class="profile-header media">
    <div class="pull-left">
      <div>
        <jalios:memberphoto member="<%= member %>" size="<%= PhotoSize.NORMAL %>" css="br"/>
      </div>
      
      <% if (member.canUploadPhoto()) { %>
        <div>
          <a class="modal btn btn-default" href="front/memberPhoto/editPhoto.jsp?mbrId=<%= member.getId() %>"><%= glp("ui.member-editor.change-photo") %></a>
        </div>
      <% } %>          
    </div>
  
    <div class="media-body" vocab="http://schema.org/" typeof="Person">
        <div class="pull-right">
        <jalios:edit css="btn btn-default" data='<%= member %>' />
        <% if(isLogged && !isAdmin && channel.isDataWriteEnabled() && JcmsUtil.isSameId(member,loggedMember)){%>
          <a class="btn btn-default" onclick="popupWindow(this.href, &quot;MemberProfile&quot;, 1000, 600); return false;" href="front/memberProfile.jsp?emptyheader=true">
            <jalios:icon src="edit"  title='<%= glp("ui.com.alt.edit") %>' />
          </a>
        <% } %>
        </div>      
      <h1 class="media-heading">
        <span property="name"><%= member.getLangSalutation(userLang) %> <%= member.getFullName() %></span> 
      </h1>
      
      <div class="br">
        <%-- JOB TITLE ------------------------------------------------------- --%> 
        <% if (Util.notEmpty(member.getJobTitle())) { %>
        <p property="jobTitle"><%= member.getJobTitle() %></p>
        <% } %>
                
        <%-- DEPARTMENT ------------------------------------------------------- --%> 
        <% if (Util.notEmpty(member.getDepartment())) { %>
        <p><%= member.getDepartment() %></p>
        <% } %>

        <%-- ORGANIZATION ------------------------------------------------------- --%> 
        <% if (Util.notEmpty(member.getOrganization())) { %>
        <p><%= member.getOrganization() %></p>
        <% } %>
    
      </div>
      
      <div class="well well-sm">
      <ul class="list-unstyled">
        <%-- E-MAIL ---------------------------------------------------------------- --%>
        <% if (Util.notEmpty(member.getEmail()) && (member.isEmailVisible() || isAdmin)) { %>
        <li property="email">
          <jalios:icon src="mail" title="ui.adm.mn.mail.send" alt="ui.adm.mn.mail.send" />
          <%= member.getEmail() %>
        </li>
        <% } %>
        
        <%-- PHONE ------------------------------------------------------- --%> 
        <% String phone =  member.getPhone(); %>
        <% if (Util.notEmpty(phone)) { %>
        <li property="telephone">
          <jalios:icon src="telephone" title="ui.adm.mbr-edit.lbl.phone" alt="ui.adm.mbr-edit.lbl.phone" />
          <jalios:phone number="<%= phone %>" region="<%= member.getCountry() %>" />
        </li>
        <% } %>
        
        <%-- MOBILE ------------------------------------------------------- --%> 
        <% String mobile =  member.getMobile(); %>
        <% if (Util.notEmpty(mobile)) { %>
        <li property="telephone">
          <jalios:icon src="phone" title="ui.adm.mbr-edit.lbl.mobile" alt="ui.adm.mbr-edit.lbl.mobile" />
          <jalios:phone number="<%= mobile %>" region="<%= member.getCountry() %>" />
        </li>
        <% } %>
        
        <%-- ADDRESS ------------------------------------------------------- --%> 
        <% if (Util.notEmpty(member.getAddress())) { %>
        <li property="address">
          <jalios:icon src="house" title="ui.adm.mbr-edit.lbl.addr" alt="ui.adm.mbr-edit.lbl.addr" />
          <%= member.getAddress() %>
        </li>
        <% } %>

      </ul>
      </div>
        
      <%-- LAST LOGIN DATES ------------------------------------------------------- --%> 
      <jalios:accordion>
        <jalios:accordion-panel title="ui.com.lbl.previous-dates-login">
          <ul>
            <jalios:foreach collection="<%=  member.getLastLoginDateSet() %>" name="itDate" type="Date">
            <li><jalios:time date="<%= itDate %>" format="short" /> <jalios:date date="<%= itDate %>" format="short" /></li>
            </jalios:foreach>
          </ul>
        </jalios:accordion-panel>
      </jalios:accordion>
   
    </div>

  </div>

  <div class="profile-body form-horizontal">

  
    <%-- *** PLUGINS ***************************** --%>
    <jalios:include target="MEMBER_FULLDISPLAY" />
  </div>
  
  <%-- TRACES ------------------------------------------------------- --%> 
  <%@ include file='/admin/doMemberSessionTraces.jspf' %>
</jalios:panel>

<% } %>
