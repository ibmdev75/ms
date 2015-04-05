<%--
  @Summary: Documentation des règles de formattage Wiki
  @Category: Documentation
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf' %>
 <table class="table howToTFR">
    <tr bgcolor="#EEEEEE"> 
      <td class="col-md-4"> 
        <div class="text-center"><strong>Formattage</strong></div>
      </td>
      <td class="col-md-4"> 
        <div class="text-center"><strong>Exemple, vous écrivez</strong></div>
      </td>
      <td> 
        <div class="text-center"><strong>Vous obtenez</strong></div>
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> 
        <p><strong>Paragraphes :</strong> <br />
      Une ligne vide marque un  nouveau paragraphe. </p>
        <p>Ajoutez un '#' en fin de ligne pour insérer un saut de ligne.</p>
      </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">1er paragraphe

2nd paragraphe#
avec un saut de ligne</font></span></pre>
      </td>
      <td class="vTop"> 1er paragraphe 
        <p> 2nd paragraphe<br />
          avec un saut de ligne
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Titre :</strong> <br />
      Au moins 3 tirets au début de la ligne, suivis des signes '+' et du titre. '++' créé un titre de niveau 1, '+++' plus créé un titre de niveau 2, ... Au maxium 6 niveaux.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">---++ Niveau1

---+++ Niveau2

---++++ Niveau3</font></span></pre>
      </td>
      <td class="vTop"> 
        <h1 class="wiki">Niveau1</h1>
        <h2 class="wiki">Niveau2</h2>
        <h3 class="wiki">Niveau3</h3>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Gras :</strong> <br />
      Encadrez un mot avec des asteriks * pour le mettre en <strong>gras</strong>.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">*Gras*
</font></span></pre>
      </td>
      <td class="vTop"> <strong>Gras</strong> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Italique :</strong> <br />
      Encadrez un mot avec des soulignés _  pour le mettre en <em>italique</em>.  </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">_Italique_
</font></span></pre>
      </td>
      <td class="vTop"> <em>Italique</em> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Gras Italique</strong> :<br />
      Encadrez un mot avec des double soulignés __  pour le mettre en <em><b>gras italique</b></em>.  </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">__Gras italique__
</font></span></pre>
      </td>
      <td class="vTop"> <strong><em>Gras italique</em></strong> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Chasse fixe :</strong> <br />
      Encadrez un mot avec des égals =   pour le mettre en <code>chasse fixe</code>.  </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">=Chasse fixe=
</font></span></pre>
      </td>
      <td class="vTop"> <code>Chasse fixe</code> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Chasse fixe grasse : </strong><br />
      Encadrez un mot avec des double égals ==   pour le mettre en <code><b>chasse fixe grasse</b></code>.  </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">==Chasse fixe grasse==
</font></span></pre>
      </td>
      <td class="vTop"> <code><b>Chasse fixe grasse</b></code></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong><em>Attention :</em></strong> Assurez-vous de &quot;coller&quot; les signes <code>* _ = ==</code> aux mots, c-à-d otez les espaces.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">_Ca marche_,
_Ca ne marche pas _
</font></span></pre>
      </td>
      <td class="vTop"> <em>Ca marche</em>, _Ca ne marche pas  _ </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Separateur :</strong> <br />
      Au moins 3 tirets au début d'une ligne. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">-------
</font></span></pre>
      </td>
      <td class="vTop"> 
        <hr class="wiki"/>
    </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Liste à items :</strong> <br />
      Trois espaces et un asterisk (*). <br/>
      Dièse (#) avec la même indentation pour continuer l'item sur une nouvelle ligne.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   * item 1
   # ligne suivante
   * item 2
   * item 3
</font></span></pre>
      </td>
      <td class="vTop"> 
        <ul class="wiki">
          <li class="wiki">  item 1<br/> ligne suivante</li>
          <li class="wiki">  item 2</li>
          <li class="wiki">  item 3</li>
        </ul>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>List à items imbriqués :</strong> <br />
      Six, neuf, ... espaces et un asterisk (*).<br/>
      Dièse (#) avec la même indentation pour continuer l'item sur une nouvelle ligne.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   * item de premier niveau
      * item imbriqué
      # ligne 2</font></span></pre>
      </td>
      <td class="vTop"> 
        <ul class="wiki">
          <li>item de premier niveau
          <ul class="wiki">
            <li class="wiki"> item imbriqué <br/> ligne 2</li>
          </ul>
          </li>
        </ul>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Liste ordonnée:</strong> <br />
      3 espaces et un nombre. <br/>
      Dièse (#) avec la même indentation pour continuer l'item sur une nouvelle ligne.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   1 Sushi
   # Miam
   1 Dim Sum
</font></span></pre>
      </td>
      <td class="vTop"> 
        <ol class="wiki">
          <li class="wiki"> Sushi <br/> Miam</li>
          <li class="wiki"> Dim Sum </li>
        </ol>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Liste de définition :</strong> <br />
      Trois espaces, le terme, un ':'  et la définition. <br />
      <strong><em>Attention:</em></strong> Les termes avec des espaces ne sont pas supportés. Si vous avez des termes composés de plusieurs mots, séparez-les avec des tirets ou avec l'espace insécable <code>&amp;nbsp;</code>.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   Sushi: Japan
   Dim&amp;nbsp;Sum: S.F.
</font></span></pre>
      </td>
      <td class="vTop"> 
        <dl class="wiki"> 
          <dt class="wiki"> Sushi 
          <dd class="wiki"> Japan 
          <dt class="wiki"> Dim&nbsp;Sum 
          <dd class="wiki"> S.F. 
        </dl>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Image:</strong> <br />
        Insérez une image en donnant son nom de fichier  
        (relatif  à la racine du canal).</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">images/powered-by-jcms.gif
</font></span></pre>
        <pre><span style="background : #FFFFCC;"><font color="#990000">[[upload/docs/image/jpeg/2009-01/image.jpg][320x240]]
</font></span></pre>
      </td>
      <td class="vTop"><img class="wiki" src="images/jalios/logos/powered-by-jalios.gif" /> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Médias (Audio, Video, Image, ...):</strong> <br />
        Insérez tout type de média en saisissant le tag <code>[flv path="pathToMedia" width="320" height="240" /]</code>.<br/> Seul le paramètre <code>path</code> est obligatoire.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[media path="upload/video.mp4" /]
[media path="upload/audio.mp3" /]
[media path="upload/image.png" 
     width="640" height="480" /]
</font></span></pre>
      </td>
      <td class="vTop"></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Vidéo Flash (FLV) :</strong> <br />
        Insérez une vidéo Flash (FLV) en saisissant le tag <code>[flv path="pathDuFLV" width="320" height="240" image="pathImageAccueil" /]</code>.<br/> Seul le paramètre <code>path</code> est obligatoire.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[flv path="upload/video.flv" /]
[flv path="upload/video.flv" 
     width="320" height="240" 
     image="upload/intro.gif" /]
</font></span></pre>
      </td>
      <td class="vTop"></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>MP3:</strong> <br />
        Insérez un MP3 en saisissant le tag <code>[mp3 path="pathMP3" width="320" height="160" image="pathTitleImage" showeq="true" /]</code>.<br/> Seul le paramètre <code>path</code> est obligatoire.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[mp3 path="upload/music.mp3" /]
[mp3 path="upload/music.mp3" 
     width="320" height="240" 
     image="upload/intro.gif"
     showeq="false" /]
</font></span></pre>
      </td>
      <td class="vTop"></td>
    </tr>   
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Liens JCMS :</strong> <br />
      Posez un lien sur une publication en encadrant son titre (ou son ID) par des double crochets. Vous pouvez choisir un titre différent pour le lien avec la syntaxe suivante <code>[[ID][text]]</code>.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[[Un article]]

[[c_1234][Cet article]]
</font></span></pre>
      </td>
      <td class="vTop"> <a  class="wiki" href="">Un article</a> 
        <p> <a class="wiki" href="">Cet article</a>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Liens externes :</strong> <br />
      Posez un lien externe simplement en donnant son URL.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">http://www.jalios.com/

[[http://www.sun.com/][Sun]]
</font></span></pre>
      </td>
      <td class="vTop"> <a class="wiki" href="http://www.jalios.com/">http://www.jalios.com</a> 
        <p> <a class="wiki" href="http://www.sun.com/" target="_top">Sun</a> 
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td class="vTop"><strong>Email:</strong> <br />
      Vous  créez un lien 'mailto' en donnant un email</td>
      <td class="vTop"><span style="background : #FFFFCC;"><font color="#990000">contact@jalios.com</font></span></td>
      <td class="vTop"><a class="wiki" href="mailto:contact@jalios.com">contact@jalios.com</a></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Tableau :</strong> <br />
      Des espaces optionels suivit de la cellule encadrée par des barres verticales (|) ou des symboles paragraphe (&sect;).<br />
      <strong><em>Note:</em></strong> <code>&sect; &nbsp; header&nbsp; &sect;</code> cellule en tétière. <br />
      <strong><em>Note:</em></strong> <code>| &nbsp; spaced &nbsp; |</code> cellule alignée au centre. <br />
      <strong><em>Note:</em></strong> <code>| &nbsp; &nbsp; spaced |</code> cells 
      alignée à droite. <br />
      <br />
    </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">| Gauche  |  Centre  |  Droite |
| A2      |     2    |       2 |
| A3      |     3    |       3 |

&sect; Gauche  &sect;  Centre  &sect;  Droite &sect;
| A2      |     2    |       2 |
| A3      |     3    |       3 |

&sect; Gauche  |  Centre  |  Droite |
&sect; A2      |     2    |       2 |
&sect; A3      |     3    |       3 |
</font></span></pre>
      </td>
      <td class="vTop"> 
        <table class="wiki">
          <tr class="wiki"> 
            <td class="wiki">Gauche</td>
            <td class="wiki">Centre</td>
            <td class="wiki">Droite</td>
          </tr>
          <tr class="wiki"> 
            <td class="wiki text-left"> A2 </td>
            <td class="wiki text-center"> 2 </td>
            <td class="wiki text-right"> 2 </td>
          </tr>
          <tr class="wiki"> 
            <td class="wiki text-left"> A3 </td>
            <td class="wiki text-center"> 3 </td>
            <td class="wiki text-right"> 3 </td>
          </tr>
        </table>
        <br />
        <table class="wiki">
          <tr class="wiki"> 
            <th class="wiki">Gauche</th>
            <th class="wiki">Centre</th>
            <th class="wiki">Droite</th>
          </tr>
          <tr class="wiki"> 
            <td class="wiki text-left"> A2 </td>
            <td class="wiki text-center"> 2 </td>
            <td class="wiki text-right"> 2 </td>
          </tr>
          <tr class="wiki"> 
            <td class="wiki text-left"> A3 </td>
            <td class="wiki text-center"> 3 </td>
            <td class="wiki text-right"> 3 </td>
          </tr>
        </table>
        <br />
        <table class="wiki">
          <tr class="wiki"> 
            <th class="wiki">Gauche</th>
            <td class="wiki">Centre</td>
            <td class="wiki">Droite</td>
          </tr>
          <tr class="wiki"> 
            <th class="wiki text-left"> A2 </th>
            <td class="wiki text-center"> 2 </td>
            <td class="wiki text-right"> 2 </td>
          </tr>
          <tr class="wiki"> 
            <th class="wiki text-left"> A3 </th>
            <td class="wiki text-center"> 3 </td>
            <td class="wiki text-right"> 3 </td>
          </tr>
        </table>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Citation:</strong><br>
      Pour citer quelqu'un dans un forum.
      </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[quote]
  Que penses-tu de cela? 
[/quote]
Je suis d'accord.
</font></span></pre>
      </td>
      <td class="vTop"> 
<jalios:wiki>
[quote]
  Que penses-tu de cela? 
[/quote]
Je suis d'accord.
</jalios:wiki>
      </td>
    </tr>


    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Code:</strong><br>
      Utile pour afficher des exemples de code de langage de programmation ou du texte à chasse fixe.
      </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[verbatim]
   .--.  
  /( @ >    ,-. 
 / ' .'--._/  /
 :   ,    , .'
 '. (___.'_/
  ((-((-''  
[/verbatim]
</font></span></pre>
      </td>
      <td class="vTop"> 
<jalios:wiki>
[verbatim]
   .--.  
  /( @ >    ,-. 
 / ' .'--._/  /
 :   ,    , .'
 '. (___.'_/
  ((-((-''  
[/verbatim]
</jalios:wiki>
      </td>
    </tr>
    
  <tr bgcolor="#FFFFFF"> 
    <td class="vTop"> <strong>Message:</strong><br>
      Affiche un message sous la forme d'une info, erreur, ou avertissement. 
      L'avertissement est légèrement décalé sur la droite 
    </td>
    <td class="vTop"> 
    <pre><span style="background : #FFFFCC;"><font color="#990000">
[info] Message d'information [/info]
[error] Message d'erreur [/error]
[disclaimer] Message d'avertissement [/disclaimer]
    </font></span></pre></td><td class="vTop">
      <div style="margin-left: -100px;">
      <jalios:wiki>
[info] Message d'information [/info]
[error] Message d'erreur [/error]
[disclaimer] Message d'avertissement [/disclaimer]     
      </jalios:wiki>
      </div>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td class="vTop"> <strong>Note:</strong><br>
      Trasforme une zone de texte en tooltip.
      L'icone est affichée sur la gauche en dehors de la zone wiki.
    </td>
    <td class="vTop"> 
    <pre><span style="background : #FFFFCC;"><font color="#990000">[note]Lorem ipsum dolor sit amet[/note]</font></span></pre></td><td class="vTop">
      <div style="position: relative; margin-left: 20px;">
      <jalios:wiki>
[note]Lorem ipsum dolor sit amet[/note]
      </jalios:wiki>
      </div>
    </td>
  </tr>
<%
  LangProperties props = channel.getProperties("wiki.shortcode");
  if (Util.notEmpty(props)){
    for (Map.Entry<String, String> itProp : props.entrySet()){
      String value = Util.getString(itProp.getValue(),"");
      String key   = Util.getString(itProp.getKey(),"");
      if (!key.endsWith("snippet")){ continue; }
      String shortcode =  key.substring(15,key.length()-8);
      
      String doc    = "wiki.shortcode."+shortcode+".doc";
      String docGLP = glp("wiki.shortcode."+shortcode+".doc");
      if (doc.equals(docGLP)){ continue; }
%>
<tr bgcolor="#FFFFFF">
  <td>
    <strong><%= glp("wiki.shortcode."+shortcode) %></strong>:<br/>
    <%= glp("wiki.shortcode."+shortcode+".h") %><br/>
    <%= docGLP %>
  </td>
  <td>
    <pre><span style="background : #FFFFCC;"><font color="#990000"><%= value %></font></span></pre>
  </td>
  <td></td>
</tr>
<% }} %>
<jalios:include target="WIKI_HELP" targetContext="tr" />
</table>


