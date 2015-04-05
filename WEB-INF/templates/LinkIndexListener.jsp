<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");
  
List typeList = (List)session.getAttribute("typeList");
List extendedTypes = (List)session.getAttribute("extendedTypeList");
// Extract Type that have at least one link or link[] field
List linkTypeList = new ArrayList();
Set dblinkSet = new HashSet();
for(Iterator it1 = typeList.iterator(); it1.hasNext();) {
  Element itType = (Element)it1.next();
  
  // Skip DBData
  if (Util.toBoolean(itType.getAttributeValue("database"),false)) {
    continue;
  }
  
  List fieldList = new ArrayList();
  TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
  for(Iterator it2 = fieldList.iterator(); it2.hasNext();) {
    Element itField = (Element)it2.next();
    String editor = itField.getAttributeValue("editor");
    boolean isLinkEditor = editor != null && editor.startsWith("member") || editor.startsWith("group") || editor.startsWith("link");
    if (isLinkEditor) {
      linkTypeList.add(itType);
      break;
    }
  }
}
%>
// This file was automatically generated. Please, do not edit.
// Generation date : <%= new Date() %>
package generated;

import java.util.TreeMap;

import com.jalios.jcms.AbstractLinkIndexListener;
import com.jalios.jstore.Storable;

@SuppressWarnings({"unchecked"})
public class LinkIndexListener extends AbstractLinkIndexListener {
  
  public LinkIndexListener(TreeMap index) {
    super(index);
  }
  
  public void handleCreate(Storable storable, boolean firstTime) {
<jalios:foreach collection='<%= linkTypeList %>' name="itType" type="org.jdom.Element">
<% 
String typeName = itType.getAttributeValue("name"); 
List fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
%>
    // <%= typeName %>
    if (storable instanceof <%= typeName %>) {
      <%= typeName %> obj = (<%= typeName %>)storable;
      
<jalios:foreach collection='<%= fieldList %>' name="itField" type="org.jdom.Element" counter="itCounter2">
<%
  String fieldType = itField.getAttributeValue("type");
  String fieldName = itField.getAttributeValue("name");
  String fieldNameCap = Util.recapitalize(fieldName);
  String fieldEditor = itField.getAttributeValue("editor");
  boolean fieldML = Util.toBoolean(itField.getAttributeValue("ml"), false);
  
  String fieldTypeShort = fieldType;
  if (fieldTypeShort.endsWith("[]")) {
    fieldTypeShort = fieldTypeShort.substring(0, fieldTypeShort.length() - 2);
  }
  
  String getterParam="";
  boolean isDBLink = TypeUtil.isDBType(itType.getParentElement(), fieldTypeShort);
  if (isDBLink) {
    getterParam="false";
  }
%>

<jalios:if predicate='<%= fieldEditor.startsWith("link") || fieldEditor.startsWith("member") || fieldEditor.startsWith("group") %>'>
      // <%= fieldName %>
      add(obj, obj.get<%= fieldNameCap %>(<%= getterParam %>), "<%= fieldName %>");
<jalios:if predicate='<%= fieldML %>'>
      add(obj, obj.get<%= fieldNameCap %>ML(), "<%= fieldName %>");
</jalios:if>
</jalios:if>

</jalios:foreach>
    }
</jalios:foreach>
  }
  
  public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {
<jalios:foreach collection='<%= linkTypeList %>' name="itType" type="org.jdom.Element">
<% 
String typeName = itType.getAttributeValue("name"); 
List fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
%>
    // <%= typeName %>    
    if (storable instanceof <%= typeName %>) {
      <%= typeName %> obj = (<%= typeName %>)storable;
      <%= typeName %> oldObj = (<%= typeName %>)oldStorable;
      
<jalios:foreach collection='<%= fieldList %>' name="itField" type="org.jdom.Element" counter="itCounter2">
<%
  String fieldType    = itField.getAttributeValue("type");
  String fieldName    = itField.getAttributeValue("name");
  String fieldNameCap = Util.recapitalize(fieldName);
  String fieldEditor  = itField.getAttributeValue("editor");
  boolean fieldML     = Util.toBoolean(itField.getAttributeValue("ml"), false);
  
  String fieldTypeShort = fieldType;
  if (fieldTypeShort.endsWith("[]")) {
    fieldTypeShort = fieldTypeShort.substring(0, fieldTypeShort.length() - 2);
  }
  
  String getterParam="";
  boolean isDBLink =  TypeUtil.isDBType(itType.getParentElement(), fieldTypeShort);
  if (isDBLink) {
    getterParam="false";
  }
%>

<jalios:if predicate='<%= fieldEditor.startsWith("link") || fieldEditor.startsWith("member") || fieldEditor.startsWith("group") %>'>
      // <%= fieldName %>
      if (obj.get<%= fieldNameCap %>(<%= getterParam %>) != oldObj.get<%= fieldNameCap %>(<%= getterParam %>)) {
        remove(obj, oldObj.get<%= fieldNameCap %>(<%= getterParam %>), "<%= fieldName %>");
        add(obj, obj.get<%= fieldNameCap %>(<%= getterParam %>), "<%= fieldName %>");
      }
<jalios:if predicate='<%= fieldML %>'>
      if (obj.get<%= fieldNameCap %>ML() != oldObj.get<%= fieldNameCap %>ML()) {
        remove(obj, oldObj.get<%= fieldNameCap %>ML(), "<%= fieldName %>");
        add(obj, obj.get<%= fieldNameCap %>ML(), "<%= fieldName %>");
      }
</jalios:if>
</jalios:if>

</jalios:foreach>
    }
</jalios:foreach>
  }
  
  public void handleDelete(Storable storable, boolean firstTime) {
<jalios:foreach collection='<%= linkTypeList %>' name="itType" type="org.jdom.Element">
<% 
String typeName = itType.getAttributeValue("name"); 
List fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
%>
    // <%= typeName %>   
    if (storable instanceof <%= typeName %>) {
      <%= typeName %> obj = (<%= typeName %>)storable;
    
<jalios:foreach collection='<%= fieldList %>' name="itField" type="org.jdom.Element" counter="itCounter2">
<%
  String fieldType    = itField.getAttributeValue("type");
  String fieldName    = itField.getAttributeValue("name");
  String fieldNameCap = Util.recapitalize(fieldName);
  String fieldEditor  = itField.getAttributeValue("editor");
  boolean fieldML     = Util.toBoolean(itField.getAttributeValue("ml"), false);
  
  String fieldTypeShort = fieldType;
  if (fieldTypeShort.endsWith("[]")) {
    fieldTypeShort = fieldTypeShort.substring(0, fieldTypeShort.length() - 2);
  }
  
  String getterParam="";
  boolean isDBLink =  TypeUtil.isDBType(itType.getParentElement(), fieldTypeShort);
  if (isDBLink) {
    getterParam="false";
  }
%>

<jalios:if predicate='<%= fieldEditor.startsWith("link") || fieldEditor.startsWith("member") || fieldEditor.startsWith("group") %>'>
      // <%= fieldName %>
      remove(obj, obj.get<%= fieldNameCap %>(<%= getterParam %>), "<%= fieldName %>");
<jalios:if predicate='<%= fieldML %>'>
      remove(obj, obj.get<%= fieldNameCap %>ML(), "<%= fieldName %>");
</jalios:if>
</jalios:if>

</jalios:foreach>
    }    
</jalios:foreach>
  }
  
}
<% out.flush(); %>

