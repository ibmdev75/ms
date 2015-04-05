<%--
  @Summary: Documentation des syntaxes de recherche
  @Category: Documentation
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  request.setAttribute("title","Aide sur la recherche"); 
  request.setAttribute("zone","InternalUI");
  jcmsContext.addCSSHeader("css/jalios/textSearchHelp.css"); 
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<%
  boolean LUCENE_WILDCARD_ENABLED = channel.getBooleanProperty("query.lucene.wildcard.enabled", true);
  boolean LUCENE_FUZZY_ENABLED = channel.getBooleanProperty("query.lucene.fuzzy.enabled", true);
  boolean USE_RIGHT_TRUNCATION = channel.getBooleanProperty("query.lucene.use-right-truncation", false);
%>
    <div id="toc">
      <% String curURL = ServletUtil.getUrl(request); %>
      <a href="<%= curURL %>#anchorMajMin" class="toc-h2">1. Majuscules, minuscules et diacritiques</a>
      <a href="<%= curURL %>#anchorSpecChar" class="toc-h2">2. Caratères spéciaux</a>
      <a href="<%= curURL %>#anchorBool" class="toc-h2">3. Recherche booléenne <samp>AND, &amp;&amp;, OR, ||, NOT, !, +, -</samp></a>
      <a href="<%= curURL %>#anchorRechChamp" class="toc-h2">4. Recherche par champs <samp>monChamp:&quot;texte&quot;</samp></a>
      <a href="<%= curURL %>#anchorGroup" class="toc-h2">5. Groupement <samp>( )</samp></a>
      <a href="<%= curURL %>#anchorAvance" class="toc-h2">6. Fonction avancée</a>
      <a href="<%= curURL %>#anchorWildcard" class="toc-h3">6.1 Caractères joker <samp>*, ?</samp></a>
      <a href="<%= curURL %>#anchorFuzzy" class="toc-h3">6.2 Recherche approximative <samp>mot~</samp></a>
      <a href="<%= curURL %>#anchorProximity" class="toc-h3">6.3 Recherche de proximité <samp>phrase~7</samp></a>
      <a href="<%= curURL %>#anchorInterval" class="toc-h3">6.4 Recherche par intervalle <samp>monChamp:[... TO ...], monChamp:{... TO ...}</samp></a>
      <a href="<%= curURL %>#anchorBoost" class="toc-h3">6.5 Augmenter le poid d'un terme <samp>terme^2</samp></a>
    </div>

    <h1>Aide sur la recherche <a href="#" title="Imprimer..." onclick="window.print();" ><jalios:icon src="printer" alt="Imprimer...."/></a></h1>
    <p>Dans cette aide, un <em>&laquo;terme&raquo;</em> fait référence :</p>
    <ul>
      <li>soit à un mot unique du texte recherché, appelé <em>&laquo;terme unique&raquo;</em>;</li>
      <li>soit à un ensemble de mot entre guillemets dans le texte recherché, appelé <em>&laquo;phrase&raquo;</em>.</li>
    </ul>
    <p>Par exemple, si vous recherchez : </p>
    <pre style="display:inline;">Bienvenue dans &quot;Jalios JCMS&quot;</pre>
    <ul>
      <li><em>&laquo;Bienvenue&raquo;</em> et <em>&laquo;dans&raquo;</em> sont considérés comme des terme uniques;</li>
      <li><em>&laquo;&quot;Jalios JCMS&quot;&raquo;</em> comme une phrase,</li>
      <li>les 3 sont des termes.</li>
    </ul>

    <h2><a id="anchorMajMin"></a>1. Majuscules, minuscules et diacritiques</h2>
    <p><strong>Majuscule et Minuscule :</strong> La recherche ne tient pas compte de la casse des lettres (MAJUSCULES/minuscules).</p>
    <p>Par exemple, vous obtiendrez les mêmes résultats en recherchant &laquo;bonjour&raquo;, &laquo;Bonjour&raquo; ou &laquo;BONJOUR&raquo;.</p>
    <p><strong>Signes et lettres diacritiques :</strong> La recherche <em>en français</em> ne tient pas compte des signes et lettres diacritiques (accents, ç, etc.)</p>
    <p>Par exemple, vous obtiendrez les mêmes résultats en recherchant &laquo;régions françaises&raquo; ou &laquo;region francaises&raquo;.</p>

    <h2><a id="anchorSpecChar"></a>2. Caratères spéciaux</h2>
    <p>Certains caractères sont utilisés pour des fonctions avancées de la recherche. Si vous souhaitez rechercher ces caractères, vous devez les faire précéder du caractère &laquo;\&raquo; (anti-slash). Voici la liste de ces caractères spéciaux :</p>
    <pre>+ - &amp;&amp; || ! ( ) { } [ ] ^ &quot; ~ * ? : \</pre>
    <p>Par exemple pour  rechercher le texte <em>&laquo;3 * (5+9) = 42&raquo;</em>, vous devrez saisir :</p>
    <pre>3 \* \(5\+9\) = 42</pre>

    <h2><a id="anchorBool"></a>3. Recherche booléenne <samp>AND, &amp;&amp;, OR, ||, NOT, !, +, -</samp></h2>
    <p>Vous pouvez utiliser les mots-clés ou opérateurs suivant pour effectuer des opérations logiques entre les différents termes de votre recherche. Vous devez respecter la casse des mots clés en les spécifiant toujours en MAJUSCULES.</p>
    <table class='layout'>
      <tr>
        <th>Mot-clé</th>
        <th>Opérateur équivalent</th>
        <th>Explication</th>
        <th>Exemple</th>
      </tr>
      <tr>
        <td class="text-center"><strong>AND</strong></td>
        <td class="text-center"><strong>&amp;&amp;</strong></td>
        <td>Une publication est retenue uniquement si les deux termes entourant l'opérateur <em>&amp;&amp;</em> ou le mot-clé <em>AND</em> sont présents dans le(s) champ(s) recherché(s).
          <p>C'est l'opérateur par défaut dans JCMS (options <em>&laquo;Tous les mots&raquo;</em>).</p>
        </td>
        <td>
          <pre>&quot;robe blanche&quot; AND cheval</pre>
          <pre>&quot;robe blanche&quot; &amp;&amp; cheval</pre>
          Recherche tous les contenus qui contiennent à la fois <em>&laquo;robe blanche&raquo;</em> et <em>&laquo;cheval&raquo;</em>.</td>
      </tr>
      <tr>
        <td class="text-center"><strong>OR</strong></td>
        <td class="text-center"><strong>||</strong></td>
        <td>Une publication est retenue si au moins un des deux termes entourant l'opérateur <em>||</em> ou le mot-clé <em>OR</em> sont présents dans le(s) champ(s) recherché(s).</td>
        <td>
          <pre>cheval OR chevaux</pre>
          <pre>cheval || chevaux</pre>
          Recherche tous les contenus qui contiennent soit <em>&laquo;cheval&raquo;</em>, soit <em>&laquo;chevaux&raquo;</em>, ou les deux à la fois.</td>
      </tr>
      <tr>
        <td class="text-center"><strong>NOT</strong></td>
        <td class="text-center"><strong>!</strong> ou <strong>-</strong></td>
        <td>Une publication est retenue uniquement si le terme suivant le mot-clé <em>NOT</em>, l'opérateur <em>!</em> ou l'opérateur <em>-</em> est absent du(des) champ(s) recherché(s).
          <p>Les opérateurs <em>!</em> et <em>-</em> doivent être acollés au terme à exclure.</p>
        </td>
        <td>
          <pre>&quot;robe blanche&quot; NOT vêtements</pre>
          <pre>&quot;robe blanche&quot; !vêtements</pre>
          <pre>&quot;robe blanche&quot; -vêtements</pre>
          Recherche tous les contenus qui contiennent <em>&laquo;robe blanche&raquo;</em>, mais pas <em>&laquo;vêtements&raquo;</em>.</td>
      </tr>
      <tr>
        <td class="text-center"></td>
        <td class="text-center"><strong>+</strong></td>
        <td>Une publication est retenue uniquement si le terme suivant l'opérateur <em>+</em> est présent dans le(s) champ(s) recherché(s). Les autres termes sont optionnels (sauf autrement précisé).
          <p>L'opérateur <em>+</em> doit être accolé au terme à inclure.</p>
        </td>
        <td>
          <pre>+&quot;robe blanche&quot; cheval</pre>
          Recherche tous les contenus qui contiennent <em>&laquo;robe blanche&raquo;</em>, et si possible <em>&laquo;cheval&raquo;</em>.</td>
      </tr>
    </table>

    <h2><a id="anchorRechChamp"></a>4. Recherche par champs <samp>monChamp:&quot;texte&quot;</samp></h2>
    <p>Vous pouvez effectuer une recherche dans n'importe quel champ de vos contenus en précisant le nom du champ, suivi du caractère &laquo;:&raquo; (deux points) puis du texte recherché.</p>
    <pre>nomduchamp:texte</pre>
    <p><strong>Titre et Résumé </strong>: quelque soit le type de contenu ou la langue du site, pour rechercher dans les champs <em>titre</em> et <em>résumé</em>, vous devez respectivement utiliser les noms de champ <em>&laquo;title&raquo;</em> et <em>&laquo;abstract&raquo;</em>.</p>
    <p><strong>Autres champs </strong>: pour les autres champs propre à chaque type, vous devez alors utiliser le nom <em>interne </em>généré par JCMS pour le champ. Il s'agit en général du nom du champ dans la langue principale du site, sans accent, ni signe diacritique, commençant par une minuscule. Par exemple pour un champ avec le libéllé <em>&laquo;Régions française&raquo;</em>, le nom interne du champ sera <em>&laquo;regionFrancaise&raquo;</em>.</p>
    <p><strong>Exemple </strong>: pour effectuer une recherche du terme<em>&laquo;restaurant&raquo;</em> dans le champ résumé, ainsi que du terme <em>&laquo;gers&raquo;</em> dans le champ <em>&laquo;Région française&raquo;</em> de notre exemple ci dessus, voici la syntaxe à utiliser:</p>
    <pre>abstract:restaurant regionFrancaise:gers</pre>

    <h2><a id="anchorGroup"></a>5. Groupement <samp>( )</samp></h2>
    <p><strong>Groupement logique :</strong> vous pouvez utiliser les parenthèses pour grouper certains termes de votre recherche. Ceci permet notament de controler plus précisément la portée des opérateurs booléen.</p>
    <p>Par exemple, pour recherchez tous les contenus qui contiennent soit <em>&laquo;cheval&raquo;</em> soit <em>&laquo;chevaux&raquo;</em>, et <em>&laquo;robe&raquo;</em></p>
    <pre>robe AND (cheval OR chevaux)</pre>
    <p><strong>Groupement de champ :</strong> pour rechercher plus d'un terme sur un champ unique, vous pouvez également utiliser les parenthèses.</p>
    <p>Par exemple, pour recherchez tous les contenus dont le champ titre contient <em>&laquo;cheval&raquo;</em> et <em>&laquo;robe blanche&raquo;</em> :</p>
    <pre>title:(+cheval +&quot;robe blanche&quot;)</pre>

    <h2><a id="anchorAvance"></a>6. Fonction avancée</h2>

    <h3><a id="anchorWildcard"></a>6.1 Caractères joker <samp>*, ?</samp></h3>
    <p><strong>? :</strong> Utilisez le symbole <em>&laquo;?&raquo;</em> (point d'intérrogation) pour effectuer une recherche sur un caractère joker.</p>
    <p>Par exemple pour rechercher tous les contenus dont le texte contient le mot <em>&laquo;remorque&raquo;</em> ou le mot <em>&laquo;remarque&raquo;:</em></p>
    <pre>rem?rque</pre>
    <p><strong>* :</strong> Utilisez le symbole <em>&laquo;*&raquo;</em> (astérisque, étoile) pour effectuer une recherche sur plusieurs caratère joker.</p>
    <p>Par exemple pour rechercher tous les contenus commençant par <em>&laquo;m&raquo;</em> et finissant par <em>&laquo;uscule&raquo;</em> :</p>
    <pre>m*uscule</pre>
    <p>Cette recherche trouvera tous les contenus avec le mot <em>&laquo;majuscule&raquo;</em> ou <em>&laquo;minuscule&raquo;</em>.</p>
<% if (!LUCENE_WILDCARD_ENABLED) { %>
    <p>Note : Cette fonctionnalité est actuellement désactivée sur le site.</p>
<% } %>    
<% if (USE_RIGHT_TRUNCATION) { %>
    <p>Note : La troncature droite, qui enrichit automatiquement les recherches simple avec le joker * est actuellement activé sur le site.  </p>
<% } %>    

    <h3><a id="anchorFuzzy"></a>6.2 Recherche approximative <samp>mot~</samp></h3>
    <p>Utilisez le symbole <em>&laquo;~&raquo;</em> (tilde) immédiatement après un terme unique pour effectuer une recherche sur les mots se rapprochant de l'orthographe de votre mot.</p>
    <p>Par exemple, pour rechercher les contenus avec le mot <em>&laquo;dahlia&raquo;</em> si vous n'êtes pas sûr de l'orthographe :</p>
    <pre>dalia~ </pre>
<% if (!LUCENE_FUZZY_ENABLED) { %>
    <p>Note : Cette fonctionnalité est actuellement désactivée sur le site.</p>
<% } %>

    <h3><a id="anchorProximity"></a>6.3 Recherche de proximité <samp>phrase~7</samp></h3>
    <p>Utilisez le symbole <em>&laquo;~&raquo;</em> (tilde) immédiatement après une phrase en précisant une distance pour effectuer une recherche en forcant les mots de la phrase à apparaitre à moins d'un certains nombre de mot l'un de l'autre.</p>
    <p>Par exemple, pour rechercher les contenus ou le mot <em>&laquo;page&raquo;</em> apparait à moins de 8 mots du <em>&laquo;accueil&raquo;</em> :</p>
    <pre>&quot;page accueil&quot;~8 </pre>
    <p>La distance par défaut est de 0, la recherche d'une phrase recherche la phrase exact.</p>

    <h3><a id="anchorInterval"></a>6.4 Recherche par intervalle <samp>monChamp:[... TO ...], monChamp:{... TO ...}</samp></h3>
    <p>Pour rechercher toutes les valeurs d'un champ comprises entre deux bornes vous pouvez utilisez la syntaxe  <em>nomduchamp:[borneInférieure TO borneSupérieure]</em>. Les bornes sont inclues dans les éléments recherchés, ou en remplaçant les crochets <em>&laquo;[&raquo;</em> <em>&laquo;]&raquo;</em> par des accolades<em>&laquo;{&raquo;</em> <em>&laquo;}&raquo;</em>, pour exclure les bornes.</p>
    <p>Les recherches par intervalle peuvent s'effectuer  sur des champs de type :</p>
    <p><strong>texte :</strong> par exemple, sur un site de référencement de livres, pour rechercher tous les livres dont l'auteur est alphabétiquement situé entre Apollinaire et Pascal on effectuerait la recherche suivante :
    </p>
    <pre>auteur:[Apollinaire TO Pascal]</pre>
    <p><strong>date :</strong> en utilisant le format <em>AAAAMMJJ</em> (année, mois, jour), par exemple, pour rechercher tous les livres dont la date de parution est comprise strictement apres le <em>31 décembre 1899</em> et strictement avant le <em>1er janvier 2000</em>, on effectuerait la recherche suivante :
    </p>
    <pre>dateParution:{18991231 TO 20000101}</pre>

    <h3><a id="anchorBoost"></a>6.5 Augmenter le poid d'un terme <samp>terme^2</samp></h3>
    <p>Si vous souhaitez accorder plus d'importance à un des termes de votre recherche pour favoriser la remonter des contenus contenant ce terme (par rapport à ceux contenant les autres termes de votre recherche). Vous avez la possibilité, en utilisant le symbole <em>&laquo;^&raquo;</em> (accent circonflexe), de préciser pour chacun des termes, un facteur d'augmentation de son poids dans la recherche.</p>
    <p>Par exemple, si vous recherchez les contenus avec la phrase <em>&laquo;robe bleu&raquo;</em> ou avec la phrase <em>&laquo;robe rouge&raquo;</em>, vous pouvez favoriser la remonter des contenus avec <em>&laquo;robe rouge&raquo;</em> utilisant la recherche suivante :</p>
    <pre>&quot;robe bleu&quot; OR &quot;robe rouge&quot;^2</pre>

<%@ include file='/jcore/doEmptyFooter.jspf' %>