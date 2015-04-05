<%--
  @Summary: FAQ display template
  @Category: Core Type / FAQ
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Faq obj = (Faq)request.getAttribute("publication");
boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView"));
boolean canEdit = !printView && channel.isDataWriteEnabled() && jcmsContext.isEditIcon() && loggedMember.canPublish(FaqEntry.class, workspace);
%>
<jsp:useBean id="formHandler" scope="page" class="custom.CustomEditFaqEntryHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="id"  value="<%= null %>" />
  <jsp:setProperty name="formHandler" property="faq" value="<%= obj.getId() %>" />
</jsp:useBean>
<%

if (canEdit && formHandler.validate()) {
  //request.setAttribute("redirect", "display.jsp?id=" + getDataIdParameter("id")); // TODO OD generalize
  //return;
}
%>

<div class="fullDisplay Faq">
  <%@ include file="/front/publication/doPublicationHeader.jspf" %>

  <% if (Util.notEmpty(obj.getDescription())) { %>
  <div class="description abstract">
    <jalios:wiki data="<%= obj %>" field="description"><%= obj.getDescription(userLang) %></jalios:wiki>
  </div>
  <% } %>

  <%-- *** FORM ************************************************** --%>
  <% if (canEdit) { %>
    <div class='newEntry editArea br <%= jcmsContext.showEditIcon() ? "" : "hidden" %>'>
      <a href="#add" data-jalios-action="toggle:hide" data-jalios-target=".Faq .faq-entry-add" class="btn btn-default"><jalios:icon src="add" alt="+" /> <%= glp("ui.faq.lbl.add-entry") %></a>
    </div>

    <% int formElementCount = 0; %>
    <form class="faq-entry-add br <%= hasParameter("opCreate") ? "" : " hide" %>" action="<%= JcmsUtil.getDisplayUrl() %>" method="post" name="editForm">
      <%@ include file="/jcore/doMessageBox.jspf" %>

      <%-- Question ------------------------------------------------------------ --%>
      <jalios:field name="title" label="ui.faq.lbl.question" required="true" ml="<%= channel.isMultilingual() %>" value="<%= formHandler.getAllAvailableTitleML() %>" resource="field-vertical">
        <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
      </jalios:field>

      <%-- Answer ------------------------------------------------------------ --%>
      <jalios:field name="answer" label="ui.faq.lbl.answer" ml="<%= channel.isMultilingual() %>" value="<%= formHandler.getAllAvailableAnswerML() %>" resource="field-vertical">
        <jalios:control settings='<%= new WikiAreaSettings().rows(10) %>' />
      </jalios:field>

      <button class="btn btn-primary" type="submit" name="opCreate" value="true"><%= glp("ui.com.btn.save") %></button>
      <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" />
      <input type="hidden" name="ws" value="<%= workspace.getId() %>" />
      <%
        ArrayList paramList = new ArrayList();
        paramList.add("title");
        paramList.add("answer");
        paramList.add("faq");
        paramList.add("opCreate");
        paramList.add("ws");
        paramList.add("redirect");
      %><%= printDisabledHiddenParams(request, paramList) %>
    </form>
  <% } %>

  <%-- *** QUESTION LIST ************************************* --%>
  <hr />

  <div class="list">
    <%
    boolean isPreview = getBooleanParameter("preview", false);
    DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
    DataSelector selector = isPreview ? authorizedSelector : new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
    %>
    <jalios:query name="entrySet"
                  dataset="<%= obj.getLinkIndexedDataSet(FaqEntry.class) %>"
                  comparator="<%=  new custom.CustomEditFaqEntryHandler.OrderComparator() %>"
                  selector="<%= selector %>"/>
    <% if (Util.notEmpty(entrySet)) { %>
      <ol>
      <jalios:foreach name="itEntry" type="FaqEntry" collection="<%= entrySet %>">
        <li>
          <% if (canEdit && !printView && entrySet.size() > 1) { %>
            <%
            String opUpURL = HttpUtil.getUrlWithCSRFToken("types/FaqEntry/editFaqEntry.jsp?opUp=true&amp;id=" + itEntry.getId(), request, true);
            String opDownURL = HttpUtil.getUrlWithCSRFToken("types/FaqEntry/editFaqEntry.jsp?opDown=true&amp;id=" + itEntry.getId(), request, true);
            %>
            <a href="<%= opUpURL %>" title="<%= glp("ui.com.alt.up") %>"><jalios:icon src="arrowup" /></a>
            <a href="<%= opDownURL %>" title="<%= glp("ui.com.alt.down") %>"><jalios:icon src="arrowdown" /></a>
          <% } %>
          <a href="<%= ServletUtil.getUrl(request) %>#<%= itEntry.getId() %>"><% /* %>Question<% */ %><%= itEntry.getTitle(userLang) %></a>
        </li>
      </jalios:foreach>
      </ol>
    <% } %>
  </div>

  <%-- *** QUESTION / ANSWSER LIST ************************************* --%>
  <jalios:foreach name="itEntry" type="FaqEntry" collection="<%= entrySet %>">
    <hr />

    <a class="anchor" id="<%= itEntry.getId() %>"></a>
    <div class='entry <%= itEntry.isInVisibleState() ? "pub-state" : "work-state" %>'>
      <div class="question">
      <h3>
        <%= itCounter %>. <%= itEntry.getTitle(userLang) %>
        <jalios:edit id="<%= itEntry.getId() %>" fields="title,answer" />
        <jalios:recommendation data="<%= itEntry %>"><jalios:icon title='<%= glp("ui.recommendation") %>' src="recommendation" alt='<%= glp("ui.recommendation") %>'  /></jalios:recommendation>
      </h3>
      </div>
      <div class="answer">
        <jalios:wiki data="<%= itEntry %>" field="answer"><%= itEntry.getAnswer(userLang) %></jalios:wiki>
      </div>
    </div>
  </jalios:foreach>
</div>
