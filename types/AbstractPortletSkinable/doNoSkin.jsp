<%@ page import="com.jalios.util.*, com.jalios.jcms.*, com.jalios.jcms.portlet.*, com.jalios.jcms.context.*" %><%
  JcmsJspContext jcmsContext     = (JcmsJspContext)request.getAttribute("jcmsContext");
  PortalElement  portlet         = (PortalElement) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
%><%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %>