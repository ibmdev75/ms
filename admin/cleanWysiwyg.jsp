<%-- 

This JSP provides HTML cleanup facility for existing wysiwyg content of the site.
It must be accessed by an administrator

1. finds ALL wysiwyg fields in the publication type of the current site, 
2. display a form to with cleaning option
3. Process sanitization 

--%><%@ page import="org.jsoup.Jsoup" %><%
%><%@ page import="org.jsoup.nodes.Entities.EscapeMode" %><%
%><%@ page import="com.jalios.jcms.servlet.BinaryFileServlet" %><%
%><%@ page import="com.jalios.jcms.servlet.BinaryFileServlet.DownloadTicket" %><%
%><%@ page import="com.jalios.io.IOUtil" %><%
%><%@ page import="org.apache.commons.io.FileUtils" %><%
%><%@ page import="org.apache.commons.lang.StringUtils" %><%

  boolean opClean = hasParameter("opClean");
  if (opClean) {
    request.setAttribute("CheckCSRF", Boolean.TRUE);
  }
%><%@ include file="/jcore/doInitPage.jspf" %><%

  /* Wysiwyg cleaning requires TRUE ADMIN ACCESS (not enforced by admin header which may authorized user with ACL) */ 
  if (!isAdmin) {
    sendForbidden(request, response);
    return;
  }

%><%@ include file="/admin/doAdminHeader.jspf" %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

boolean dryClean = !opClean || hasParameter("dryClean");
boolean skipIntegrityCheck = !opClean || hasParameter("skipIntegrityCheck");
String[] selectedFields = getStringParameterValues("fields", "[a-zA-Z0-9\\.#]*");

%>
<div class="page-header"><h1>Wysiwyg Sanitization</h1></div>

<%-- Require HTML sanitization enabled --%>
<% 

if (!channel.getBooleanProperty("wysiwyg.sanitize-html", false)) {
  %>
  <p class="alert alert-warn">
    HTML sanitizitation is disabled.<br/>
    Enable with property <code>wysiwyg.sanitize-html: true</code>
  <p>
  <%
  %><%@ include file='/admin/doAdminFooter.jspf' %><%
  return;
}

%><%!

/**
 * Rewrite the specified HTML *without any cleaning*. 
 * Used in dry-clean mode.
 */
String rewriteHtml(String bodyHtml) {
  if (Util.isEmpty(bodyHtml)) {
    return bodyHtml;
  }
  org.jsoup.nodes.Document dirty = Jsoup.parseBodyFragment(bodyHtml);
  // Adjust escape mode - so characters are not escape into entities
  // http://stackoverflow.com/questions/8683018/jsoup-clean-without-adding-html-entities
  dirty.outputSettings().escapeMode(EscapeMode.xhtml);
  String rewrittenXml = dirty.body().html();
  return rewrittenXml;
}

/**
 * Rewrite the specified HTML array *without any cleaning*. 
 * Used in dry-clean mode.
 */
String[] rewriteHtml(String[] bodyHtmlArray) {
  if (bodyHtmlArray == null || bodyHtmlArray.length == 0) {
    return bodyHtmlArray;
  }
  
  String[] rewrittenXmlArray = new String[bodyHtmlArray.length]; 
  for (int idx = 0; idx < bodyHtmlArray.length; idx++) {
    rewrittenXmlArray[idx] = rewriteHtml(bodyHtmlArray[idx]);
  }
  return rewrittenXmlArray;
}

%><%-- Process actions --%><%

if (opClean && Util.notEmpty(selectedFields)) {
  File dryCleanWorkDir = null;
  File dryCleanExportDir = null;
  File dryCleanOriginalExportDir = null;
  File dryCleanRewrittenExportDir = null;
  File dryCleanUpdatedExportDir = null;
  File dryCleanExportZipFile = null;
  if (dryClean) {
    File tmpFile = File.createTempFile("jalios-jcms", "wysiwyg-sanitization");
    tmpFile.delete();
    tmpFile.mkdir();
    dryCleanWorkDir = tmpFile;
    dryCleanExportDir = new File(dryCleanWorkDir, "wysiwyg-sanitization");
    dryCleanOriginalExportDir = new File(dryCleanExportDir, "1-original");
    dryCleanRewrittenExportDir = new File(dryCleanExportDir, "2-rewritten");
    dryCleanUpdatedExportDir = new File(dryCleanExportDir, "3-updated");
    dryCleanExportDir.mkdirs();
    dryCleanOriginalExportDir.mkdirs();
    dryCleanRewrittenExportDir.mkdirs();
    dryCleanUpdatedExportDir.mkdirs();
    
    dryCleanExportZipFile = File.createTempFile("jalios-jcms", "wysiwyg-sanitization-export.zip");
  }
  
  
  
  HashMap<TypeEntry, List<TypeFieldEntry>> fieldsMap = new HashMap<TypeEntry, List<TypeFieldEntry>>();
  for (String field : selectedFields) {
    String className = StringUtils.substringBefore(field, "#");
    String fieldName = StringUtils.substringAfter(field, "#");
    Class clazz = null;
    TypeEntry te = null;
    TypeFieldEntry tfe  = null;
    try {
      clazz = channel.getClass(className);
      te = channel.getTypeEntry(clazz);
      tfe = channel.getTypeFieldEntry(clazz, fieldName, false);
    } catch (Exception ex) {
      logger.debug(ex);
    }
    if (clazz == null || te == null || tfe == null) {
      continue;
    }
    List<TypeFieldEntry> tfeList = fieldsMap.get(te);
    if (tfeList == null) {
      tfeList = new LinkedList<TypeFieldEntry>();
      fieldsMap.put(te, tfeList);
    }
    tfeList.add(tfe);
  }
  
  if (!dryClean) {
    channel.appendMilestone("Wysiwyg sanitization start " + new Date());
  }
  %>
  <div class="alert alert-info">
    <% if (dryClean) {%><strong>Dry clean enabled</strong>, HTML sanitization was NOT saved to JStore or JcmsDB.<% } %>
    <ul><%
  long updateCounter = 0;
  for (Map.Entry<TypeEntry, List<TypeFieldEntry>> entry : fieldsMap.entrySet()) {
    TypeEntry te = entry.getKey();
    List<TypeFieldEntry> tfeList = entry.getValue();
    Class clazz = channel.getClass(te.getClassName());

    HibernateUtil.commitTransaction();
    HibernateUtil.beginTransaction();
    TreeSet<? extends Publication> pubSet = channel.getDataSet(clazz);
    if (Util.notEmpty(pubSet)) {
      for (Publication pub : pubSet) {
        Publication update = (Publication) pub.getUpdateInstance();
        
        String shortClassName = Util.getClassShortName(pub.getClass());
        String exportFileName = shortClassName + "." + pub.getId() + ".xml";
        
        if (dryClean) {
          File pubExport = new File(dryCleanOriginalExportDir, exportFileName);
          String xmlExport = pub.exportXml();
          FileUtils.writeStringToFile(pubExport, xmlExport, "UTF-8");
        }
        
        // when dry-clean is enabled, to help in analysis, 
        // output content in rewritten HTML, without cleaning
        if (dryClean) {

          for (TypeFieldEntry tfe : tfeList) {
            String fieldName = tfe.getName();
            for (String lang : channel.getLanguageList()) {
              if (tfe.isTypeString()) {
                String fieldValue = (String) pub.getFieldValue(fieldName, lang, false);
                fieldValue = rewriteHtml(fieldValue);
                if (fieldValue != null) {
                  update.setFieldValue(fieldName, fieldValue, lang);
                }
              } 
              else if (tfe.isTypeStringArray()) {
                String[] fieldValues = (String[]) pub.getFieldValue(fieldName, lang, false);
                fieldValues = rewriteHtml(fieldValues);
                if (fieldValues != null) {
                  update.setFieldValue(fieldName, fieldValues, lang);
                }
              }
            }
          }

          File pubExport = new File(dryCleanRewrittenExportDir, exportFileName);
          String xmlExport = update.exportXml();
          FileUtils.writeStringToFile(pubExport, xmlExport, "UTF-8");
        }
        
        // clean
        for (TypeFieldEntry tfe : tfeList) {
          String fieldName = tfe.getName();
          for (String lang : channel.getLanguageList()) {
            if (tfe.isTypeString()) {
              String fieldValue = (String) pub.getFieldValue(fieldName, lang, false);
              fieldValue = WysiwygManager.cleanHtml(fieldValue, WysiwygManager.getCleanHtmlContextMap(pub, fieldName));
              if (fieldValue != null) {
                update.setFieldValue(fieldName, fieldValue, lang);
              }
            } 
            else if (tfe.isTypeStringArray()) {
              String[] fieldValues = (String[]) pub.getFieldValue(fieldName, lang, false);
              fieldValues = WysiwygManager.cleanHtml(fieldValues, WysiwygManager.getCleanHtmlContextMap(pub, fieldName));
              if (fieldValues != null) {
                update.setFieldValue(fieldName, fieldValues, lang);
              }
            }
          }
        }
        
        if (dryClean) {
          File pubExport = new File(dryCleanUpdatedExportDir, exportFileName);
          String xmlExport = update.exportXml();
          FileUtils.writeStringToFile(pubExport, xmlExport, "UTF-8");
        }        
        
        Member opAuthor = loggedMember;
        Map<String,Object> ctxMap = new HashMap<String,Object>();
        ctxMap.put(DataController.CTXT_IS_BATCH_OPERATION, Boolean.TRUE);
        ctxMap.put("wysiwyg.sanitize", Boolean.TRUE);
        if (!dryClean) {        
          if (skipIntegrityCheck || update.checkUpdate(opAuthor, ctxMap).isOK()) {
            update.performUpdate(opAuthor, ctxMap);
            updateCounter++;
            if (updateCounter % 100 == 0) {
              HibernateUtil.commitTransaction();
              HibernateUtil.beginTransaction();
            }
          }
        } else {
          HibernateUtil.evict(pub);
        }
      }
      
    }

    HibernateUtil.commitTransaction();

    %><li><%= pubSet != null ? pubSet.size() : 0%> <%= channel.getTypeLabel(clazz, userLang) %> processed.</li><%
    
    HibernateUtil.beginTransaction();
        
  }
  if (!dryClean) {
    channel.appendMilestone("Wysiwyg sanitization end " + new Date());
  } else {
    IOUtil.zip(dryCleanExportDir.getPath(), dryCleanExportZipFile.getPath(), true); 
    IOUtil.deepDelete(dryCleanWorkDir);
    
    // Create a download ticket and redirect client to download servlet
    BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(dryCleanExportZipFile, "application/zip", "wysiwyg-sanitization-export.zip");
    ticket.setDeleteFileAfterDelivery(true);
    ticket.setUsePragmaNoCache(true);
    ticket.sendToDownloadUrl(request, response);    
  }
  %>
    </ul>
  </div><% 
}
%>



<%-- Display Form --%>

<div class="alert alert-info">
 <p>
   This tool allows you to sanitize existing HTML fields in the site
   with the current HTML whitelist configuration.<br/>
 </p>
 <p>
   When HTML sanitization is enabled (<code>wysiwyg.sanitize-html: true</code>), all
   contents created or modified are automatically sanitized.<br/>
   However, it might be needed to run this tool in case whitelisting configuration is modified,
   or for cleaning contents created or modified prior to the activation the sanitization.
       
 </p>
</div>
<div class="alert alert-warn">
 <p>
    <strong>This process may result in loss of information depending on the current whitelist configuration.</strong><br/>
    <strong>It is strongly advised that you first run this tool in "dry clean" mode, on a developpement environement </strong>.
 </p>
 <p>
    Should you need to revert the operation, JStore milestones will automatically be added after
    and before processing (if dry clean mode is disabled).<br/> 
    <strong>However, operations on JcmsDB contents CANNOT be undone</strong>.      
 </p>
</div>

<form action='<%= channel.getSecuredBaseUrl(request) %>admin/cleanWysiwyg.jsp' method='post' name='cleanForm' id='cleanForm' class='noSingleSubmitButton'>
  <fieldset>
    <legend>Wysiwyg type fields to sanitize : </legend>
    <p>
      <input data-jalios-action="sync:checked"  name="checkAll" type="checkbox"
             data-jalios-target="#fieldsUl :checkbox" <% if (!opClean) { %>checked="checked" <% } %>> 
      <span>Check / Uncheck all</span>
    </p>
    <ul id="fieldsUl">
    <%
    
    // Types
    boolean hasWysiwyg = false; 
    List<Class<? extends Publication>> typeList = channel.getPublicationTypeList();
    for (Class<? extends Publication> clazz : typeList) {
      TypeEntry te = channel.getTypeEntry(clazz);
      if (te == null || te.isExtension()) {
        continue;
      }

      LinkedHashSet<TypeFieldEntry> wysiwygTfeSet = new LinkedHashSet<TypeFieldEntry>();
      // Type fields
      TypeFieldEntry[] tfes = channel.getTypeFieldEntries(clazz);
      for (TypeFieldEntry tfe : tfes) {
        if (tfe.isSuper()) {
          continue;
        }
        
        if (!tfe.isWysiwyg()) {
          continue;
        }
        wysiwygTfeSet.add(tfe);          
        hasWysiwyg = true;
      }
      
      if (Util.isEmpty(wysiwygTfeSet)) {
        continue;
      }  

      boolean oneField = wysiwygTfeSet.size() == 1;
      if (!oneField) {
      %>
      <li><strong><%= te.getLabel(userLang) %></strong>
        <ul><%
      }
          for (TypeFieldEntry tfe : wysiwygTfeSet) {
            String inputId = ServletUtil.generateUniqueDOMId(request, "fields_");
            String inputValue = te.getClassName() + "#" + tfe.getName();
            boolean checked = !hasParameter("fields") || Util.arrayContains(selectedFields, inputValue);
            %>
            <li>
              <% if (oneField) { %><strong><%= te.getLabel(userLang) %></strong> <% } %>
              <input id="<%= inputId %>" name="fields" value="<%= te.getClassName() %>#<%= tfe.getName() %>" type="checkbox" <% if (checked) { %>checked="checked" <% } %>/>
              <label for="<%= inputId %>" title="<%= te.getClassName() %>#<%= tfe.getName() %>">
                <%= tfe.getLabel() %>
              </label>       
            </li>
            <%    
          }
      if (!oneField) {
        %>
        </ul>
      </li><%
      }
      
    }
    
    if (!hasWysiwyg) {
      %>No wysiwyg fields found on your site.<%
    }
    %>
    </ul>
    <input name="fields" type="hidden" value=""/>
    </fieldset>

  <fieldset>
    
    <input id="dryClean" name="dryClean" value="true" type="checkbox" <% if (dryClean) { %>checked="checked" <% } %>/>
    <label for="dryClean"><strong>Dry clean and zip results</strong></label>
    <p>
      If dry cleanning is enabled, contents will NOT be updated in JStore or JcmsDB. Instead, a zip 
      will be generated for proper auditing of cleaning process, this zip will contains XML export of all contents
      <ul>
        <li>before sanization, in directory <code>"1-original"</code>,</li>
        <li>after simple HTML rewriting, without sanitization, in directory <code>"2-rewritten"</code>,</li>
        <li>after complete sanitization, in directory <code>"3-updated"</code>.</li>
      </ul>
      You are <strong>STRONGLY</strong> advised to :
      <ol>
        <li>use this option first to audit the exported contents using a diff tool;<br/>
            comparing directories <code>"2-rewritten"</code> and <code>"3-updated"</code> will give
            you the most relevant information on contents which have been sanitized,</li>
        <li>validate and adapt the whitelist configuration as needed,<br/>
            You can check whitelist configuration in properties <code>wysiwyg.sanitize-html.whitelist.*</code>.<br/>
        </li>
        <li>test your new configuration,</li>
        <li>perform the cleaning process on the production data.</li>
      </ol>
    </p>      
    
    <input id="skipIntegrityCheck" name="skipIntegrityCheck" value="true" type="checkbox" <% if (skipIntegrityCheck) { %>checked="checked" <% } %>/>
    <label for="skipIntegrityCheck"><strong>Skip Integrity Check</strong></label> 
    <p>Perform content update without checking integrity constraints (recommended to ensure proper cleaning)</p>
    
  </fieldset>
  
  <div class="buttons">
    <input name="opClean" value="Sanitize..." type="submit" class="btn btn-danger modal confirm" />
  </div>
  
</form>


<%@ include file='/admin/doAdminFooter.jspf' %> 