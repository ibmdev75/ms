<%@ include file='/jcore/doInitPage.jspf' %><% 

  // -- Set the portal --------------------------------------------
  Data tmpPortal = getDataParameter("portal");
  if ((tmpPortal != null) && (tmpPortal instanceof PortalInterface)){
	displayPortal = (PortalInterface) tmpPortal;
	request.setAttribute(PortalManager.PORTAL_PORTAL,displayPortal);
  }
  
  if (displayPortal instanceof Portal){
    jcmsContext.addCSSHeader(((Portal)displayPortal).getCssFile());
  }
  
  // -- Set the cid -----------------------------------------------
  Category tmpCid = getCategoryParameter("cid");
    if (tmpCid != null){
	  request.setAttribute(PortalManager.PORTAL_CURRENTCATEGORY,tmpCid);
	  request.setAttribute(PortalManager.PORTAL_PORTALCATEGORY,tmpCid);
  }

  // -- Set the paramContent --------------------------------------
  Publication portalPublicationParam = getPublicationParameter("content");
  if (portalPublicationParam != null){
    request.setAttribute(PortalManager.PORTAL_PUBLICATION, portalPublicationParam);
	}
	
  // -- Set the paramId -------------------------------------------
  displayPortlet = getDataParameter("id", PortalElement.class);
  if (displayPortlet != null && !displayPortlet.canBeReadBy(loggedMember)) {
    sendForbidden(request, response); 
    return;
  }
  
  request.setAttribute("storeBufferForContainer", Boolean.TRUE);
%><% if (displayPortlet != null) { %><%@ include file='/jcore/portal/doIncludePortlet.jspf' %><% } 
%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<div id='mainDiv'>
  <%= Util.getString(request.getAttribute("storeBufferForContainer"), "") %>
</div>

<jalios:javascript>
  Popup.autoResize("mainDiv");
</jalios:javascript>

<%@ include file='/jcore/doEmptyFooter.jspf' %>