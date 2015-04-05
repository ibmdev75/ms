<%@ include file="/jcore/doInitPage.jspf" %><%
  Member member = getMemberParameter("ttId");
  if (member == null){
    return;
  }
  
  String organizationAndDepartement = member.getOrganizationAndDepartment();
  String jobTitle =  member.getJobTitle();
  String email = member.getEmail();
  String phone = member.getPhone();
  String mobile = member.getMobile();
%><div class="tt-card tt-member">
  <div class="popover-body tt-card-body media">
    <jalios:memberphoto css="pull-left" member="<%= member %>" size="<%= PhotoSize.SMALL %>"/>
    <div class="media-body">
    <div class="tt-member-title"><jalios:link data="<%= member %>"/></div>
    <% if (Util.notEmpty(organizationAndDepartement)) { %>
    <div class='organization'><%= organizationAndDepartement %></div>
    <% } %>
    <% if (Util.notEmpty(jobTitle)) { %><div class='jobTitle'><%= jobTitle %></div><% } %>
	  <div class='spacer'></div>
	  <% if (isLogged && (member.isEmailVisible() || isAdmin)) { %>
		  <% if (Util.notEmpty(email)) { %><div class='email'><jalios:icon src="email" alt='<%= glp("ui.adm.mbr-edit.lbl.mail") %>' /> <a href="mailto:<%= email %>"><%= email %></a></div><% } %>
	    <% if (Util.notEmpty(phone)) { %><div class='phone'><jalios:icon src="telephone" alt='<%= glp("ui.adm.mbr-edit.lbl.phone") %>' /> <jalios:phone number="<%= phone %>" region="<%= member.getCountry() %>"/></div><% } %>
	    <% if (Util.notEmpty(mobile)) { %><div class='mobile'><jalios:icon src="phone" alt='<%= glp("ui.adm.mbr-edit.lbl.mobile") %>' /> <jalios:phone number="<%= mobile %>" region="<%= member.getCountry() %>"/></div><% } %>
	  <% } %>
	  
	  <jalios:include target="MEMBER_TOOLTIP_CONTENT" targetContext="bloc" />
    </div>
	</div>
  <div class='popover-footer tt-btn focus'>
    <jalios:link data="<%= member %>" css="btn btn-default"><%= glp("ui.com.foot.profile") %></jalios:link>
    <jalios:include target="MEMBER_TOOLTIP_FOOTER" targetContext="inline" />
  </div>
</div>