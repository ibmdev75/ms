<%@ include file="/jcore/doInitPage.jspf" %><%

if (isLogged) {
  Publication pub = getPublicationParameter("id");
  if (pub != null) {
    if (getBooleanParameter("follow", true)) {
      pub.addFollower(loggedMember);
    } else {
      pub.removeFollower(loggedMember);
    }
  }
  
}
sendRedirect(getValidHttpUrl("redirect"));

%>