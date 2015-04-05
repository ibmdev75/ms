<%
 request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  PortalElement elm = getDataParameter("id", PortalElement.class);
	if (elm == null || !isLogged || !loggedMember.canWorkOn(elm)){
	  jcmsContext.sendForbidden();
	  return;
	}
	
	String opPreview = getUntrustedStringParameter("opPreview", null);
	if (Util.notEmpty(opPreview)){
		boolean isPreview = Util.toBoolean(opPreview,false);
		PortalManager.setPreview(request , elm, isPreview);
	}
	
	// Clone the element
	PortalElement copy = (PortalElement) elm.clone();
	
  // Call setters
  String opSkin = getUntrustedStringParameter("opSkin", null);
  if (Util.notEmpty(opSkin) && (elm instanceof PortletSkinable)){
    ((PortletSkinable)copy).setSkin(opSkin);
  }
  
  String opTmpl = getUntrustedStringParameter("opTmpl", null);
  if (Util.notEmpty(opTmpl)){
    copy.setTemplate(opTmpl);
  }
  
  String opCacheType = getUntrustedStringParameter("opCacheType", null);
  if (Util.notEmpty(opCacheType)){
    copy.setCacheType(opCacheType);
  }
  
  String opCacheSensibility = getUntrustedStringParameter("opCacheSensibility", null);
  if (Util.notEmpty(opCacheSensibility)){
    copy.setCacheSensibility(opCacheSensibility);
  }
  
  String opCacheTimeout = getUntrustedStringParameter("opCacheTimeout", null);
  if (Util.notEmpty(opCacheTimeout)){
    copy.setInvalidTime(Util.toLong(opCacheTimeout,0));
  }
  
  // PortletQueryForeach
  if (copy instanceof PortletQueryForeach){
	  String opShowPager = getUntrustedStringParameter("opShowPager", null);
	  if (Util.notEmpty(opShowPager)){
	    ((PortletQueryForeach)copy).setShowPager(opShowPager);
	  }
	  
	  String opMaxResults = getUntrustedStringParameter("opMaxResults", null);
	  if (Util.notEmpty(opMaxResults)){
      ((PortletQueryForeach)copy).setMaxResults(Util.toInt(opMaxResults,3));
    }
    
    String opOrderBy = getUntrustedStringParameter("opOrderBy", null);
    if (Util.notEmpty(opOrderBy)){
      ((PortletQueryForeach)copy).setOrderBy(opOrderBy);
    }
  }
  
  // perform Update
  ControllerStatus status = copy.checkUpdate(loggedMember);
	if (!status.hasFailed()){
	  copy.performUpdate(loggedMember);
	}
%>