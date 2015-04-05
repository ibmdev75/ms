<%
PortletQueryForeachDetail pqfd = (PortletQueryForeachDetail) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);

// Read options
Boolean carouselPqfdShowTitle       = pqfd.getShowTitle();
Boolean carouselPqfdShowAbstract    = pqfd.getShowAbstract();
Boolean carouselPqfdShowAuthor      = pqfd.getShowAuthor();
Boolean carouselPqfdShowCategories  = pqfd.getShowCategories();
String carouselPqfdShowDate         = pqfd.getShowDate();
Boolean carouselPqfdShowStatus      = pqfd.getShowStatus();
Boolean carouselPqfdShowType        = pqfd.getShowType();
Boolean carouselPqfdShowRights      = pqfd.getShowRights();
Boolean carouselPqfdShowId          = pqfd.getShowId();

// Set options
request.setAttribute("pqf-carousel-show-title", carouselPqfdShowTitle);
request.setAttribute("pqf-carousel-show-abstract", carouselPqfdShowAbstract);
request.setAttribute("pqf-carousel-show-author", carouselPqfdShowAuthor);
request.setAttribute("pqf-carousel-show-categories", carouselPqfdShowCategories);
request.setAttribute("pqf-carousel-show-date", carouselPqfdShowDate);
request.setAttribute("pqf-carousel-show-status", carouselPqfdShowStatus);
request.setAttribute("pqf-carousel-show-type", carouselPqfdShowType);
request.setAttribute("pqf-carousel-show-rights", carouselPqfdShowRights);
request.setAttribute("pqf-carousel-show-id", carouselPqfdShowId);

%><%@ include file='/types/PortletQueryForeach/doPortletQueryForeachCarousel.jsp' %><%

// Reset options
request.removeAttribute("pqf-carousel-show-title");
request.removeAttribute("pqf-carousel-show-abstract");
request.removeAttribute("pqf-carousel-show-author");
request.removeAttribute("pqf-carousel-show-categories");
request.removeAttribute("pqf-carousel-show-date");
request.removeAttribute("pqf-carousel-show-status");
request.removeAttribute("pqf-carousel-show-type");
request.removeAttribute("pqf-carousel-show-rights");
request.removeAttribute("pqf-carousel-show-id");
%>