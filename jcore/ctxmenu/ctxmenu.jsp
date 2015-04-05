<%@ include file="/jcore/doInitPage.jspf" %><%

  String ctxId = getUntrustedStringParameter("ctxId", null);
  if (ctxId == null) {
    return;
  }
  
  // Find best generic menu
  String ctxTemplate = channel.getProperty("jcms.resource.ctxmenu."+ctxId,"");
  
  // Working with data
  Data data = channel.getData(ctxId);  
  if (data != null && Util.isEmpty(ctxTemplate)){
    request.setAttribute("ctxData", data);
    
    // Find best generic data tooltip card
    ctxTemplate = channel.getProperty("jcms.resource.ctxmenu."+Util.getClassShortName(data),"");
    
    String classes =  getUntrustedStringParameter("classes", "");
    if (Util.isEmpty(ctxTemplate) && data instanceof PortalElement && classes.indexOf("ctxPortletMenu") >= 0){ // PortalMode
      ctxTemplate = channel.getProperty("jcms.resource.ctxmenu.CtxPortlet","");
    }
    
    // Default on Category (done by properties)
    // Default on Member
	  else if (Util.isEmpty(ctxTemplate) && data instanceof Member){
      ctxTemplate = channel.getProperty("jcms.resource.ctxmenu.Member","");
    }
    
    // Default on Publication
	  else if (Util.isEmpty(ctxTemplate) && data instanceof Publication){
	    ctxTemplate = channel.getProperty("jcms.resource.ctxmenu.Publication","");
	  }
  }
  
  // Exit if empty
  if (Util.isEmpty(ctxTemplate)){
    // Do not forget doAjaxFooter.jspf in hook
%><jalios:include target="CTXMENU_HOOK" targetContext="li" /><%
    return;
  }

  // Override choosen 
  request.setAttribute("ctxTemplate", ctxTemplate);
%><jalios:include target="CTXMENU_FILTER" targetContext="empty" /><%
  ctxTemplate = (String) request.getAttribute("ctxTemplate");

  // Include template
%><jsp:include page='<%= "/"+ctxTemplate %>' flush="true" />
<%@ include file='/jcore/doAjaxFooter.jspf' %>