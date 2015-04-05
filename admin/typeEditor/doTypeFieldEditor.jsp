<%--
  @Summary: Type Field Editor
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: False
  @Deprecated: False
  @Since: jcms-4.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcms.handler.TypeEditorHandler" %>

<% 
TypeEditorHandler formHandler = (TypeEditorHandler)request.getAttribute("formHandler"); 
String fieldType         = formHandler.getFieldType();
String fieldEditor       = formHandler.getFieldEditor();

boolean isFieldMV        = formHandler.isFieldMV();
boolean isString         = formHandler.isFieldString();
boolean isDate           = formHandler.isFieldDate();
boolean isInteger        = formHandler.isFieldInteger();
boolean isDouble         = formHandler.isFieldDouble();
boolean isBoolean        = formHandler.isFieldBoolean();
boolean isFileDocument   = formHandler.isFieldFileDocument();

boolean isEnumerate      = formHandler.isFieldEnumerate();

boolean isDatabase       = formHandler.isDatabase();

boolean isSQLQuery       = formHandler.isFieldSQLQuery();
boolean isDBRecord       = formHandler.isFieldDBRecord();
boolean isSQLResult      = formHandler.isFieldSQLResult();
boolean isText           = formHandler.isFieldText();
boolean isImage          = formHandler.isFieldImage();
boolean isURL            = formHandler.isFieldURL();
boolean isEditable       = formHandler.isFieldEditable();

boolean showDescription  = isEditable;
boolean showTab          = isEditable;
boolean showRequired     = isEditable && !fieldEditor.equals("boolean") && !fieldEditor.equals("boolean[]") && !fieldEditor.equals("int") && !fieldEditor.equals("int[]") && !fieldEditor.equals("double") && !fieldEditor.equals("double[]");
boolean showMultivalued  = isEditable;
boolean showMultilingual = isEditable && channel.isMultilingual() && !isSQLQuery && !isDBRecord && !isDatabase && !fieldEditor.equals("enumerate") && !fieldEditor.equals("query") && (fieldType.equals("String") || fieldType.equals("String[]") || isFileDocument);
boolean showAbstract     = (fieldType.equals("String") || fieldType.equals("String[]")) && !isSQLQuery && !fieldEditor.equals("query") && !isDBRecord;
boolean showDataImage    = !formHandler.isPortletEditor() &&
                           (fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) || fieldType.equals("com.jalios.jcms.FileDocument"));
boolean showHidden       = isEditable;
boolean showEnum         = isEnumerate;
boolean showSearchable   = showAbstract;
boolean showParentLink   = fieldEditor.equals("link");
boolean showDataSource   = isSQLQuery || isSQLResult || isDBRecord;
boolean showMaxRows      = isSQLQuery || isSQLResult || isDBRecord;


boolean showDisplayProperties = isImage || isURL || isDate;

org.jdom.Element fieldElt = formHandler.getFieldElt();

int labelWidth = 160;
%>

<%-- *** TITLE EDITOR ******************************************* --%>
<% if (formHandler.isEditTitle()) { %>
<%@ include file='/admin/typeEditor/doTypeFieldEditor_title.jspf' %>

<%-- *** SUPER EDITOR ******************************************* --%>
<% } else if (formHandler.getFieldElt() != null && "super".equals(fieldType)) { %>
<%@ include file='/admin/typeEditor/doTypeFieldEditor_super.jspf' %>

<%-- *** OTHER FIELD EDITOR ******************************************* --%>
<% } else if (fieldElt != null) { %>
<%@ include file='/admin/typeEditor/doTypeFieldEditor_field.jspf' %>
<% } %>
