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
// session.setAttribute("typeElt", channel.getTypeEntry(generated.DBComment.class).getXmlElement());

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");

int limit = 30; // Oracle tables are limited to 30 chars

String table = Util.truncate("G_" + className.toUpperCase(), limit, ""); 

String tablePrefix = table + "_"; 

String indexPrefix = "IG_" + className.toUpperCase() + "_";

//Get the fields (and the inherited fields)                             
ArrayList fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);

boolean isForm = typeElt.getAttribute("formAuthor") != null;

boolean isContent = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.Content.class);
boolean isUserContent = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.UserContent.class);

boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);

boolean openRole = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);

boolean addReadRights = isContent;
boolean addVersion = isContent;

String[] customInterfaces = Util.split(Util.getString(typeElt.getAttributeValue("interfaces"), ""), ", ");

if (!addVersion) {
  if (Util.toBoolean(typeElt.getAttributeValue("revision"), false)) {
	  addVersion = true;
  } else {
	  for(String customInterface: customInterfaces) {
	    if (customInterface.endsWith(".HistorizedDBData")) {
	      addVersion = true;
	      break;
	    }
	  }
  }
}

boolean addCategories = isContent;
if (!addCategories) {
  for(String customInterface: customInterfaces) {
    if (customInterface.endsWith(".CategorizedDBData")) {
      addCategories = true;
      break;
    }
  }
  
  TypeFieldEntry[] allTFE = channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className);
  for(TypeFieldEntry fieldEntry: allTFE) {
    String editor = fieldEntry.getEditor();    
    if ("category".equals(editor)) {
      addCategories = true;
      break;      
    }
  }
}

boolean addReaderTracker = isContent;
if (!addReaderTracker) {
  for(String customInterface: customInterfaces) {
    if (customInterface.endsWith(".TrackedDBData")) {
      addReaderTracker = true;
      break;
    }
  }  
}
List fieldEntryList = Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
%>
  <class name="generated.<%= className %>" table="<%= table %>">
    <cache usage="read-write" />  
    <id name="rowId" column="rowId">
      <generator class="native"/>
    </id>
    <property name="cdate" not-null="true" />
    <property name="mdate" not-null="true" index="<%= Util.truncate(indexPrefix + "MDATE", limit, "")  %>" />
    <property name="authorId" length="32" index="<%= Util.truncate(indexPrefix + "AUTHORID", limit, "")  %>" />
    
    <property name="pstatus" not-null="true" index="<%= Util.truncate(indexPrefix + "PSTATUS", limit, "") %>" />
    <property name="workspaceId" not-null="true" length="32" index="<%= Util.truncate(indexPrefix + "WSID", limit, "") %>" />
    
<% if (isContent) { %>
    <property name="pdate"  index="<%= Util.truncate(indexPrefix + "PDATE", limit, "")  %>" />
<% } else { %>
    <property name="pdate" />
<% } %>
    <property name="edate" />
    <property name="adate" />
    <property name="title" />
    <property name="workflowId" not-null="false" length="32" index="<%= Util.truncate(indexPrefix + "WFID", limit, "") %>" />
<% if (addVersion) { %>
    <property name="udate" />
    <property name="majorVersion" />
    <property name="minorVersion" />
<% } %>
<% if (isContent) { %>
    <property name="hasNoReadRights" index="<%= Util.truncate(indexPrefix + "HASNOREADRIGHTS", limit, "") %>" />
<% } %>
<% if (addReaderTracker) { %>
    <property name="tracked" />
    <property name="readerCount" index="<%= Util.truncate(indexPrefix + "READERCOUNT", limit, "") %>" />
<% } %>
<% if(isUserContent || isContent){ %>
    <property name="voteCount" not-null="false" index="<%= Util.truncate(indexPrefix + "VOTECOUNT", limit, "") %>" />
    <property name="voteScore" not-null="false" index="<%= Util.truncate(indexPrefix + "VOTESCORE", limit, "") %>" />
<% } %>
<% if (isDBFileDocument) { %>
    <property name="filename" index="<%= Util.truncate(indexPrefix + "FILENAME", limit, "") %>" />
    <property name="originalFilename" />
    <property name="contentType" />
    <property name="uploadDate" />
    <property name="pdfUploadDate" />
<% } %>    
<% if (isForm) { %>
    <property name="submitMemberId" index="<%= Util.truncate(indexPrefix + "SUBMID", limit, "") %>" />
    <property name="submitRemoteAddr" />
<% } %>
<% if (openRole) { %>
    <property name="roleMapStr" type="text" length="65536" />
<% } %>    
<jalios:foreach collection="<%= fieldEntryList %>" name="itField" type="TypeFieldEntry">
<% 
String name       = itField.getName();
String editor     = itField.getEditor();
String type       = itField.getType();
boolean isAnyLink = itField.isAnyLink();

boolean isLargeText = "textarea".equals(editor) || "wysiwyg".equals(editor);


String indexName = Util.truncate(indexPrefix + name.toUpperCase(), limit, "");

String attributes = "";
if (isLargeText) { 
  attributes = " type=\"text\" length=\"65536\"";
}
else if (isAnyLink) {
  attributes = " length=\"64\" index=\"" + indexName + "\"";
}

String propertyName = isAnyLink ? name + "Id" : name;

if (!editor.equals("category")) {
%>
<%-- SCALAR --%>
<%   if (itField.isTypeScalar()) { %>
    <property name="<%= propertyName %>"<%= attributes %> />
    <% if(editor.equals("sqlquery")) { %>
    <property name="<%= propertyName %>DataSource" />
    <property name="<%= propertyName %>MaxRows" />
    <% } %>
<%-- LIST/SET --%>
<%   } else { %>
<%
String collection = itField.isTypeList() ? "list" : "set";
String collectionTable = Util.truncate(tablePrefix + name.toUpperCase(), limit, "");
String collectionType = isLargeText ? "text" : itField.getCollectionTypeMapping();
%>
    <<%= collection %> name="<%= propertyName %>" table="<%= collectionTable %>">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= Util.truncate(indexName, limit - 2, "") + "_I" %>"/>
      </key>      
<%   if (itField.isTypeList()) { %>
      <list-index column="POSITION" />
<%   } %>
      <element type="<%= collectionType %>"<%= isLargeText ? " length=\"65536\"" : "" %>>
        <column name="VALUE"<%= isAnyLink ? " length=\"64\" index=\"" + indexName + "\"" : "" %>/>
      </element>      
    </<%= collection %>>
<%   } %>
<% } %>
</jalios:foreach>

<% if (addCategories) { %>
    
    <!--  COLLECTIONS FOR CATEGORIES -->
    <set name="catIdSet" table="<%= Util.truncate(tablePrefix + "CATSET", limit, "") %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= Util.truncate(indexPrefix + "CATSET_I", limit, "") %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= Util.truncate(indexPrefix + "CATSET", limit, "") %>"/>
      </element>      
    </set>
    
    <set name="allCatIdSet" table="<%= Util.truncate(tablePrefix + "ALLCATSET", limit, "") %>"  lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= Util.truncate(indexPrefix + "ALLCATSET_I", limit, "") %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= Util.truncate(indexPrefix + "ALLCATSET", limit, "") %>"/>
      </element>      
    </set>
<% } %>

<% if (addReadRights) { %>
    
    <!--  COLLECTIONS FOR READ-RIGHTS -->
    <set name="authGrpIdSet" table="<%= Util.truncate(tablePrefix + "AUTHGRPSET", limit, "") %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= Util.truncate(indexPrefix + "AUTHGRPSET_I", limit, "") %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= Util.truncate(indexPrefix + "AUTHGRPSET", limit, "") %>"/>
      </element>      
    </set>    
    
    <set name="authMbrIdSet" table="<%= Util.truncate(tablePrefix + "AUTHMBRSET", limit, "") %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= Util.truncate(indexPrefix + "AUTHMBRSET_I", limit, "") %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= Util.truncate(indexPrefix + "AUTHMBRSET", limit, "") %>"/>
      </element>      
    </set>
<% } %>

  </class>
</hibernate-mapping>
