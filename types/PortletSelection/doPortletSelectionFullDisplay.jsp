  <%@ include file='/jcore/doInitPage.jspf'                    %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf'        %><% 
%><%@ include file='/types/PortletSelection/doSelection.jspf' %><% 

  PortletSelection selection = (PortletSelection) portlet;
  PortalElement    child     = (PortalElement) Util.getObject(selection.getChildren(),0,null);
  if (child == null && !isPortletMode) {
    request.setAttribute("ShowPortalElement" , Boolean.FALSE);
    return;
  }
  if (child != null){
    displayPortlet = child;
  }
%><%@ include file='/jcore/portal/doIncludePortlet.jspf'   %>