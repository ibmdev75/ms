<%--
  @Summary: Explains the wiki text formating rules
  @Category: Documentation
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/jcore/doInitPage.jspf' %>

  <table class="table howToTFR">
    <tr bgcolor="#EEEEEE"> 
      <td class="col-md-4"> 
        <div class="text-center"><strong>Formatting Command</strong></div>
      </td>
      <td class="col-md-4"> 
        <div class="text-center"><strong>Example, You write</strong></div>
      </td>
      <td> 
        <div class="text-center"><strong>You get</strong></div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> 
        <p><strong>Paragraphs:</strong> <br />
      Blank lines will create new paragraphs. </p>
        <p>Add a trailing '#' to force breakline</p>
      </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">1st paragraph

2nd paragraph#
with a breakline</font></span></pre>
      </td>
      <td class="vTop"> 1st paragraph 
        <p> 2nd paragraph<br />
          with a breakline
           
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Headings:</strong> <br />
      At least three dashes at the beginning of a line, followed by plus signs 
      and the heading text. 2 plus creates a level 1 heading (most important), 
      three pluses a level 2 heading; the maximum is level 6.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">---++ Level1

---+++ Level2

---++++ Level3</font></span></pre>
      </td>
      <td class="vTop"> 
        <h1 class="wiki">Level1</h1>
        <h2 class="wiki">Level2</h2>
        <h3 class="wiki">Level3</h3>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Bold Text:</strong> <br />
      Words get <strong>bold</strong> by enclosing them in <code>*</code> asterisks. 
    </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">*Bold*
</font></span></pre>
      </td>
      <td class="vTop"> <strong>Bold</strong> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Italic Text:</strong> <br />
      Words get <em>italic</em> by enclosing them in <code>_</code> underscores. 
    </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">_Italic_
</font></span></pre>
      </td>
      <td class="vTop"> <em>Italic</em> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Bold Italic:</strong> <br />
      Words get <em>_bold italic</em> by enclosing them in <code>_</code> double-underscores. 
    </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">__Bold italic__
</font></span></pre>
      </td>
      <td class="vTop"> <strong><em>Bold italic</em></strong> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Fixed Font:</strong> <br />
      Words get shown in <code>fixed font</code> by enclosing them in <code>=</code> 
      equal signs. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">=Fixed font=
</font></span></pre>
      </td>
      <td class="vTop"> <code>Fixed font</code> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Bold Fixed Font:</strong> <br />
      Words get shown in <code><b>bold fixed font</b></code> by enclosing them 
      in <code><b></b></code> double equal signs. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">==Bold fixed==
</font></span></pre>
      </td>
      <td class="vTop"> <code><b>Bold fixed</b></code> </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong><em>Note:</em></strong> Make sure to "stick" the 
      <code>* _ = ==</code> signs to the words, e.g. take away spaces. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">_This works_,
_this not _
</font></span></pre>
      </td>
      <td class="vTop"> <em>This works</em>, _this not _ </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Separator:</strong> <br />
      At least three dashes at the beginning of a line. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">-------
</font></span></pre>
      </td>
      <td class="vTop"> 
        <hr class="wiki"/>
    </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>List Item:</strong> <br />
      Three spaces and an asterisk (*).<br/>
      Pound sign (#) with same indentation to continue item on a new line. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   * bullet item 1
   # line 2
   * bullet item 2
   * bullet item 3
</font></span></pre>
      </td>
      <td class="vTop"> 
        <ul class="wiki">
          <li class="wiki"> bullet item 1<br/> line2 </li>
          <li class="wiki"> bullet item 2 </li>
          <li class="wiki"> bullet item 3 </li>
        </ul>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Nested List Item:</strong> <br />
      Six, nine, ... spaces and an asterisk (*).<br/>
      Pound sign (#) with same indentation to continue item on a new line.</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   * first level item 
      * nested item
      # line 2
</font></span></pre>
      </td>
      <td class="vTop"> 
        <ul class="wiki">
          <li class="wiki"> first level item 
          <ul class="wiki">
            <li class="wiki"> nested item <br/>line 2</li>
          </ul>
          </li>
        </ul>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Ordered List:</strong> <br />
      Three spaces and a number.<br/>
      Pound sign (#) with same indentation to continue item on a new line. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">   1 Sushi
   # Yummy
   1 Dim Sum
</font></span></pre>
      </td>
      <td class="vTop"> 
        <ol class="wiki">
          <li class="wiki"> Sushi  <br/> Yummy</li>
          <li class="wiki"> Dim Sum </li>
        </ol>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Definition List:</strong> <br />
      Three spaces, the term, a colon, followed by the definition. <br />
      <strong><em>Note:</em></strong> Terms with spaces are not supported. In 
      case you do have a term with more then one word, separate the words with 
      dashes or with the <code>&amp;nbsp;</code> non-breaking-space entity. </td>
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
      <td class="vTop"> <strong>Image:</strong> <br />
        You can insert an internal link on a publication by giving its filename 
        (relative to the channel directory).</td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">images/jalios/logos/powered-by-jalios.gif
</font></span></pre>
<pre><span style="background : #FFFFCC;"><font color="#990000">[[upload/docs/image/jpeg/2009-01/image.jpg][320x240]]
</font></span></pre>
      </td>
      <td class="vTop"><img class="wiki" src="images/jalios/logos/powered-by-jalios.gif" /> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"><strong>Medias (Audio, Video, Image, ...):</strong> <br />
        You can insert any media by adding the tag <code>[flv path="pathToMedia" width="320" height="240" /]</code>.<br/> Only the <code>path</code> parameter is required.</td>
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
      <td class="vTop"><strong>Flash Video (FLV):</strong> <br />
        You can insert Flash Video (FLV) by adding the tag <code>[flv path="pathFLV" width="320" height="240" image="pathTitleImage" /]</code>.<br/> Only the <code>path</code> parameter is required.</td>
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
        You can insert MP3 by adding the tag <code>[mp3 path="pathMP3" width="320" height="160" image="pathTitleImage" showeq="true" /]</code>.<br/> Only the <code>path</code> parameter is required.</td>
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
      <td class="vTop"> <strong>Internal Links:</strong> <br />
      You can create an internal link on a publication by enclosing either the 
      publication title in double square brackets or the publication ID. Create 
      a link where you can specify the link text and the link reference separately, 
      using nested square brackets like <code>[[reference][text]]</code>.<br />
    </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[[An article]]

[[c_1234][Tutorial]]
</font></span></pre>
      </td>
      <td class="vTop"> <a  class="wiki" href="">An article</a> 
        <p> <a class="wiki" href="">Tutorial</a> 
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>External Links:</strong> <br />
      You can create an external link by giving its URL. </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">http://www.jalios.com/

[[http://www.jalios.com/][Jalios]]
</font></span></pre>
      </td>
      <td class="vTop"> <a class="wiki" href="http://www.jalios.com/">http://www.jalios.com/</a> 
        <p> <a class="wiki" href="http://www.jalios.com/" target="_top">Jalios</a> 
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td class="vTop"><strong>Email:</strong> <br />
      You can create a mailto link by giving an email. </td>
      <td class="vTop"><span style="background : #FFFFCC;"><font color="#990000">contact@jalios.com</font></span></td>
      <td class="vTop"><a class="wiki" href="mailto:contact@jalios.com">contact@jalios.com</a></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Table:</strong> <br />
      Optional spaces followed by the cells enclosed in vertical bars (|) or subsection char (&sect;). <br />
      <strong><em>Note:</em></strong> <code>&sect; &nbsp; header &nbsp; |</code> cells are rendered 
      as table headers. <br />
      <strong><em>Note:</em></strong> <code>| &nbsp; spaced &nbsp; |</code> cells 
      are rendered center aligned. <br />
      <strong><em>Note:</em></strong> <code>| &nbsp; &nbsp; spaced |</code> cells 
      are rendered right aligned. <br />
    </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">| Left  |  Center  |  Right |
| A2    |     2    |      2 |
| A3    |     3    |      3 |

&sect; Left  &sect;  Center  &sect;  Right &sect;
| A2    |     2    |      2 |
| A3    |     3    |      3 |

&sect; Left  |  Center  |  Right |
&sect; A2    |     2    |      2 |
&sect; A3    |     3    |      3 |
</font></span></pre>
      </td>
      <td class="vTop"> 
        <table class="wiki">
          <tr class="wiki"> 
            <td class="wiki">Left</td>
            <td class="wiki">Center</td>
            <td class="wiki">Right</td>
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
        </table>  <br />
        <table class="wiki">
          <tr class="wiki"> 
            <th class="wiki">Left</th>
            <th class="wiki">Center</th>
            <th class="wiki">Right</th>
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
            <th class="wiki">Left</th>
            <td class="wiki">Center</td>
            <td class="wiki">Right</td>
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
      <td class="vTop"> <strong>Quote:</strong><br>
      To quote somebody in a forum.
      </td>
      <td class="vTop"> 
        <pre><span style="background : #FFFFCC;"><font color="#990000">[quote]
  What do you think? 
[/quote]
I second you on this.
</font></span></pre>
      </td>
      <td class="vTop"> 
<jalios:wiki>
[quote]
  What do you think? 
[/quote]
I second you on this.
</jalios:wiki>
      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td class="vTop"> <strong>Code:</strong><br>
      Useful to display programming language code or any fixed text data.
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
      Display a message box: information, error or warning. 
      The box is left padded.  
    </td>
    <td class="vTop"> 
    <pre><span style="background : #FFFFCC;"><font color="#990000">[info] Information message [/info]
[error] Error message [/error]
[disclaimer] Warning mesage [/disclaimer]
    </font></span></pre></td><td class="vTop">
      <div style="margin-left: -100px;">
      <jalios:wiki>
[info] Information message [/info]
[error] Error message [/error]
[disclaimer] Warning mesage [/disclaimer]
      </jalios:wiki>
      </div>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td class="vTop"> <strong>Note:</strong><br>
      Transform a block of text into a note tooltip. 
      The icon is displayed on the left outside of the wiki content  
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
    
<jalios:include target="WIKI_HELP" targetContext="tr"/>
</table>

