<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");
  
List typeList = (List)session.getAttribute("typeList");
List extendedTypes = (List)session.getAttribute("extendedTypeList");

// Extract Type that have at least one file field
List fileTypeList = new ArrayList();
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
    if (editor != null && (editor.equals("image") || editor.equals("media"))) {
      fileTypeList.add(itType);
      break;
    }
  }
}
%>
// This file was automatically generated. Please, do not edit.
// Generation date : <%= new Date() %>
package generated;

import java.util.Map;
import java.util.HashMap;

import com.jalios.jcms.AbstractFileIndexListener;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jstore.Storable;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public class FileIndexListener extends AbstractFileIndexListener {
  
  public FileIndexListener(HashMap index) {
    super(index);
  }
  
  public void handleCreate(Storable storable, boolean firstTime) {
    if (storable instanceof FileDocument) {
      FileDocument obj = (FileDocument)storable;
      add(obj.getFilename(), obj);
    }
    
<jalios:foreach collection='<%= fileTypeList %>' name="itType" type="org.jdom.Element">
<% 
String typeName = itType.getAttributeValue("name"); 
List fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
%>
    
    if (storable instanceof <%= typeName %>) {
      <%= typeName %> obj = (<%= typeName %>)storable;
      String[] array = null;
      
<jalios:foreach collection='<%= fieldList %>' name="itField" type="org.jdom.Element" counter="itCounter2">
<%
  String fieldType = itField.getAttributeValue("type");
  String fieldName = itField.getAttributeValue("name");
  String fieldNameCap = Util.recapitalize(fieldName);
  String fieldEditor = itField.getAttributeValue("editor");
%>

<jalios:if predicate='<%= fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) %>'>
      // file/image/media
      add(obj.get<%= fieldNameCap %>(), obj);
</jalios:if>

<jalios:if predicate='<%= fieldType.equals("String[]") && (fieldEditor.equals("image") || fieldEditor.equals("media")) %>'>
      // file[]/image[]/media[]
      array = obj.get<%= fieldNameCap %>();
      if (array != null) {
	for (int i = 0; i < array.length; i++) {
	  add(array[i], obj);
	}
      }
</jalios:if>

</jalios:foreach>
    }
</jalios:foreach>
  }
  
  public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {
    if (storable instanceof FileDocument) {
      FileDocument obj = (FileDocument)storable;
      FileDocument oldObj = (FileDocument)oldStorable;
      
      if (!Util.isSameContent(obj.getFilename(), oldObj.getFilename())) {
	remove(obj, oldObj.getFilename());
	add(obj.getFilename(), obj);
      }
    }
    
<jalios:foreach collection='<%= fileTypeList %>' name="itType" type="org.jdom.Element">
<% 
String typeName = itType.getAttributeValue("name"); 
List fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
%>
    
    if (storable instanceof <%= typeName %>) {
      <%= typeName %> obj = (<%= typeName %>)storable;
      <%= typeName %> oldObj = (<%= typeName %>)oldStorable;
      String[] array = null;
      
<jalios:foreach collection='<%= fieldList %>' name="itField" type="org.jdom.Element" counter="itCounter2">
<%
  String fieldType = itField.getAttributeValue("type");
  String fieldName = itField.getAttributeValue("name");
  String fieldNameCap = Util.recapitalize(fieldName);
  String fieldEditor = itField.getAttributeValue("editor");
%>

<jalios:if predicate='<%= fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) %>'>
      // file/image/media
      if (!Util.isSameContent(obj.get<%= fieldNameCap %>(), oldObj.get<%= fieldNameCap %>())) {
	remove(obj, oldObj.get<%= fieldNameCap %>());
	add(obj.get<%= fieldNameCap %>(), obj);
      }
</jalios:if>

<jalios:if predicate='<%= fieldType.equals("String[]") && (fieldEditor.equals("image") || fieldEditor.equals("media")) %>'>
      // file[]/image[]/media[]
      array = oldObj.get<%= fieldNameCap %>();
      if (array != null) {
	for (int i = 0; i < array.length; i++) {
	  remove(obj, array[i]);
	}
      }
      array = obj.get<%= fieldNameCap %>();
      if (array != null) {
	for (int i = 0; i < array.length; i++) {
	  add(array[i], obj);
	}
      }
</jalios:if>

</jalios:foreach>
    }
</jalios:foreach>
  }
  
  public void handleDelete(Storable storable, boolean firstTime) {
    if (storable instanceof FileDocument) {
      FileDocument obj = (FileDocument)storable;
    
      remove(obj, obj.getFilename());
    }    
    
<jalios:foreach collection='<%= fileTypeList %>' name="itType" type="org.jdom.Element">
<% 
String typeName = itType.getAttributeValue("name"); 
List fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
%>
    
    if (storable instanceof <%= typeName %>) {
      <%= typeName %> obj = (<%= typeName %>)storable;
      String[] array = null;
    
<jalios:foreach collection='<%= fieldList %>' name="itField" type="org.jdom.Element" counter="itCounter2">
<%
  String fieldType = itField.getAttributeValue("type");
  String fieldName = itField.getAttributeValue("name");
  String fieldNameCap = Util.recapitalize(fieldName);
  String fieldEditor = itField.getAttributeValue("editor");
%>

<jalios:if predicate='<%= fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) %>'>
      // file/image/media
      remove(obj, obj.get<%= fieldNameCap %>());
</jalios:if>

<jalios:if predicate='<%= fieldType.equals("String[]") && (fieldEditor.equals("image") || fieldEditor.equals("media")) %>'>
      // file[]/image[]/media[]
      array = obj.get<%= fieldNameCap %>();
      if (array != null) {
        for (int i = 0; i < array.length; i++) {
          remove(obj, array[i]);
        }
      }
</jalios:if>

</jalios:foreach>
    }    
</jalios:foreach>
  }
  
}
<% out.flush(); %>

