<%
 request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  Category parent     = getCategoryParameter("root");
  
  if (!isLogged || Util.isEmpty(autocomplete) || !loggedMember.canManageCategory(parent)){
    out.println("ERROR: Wrong parameters"); /* Should never be called */
    return;
  }
  
  Category itCat = new Category();
  itCat.setName(autocomplete);
  itCat.setParent(parent);
  itCat.setAuthor(loggedMember);
  
  ControllerStatus cs = itCat.checkCreate(loggedMember);
  if (cs.hasFailed()){
    out.println("ERROR: "+cs.getMessage(userLang));
    return;
  }
  
  itCat.performCreate(loggedMember);
  out.print(itCat.getId());
%>