<%@ include file="/jcore/field/control/doInitControl.jspf" %>
<%
String dataSource = getOption(SqlQuerySettings.DATA_SOURCE, null);
int maxRows = getOption(SqlQuerySettings.MAX_ROWS, 0);
String sqlQueryDisabled = Util.toBoolean(fieldDisabled, false) ? "disabled='disabled'" : "";
addOption(BasicSettings.CSS, "sqlquery-query br " + getOption(BasicSettings.CSS, ""));
%>
<jalios:buffer name="sqlQueryOptions">
  <div class="navbar navbar-default navbar-table-header">
    <div class="container-fluid">
      <div class="navbar-form navbar-left">
        <select name="<%= fieldName %>DataSource" class="sqlquery-ds form-control form-control-inline" <%= sqlQueryDisabled %>>
          <%
          for (Iterator<String> it = DBUtil.getDataSourceMap().keySet().iterator(); it.hasNext();) {
            String itDataSource = it.next();
            String selected = itDataSource.equals(dataSource) ? " selected='selected'" : "";
            %><option value="<%= itDataSource %>"<%= selected %>><%= channel.getDataSourceLabel(itDataSource, userLang) %></option><%
          }
          %>
        </select>
        <input type="text" name="<%= fieldName %>MaxRows" class="sqlquery-maxrows form-control form-control-inline" value="<%= maxRows %>" <%= sqlQueryDisabled %> />
      </div>
      <div class="navbar-form navbar-right">
        <button class="btn btn-default" data-jalios-action="sqlquery"><%= glp("ui.work.form.btn.test-sql") %></button>
      </div>
    </div>
  </div>
</jalios:buffer>
<%
includeLocalObject("TEXTAREA_PREPEND", sqlQueryOptions);

jcmsContext.addJavaScript("js/jalios/widget/sqlquery.js");
%>
<%@ include file="/jcore/field/control/doTextArea.jspf" %>