<%@ include file='/jcore/doInitPage.jspf'%>
<%
  CSVExportRawDataHandler handler = (CSVExportRawDataHandler) jcmsContext.getAjaxRequestAttribute("exportRawData.currentHandler");
%>

<%@page import="com.csvreader.CsvWriter"%>

  <jalios:field label="exportRawData.handler.csv.fieldSeparator.title" name='<%= "csvConfigurationFieldSeparator" %>' required='<%= true %>' value='<%= handler.getCsvConfigurationFieldSeparator() %>'>
    <jalios:control settings='<%= new EnumerateSettings().select().enumValues(",",";").enumLabels(",",";") %>' />
  </jalios:field>
  <input type="hidden" value="&quot;" id="csvConfigurationTextQualifier" name="csvConfigurationTextQualifier" />
  <jalios:field label="exportRawData.handler.csv.escapeMode.title"  name='<%= "csvConfigurationEscapeMode" %>' required='<%= true %>'  value='<%= handler.getAvailableCsvConfigurationEscapeMode() %>' >
    <jalios:control settings='<%= new EnumerateSettings().select()
                                        .enumValues(Integer.toString(CsvWriter.ESCAPE_MODE_BACKSLASH), Integer.toString(CsvWriter.ESCAPE_MODE_DOUBLED))
                                        .enumLabels("exportRawData.handler.csv.escapeMode.backslash", "exportRawData.handler.csv.escapeMode.doubled") %>' />
  </jalios:field>