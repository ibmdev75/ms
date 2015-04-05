<%--
  @Summary: Display information about the librairies
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/monitoring/lib-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("libInfoSubAdminMenu", "true"); 

int counter = 0;
String trClass;

%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.mn.info.lib") %></h1></div>

<jalios:cache id='<%= userLang + "_AdminChannel.PackageInfo" %>' refresh='<%= false %>'>
<%!
	public class PackageComparator implements Comparator {
	  public int compare(Object obj1, Object obj2) {
	   Package p1 = (Package) obj1;
	   Package p2 = (Package) obj2;
	   return p1.getName().compareTo(p2.getName());
	  }
	}
%>
<%
// Here we retrieve the class of some dumb Class in order do be sure the package we want to check are loaded
  Package loadAcme = null;
  Package loadActivation = null;
  Package loadMail = null;
  Package loadMetadataExt = null;
  Package loadLog4j = null;
  Package loadLog4jRollingAppender = null;
  Package loadLucene = null;
  Package loadORO = null;
  Package loadJDOM = null;
  Package loadJSON = null;
  Package loadLDAP = null;
  Package loadMozillaCharDet = null;
  Package loadPDFBox = null;
  Package loadXerces = null;
  Package loadXSC = null;
  Package loadCommonsLang = null;
  Package loadHibernate = null;
try {
  // Acme
  loadAcme = Acme.Application.class.getPackage();
  // activation 
  loadActivation = javax.activation.MimeType.class.getPackage();
  // mail
  loadMail = javax.mail.Message.class.getPackage();
  // metadata-extractor
  loadMetadataExt = com.drew.imaging.jpeg.JpegMetadataReader.class.getPackage();
  // log4j
  loadLog4j = org.apache.log4j.Logger.class.getPackage();
  // log4j rolling appender
  loadLog4jRollingAppender = uk.org.simonsite.log4j.appender.TimeAndSizeRollingAppender.class.getPackage();
  // Hibernate
  loadHibernate = org.hibernate.Hibernate.class.getPackage();
  // Lucene
  loadLucene = org.apache.lucene.LucenePackage.class.getPackage();
  // Jakarta ORO
  loadORO = org.apache.oro.text.GenericPatternCache.class.getPackage();
  // JDOM
  loadJDOM = org.jdom.Content.class.getPackage();
  // JSON-RPC
  loadJSON = org.jabsorb.JSONRPCBridge.class.getPackage();
  // ldap sdk
  loadLDAP = com.unboundid.ldap.sdk.Version.class.getPackage();
  // Mozilla Charset Detectors
  loadMozillaCharDet = org.mozilla.intl.chardet.nsVerifier.class.getPackage();
  // PDFBox
  loadPDFBox = org.apache.pdfbox.Version.class.getPackage();
  // Xerces
  loadXerces = org.apache.xerces.impl.Version.class.getPackage();
  // XMLmind Spell Checker
  loadXSC = com.xmlmind.spellcheck.engine.SpellChecker.class.getPackage();
  // iCal4j
  loadCommonsLang = org.apache.commons.lang.StringUtils.class.getPackage();
} catch (Exception ex) {
  // nothing
}
%>
<%
final Object[][] exepectedPackages = new Object[][] {
//{ displayed name,              checked package,                    checked package name           
//  Implementation-Title,        Implementation-Vendor,              Implementation-Version,
//  Specification-Title,         Specification-Vendor,               Specification-Version,
//  gravity }
  { "Acme",                      loadAcme,                           "Acme",                        
    "Acme",                      "",                                 "-",
    "",                          "",                                 "",
    "low" },
  { "javax.activation",          loadActivation,                     "javax.activation",            
    "",                          "Sun Microsystems Inc.",            "1.1.1",
    "JavaBeans(TM) Activation Framework Specification", "Sun Microsystems, Inc.", "1.1",
    "low" },
  { "javax.mail",                loadMail,                           "javax.mail",                  
    "",                          "Sun Microsystems, Inc.",           "1.4",
    "JavaMail(TM) API Design Specification ", "Sun Microsystems, Inc.", "1.4",
    "normal" },
  { "metadata-extractor",        loadMetadataExt,                    "com.drew.imaging.jpeg",                  
    "metadata-extractor",        "drewnoakes.com",                   "2.6.4",
    "",                          "",                                 "",
    "normal" },
  { "log4j",                     loadLog4j,                          "org.apache.log4j",            
    "log4j",                     "\"Apache Software Foundation\"",   "1.2.15",
    "",                          "",                                 "",
    "high" },
  { "Log4J TimeAndSizeRollingAppender", loadLog4jRollingAppender,    "uk.org.simonsite.log4j",            
    "Log4J TimeAndSizeRollingAppender", "Simon Park",                "20120703-0826",
    "",                          "",                                 "",
    "normal" },
  { "Hibernate",                 loadHibernate,                      "org.hibernate",            
    "Hibernate",                 "RedHat (and Jalios)",              "3.3.2 (Jalios patched)",
    "Hibernate",                 "RedHat",                           "3.3.2",
    "high" },
  { "lucene",                    loadLucene,                         "org.apache.lucene",     
    "org.apache.lucene",         "The Apache Software Foundation",   "2.9.4 1039909 - 2010-11-28 19:08:14",
    "Lucene Search Engine: core","The Apache Software Foundation",   "2.9.4",
    "high" },
  { "Jakarta ORO",               loadORO,                            "org.apache.oro.text",         
    "org.apache.oro",            "Apache Software Foundation",       "2.0.5",
    "",                          "",                                 "",
    "high" },
  { "JDOM",                      loadJDOM ,                          "org.jdom",                    
    "org.jdom",                  "jdom.org",                         "1.0",
    "JDOM Classes",              "jdom.org",                         "1.0",
    "high" },
  { "JSON-RPC",                  loadJSON ,                          "org.jabsorb",    
    "org.jabsorb",               "Google Code",                      "1.2",
    "",                          "",                                 "",
    "high" },
  { "UnboundID LDAP SDK for Java",          loadLDAP,                           "com.unboundid.ldap.sdk",               
    "UnboundID LDAP SDK for Java (Standard Edition)",        "UnboundID Corp.",                  "2.3.7",
    "",                          "",                                 "",
    "normal" },
  { "Mozilla Charset Detectors", loadMozillaCharDet,                 "org.mozilla.intl.chardet",    
    "Mozilla Charset Detectors", "Mozilla",                          "build 20030705",
    "",                          "",                                 "",
    "normal" },
  { "PDFBox",                    loadPDFBox,                         "org.apache.pdfbox.util",             
    "org.apache.pdfbox",         "The Apache Software Foundation (and Jalios)",       "1.0.0 Jalios Patched",
    "PDFBox  (Jalios patched)",  "The Apache Software Foundation",   "1.0.0",           
    "low" },
  { "Xerces",                    loadXerces,                         "org.apache.xerces.impl",      
    "org.apache.xerces.impl",    "Apache Software Foundation",       "2.11.0",
    "",                          "",                                 "",
    "high" },
  { "XMLmind Spell-Checker",     loadXSC,                            "com.xmlmind.spellcheck.engine",              
    "XMLmind Spell-Checker",     "XMLmind",                          "1.3",
    "",                          "",                                 "",
    "low" },
  { "commons-lang",              loadCommonsLang,                    "org.apache.commons.lang",      
    "Commons Lang",				 "The Apache Software Foundation",               "2.6",    
    "Commons Lang",				 "The Apache Software Foundation",               "2.6",
    "low" }
};
//{ displayed name,              checked package,                    checked package name           
//Implementation-Title,        Implementation-Vendor,              Implementation-Version,
//Specification-Title,         Specification-Vendor,               Specification-Version,
//gravity }
%>
    
         <%-- ** Bundled library ********************************** --%>
<style type="text/css">
  #libTab .low          td { background-color: #FFFF88; }
  #libTab .normal       td { background-color: #FFCC88; }
  #libTab .high         td { background-color: #FF8888; }
  #libTab .low-hover    td { background-color: #FFFF66; }
  #libTab .normal-hover td { background-color: #FFCC66; }
  #libTab .high-hover   td { background-color: #FF6666; }
</style>

<div class="tab-pane" id="libTab">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src='jar' alt='jar' /> <%= glp("ui.adm.ch-status.lib.tab.lib") %></h2>
    <% counter = 0; %>
    <table class="table-data">
      <tr> 
        <th><% /* %>Bundle Package Name<% */ %><%= glp("ui.adm.ch-status.lib.bundle.name") %></th>
        <th><% /* %>Expected Version<% */ %><%= glp("ui.adm.ch-status.lib.bundle.expected") %></th>
        <th><% /* %>Current Version<% */ %><%= glp("ui.adm.ch-status.lib.bundle.current") %></th>
      </tr>
      <%
      for (int i = 0; i < exepectedPackages.length; i++) {
              String displayName = (String) exepectedPackages[i][0];
              Package checkedPackaged = (Package) exepectedPackages[i][1];
              String packageName = (String) exepectedPackages[i][2];
	            String expectedTitle = (String) exepectedPackages[i][3];
	            String expectedVendor = (String) exepectedPackages[i][4];
	            String expectedVersion = (String) exepectedPackages[i][5];
              String expectedSTitle = (String) exepectedPackages[i][6];
              String expectedSVendor = (String) exepectedPackages[i][7];
              String expectedSVersion = (String) exepectedPackages[i][8];
              String severity = (String) exepectedPackages[i][9];
	            Package currentPackage = (checkedPackaged != null) ? checkedPackaged : Package.getPackage(packageName);
	            boolean currentPackageDiffers = currentPackage == null ? true : !expectedVersion.equals(currentPackage.getImplementationVersion());
      %>
      <tr class='<% if (currentPackageDiffers) { %> <%= severity%><% } %>'>
        <td>
          <jalios:icon src='jar'  alt='jar' /> <%= displayName %>
        </td>
        <td>
          <i>
          <%= Util.getString(expectedTitle, glp("ui.adm.ch-status.lib.bundle.unknown")) %>
          <%= Util.getString(expectedVendor, glp("ui.adm.ch-status.lib.bundle.unknown")) %>
          <%= Util.getString(expectedVersion, glp("ui.adm.ch-status.lib.bundle.unknown")) %>
          <% if (Util.notEmpty(expectedSTitle)) { %>
           <div style="font-size: smaller; color: gray;">
            <%= Util.getString(expectedSTitle, glp("ui.adm.ch-status.lib.bundle.unknown")) %>
            <%= Util.getString(expectedSVendor, glp("ui.adm.ch-status.lib.bundle.unknown")) %>
            <%= Util.getString(expectedSVersion, glp("ui.adm.ch-status.lib.bundle.unknown")) %>
           </div>
          <% } %>
          </i>
        </td>
        <td>
              <% if (currentPackage != null) { %>
                <%= Util.getString(currentPackage.getImplementationTitle(), glp("ui.adm.ch-status.lib.bundle.unknown")) %>
                <%= Util.getString(currentPackage.getImplementationVendor(), glp("ui.adm.ch-status.lib.bundle.unknown")) %>
                <%= Util.getString(currentPackage.getImplementationVersion(), glp("ui.adm.ch-status.lib.bundle.unknown")) %>
                <% if (Util.notEmpty(currentPackage.getSpecificationTitle())) { %>
                 <div style="font-size: smaller; color: gray;">
                  <%= Util.getString(currentPackage.getSpecificationTitle(), glp("ui.adm.ch-status.lib.bundle.unknown")) %>
                  <%= Util.getString(currentPackage.getSpecificationVendor(), glp("ui.adm.ch-status.lib.bundle.unknown")) %>
                  <%= Util.getString(currentPackage.getSpecificationVersion(), glp("ui.adm.ch-status.lib.bundle.unknown")) %>
                 </div>
                <% } %>
              <% } else { %>
                <%= glp("ui.adm.ch-status.lib.bundle.missing") %>
              <% } %>
        </td>
      </tr>
      <% } %>
      <tr>
        <td colspan='3'></td>
      </tr>
      <tr class='low'>
        <td colspan='3'><%= glp("ui.adm.ch-status.lib.bundle.low") %></td>
      </tr>
      <tr class='normal'>
        <td colspan='3'><%= glp("ui.adm.ch-status.lib.bundle.normal") %></td>
      </tr>
      <tr class='high'>
        <td colspan='3'><%= glp("ui.adm.ch-status.lib.bundle.high") %></td>
      </tr>
    </table>
  </div>
           
  <%-- ** PACKAGES List ********************************** --%>
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src='package' /> <%= glp("ui.adm.ch-status.lib.tab.pkg") %></h2>
         <% counter = 0; %>
          <table class="table-data">
            <tr> 
             <th>
                <% /* %>Package<% */ %><%= glp("ui.adm.ch-status.lib.pkg.title") %>
              </th>
            </tr>
					<%
						TreeSet packagesSet = new TreeSet(new PackageComparator());
						packagesSet.addAll(Arrays.asList(Package.getPackages()));
						for (Iterator it = packagesSet.iterator(); it.hasNext(); ) {
						  Package curPackage = (Package) it.next();
					%>
            <tr>
              <td>
                <jalios:icon src='package'  />
                <%= Util.getString(curPackage.getName(), "") %>  
                <br />
                <jalios:if predicate="<%= Util.notEmpty(curPackage.getImplementationTitle()) || Util.notEmpty(curPackage.getImplementationVendor()) || Util.notEmpty(curPackage.getImplementationVendor()) %>">&nbsp;&nbsp;&nbsp;<%= Util.getString(curPackage.getImplementationTitle(), "") %> <%= Util.getString(curPackage.getImplementationVendor(), "") %> <%= Util.getString(curPackage.getImplementationVersion(), "") %><br /></jalios:if>
                <jalios:if predicate="<%= Util.notEmpty(curPackage.getSpecificationTitle()) || Util.notEmpty(curPackage.getSpecificationVendor()) || Util.notEmpty(curPackage.getSpecificationVendor()) %>">&nbsp;&nbsp;&nbsp;<%= Util.getString(curPackage.getSpecificationTitle(), "") %> <%= Util.getString(curPackage.getSpecificationVendor(), "") %> <%= Util.getString(curPackage.getSpecificationVersion(), "") %></jalios:if>
              </td>
            </tr>
          <% } %>
          </table>
  </div>
          
  <%-- ** Revision List ********************************** --%>
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src='class' /> <%= glp("ui.adm.ch-status.lib.tab.rev") %></h2>        
          <%
          List divergentList = new ArrayList();
          List notDivergentList = new ArrayList();
          for(Iterator it = JcmsUtil.getClassList().iterator(); it.hasNext();) {
            Class itClass = (Class)it.next();
            String revision = JcmsUtil.getRevision(itClass);
            String releasedRevision = JcmsUtil.getReleasedRevision(itClass);
            boolean isDivergent = Util.notEmpty(releasedRevision) && !Util.isSameContent(revision, releasedRevision);
            if (isDivergent) {
              divergentList.add(itClass);
            } else {
              notDivergentList.add(itClass);
            }
          }
          List revList = new ArrayList(divergentList);
          revList.addAll(notDivergentList);
          int diffCount = divergentList.size();
          %>
          <% if (diffCount > 0) { %>
          <jalios:message msg='<%= glp("ui.adm.ch-status.lib.lbl.rev-diff", diffCount) %>' dismissable="true" level="<%= com.jalios.jcms.context.MessageLevel.WARN %>" />
          <% } %>
          <table class="table-data">
            <tr> 
              <th></th>
              <th><%= glp("ui.adm.ch-status.lib.lbl.pkg") %></th>
              <th><%= glp("ui.adm.ch-status.lib.lbl.class") %></th>
              <th><%= glp("ui.adm.ch-status.lib.lbl.rev-cur") %></th>
              <th><%= glp("ui.adm.ch-status.lib.lbl.rev-rel") %></th>
            </tr>
            <% counter = 0; %>
            <jalios:foreach collection='<%= revList %>' name='itClass' type='Class'>
            <% 
            String revision = JcmsUtil.getRevision(itClass);
            String releasedRevision = JcmsUtil.getReleasedRevision(itClass);
            boolean isDivergent = Util.notEmpty(releasedRevision) && !Util.isSameContent(revision, releasedRevision);
            if (isDivergent) {
              diffCount++;
            }
            %>
            <% if (Util.notEmpty(revision)) { %>
            <% 
            counter++;
            trClass = !isDivergent ? " noChange" : "";
            %>
            <tr class="<%= trClass %>"> 
              <td class="text-right" nowrap="nowrap"><%= counter %>.</td>
              <td nowrap="nowrap"><%= itClass.getPackage().getName() %></td>
              <td nowrap="nowrap"><%= Util.getClassShortName(itClass) %></td>
              <td class="text-right" nowrap="nowrap">
                <% if (isDivergent) { %>
                <jalios:icon src='warning'  />
                <% } %>
                <%= revision %>
              </td>
              <td class="text-right" nowrap="nowrap"><%= releasedRevision %></td>
            </tr>
            <% } %>
            </jalios:foreach>
          </table>
  </div>
</div>

</jalios:cache>

<%@ include file='/admin/doAdminFooter.jspf' %> 