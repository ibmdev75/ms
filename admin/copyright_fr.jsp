<%--
  @Summary: Copyright
  @Category: Admin / Presentation
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: False
  @Deprecated: False
  @Since: jcms-5.0.0
--%>
<%@page import="com.jalios.jcms.upload.UploadManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/jcore/doInitPage.jspf" %>

<div class="container-fluid">

  <div class="page-header">
    <h1>Copyrights JCMS</h1>
  </div>
  <p>Copyright &copy; 2001-<%= request.getAttribute("year") %> Jalios SA</p>
  
  <p>Jalios JCMS <%= isAdmin ? channel.getJcmsInfo().RELEASE : "" %> utilise les produits tiers suivants :</p>
  
  <table class="table">
    <tr>
      <td class="text-right"><a target='_blank' href="http://logging.apache.org/log4j/docs/"><img src="images/jalios/logos/log4j.gif"  /></a></td>
      <td>
        L'API <b>Apache Log4j</b> est utilisée pour la journalisation des événements.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.simonsite.org.uk/">Simon Park - TimeAndSizeRollingAppender</a></td>
      <td>
        L'API Log4J <b>TimeAndSizeRollingAppender</b> de Simonn Park est utilisée pour la rotation des fichiers dans la journalisation des événements.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://lucene.apache.org/core/"><img src="images/jalios/logos/lucene.gif"  /></a></td>
      <td>
        L'API <b>Apache Lucene</b> est utilisée pour indexer et rechercher dans les publications, les documents et les archives.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://xml.apache.org/"><img src="images/jalios/logos/apachexml.gif"  /></a></td>
      <td>
        L'API <b>Apache Xerces</b> est utilisée pour parser les documents XML.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.jdom.org/"><img src="images/jalios/logos/jdom.gif"  /></a></td>
      <td>
        L'API <b>JDOM</b> est utilisée pour manipuler les documents XML.<br />
        Ce produit est licencié dans l'esprit de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a> sans la clause de reconnaissance. 
      </td>
    </tr>
  	<tr>
  	   <td class="text-right">
  	     <a target='_blank' href="http://jaxen.codehaus.org/"><img src="images/jalios/logos/jaxen.gif"  /></a>
  	   </td>
  	   <td>
         <b>Jaxen</b> est une librairie XPath open source écrite en Java. Elle s'adapte à plusieurs type de modèles object XML, dont en particulier DOM, XOM, dom4j, et JDOM. Il est également possible d'écrire des adaptateurs qui supportent des arbres non XML, comme du pseudo-code Java ou des javabean, cela vous permet de requêter ces arbres en XPath. <br />
         Ce produit est publié sous une licence proche de la <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
  	  </td>
  	</tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://jakarta.apache.org/oro/"><img src="images/jalios/logos/oro.gif"  /></a></td>
      <td>
        L'API <b>Jakarta ORO</b> est utilisée pour les expressions régulières.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.pdfbox.org/"><img src="images/jalios/logos/pdfbox.gif"  /></a></td>
      <td>
        L'API <b>PDFBox</b> est utilisée pour traiter les fichiers PDF.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/bsd-license.php">BSD License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.fontbox.org/"><img src="images/jalios/logos/fontbox.gif"  /></a></td>
      <td>
        L'API <b>FontBox</b> est utilisée par PDFBox.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/bsd-license.php">BSD License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.acme.com/java/"><img src="images/jalios/logos/acme.gif"  /></a></td>
      <td>L'API Java <b>ACME</b> est utilisée pour faire du traitement sur les images.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.acme.com/license.html">ACME Labs Freeware License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.xmlmind.com/spellchecker/"><img src="images/jalios/logos/pixware.gif"  /></a></td>
      <td>
        L'API <b>XMLMind Spell-Checker</b> est utilisée pour la correction orthographique.<br />
        XMLMind Spell-Checker Copyright &copy; 2002 Pixware SARL.
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.mozilla.org/directory/javasdk.html"><img src="images/jalios/logos/mozilla-foundation_small.png"  /></a></td>
      <td>L'API <b>Netscape Directory SDK for Java</b> est utilisée pour la communication avec des serveurs LDAP.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.mozilla.org/MPL/">Netscape Public License</a>. 
      </td>
    </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://ical4j.sourceforge.net/"><img src="images/jalios/logos/iCal4j.png" /></a>
      </td>
      <td>
        <b>iCal4j</b> (Copyright (c) 2006, Ben Fortuna) est une librairie Java pour l'import et l'export de flux iCalendar comme définit par la RFC2445.<br />
        Ce produit est licencié selon les termes spécifiés sur le site <a target='_blank' href="http://ical4j.sourceforge.net/license.html">http://ical4j.sourceforge.net/license.html</a>. 
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.jfree.org/jfreechart/"><img src="images/jalios/logos/jfreechart.jpg" /></a>
      </td>
      <td>
        <b>JFreeChart</b> est une librairie Java pour la génération de graphiques.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.mozilla.org/projects/intl/chardet.html"><img src="images/jalios/logos/mozilla-foundation_small.png"  /></a></td>
      <td>
        <a target='_blank' href="http://jchardet.sourceforge.net/">Le portage Java</a> de <b>Mozilla charset detector</b> est utilisée pour la detection des encodages de fichiers.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.mozilla.org/MPL/">Netscape Public License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://code.google.com/p/jabsorb/"><img src="images/jalios/logos/jabsorb.jpg"  /></a></td>
      <td>L'API <b>Jabsorb 1.2</b> est utilisée pour les fonctionnalités AJAX.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.javazoom.net/mp3spi/mp3spi.html"><img src="images/jalios/logos/javazoom.gif"  /></a>
      </td>
      <td>
        L'API <b>MP3SPI</b> est utilisée pour le décodage des fichiers audio MP3.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
    </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.tritonus.org/plugins.html" style="text-decoration:none; font-size:18px; color: #000000; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">TRITONUS</a>
      </td>
      <td>
        <b>Tritonus</b> est une implémentation de l'API Java Sound API. Certaines de ses classes sont utilisées par l'API MP3SPI.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
   <tr>
     <td class="text-right">
       <a target='_blank' href="http://prototypejs.org/"><img src="images/jalios/logos/modernizr.jpg" /></a>
     </td>
     <td>
       <b>Modernizr 2.6.2</b> est un framework JavaScript qui detect les fonctionnalités HTML5 et CSS3 du navigateur client.<br />
       Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
   </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://prototypejs.org/"><img src="images/jalios/logos/prototype.png" /></a>
      </td>
      <td>
        <b>Prototype 1.7.1</b> est un framework JavaScript facilitant le developpement de site web dynamique.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://http://jquery.com/"><img src="images/jalios/logos/jquery.gif" /></a>
      </td>
      <td>
        <b>jQuery 1.8</b> jQuery est un framework javascript qui simplifie le parcours du DOM, la gestion des évènements, ... pour un développement rapide d'applications web.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>.<br/>
        <strong>jQuery devrait a terme remplacer Prototype dans les prochaines versions</strong>
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://http://jqueryui.com/"><img src="images/jalios/logos/jqueryui.jpg" /></a>
      </td>
      <td>
        <b>jQuery UI 1.9</b> jQuery UI est un framework de composants graphique, animations, etc, ... pour les pages web<br/>
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>.<br/>
        <strong>jQuery UI remplace Scriptaculous</strong>
     </td>
   </tr>
   <tr>
     <td class="text-right">
       <a target='_blank' href="http://twitter.github.com/bootstrap/"><img src="images/jalios/logos/bootstrap.png" /></a>
     </td>
     <td>
       <b>Bootstrap 3.2</b> Bootstrap de Twitter est uen boite à outils de Twitter conçu pour démarer rapidement le designs d'application web ou site. Il inclus une base de CSS et HTML pour la typographie, formulaires, bouttons, tables, grilles et plus.
       Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>.
     </td>
   </tr> 
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://code.google.com/p/reallysimplehistory/"><font size="6">RSH</font></a>
      </td>
      <td>
        <b>ReallySimpleHistory</b> est une bibliothèque JavaScript utilisée pour gérer l'historique du navigateur dans les problématiqeus AJAX.<br />
        Ce produit est fournit "tel que", sans aucunes garanties d'aucunes sorte. Elle a été patché pour changer l'emplacement du fichier blank.html
     </td>
   </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.dynarch.com/"><img src="images/jalios/logos/dynarch.gif"  /></a></td>
      <td>JCMS utilise le composant <b>JSCla2</b> de Dynarch.<br />
        Ce produit est licencié selon les termes de License "Library". 
      </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.datejs.com/"><img src="images/jalios/logos/datejs.jpg" /></a>
      </td>
      <td>
        <b>Datejs</b> est une librarie javascript simple, rapide et élégante de gestion de date.<br/>
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
   </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://deepliquid.com/content/Jcrop.html"><img src="images/jalios/logos/jcrop.jpg" /></a>
      </td>
      <td>
        <b>jCrop</b>, est une librarie pour faciliter le recadrage d'images.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://tinymce.moxiecode.com/"><img src="images/jalios/logos/moxiecode.gif"  /></a></td>
      <td>JCMS utilise l'éditeur Wysiwyg <b>TinyMCE</b> de Moxiecode Systems AB.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
      </td>
   </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.jwplayer.com/">JW Player</a></td>
      <td>JCMS utilise <strong>JW Player</strong>.<br />
          Ce produit est licencié selon les termes de la licence propriétaire sans limitation de Jeroenwijering</a>. 
      </td>
   </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.restlet.org/"><img src="images/jalios/logos/restlet.jpg"  /></a></td>
      <td>JCMS utilise le framework REST <strong>Restlet</strong> de Noelios Consulting.<br />
        Ce produit est licencié selon les termes de la <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
      </td>
   </tr>
    <tr>
    <td class="text-right"><a target='_blank' href="http://www.hibernate.org/"><img src="images/jalios/logos/hibernate.jpg"  /></a></td>
    <td><strong>Hibernate</strong> est un framework open source gérant la persistance des objets en base de données relationnelle.<br />
        Ce produit est licencié selon les termes de la <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://db.apache.org/derby"><img src="images/jalios/logos/derby.jpg"  /></a></td>
    <td><strong>Apache Derby</strong> est une base de donnée relationnelle open source entièrement écrite en Java.<br />
        Ce produit est licencié selon les termes de <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>.
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://p.yusukekamiyamane.com/icons/search/fugue/">Fugue Icons</a></td>
    <td>Certaines icônes sont Copyright © <a href="http://p.yusukekamiyamane.com/">Yusuke Kamiyamane</a>. All rights reserved. Licencié selon les termes <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 license</a>.</li>
    </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://plupload.com"><img src="images/jalios/logos/plupload.jpg"  /></a></td>
    <td><strong>Plupload v<%= UploadManager.PLUPLOAD_VERSION %></strong> est un outil permettant le téléchargement sur une majorité de navigateurs en proposant les fonctionnalités de Drag and Drop, Progression, Fil d'attente, Redimensionnement.<br />
        Le produit est sous<a target='_blank' href="http://www.plupload.com/commercial.php"> Licence OEM</a>.
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://www.mindrot.org/projects/jBCrypt/">jBCrypt</a></td>
    <td><strong>jBCrypt</strong> est une implémentation Java de l'algorithme de hachage cryptographique de mot de passe OpenBSD Blowfish, tel que décrit
        dans la publication <a href="http://www.openbsd.org/papers/bcrypt-paper.ps">"A Future-Adaptable Password Scheme"</a> de Niels Provos et David Mazi&egrave;res..<br />
        Ce produit est licencié selon les termes d'une <a target='_blank' href="http://www.mindrot.org/files/jBCrypt/LICENSE">licence ISC/BSD</a>.
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://jsoup.org/">jsoup: Java HTML Parser</a></td>
    <td><strong>JSoup</strong> est une librairie Java de manipulation HTML (parsing, extraction, recherche DOM, nettoyage, ...).<br />
        Le produit est sous <a target='_blank' href="http://jsoup.org/license">Licence MIT</a>
     </td>
   </tr>
  </table>
</div>
