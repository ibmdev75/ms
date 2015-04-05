<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.date"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  int dsdDateSince = qh.getDateSinceInt();
  
  boolean check1Day    = dsdDateSince == 1;
  boolean check1Week   = dsdDateSince == 7;
  boolean check1Month  = dsdDateSince == 30;
  boolean check1Year   = dsdDateSince == 365;
  boolean checkAnytime = !(check1Day || check1Week || check1Month || check1Year);
  
  if (!checkAnytime){
    boxStatus = 1;
  }
%>
<jalios:accordion-panel title='<%= glp(lblPrefix + "date") %>' picture="calendar" active="<%= boxStatus != 2 %>">
    
    <div class="date-type br">
    <% 
      String   dateTypeInputId = "id=\"" + FACET_PREFIX + "dateType\"";
      String[] dateTypeValues  = new String[]{"cdate", "udate", "mdate", "pdate", "edate"};
      String[] dateTypeLabels  = new String[]{
        glp("ui.work.search.date.cdate"), 
        glp("ui.work.search.date.udate"),
        glp("ui.work.search.date.mdate"), 
        glp("ui.work.search.date.pdate"), 
        glp("ui.work.search.date.edate")
      };
    %>
    <jalios:field  name='<%= "dateType" %>' required='<%= true %>' value='<%= qh.getDateType()  %>' resource="field-vertical">
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(dateTypeValues).enumLabels(dateTypeLabels) %>' />
   </jalios:field>
   </div>
    <ul class="facet-list list-unstyled">
      <li>
        <% String  sinceAnytimeId = FACET_PREFIX+"_sinceAnytime"; %>
        <label for="<%= sinceAnytimeId %>">
          <input id="<%= sinceAnytimeId %>" type="radio" name="dateSince" value="" <%= checkAnytime ? "checked='checked'":"" %>/>
          <jalios:icon src="calendar" />
          <% /* %>Anytime<% */ %><%= glp("ui.work.search.date.since.anytime") %>
        </label>
      </li>
      <li <%= check1Day ? "class='checked'":"" %>>
        <% String  since1DayId = FACET_PREFIX+"_since1Day"; %>
        <label for="<%= since1DayId %>">
          <input id="<%= since1DayId %>" type="radio" name="dateSince" value="1" <%= check1Day ? "checked='checked'":"" %> />
          <jalios:icon src="calendar" />
          <% /* %>1 Day<% */ %><%= glp("ui.work.search.date.since.1day") %>
        </label>
      </li>
      <li <%= check1Week ? "class='checked'":"" %>>
        <% String  since1WeekId = FACET_PREFIX+"_since1Week"; %>
        <label for="<%= since1WeekId %>">
          <input id="<%= since1WeekId %>" type="radio" name="dateSince" value="7" <%= check1Week ? "checked='checked'":"" %> />
          <jalios:icon src="calendar" />
          <% /* %>1 Week<% */ %><%= glp("ui.work.search.date.since.1week") %>
        </label>
      </li>
      <li <%= check1Month ? "class='checked'":"" %>>
        <% String  since1MonthId = FACET_PREFIX+"_since1Month"; %>
        <label for="<%= since1MonthId %>">
          <input id="<%= since1MonthId %>" type="radio" name="dateSince" value="30" <%= check1Month ? "checked='checked'":"" %> />
          <jalios:icon src="calendar" />
          <% /* %>1 Month<% */ %><%= glp("ui.work.search.date.since.1month") %>
        </label>
      </li>
      <li <%= check1Year ? "class='checked'":"" %>>
        <% String  since1YearId = FACET_PREFIX+"_since1Year"; %>
        <label for="<%= since1YearId %>">
          <input id="<%= since1YearId %>" type="radio" name="dateSince" value="365" <%= check1Year ? "checked='checked'":"" %> />
          <jalios:icon src="calendar" />
          <% /* %>1 Year<% */ %><%= glp("ui.work.search.date.since.1year") %>
        </label>
      </li>
    </ul>

</jalios:accordion-panel>