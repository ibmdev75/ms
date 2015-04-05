<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><% 
  
  Data   data    = getDataParameter("id");
  String section = getStringParameter("section", null, "^[0-9\\-]*$"); // 2-1-3 => Section 2.1.3
  String field   = getAlphaNumParameter("field", null);
  String unlock  = getAlphaNumParameter("unlock", null);
  
  
  if (data == null || loggedMember == null){
    return;
  }
  
  if ((data instanceof Publication) ? !loggedMember.canWorkOn((Publication)data) : !loggedMember.canUpdateOther(data)){
    return;
  }
  
  if (unlock != null){
    data.unlock(loggedMember);
    return;
  }
  
  if (section == null || field == null){
    return;
  }
  
  long mdate = getLongParameter("mdate",0);
  boolean isModifed = mdate != 0 && mdate != data.getMdate().getTime();
  
  String lang = userLang;
  String content = Util.getString(data.getFieldValue(field, userLang, false),"");
  if (Util.isEmpty(content)){
    content = Util.getString(data.getFieldValue(field, userLang, true),"");
    lang = (data instanceof Publication) ? channel.getLanguage() : ((Publication)data).getMainLanguage();
  }
  
  // Update the Section
  String update  = request.getParameter("update"); // can't use getUntrustedStringParameter // JspChecker.VERIFIED_FOR_SECURITY
  if (update != null ){
    if (isModifed){
      out.println(glp("ui.wiki.section.modified.save"));
      return;
    }
    update = WikiRenderer.encodeSection(data,field,update);
    String modified = WikiRenderer.updateSection(content,section,update);
    Data updated = (Data) data.getUpdateInstance();
    updated.setFieldValue(field,modified,lang);
    
    ControllerStatus cs = updated.checkUpdate(loggedMember);
    if (cs.hasFailed()){
      out.println(cs.getMessage(userLang));
      return;
    }
    updated.performUpdate(loggedMember);
    data.unlock(loggedMember);
    return;
  }
    
  // Init error message
  String  error = "";
  
    
  // 1. Handle modified
  if (isModifed){
    error = glp("ui.wiki.section.modified.edit");
  }
  
  // 2. Handle lock message
  if (!data.checkLockMember(loggedMember)){
    Publication pub = (Publication) data;
    error = glp("ui.work.form.txt.lock", pub.getLockMember().getFullName(), 
                DateFormat.getDateInstance(DateFormat.SHORT, userLocale).format(pub.getLockDate()), 
                DateFormat.getTimeInstance(DateFormat.SHORT, userLocale).format(pub.getLockDate()));
  } else if (!data.checkStrongLockMember(loggedMember)){
    Publication pub = (Publication) data;
    error = glp("ui.work.form.txt.lock-strong", pub.getLockMember().getFullName(), 
                DateFormat.getDateInstance(DateFormat.SHORT, userLocale).format(pub.getLockDate()), 
                DateFormat.getTimeInstance(DateFormat.SHORT, userLocale).format(pub.getLockDate()));
  }
  
  // 3. Handle extract section
  String  extract = null;
  if (Util.isEmpty(error)){
	  extract = WikiRenderer.extractSection(content,section);
	  if (extract == null){
	    error = glp("ui.wiki.section.error");
	  }
  }
  
  TypeFieldEntry tfe = channel.getTypeFieldEntry(data.getClass(), field, true);
  boolean isWikiwygField = tfe != null && tfe.isFieldWikiwyg(); 
  boolean useWikiwyg = isWikiwygField;
  // wikiwyg edition can be forced on/off through "wikiwyg" option of <jalios:wiki> tag
  if (hasParameter("wikiwyg")) {
    useWikiwyg = getBooleanParameter("wikiwyg", useWikiwyg);
  }
  // But wikiwyg edition can be disabled globally 
  if (!channel.getBooleanProperty("wiki.section.use-wikiwyg", true)) {
    useWikiwyg = false;
  }
  
  if (Util.isEmpty(error)){
    data.lock(loggedMember);
%><form name="liveForm" class="liveForm"><jalios:field  name="liveWidget" value='<%= extract %>' css='noresize' resource="field-light"><jalios:control type="<%= ControlType.WIKIAREA %>" /></jalios:field></form><% } else { %><%
%><jalios:javascript>
alert("<%= encodeForJavaScript(error) %>");
</jalios:javascript><% 
%><% } %>
<%@ include file='/jcore/doAjaxFooter.jspf' %>