<%@ page contentType="text/html; charset=UTF-8" %><%--
  @Summary: DBMailMessage Full Display
  @Category: Custom
  @Author: Sylvain DEVAUX
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page import="com.jalios.jcms.mail.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%!

static String collapseEmail = " data-jalios-action=\"toggle:block-email run:DBMailResizeIframe\" data-jalios-target='.wrapper' data-jalios-target-position='closest'";
static String showHideTitle = " title='" + HttpUtil.encodeForHTMLAttribute(JcmsUtil.glpd("types.DBMailMessage.ui.show-hide-mail-content")) + "'";
static String onClickReturn = " onclick='return false;'";

/**
 * Utility method to get beautiful email, or "".
 */
private static String getBeautifiedEmail(String email, boolean isColored) {
  return Util.isEmpty(email) ? "" : MailUtil.getBeautifiedEmail(email.replaceAll("'", ""), "email-label", "email", isColored);
}
private static String getToggleLink(String encodedText) {
  return "<a href='#' " + onClickReturn + collapseEmail + showHideTitle + ">" + encodedText + "</a>";
}
%><%
DBMailMessage obj = (DBMailMessage) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
if (!obj.canBeReadBy(loggedMember)) {
  return;
}
jcmsContext.addCSSHeader("css/jalios/mailmessage.css");
jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
jcmsContext.addJavaScript("types/DBMailMessage/mailmessage.js");
int docThumbnailPreviewWidth = 100;
int counter = Util.toInt(request.getAttribute("mailMessageCounter"), -1);
int totalCount = Util.toInt(request.getAttribute("mailMessageTotalCount"), -1);

%><jalios:include target="MAIL_MESSAGE_HEADER" /><%

boolean colorizeEmail = Util.toBoolean(request.getAttribute("beautiful-email-colorize"), true); // FIXME: to remove
String displayUrl  = obj.getDisplayUrl(userLocale);
String contentHtml = obj.getContentHtml(userLang);
String contentText = obj.getContentText(userLang);
String wrapperCSS  = Util.getString(request.getAttribute("wrapper"),"").trim();
       wrapperCSS += Util.notEmpty(contentHtml) ? " text-html" : "";
       wrapperCSS += " Mail_" + obj.getId();
Set<FileDocument> attachements = new TreeSet<FileDocument>();
// Remove non authorized Attachements (JCMS-3939)
attachements.addAll(obj.getAttachements());
attachements.removeAll(JcmsUtil.select(attachements, new ReverseDataSelector(Publication.getAuthorizedSelector(loggedMember)), null));


String bodyAbstract = Util.getString(HtmlUtil.html2text(contentHtml),contentText);
Collection<Member> toMemberSet = Util.cleanCollection(obj.getToMember());
Collection<Member> ccMemberSet = Util.cleanCollection(obj.getCcMember());
Collection<Member> bccMemberSet = Util.cleanCollection(obj.getBccMember());
Collection<String> toSet = Util.cleanCollection(obj.getTo());
Collection<String> ccSet = Util.cleanCollection(obj.getCc());
Collection<String> bccSet = Util.cleanCollection(obj.getBcc());
String msgId = obj.getMessageId();
String msgHtmlId = Util.buildID(obj.getMessageId());

Member fromMember = obj.getFromMember();
Member replyToMember = obj.getReplyToMember();
boolean hasContentText = Util.notEmpty(contentText);
boolean hasContentHtml = Util.notEmpty(contentHtml);

// Hook to show/hide HTML/Raw switch
boolean showSourceSwitch = hasContentText && hasContentHtml && Util.toBoolean(request.getAttribute("MailMessage-show-source-switch"), false);
boolean hasPriority = 0 != obj.getPriority();
%>


<%
// ---------------------------------------------------------------
// BUFFERs
// ---------------------------------------------------------------
%>

<jalios:buffer name='counterBuffer'>
  <% if (totalCount > 1) { %>
    <% String linkTitle = " title='" + encodeForHTMLAttribute(glp("ui.com.title.permalink")) + "'"; %>
    <jalios:link data='<%= obj %>' htmlAttributes='<%= linkTitle %>' css='noTooltipCard'><%= counter %></jalios:link>
  <% } %>
</jalios:buffer>

<jalios:buffer name='fromPhotoBuffer'>
  <% if (fromMember != null) { %>
    <jalios:memberphoto member="<%= fromMember %>" size="<%= PhotoSize.TINY %>" />
    <jalios:memberphoto member="<%= fromMember %>" size="<%= PhotoSize.ICON %>" />
  <% } else { %>
    <div class='wrapper-photo tiny-photo no-member-photo'>
      <img src="images/jalios/layout/silhouette.jpg" class="photo" alt="" width="<%= PhotoSize.TINY.getWidth() %>" />
    </div>
    <div class='wrapper-photo icon-photo no-member-photo'>
      <img src="images/jalios/layout/silhouette.jpg" class="photo" alt="" width="<%= PhotoSize.ICON.getWidth() %>" />
    </div>
  <% } %>
</jalios:buffer>

<jalios:buffer name='toFirstBuffer'>
  <% if (Util.notEmpty(toMemberSet)) { %>
    <%
    Member toFirstMember = toMemberSet.iterator().next();
    request.setAttribute("beautiful-email-member", toMemberSet.iterator().next());
    request.setAttribute("beautiful-email-print-photo", Boolean.TRUE);
    %>
    <%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %>
  <% } %>
  <% if (Util.notEmpty(toSet)) { %>
    <%
    request.setAttribute("beautiful-email-string", toSet.iterator().next());
    request.setAttribute("beautiful-email-print-photo", Boolean.TRUE);
    %>
    <%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %>
  <% } %>
</jalios:buffer>

<jalios:buffer name='rightCellBuffer'>
  <%
  // The following HTML will be included in a <a href>, in the very last cell.
  String priorityBadge = hasPriority ? ("<span title='"+encodeForHTMLAttribute(glp("types.DBMailMessage.fields.priority.label") + " " + glp("mail.priority." + obj.getPriority()))+"' class='badge priority badge-small priority-"+obj.getPriority()+"'>&nbsp;</span> ") : "";
  String shortTime = JcmsUtil.getFriendlyDate(obj.getSentDate(), DateFormat.SHORT, true, userLocale);
  %>
  <%= priorityBadge %>
  <time class='short-time'><%= shortTime %></time>
  <time class='short-no-time' title='<%= encodeForHTMLAttribute(shortTime) %>'><jalios:date date="<%= obj.getSentDate() %>" format="short"/></time>
</jalios:buffer>

<jalios:buffer name='abstractBuffer'><%
  String abs = Util.truncate(bodyAbstract,150);
  %><jalios:link data='<%= obj %>' htmlAttributes='<%= onClickReturn + collapseEmail + showHideTitle %>' css='noTooltipCard'><%
    %><span class='object<%= Util.isEmpty(abs) ?" empty-abstract":""%>'><%= encodeForHTML(Util.truncate(obj.getSubject(),150)) %><%= Util.isEmpty(abs) ? "" : "&nbsp;" %></span><%
    %><%= encodeForHTML(abs) %><%
  %></jalios:link><%
%></jalios:buffer>

<jalios:buffer name='shortAttachementsBuffer'>
  <% if (Util.notEmpty(attachements)) { %> 
    <span class='attachement'>
      <jalios:tooltip sprite='ss_attach'><%= glp("ui.incoming.mail.attachement",attachements.size()) %></jalios:tooltip>
    </span>
  <% } %>
</jalios:buffer>

<jalios:buffer name='attachmentsBuffer'> 
  <% if (Util.notEmpty(attachements)) { %> 
    <span class='attachement'>
      <jalios:tooltip sprite='ss_attach'><%= glp("ui.incoming.mail.attachement",attachements.size()) %></jalios:tooltip>
    </span>
  <% } %>
</jalios:buffer>

<jalios:buffer name='showHideBuffer'>
  <a href="#" class='show-details' <%= onClickReturn %> data-jalios-action="toggle:detailled-email" data-jalios-target='.wrapper' data-jalios-target-position='closest'
          title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.show-details")) %>'>
    <jalios:icon src='bullet-arrow-down' css='show-detail-icon' />
  </a>
  <a href="#" class='hide-details' <%= onClickReturn %> data-jalios-action="toggle:detailled-email" data-jalios-target='.wrapper' data-jalios-target-position='closest'
          title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.hide-details")) %>'>
    <jalios:icon src='bullet-arrow-up' css='hide-detail-icon' />
  </a>
</jalios:buffer>

<jalios:buffer name='editBuffer'>
  <jalios:edit data='<%= obj %>'/>
</jalios:buffer>

<jalios:buffer name='sourceSwitchBuffer'>
  <% if (showSourceSwitch) { %>
    <span class='mode'>
      <span class='html-display'><a href="<%= displayUrl %>" <%= onClickReturn %> title="<%= glp("ui.incoming.mail.html") %>" data-jalios-action="toggle:text-html" data-jalios-target='.wrapper' data-jalios-target-position='closest'><jalios:icon src='html' /></a></span>
      <span class='html-hide'><a href="<%= displayUrl %>" <%= onClickReturn %> title="<%= glp("ui.incoming.mail.text") %>" data-jalios-action="toggle:text-html" data-jalios-target='.wrapper' data-jalios-target-position='closest'><jalios:icon src='html-delete' /></a></span>
    </span>
  <% } %>
</jalios:buffer>

<jalios:buffer name='bodyTextBuffer'>
  <% if (Util.notEmpty(contentText)) { %>
    <div class="body-text">
      
        <pre><jalios:wiki span="true"><%= MailUtil.toggleReplies(encodeForHTML(contentText.trim()), "&gt;", glp("ui.incoming.mail.quote")) %></jalios:wiki></pre>
      
    </div>
  <% } %>
</jalios:buffer>

<jalios:buffer name='bodyHtmlBuffer'>
  <% if (Util.notEmpty(contentHtml)) { %>
    <% String iframeId = "mail-content-" + obj.getId(); %>
    <% String iframeSrc = "types/DBMailMessage/doDBMailMessageIframe.jsp?id=" + obj.getId(); %>
    <div class="body-html">
      <iframe id="<%= iframeId %>" width="100%" height="100%" frameborder="0" src="<%= iframeSrc %>"></iframe>
    </div>
  <% } %>
</jalios:buffer>

<jalios:buffer name='detailledBuffer'>
  <dl class="dl-horizontal">
    <%
    // ---------------------------------------------------------------
    // FROM
    // ---------------------------------------------------------------
    %>
    <jalios:if predicate='<%= (Util.notEmpty(fromMember) || Util.notEmpty(obj.getFrom())) %>'>
      <dt class='from' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.from")) %>'><%= glp("ui.incoming.mail.from") %></dt>
      <dd class='from beautiful-email'><%
        request.setAttribute("beautiful-email-member", fromMember);
        request.setAttribute("beautiful-email-string", obj.getFrom());
        %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %>
      </dd>
    </jalios:if>

    <%
    // ---------------------------------------------------------------
    // REPLY-TO
    // ---------------------------------------------------------------
    %>
    <jalios:if predicate='<%= (replyToMember != null || Util.notEmpty(obj.getReplyTo())) %>'>
      <dt class='reply-to' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.reply-to")) %>'><%= glp("ui.incoming.mail.reply-to") %></dt>
      <dd class='reply-to beautiful-email <%= replyToMember!=null ? "" : "unknown-member" %>'><%
        request.setAttribute("beautiful-email-member", replyToMember);
        request.setAttribute("beautiful-email-string", obj.getReplyTo());
        %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %>
      </dd>
    </jalios:if>

    <%
    // ---------------------------------------------------------------
    // TO
    // ---------------------------------------------------------------
    int cptTo = 0; 
    %>
    <jalios:if predicate='<%= (Util.notEmpty(toMemberSet) || Util.notEmpty(toSet)) %>'>
      <dt class='to' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.to")) %>'><%= glp("ui.incoming.mail.to") %></dt>
      <jalios:foreach collection="<%= toMemberSet %>" type="Member" name="itTo"><% cptTo++; %>
        <dd class='beautiful-email to <%= cptTo == 1 ? "to-first" : "" %>'><%
          request.setAttribute("beautiful-email-member", itTo);
          %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %><%
          %></dd>
      </jalios:foreach>
      <jalios:foreach collection="<%= toSet %>" type="String" name="itTo"><% cptTo++; %>
        <dd class='beautiful-email to unknown-member <%= cptTo == 1 ? "to-first" : "" %>'><%
          request.setAttribute("beautiful-email-string", itTo);
          %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %><%
        %></dd>
      </jalios:foreach>
    </jalios:if>

    <%
    // ---------------------------------------------------------------
    // CC
    // ---------------------------------------------------------------
    int cptCc = 0; 
    %>
    <jalios:if predicate='<%= Util.notEmpty(ccMemberSet) || Util.notEmpty(ccSet) %>'>
      <dt class='cc' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.cc")) %>'><%= glp("ui.incoming.mail.cc") %></dt>
      <jalios:foreach collection="<%= ccMemberSet %>" type="Member" name="itCc"><% cptCc++; %>
        <dd class='beautiful-email cc <%= cptCc == 1 ? "cc-first" : "" %>'><%
          request.setAttribute("beautiful-email-member", itCc);
          %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %><%
        %></dd>
      </jalios:foreach>
      <jalios:foreach collection="<%= ccSet %>" type="String" name="itCc"><% cptCc++; %>
        <dd class='beautiful-email cc unknown-member <%= cptCc == 1 ? "cc-first" : "" %>'><%
          request.setAttribute("beautiful-email-string", itCc);
          %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %><%
        %></dd>
      </jalios:foreach>
    </jalios:if>

    <%
    // ---------------------------------------------------------------
    // BCC
    // ---------------------------------------------------------------
    int cptBcc = 0; 
    %>
    <jalios:if predicate='<%= Util.notEmpty(bccMemberSet) || Util.notEmpty(bccSet) %>'>
      <dt class='bcc' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.bcc")) %>'><%= glp("ui.incoming.mail.bcc") %></dt>
      <jalios:foreach collection="<%= bccMemberSet %>" type="Member" name="itBcc"><% cptBcc++; %>
        <dd class='beautiful-email bcc <%= cptBcc == 1 ? "bcc-first" : "" %>'><%
          request.setAttribute("beautiful-email-member", itBcc);
          %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %><%
        %></dd>
      </jalios:foreach>
      <jalios:foreach collection="<%= bccSet %>" type="String" name="itBcc"><% cptBcc++; %>
        <dd class='beautiful-email bcc <%= cptBcc == 1 ? "bcc-first" : "" %>'><%
          request.setAttribute("beautiful-email-string", itBcc);
          %><%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %><%
        %></dd>
      </jalios:foreach>
    </jalios:if>

    <%
    // ---------------------------------------------------------------
    // DATE
    // ---------------------------------------------------------------
    %>
    <jalios:if predicate='<%= Util.notEmpty(obj.getSentDate()) %>'>
      <dt class='date' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.date")) %>'><%= glp("ui.incoming.mail.date") %></dt>
      <dd class='date'><jalios:date date="<%= obj.getSentDate() %>"/> <%= glp("ui.incoming.mail.at") %> <jalios:time date="<%= obj.getSentDate() %>"/></dd>
    </jalios:if>

    <%
    // ---------------------------------------------------------------
    // SUBJECT
    // ---------------------------------------------------------------
    %>
    <dt class='subject' title='<%= encodeForHTMLAttribute(glp("ui.incoming.mail.subject")) %>'><%= glp("ui.incoming.mail.subject") %></dt>
    <dd><%= encodeForHTML(obj.getSubject()) %></dd>

    <%
    // ---------------------------------------------------------------
    // PRIORITY
    // ---------------------------------------------------------------
    %>
    <% if (hasPriority) { %>
      <dt class='priority priority-<%= obj.getPriority() %>' title='<%= encodeForHTMLAttribute(glp("types.DBMailMessage.fields.priority.label")) %>'><%= glp("types.DBMailMessage.fields.priority.label") %></dt>
      <dd class='priority-<%= obj.getPriority() %>'><%= glp("mail.priority." + obj.getPriority()) %></dd>
    <%} %>
  </dl>
</jalios:buffer>

<%
// ---------------------------------------------------------------
// HTML Start
// ---------------------------------------------------------------
String rightCellLink = getToggleLink(rightCellBuffer.toString());
%>

<div class='mail-message' id='<%= msgHtmlId %>'>
  <div class="wrapper <%= wrapperCSS %>">
    <div class='header'>
      <%
      // ---------------------------------------------------------------
      // INLINE VIEW
      // ---------------------------------------------------------------
      %>
      <div class='visible-inline'>
        <table>
          <tr>
            <td class='count-column toggle-cell'>
              <%= counterBuffer.toString() %>
            </td>
            <td class='left-column fit'>
              <%= fromPhotoBuffer.toString() %>
            </td>
            <td class='from fit'>
              <div class='from beautiful-email'>
                <%
                request.setAttribute("beautiful-email-member", fromMember);
                request.setAttribute("beautiful-email-string", obj.getFrom());
                request.setAttribute("beautiful-email-print-photo", Boolean.FALSE);
                %>
                <%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %>
              </div>
            </td>
            <td class='abstract toggle-cell'>
              <%= abstractBuffer.toString() %>
            </td>
            <td class='right-column toggle-cell'>
              <%= attachmentsBuffer.toString() %>
              <%= rightCellLink %>
            </td>
          </tr>
        </table>
      </div><%-- end visible-inline --%>

      <%
      // ---------------------------------------------------------------
      // BLOCK VIEW
      // ---------------------------------------------------------------
      %>
      <div class='visible-block'>
        <table>
          <%-- MAIN INFORMATIONS ROW --%>
          <tr>
            <td class='count-column toggle-cell'>
              <%= counterBuffer.toString() %>
            </td>
            <td class='left-column fit'>
              <%= fromPhotoBuffer.toString() %>
            </td>
            <td class='from fit'>
              <div class='from beautiful-email'>
                <%
                request.setAttribute("beautiful-email-member", fromMember);
                request.setAttribute("beautiful-email-string", obj.getFrom());
                request.setAttribute("beautiful-email-print-photo", Boolean.FALSE);
                %>
                <%@ include file='/types/DBMailMessage/doBeautifulMail.jspf' %>
              </div>
            </td>
            <td class='abstract toggle-cell'>
              <%= getToggleLink("") %>
            </td>
            <td class='right-column toggle-cell'>
              <%= attachmentsBuffer.toString() %>
              <%= rightCellLink %>
            </td>
          </tr>
          <%-- SECOND INFORMATIONS ROW --%>
          <tr class='second-row-infos'>
            <td class='count-column toggle-cell'>&nbsp;</td>
            <td class='left-column fit'>&nbsp;</td>
            <td class='to' colspan="3">
              <div class='to beautiful-email'>
                <span><%= glp("ui.incoming.mail.to") %></span>
                <%= toFirstBuffer.toString() %>
              </div>
              <% if (showSourceSwitch){ %>
                <div class='toggle-format'>
                  <%= sourceSwitchBuffer.toString() %>
                </div>
              <% } %>
              <div class='toggle-details'>
                <%= showHideBuffer.toString() %>
              </div>
            </td>
          </tr>
          <%
          // ---------------------------------------------------------------
          // DETAILLED VIEW
          // ---------------------------------------------------------------
          %>
          <tr class='email-details visible-detailled'>
            <td class='count-column toggle-cell'>&nbsp;</td>
            <td class='left-column fit'>&nbsp;</td>
            <td class='to' colspan="3">
              <%= detailledBuffer.toString() %>
            </td>
          </tr>
        </table>

      </div><%-- end visible-block --%>
    </div><%-- end header --%>

    <%
    // ---------------------------------------------------------------
    // MAIL BODY
    // ---------------------------------------------------------------
    %>
    <div class='mail-content'>
      <% if (Util.notEmpty(contentText)) { %>
        <%= bodyTextBuffer.toString() %>
      <% } %>
      <% if (Util.notEmpty(contentHtml)) { %>
        <%= bodyHtmlBuffer.toString() %>
      <% } %>

      <%
      // ---------------------------------------------------------------
      // ATTACHEMENTS
      // ---------------------------------------------------------------
      %><%@ include file='doDBMailMessageAttachements.jspf' %>
    </div>

  </div><%-- end wrapper --%>
</div>
<jalios:include target="MAIL_MESSAGE_FOOTER" />