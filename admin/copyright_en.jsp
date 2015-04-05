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
<%@ include file="/jcore/doInitPage.jspf" %>

<div class="container-fluid">

  <div class="page-header">
    <h1>JCMS copyrights</h1>
  </div>
  <p>Copyright &copy; 2001-<%= request.getAttribute("year") %> Jalios SA</p>
  
  <p>Jalios JCMS <%= isAdmin ? channel.getJcmsInfo().RELEASE : "" %> uses the following third-party products:</p>
  
  <table class="table">
    <tr>
      <td class="text-right"><a target='_blank' href="http://logging.apache.org/log4j/docs/"><img src="images/jalios/logos/log4j.gif"  /></a></td>
      <td>
        <b>Apache Log4j</b> API is used for the logging.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.simonsite.org.uk/">Simon Park - TimeAndSizeRollingAppender</a></td>
      <td>
        Log4J <b>TimeAndSizeRollingAppender</b> API by Simon Park is used for the file rolling logging.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://lucene.apache.org/core/"><img src="images/jalios/logos/lucene.gif"  /></a></td>
      <td>
        <b>Apache Lucene</b> API is used to index and search in publications, documents and in archives.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://xml.apache.org/"><img src="images/jalios/logos/apachexml.gif"  /></a></td>
      <td>
        <b>Apache Xerces</b> API is used to parse XML documents.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.jdom.org/"><img src="images/jalios/logos/jdom.gif"  /></a></td>
      <td>
        <b>JDOM</b> API is used to manipulate XML documents.<br />
        This product is licensed according to the style of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>, with the acknowledgment clause removed.
      </td>
    </tr>
    <tr>
       <td class="text-right">
         <a target='_blank' href="http://jaxen.codehaus.org/"><img src="images/jalios/logos/jaxen.gif"  /></a>
       </td>
       <td>
         <b>Jaxen</b> is an open source XPath library written in Java. It is adaptable to many different object models, including DOM, XOM, dom4j, and JDOM. Is it also possible to write adapters that treat non-XML trees such as compiled Java byte code or Java beans as XML, thus enabling you to query these trees with XPath too. <br />
         This product is published according to the terms of a closed to <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a> licence.
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://jakarta.apache.org/oro/"><img src="images/jalios/logos/oro.gif"  /></a></td>
      <td>
        <b>Jakarta ORO</b> API is used for regular expression.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.pdfbox.org/"><img src="images/jalios/logos/pdfbox.gif"  /></a></td>
      <td>
        <b>PDFBox</b> API is used to process PDF files.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.opensource.org/licenses/bsd-license.php">BSD License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.fontbox.org/"><img src="images/jalios/logos/fontbox.gif"  /></a></td>
      <td>
        <b>FontBox</b> API is used by PDFBox.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.opensource.org/licenses/bsd-license.php">BSD License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.acme.com/java/"><img src="images/jalios/logos/acme.gif"  /></a></td>
      <td>
        Java <b>ACME</b> API is used for image processing.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.acme.com/license.html">ACME Labs Freeware License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.xmlmind.com/spellchecker/"><img src="images/jalios/logos/pixware.gif"  /></a></td>
      <td>
        <b>XMLMind Spell-Checker</b> API is used for spell checking.<br />
        XMLMind Spell-Checker Copyright &copy; 2002 Pixware SARL.
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.mozilla.org/directory/javasdk.html"><img src="images/jalios/logos/mozilla-foundation_small.png"  /></a></td>
      <td>
        <b>Netscape Directory SDK</b> for Java is used for LDAP connection.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.mozilla.org/MPL/">Netscape Public License</a>. 
      </td>
    </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://ical4j.sourceforge.net/"><img src="images/jalios/logos/iCal4j.png" /></a>
      </td>
      <td>
        <b>iCal4j</b> (Copyright (c) 2006, Ben Fortuna) is a Java library used to read and write iCalendar data streams as defined in RFC2445.<br />
        This product is licensed according to the terms specified at <a target='_blank' href="http://ical4j.sourceforge.net/license.html">http://ical4j.sourceforge.net/license.html</a>. 
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.jfree.org/jfreechart/"><img src="images/jalios/logos/jfreechart.jpg" /></a>
      </td>
      <td>
        <b>JFreeChart</b> is a Java library used to generate charts.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://www.mozilla.org/projects/intl/chardet.html"><img src="images/jalios/logos/mozilla-foundation_small.png"  /></a></td>
      <td>
        <a target='_blank' href="http://jchardet.sourceforge.net/">Java port</a> of <b>Mozilla charset detector</b> is used to detect file encoding.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.mozilla.org/MPL/">Netscape Public License</a>. 
      </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://code.google.com/p/jabsorb/"><img src="images/jalios/logos/jabsorb.jpg"  /></a></td>
      <td>
        <b>Jabsorb's JSON-RPC-Java 1.2</b> API is a simple and lightweight Ajax/Web 2.0 framework that allows you to call methods 
        in a Java web application from JavaScript code running in a web browser as if they were local objects residing directly in the browser.<br />
        jabsorb makes use of the JSON-RPC protocol for it's transport mechanism. JSON-RPC is a standard protocol and jabsorb can interoperate 
        with other standard JSON-RPC clients and servers that may be written in other languages.<br/>
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>
      </td>
    </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.javazoom.net/mp3spi/mp3spi.html"><img src="images/jalios/logos/javazoom.gif"  /></a>
      </td>
      <td>
        <b>MP3SPI</b> API is used for MP3 audio format.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
    </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.tritonus.org/plugins.html" style="text-decoration:none; font-size:18px; color: #000000; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">TRITONUS</a>
      </td>
      <td>
        <b>Tritonus</b> is an implementation of the Java Sound API. Basic utility classes are needed for javazoom's mp3spi package.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://prototypejs.org/"><img src="images/jalios/logos/prototype.png" /></a>
      </td>
      <td>
        <b>Prototype 1.7.1</b> is a JavaScript framework that aims to ease development of dynamic web applications. Featuring a unique, easy-to-use toolkit for class-driven development and the nicest Ajax library around, Prototype is quickly becoming the codebase of choice for web application developers everywhere.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://prototypejs.org/"><img src="images/jalios/logos/modernizr.jpg" /></a>
      </td>
      <td>
        <b>Modernizr 2.6.2</b> is a JavaScript library that detects HTML5 and CSS3 features in the user's browser.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://http://jquery.com/"><img src="images/jalios/logos/jquery.gif" /></a>
      </td>
      <td>
        <b>jQuery 1.8</b> jQuery is a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. jQuery is designed to change the way that you write JavaScript.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://jquery.org/license/">MIT License</a>.<br/>
        <strong>jQuery should replace Prototype in future release</strong>
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://http://jqueryui.com/"><img src="images/jalios/logos/jqueryui.jpg" /></a>
      </td>
      <td>
        <b>jQuery UI 1.9</b> jQuery UI is a curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library. Whether you're building highly interactive web applications or you just need to add a date picker to a form control, jQuery UI is the perfect choice.<br/>
        This product is licensed according to the terms of <a target='_blank' href="http://jquery.org/license/">MIT License</a>.<br/>
        <strong>jQuery UI replace Scriptaculous</strong>
     </td>
   </tr>
   <tr>
     <td class="text-right">
       <a target='_blank' href="http://twitter.github.com/bootstrap/"><img src="images/jalios/logos/bootstrap.png" /></a>
     </td>
     <td>
       <b>Bootstrap 3.2</b> Bootstrap from Twitter is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.
       Code licensed under the <a target="_blank" href="http://www.apache.org/licenses/LICENSE-2.0">Apache License v2.0</a>. Documentation licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>
     </td>
   </tr>
   <tr>
      <td class="text-right">
        <a target='_blank' href="http://code.google.com/p/reallysimplehistory/"><font size="6">RSH</font></a>
      </td>
      <td>
        <b>ReallySimpleHistory</b> is a JavaScript library used to handle browser history for Ajax Update purpose.<br />
        This product is provided "as is", without waranty of any kind. It has been patch to specify the location of blank.html
     </td>
   </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://www.datejs.com/"><img src="images/jalios/logos/datejs.jpg" /></a>
      </td>
      <td>
        <b>Datejs</b>, Datejs is an open-source JavaScript Date Library. Comprehensive, yet simple, stealthy and fast.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
    </tr>
    <tr>
      <td class="text-right">
        <a target='_blank' href="http://deepliquid.com/content/Jcrop.html"><img src="images/jalios/logos/jcrop.jpg" /></a>
      </td>
      <td>
        <b>jCrop</b>, is the quick and easy way to add image cropping functionality to your web application. It combines the ease-of-use of a typical jQuery plugin with a powerful cross-platform DHTML cropping engine that is faithful to familiar desktop graphics applications.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>. 
     </td>
    </tr>
    <tr>
      <td class="text-right"><a target='_blank' href="http://tinymce.moxiecode.com/"><img src="images/jalios/logos/moxiecode.gif"  /></a></td>
      <td>JCMS uses the wysiwyg editor <b>TinyMCE</b> from Moxiecode Systems AB.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
      </td>
   </tr>
   <tr>
      <td class="text-right"><a target='_blank' href="http://www.jwplayer.com/">JW Player</a></td>
      <td>JCMS uses <strong>JW Player</strong>.<br />
          This product is licensed according to the terms of Unrestricted Jeroenwijering Proprietary License</a>.
      </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://www.restlet.org/"><img src="images/jalios/logos/restlet.jpg"  /></a></td>
    <td>JCMS uses the REST framework <strong>Restlet</strong> from Noelios Consulting.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://www.hibernate.org/"><img src="images/jalios/logos/hibernate.jpg"  /></a></td>
    <td><strong>Hibernate</strong> is a powerful, high performance object/relational persistence and query service.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License 2.1</a>. 
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://db.apache.org/derby"><img src="images/jalios/logos/derby.jpg"  /></a></td>
    <td><strong>Apache Derby</strong> is an open source relational database implemented entirely in Java.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>.
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://p.yusukekamiyamane.com/icons/search/fugue/">Fugue Icons</a></td>
    <td>Some Icons are Copyright � <a href="http://p.yusukekamiyamane.com/">Yusuke Kamiyamane</a>. All rights reserved. Licensed under a <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 license</a>.</li>
    </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://plupload.com"><img src="images/jalios/logos/plupload.jpg"  /></a></td>
    <td><strong>Plupload v<%= UploadManager.PLUPLOAD_VERSION %></strong> is a highly usable upload handler for Content Management that brings Drag and Drop, Progress, Queue, Resize of images.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://www.plupload.com/commercial.php">OEM License</a>.
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://www.mindrot.org/projects/jBCrypt/">jBCrypt</a></td>
    <td><strong>jBCrypt</strong>  is a Java implementation of OpenBSD's Blowfish password hashing code, as described in
        <a href="http://www.openbsd.org/papers/bcrypt-paper.ps">"A Future-Adaptable Password Scheme"</a> by Niels Provos and David Mazi&egrave;res..<br />
        This product is licensed according to the terms of a <a target='_blank' href="http://www.mindrot.org/files/jBCrypt/LICENSE">ISC/BSD licence</a>.
     </td>
   </tr>
   <tr>
    <td class="text-right"><a target='_blank' href="http://jsoup.org/">jsoup: Java HTML Parser</a></td>
    <td><strong>jsoup</strong> is a Java library for working with real-world HTML. It provides a very convenient API for extracting and manipulating data, using the best of DOM, CSS, and jquery-like methods.<br />
        This product is licensed according to the terms of <a target='_blank' href="http://jsoup.org/license">MIT License</a>
     </td>
   </tr>
  </table>
</div>
