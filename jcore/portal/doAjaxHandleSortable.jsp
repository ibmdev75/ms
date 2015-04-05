<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ page contentType="text/html; charset=UTF-8"  %>
<%@ include file='/jcore/doInitPage.jspf' %><%
  
  PortletCollection  collect  = (PortletCollection) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
  
  // Check if there is a sort action 
  if (!hasParameter("dnd-sortable")) {
    return;
  }
  
  // Check rights
  if (!isLogged || !loggedMember.canWorkOn(collect)){
    jcmsContext.sendForbidden();
    return;
  }
	
	String dummyId = collect.getId();
  synchronized(collect){
    // Retrieve parameter to perform update
    Map childrenMap = new LinkedHashMap();
    Map requestMap  = jcmsContext.isAjaxRequest() ? ((AjaxRequestWrapper)request).getOriginalParameterMap() : request.getParameterMap(); // JspChecker.VERIFIED_FOR_SECURITY
    main:for (Iterator it = requestMap.entrySet().iterator(); it.hasNext();) {
      Map.Entry itEntry = (Map.Entry) it.next();
      String   itBind = (String)   itEntry.getKey();
      String[] itIds  = (String[]) itEntry.getValue();
      
      // Optional: Bypass jsp parameters (already done by original parameter map)
      if ("id".equals(itBind)) { continue; }
      if ("cid".equals(itBind)){ continue; }
      if ("jsp".equals(itBind)){ continue; }
      if ("portletId".equals(itBind)){ continue; }
      if ("dnd-sortable".equals(itBind)){ continue; }
      if (Util.getSize(itBind) < 2){ continue; }
      if (dummyId.equals(itBind)){ itBind = ""; }
      
      // Optional: Bypass fake ids (already done by original parameter map)
      for (int i = 0 ; i < itIds.length ; i++){
        if (Util.isEmpty(itIds[i])){ continue; }
        Data data = channel.getData(itIds[i]);
        if (data == null){ continue main; }
      }
      
      // Store
      for (int i = 0 ; i < itIds.length ; i++){
        childrenMap.put(Util.getString(itIds[i],"Empty-"+i),itBind);
      }
    }

    // Update PortletCollection
    PortletCollection copy = (PortletCollection) collect.clone();
    copy.setChildrenMap(childrenMap);
    
    ControllerStatus status = copy.checkUpdate(loggedMember);
    if (!status.hasFailed()){
      copy.performUpdate(loggedMember);
      return;
    }
    logger.warn(status.getMessage(userLang));
  }
%>