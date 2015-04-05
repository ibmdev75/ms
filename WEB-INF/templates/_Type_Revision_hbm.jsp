<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
        "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
        "classpath://org/hibernate/hibernate-mapping-3.0.dtd">

<hibernate-mapping>
<%-- 
--%><%@ page contentType="text/plain; charset=UTF-8"%><%--
--%><%@ page buffer="none" autoFlush="true"%><%--
--%><%@ taglib uri="jcms.tld" prefix="jalios" %><%--
--%><%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %><%--
--%><%
  request.setCharacterEncoding("UTF-8");
  
final Channel channel = Channel.getChannel();

// Uncomment this to test template under JCMS without the need to restart
// session.setAttribute("typeElt", channel.getTypeEntry(generated.DBTestType.class).getXmlElement());

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");
String revisionClassName = className + "Revision";
boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);
boolean openRole = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);

int limit = 30; // Oracle tables are limited to 30 chars

String table = Util.truncate("G_" + revisionClassName.toUpperCase(), limit, ""); 

String tablePrefix = table + "_"; 

String indexPrefix = "IG_" + revisionClassName.toUpperCase() + "_";

//Get the fields (and the inherited fields)                             
List fieldEntryList = new ArrayList(Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry itTFE = (TypeFieldEntry)it.next();
  String editor = itTFE.getEditor();
  if (Util.isEmpty(editor) || "category".equals(editor)) {
    it.remove();
  }
}
%>
  <class name="generated.<%= revisionClassName %>" table="<%= table %>">
    <cache usage="read-write" />  
    <id name="rowId" column="rowId">
      <generator class="native"/>
    </id>
    <property name="revDate" not-null="true" index="<%= Util.truncate(indexPrefix + "REVDATE", limit, "")  %>" />
    <property name="revAuthorId" length="32" />
    <property name="revDataId" column="revDataId" not-null="true" index="<%= Util.truncate(indexPrefix + "REVDATAID", limit, "")  %>" />
    <property name="revOp" column="revOp" />
    <property name="revDelegateId"/>    
    

    <property name="cdate" />
    <property name="mdate"  />
    <property name="authorId" length="32" />
    
    <property name="pstatus" />
    <property name="workspaceId" not-null="true" length="32" />
    <property name="pdate" />
    <property name="edate" />
    <property name="adate" />
    <property name="udate" />
    <property name="majorVersion" />
    <property name="minorVersion" />    
    <property name="tracked" />     
    <property name="catIdSetSerial" />
    <property name="authGrpIdSetSerial" />
    <property name="authMbrIdSetSerial" />       
   
<% if (isDBFileDocument) { %>
    <property name="filename" />
    <property name="originalFilename" />
    <property name="contentType"  />
    <property name="uploadDate" />
<% } %>    
   
<% if (openRole) { %>
    <property name="roleMapStr" type="text" length="65536"/>
<% } %>    
    <property name="title" />
    
<jalios:foreach collection="<%= fieldEntryList %>" name="itField" type="TypeFieldEntry">
<% 
String name       = itField.getName();
String editor     = itField.getEditor();
String type       = itField.getType();
boolean isAnyLink = itField.isAnyLink();
boolean isScalar  = itField.isTypeScalar();

boolean isLargeText = "textarea".equals(editor) || "wysiwyg".equals(editor);

String attributes = "";
if (isLargeText) { 
  attributes = " type=\"text\" length=\"65536\"";
}
else if (isScalar && isAnyLink) {
  attributes = " length=\"64\"";
}

String propertyName = isAnyLink ? name + "Id" : name;
%>
<%-- SCALAR --%>
<% if (isScalar) { %>
    <property name="<%= propertyName %>"<%= attributes %>/>
<%-- LIST/SET --%>
<% } else { %>
    <property name="<%= propertyName %>Serial"<%= attributes %>/>
<% } %>
</jalios:foreach>
  </class>
</hibernate-mapping>
