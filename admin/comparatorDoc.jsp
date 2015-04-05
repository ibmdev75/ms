<%--
  @Summary: Data Comparator List
  @Category: Help / API
  @Author: Sylvain DEVAUX
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-8.0.2, 9.0.0
--%>
<%@page import="com.jalios.jstore.Storable"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
String title = glp("doc.comp.title");
jcmsContext.setPageTitle(title);

Set<Class<? extends Storable>> storableClasses = new TreeSet<Class<? extends Storable>>(new Comparator<Class<? extends Storable>>() {
  public int compare(Class<? extends Storable> c1, Class<? extends Storable> c2) {
    if (c1 == null || c2 == null) { return 1; } 
    return c1.getSimpleName().compareTo(c2.getSimpleName());
  }
});
storableClasses.addAll(ComparatorManager.getTypeSet());
String javadocPrefix = "docs/javadoc/";
%>
<jalios:buffer name='cssquery'>
PRE {
  background-color: inherit;
  border: none;
  margin: inherit;
  padding: 0;
}
TD.comparator-name {
  padding-left: 40px;
  color: blue;
}
</jalios:buffer>

<%
jcmsContext.addStyleHeader(cssquery);
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><%= title %></h1></div>

<%= glp("doc.comp.intro.content") %>

<table class="table-data">
  <thead>
    <tr>
      <th class='nowrap listHeader'>
        <%= glp("doc.comp.header.name") %>
      </th>
      <th class='nowrap listHeader'>
        <%= glp("doc.comp.header.label") %>
      </th>
      <th class='nowrap listHeader'>
        <%= glp("doc.comp.header.example") %>
      </th>
    </tr>
  </thead>
  <tbody>
    <%
    for (Class<? extends Storable> storableClass : storableClasses) {
      %>
      <tr class='<%= storableClass %>'>
        <td nowrap="nowrap">
          <strong><%= storableClass.getSimpleName() %></strong>
        </td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <%
      Set<String> nameSet = new TreeSet<String>();
      nameSet.addAll(ComparatorManager.getComparatorNameSet(storableClass));
      for (String name : nameSet) {
        Class<? extends Comparator> comp = ComparatorManager.getComparatorClass(storableClass, name);
        String label = ComparatorManager.getComparatorLabel(name, userLang);
        String javadocHref = javadocPrefix + comp.getName().replaceAll("\\.", "/").replaceAll("\\$", ".") + ".html";
        boolean isApplicable = Util.notEmpty(label);
        %>
        <tr class='<%= storableClass %>'>
          <td class='comparator-name <%= name %>' title='<%= comp.getCanonicalName() %>'>
            <a href='<%= javadocHref %>' target="_blank">"<%= name %>"</a>
          </td>
          <td<%= isApplicable ? "" : " class='notApplicable'" %>><%
            %><%= isApplicable ? label : "" %><%
          %></td>
          <td>
            <pre>ComparatorManager.getComparator(<%= storableClass.getSimpleName() %>.class, "<%= name %>");</pre>
          </td>
        </tr>
        <%
      }
    }
    %>
  </tbody>
</table>
<%@ include file='/admin/doAdminFooter.jspf' %>