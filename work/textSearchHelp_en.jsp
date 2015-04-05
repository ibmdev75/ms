<%--
  @Summary: Text search documentation
  @Category: Documentation
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  request.setAttribute("title","Text search help"); 
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
      <a href="<%= curURL %>#anchorMajMin" class="toc-h2">1. Uppercase, lowercase and diacritic</a>
      <a href="<%= curURL %>#anchorSpecChar" class="toc-h2">2. Special characters</a>
      <a href="<%= curURL %>#anchorBool" class="toc-h2">3. Boolean operators <samp>AND, &amp;&amp;, OR, ||, NOT, !, +, -</samp></a>
      <a href="<%= curURL %>#anchorRechChamp" class="toc-h2">4. Field search <samp>myField:&quot;text&quot;</samp></a>
      <a href="<%= curURL %>#anchorGroup" class="toc-h2">5. Groups <samp>( )</samp></a>
      <a href="<%= curURL %>#anchorAvance" class="toc-h2">6. Advanced features</a>
      <a href="<%= curURL %>#anchorWildcard" class="toc-h3">6.1 Wildcard characters <samp>*, ?</samp></a>
      <a href="<%= curURL %>#anchorFuzzy" class="toc-h3">6.2 Fuzzy search <samp>word~</samp></a>
      <a href="<%= curURL %>#anchorProximity" class="toc-h3">6.3 Proximity search <samp>phrase~7</samp></a>
      <a href="<%= curURL %>#anchorInterval" class="toc-h3">6.4 Range search <samp>myField:[... TO ...], myField:{... TO ...}</samp></a>
      <a href="<%= curURL %>#anchorBoost" class="toc-h3">6.5 Boosting term <samp>term^2</samp></a>
    </div>
  
    <h1>Text Search Help <a href="#" title="Print..." onclick="window.print();" ><jalios:icon src="printer" alt="Print...."/></a></h1>
    <p>In this help, a <em>«term»</em> is:</p>
    <ul>
      <li>either a single word in the searched text, otherwise called <em>«single term&raquo;</em>;</li>
      <li>else a group of words surrounded by double quotes, otherwise called  <em>&laquo;phrase&raquo;</em>.</li>
    </ul>
    <p>For example, if you search:</p>
    <pre style="display:inline;">Welcome to &quot;Jalios JCMS&quot;</pre>
    <ul>
      <li><em>&laquo;Welcome&raquo;</em> and <em>&laquo;to&raquo;</em> are single terms;</li>
      <li><em>&laquo;&quot;Jalios JCMS&quot;&raquo;</em> is a phrase,</li>
      <li>all 3 are terms.</li>
    </ul>
    
    <h2><a id="anchorMajMin"></a>1. Uppercase, lowercase and diacritic</h2>
    <p><strong>Uppercase and lowercase:</strong> Search is NOT case sensitive.</p>
    <p>For example, &laquo;welcome&raquo;, &laquo;Welcome&raquo; or &laquo;WELCOME&raquo; will all return the same results.</p>
    <p><strong>Diacritic marks and accents:</strong> Search ignores diacritical marks and accents (é, ç, etc.)</p>
    <p>For example, &laquo;à la française&raquo; ou &laquo;a la francaises&raquo; will all return the same results.</p>

    <h2><a id="anchorSpecChar"></a>2. Special characters</h2>
    <p>Some characters are used for advanced search features. If you want to search those characters, you must escape them using character &laquo;\&raquo; (back-slash). Current special characters are:</p>
    <pre>+ - &amp;&amp; || ! ( ) { } [ ] ^ &quot; ~ * ? : \</pre>
    <p>For example to search <em>&laquo;3 * (5+9) = 42&raquo;</em>, you must enter:</p>
    <pre>3 \* \(5\+9\) = 42</pre>

    <h2><a id="anchorBool"></a>3. Boolean operators <samp>AND, &amp;&amp;, OR, ||, NOT, !, +, -</samp></h2>
    <p>You can use the following keywords and operators in order to group terms of your search using logical operations. You must  preserve the case of keywords and always enter them in UPPERCASE.</p>
    <table class='layout'>
      <tr>
        <th>Keywords</th>
        <th>Operators</th>
        <th>Explanation</th>
        <th>Example</th>
      </tr>
      <tr>
        <td class="text-center"><strong>AND</strong></td>
        <td class="text-center"><strong>&amp;&amp;</strong></td>
        <td>A publication is kept only if both terms surrounding operator <em>&laquo;&amp;&amp;&raquo;</em> or keyword <em>&laquo;AND&raquo;</em> exists in the searched field(s).<p>It is the default operator in JCMS (option <em>&laquo;All words&raquo;</em>).</p>
        </td>
        <td>
          <pre>&quot;white coat&quot; AND horse</pre>
          <pre>&quot;white coat&quot; &amp;&amp; horse</pre>Search all publication containing <em>&laquo;white coat&raquo;</em> and <em>&laquo;horse&raquo;</em>.</td>
      </tr>
      <tr>
        <td class="text-center"><strong>OR</strong></td>
        <td class="text-center"><strong>||</strong></td>
        <td>A publication is kept only if at least one of the terms surrounging operator <em>&laquo;||&raquo;</em> or keyword <em>&laquo;OR&raquo;</em> exists in the searched field(s).</td>
        <td>
          <pre>equine OR horse</pre>
          <pre>equine || horse</pre>
          Search all publication containing either <em>&laquo;equine&raquo;</em> or <em>&laquo;horse&raquo;</em>,(or both).</td>
      </tr>
      <tr>
        <td class="text-center"><strong>NOT</strong></td>
        <td class="text-center"><strong>!</strong> ou <strong>-</strong></td>
        <td>A publication is kept only if the term following the keyword <em>&laquo;NOT&raquo;</em>, operator <em>&laquo;!&raquo;</em> or operator <em>&laquo;-&raquo;</em> is not in the searched field(s).<p>Operators <em>&laquo;!&raquo;</em> and <em>&laquo;-&raquo;</em> must be placed side by side with the term to exclude.</p>
        </td>
        <td>
          <pre>&quot;white coat&quot; NOT clothing</pre>
          <pre>&quot;white coat&quot; !clothing</pre>
          <pre>&quot;white coat&quot; -clothing</pre>
          Search all publication containing <em>&laquo;</em>white coat<em>&raquo;</em>, but not <em>&laquo;</em>clothing<em>&raquo;</em>.</td>
      </tr>
      <tr>
        <td class="text-center"></td>
        <td class="text-center"><strong>+</strong></td>
        <td>A publication is kept only if term following operator  <em>&laquo;+&raquo;</em> exists in the searched field(s).
          
          <p>Operator <em>&laquo;+&raquo;</em> must be placed side by side with the term to include.</p>
          <p>Because AND operator is the default when option &laquo;All words&raquo; is specified, other terms are also required. Therefore this operator may be useful only when specifying option &laquo;Any words&raquo;, in which case other terms are optionnal.</p>
        </td>
        <td>
          <pre>+&quot;white coat&quot; horse</pre>Search all publication containing <em>&laquo;white coat&raquo;</em>, and eventually <em>&laquo;horse&raquo;</em> (if option <em>&laquo;Any words&raquo;</em> was used).</td>
      </tr>
    </table>

    <h2><a id="anchorRechChamp"></a>4. Field search <samp>myField:&quot;text&quot;</samp></h2>
    <p>You can search in any field of your publication by specifying the field name, followed by character &laquo;:&raquo; (deux points) and the text to search.</p>
    <pre>fieldname:text</pre>
    <p><strong>Title and Abstract</strong>: whatever the type of publication or site language, to search in <em>title</em> and <em>abstract</em>  fields, you must  respectively use the field name <em>&laquo;title&raquo;</em> et <em>&laquo;abstract&raquo;</em>.</p>
    <p><strong>Other fields</strong>: for other fields specific to your types, you must use the internal name generated by JCMS. This internal name is generaly the field's label in the default site language, without accent or diacritical marks and starting with a lowercase letter. For example, for a field with label <em>&laquo;Régions française&raquo;</em> (French regions) in a french site, the internal name will <em>&laquo;regionFrancaise&raquo;</em>.</p>
    <p><strong>Example </strong>: to search word <em>&laquo;restaurant&raquo;</em> in the abstract field and word <em>&laquo;gers&raquo;</em> in field <em>&laquo;Région française&raquo;</em> of exampl above, here is the syntax to use:</p>
    <pre>abstract:restaurant regionFrancaise:gers</pre>

    <h2><a id="anchorGroup"></a>5. Groups <samp>( )</samp></h2>
    <p><strong>Logical group :</strong> You can use parenthesis to group some terms of your search. This is often used to precisely control scope of boolean operators.</p>
    <p>For example to search all publications containing either <em>&laquo;horse&raquo;</em> or <em>&laquo;equine&raquo;</em> and <em>&laquo;coat&raquo;</em>:</p>
    <pre>coat AND (horse OR equine)</pre>
    <p><strong>Field's groups:</strong> You can also use parenthesis to search for more than one single term in a field.</p>
    <p>For example to search all publications of which title field contains both <em>&laquo;horse&raquo;</em> and <em>&laquo;white coat&raquo;</em>:</p>
    <pre>title:(+horse +&quot;white coat&quot;)</pre>

    <h2><a id="anchorAvance"></a>6. Advanced features</h2>

    <h3><a id="anchorWildcard"></a>6.1 Wildcard characters <samp>*, ?</samp></h3>
    <p><strong>? :</strong> Use symbol <em>&laquo;?&raquo;</em> (question mark) to search words using a single character wildcard.</p>
    <p>For example, to search all publications containing word <em>&laquo;realise&raquo;</em> or word <em>&laquo;realize&raquo;:</em></p>
    <pre>reali?e</pre>
    <p><strong>* :</strong> Use symbol <em>&laquo;*&raquo;</em> (asterisk, star) to search words using a multiple character wildcard.</p>
    <p>For example, to search all publications starting with <em>&laquo;col&raquo;</em> and finishing with <em>&laquo;r&raquo;</em>:</p>
    <pre>col*r</pre>
    <p>This search would find publications with either word <em>&laquo;color&raquo;</em> or <em>&laquo;colour&raquo;</em>.</p>
    <p>Neither <em>&laquo;?&raquo;</em> nor <em>&laquo;*&raquo;</em> can be the first character of a term (<strike>*something</strike>).</p>
<% if (!LUCENE_WILDCARD_ENABLED) { %>
    <p>Note: This feature is currently disabled on this site.</p>
<% } %>    
<% if (USE_RIGHT_TRUNCATION) { %>
    <p>Note: Right truncation, which automatically add * to simple search is currently enabled on this site.</p>
<% } %>    

    <h3><a id="anchorFuzzy"></a>6.2 Fuzzy search <samp>word~</samp></h3>
    <p>Use symbol <em>&laquo;~&raquo;</em> (tilde) immediately after a single term to search words having a similar spelling.</p>
    <p>For example, to search all publications with word <em>&laquo;humour&raquo;</em> in american or british english (<em>&laquo;humor&raquo; vs &laquo;humour&raquo;</em>):</p>
    <pre>humour~ </pre>
<% if (!LUCENE_FUZZY_ENABLED) { %>
    <p>Note: This feature is currently disabled on this site.</p>
<% } %>  

    <h3><a id="anchorProximity"></a>6.3 Proximity search <samp>phrase~7</samp></h3>
    <p>Use symbol <em>&laquo;~&raquo;</em> (tilde) immediately after a phrase, and specify a distance, in order to force all words of the phrase to appear within this given number of words of each other..</p>
    <p>For example, to search <em>&laquo;later&raquo;</em>, <em>&laquo;alligator&raquo;</em> and <em>&laquo;crocodile&raquo;</em> within 8 words of each other:</p>
    <pre>&quot;later alligator crocodile&quot;~8 </pre>
    <p>Default distance is 0 and any phrase search for an exact match.</p>

    <h3><a id="anchorInterval"></a>6.4 Range search <samp>myField:[... TO ...], myField:{... TO ...}</samp></h3>
    <p>Range search allows you to search for publications whose field(s) values are between a lower and an upper bound as specified using this syntax; <em>fieldname:[lowerBound TO upperBound]</em>. Use <em>&laquo;[&raquo;</em> <em>&laquo;]&raquo;</em> (square brackets), to include both bound, or  <em>&laquo;{&raquo;</em> <em>&laquo;}&raquo;</em> (curly brackets), to exclude them.</p>
    <p>Range search can occur on text and date fields:</p>
    <p><strong>text field :</strong> for example, to search books of which author is between Apollinaire and  Pascal :</p>
    <pre>author:[Apollinaire TO Pascal]</pre>
    <p><strong>date field:</strong> always use the format <em>YYYYMMDD</em> (year, month, day). For example to search all books whose release date is strictly after <em>December 31, 1899</em> and strictly before <em>January 1, 2000</em>:</p>
    <pre>releaseDate:{18991231 TO 20000101}</pre>

    <h3><a id="anchorBoost"></a>6.5 Boosting term <samp>term^2</samp></h3>
    <p>If you want to increase relevance of publication containing some term of your query over others terms, you can boost  a term using symbol <em>&laquo;^&raquo;</em> (caret), followed by a boost factor.</p>
    <p>For example, to search all publications with either phrase <em>&laquo;blue coat&raquo;</em> or phrase <em>&laquo;red coat&raquo;</em>, but boosting publications having  phrase <em>&laquo;red coat&raquo;</em>:</p>
    <pre>&quot;blue coat&quot; OR &quot;red coat&quot;^2</pre>
