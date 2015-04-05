<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcms.handler.EditMemberPhotoHandler" %>

<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberPhotoHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name='formHandler' property="noRedirect" value="true" />
  <jsp:setProperty name='formHandler' property='member' value='<%= getMemberParameter("mbrId") %>' />
</jsp:useBean><% 

	jcmsContext.addCSSHeader("css/jalios/core/jalios-photo-crop.css");
  jcmsContext.addJavaScript("js/lib/imagesLoaded/imagesloaded.pkgd.js");

  jcmsContext.addCSSHeader("css/lib/jcrop/jquery.Jcrop.css");
  jcmsContext.addJavaScript("js/lib/jcrop/jquery.Jcrop.js");
  jcmsContext.addJavaScript("js/jalios/ux/jalios-crop.js");

  String stepPrefixProp = "ui.adm.mbr-edit.photo.crop.steps.";
	if(formHandler.validate() && (hasParameter("opFinish") || hasParameter("opCancel"))) {
		request.setAttribute("modal.redirect",formHandler.getMember().getDisplayUrl(userLocale));
  %>
    <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <%
	}

	int step = formHandler.getFormStep();
	int stepCount = formHandler.getFormStepCount();
%>
<jalios:modal css="modal-lg photo-crop-modal modal-upload" title="ui.member-editor.change-photo" picture="images/jalios/icons/imageEditor.gif" url="front/memberPhoto/editPhoto.jsp" formHandler="<%= formHandler %>">
  <%@ include file='/front/memberPhoto/editPhoto_upload.jspf' %>  
  <%@ include file='/front/memberPhoto/editPhoto_crop.jspf' %> 
</jalios:modal>