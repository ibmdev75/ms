<%@page import="com.jalios.jcms.docs.ExampleExtractor"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css"); %>
<% Map<String, String> exampleMap = ExampleExtractor.parse(channel.getRealPath("/docs/jcms/components/components_custom_card.jsp")); %>
<div class="bs-docs-section">

<h1 id="custom-components-card" class="page-header">Card</h1>
<p class="lead">Card component (Media card, Member card, Resource card)</p>
<p>Less file : jalios-card.less (Variables are in jcms-variables.less)</p>

<h3 id="card-simple">Simple media card example with an unknown image size</h3>
<div class="bs-example">
  <div class="row">
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="card media">
        <div class="pull-left"><img class="card-picture thumbnail" src="http://lorempixel.com/100/100/people/" alt="" /></div>
        <div class="media-body card-body">
          <div class="card-title"><a href="">My card</a></div>
          <div class="card-content">
            Lorem Ipsum &middot; Lorem Psoeu
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="card media">
        <div class="pull-left"><img class="card-picture thumbnail" src="http://lorempixel.com/100/100/people/" alt="" /></div>
        <div class="media-body card-body">
          <div class="card-title"><a href="">My card</a></div>
          <div class="card-content">
            Lorem Ipsum &middot; Lorem Psoeu
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="card media">
        <div class="pull-left"><img class="card-picture thumbnail" src="http://lorempixel.com/100/100/people/" alt="" /></div>
        <div class="media-body card-body">
          <div class="card-title"><a href="">My card</a></div>
          <div class="card-content">
            Lorem Ipsum &middot; Lorem Psoeu
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="card media">
        <div class="pull-left"><img class="card-picture thumbnail" src="http://lorempixel.com/100/100/people/" alt="" /></div>
        <div class="media-body card-body">
          <div class="card-title"><a href="">My card</a></div>
          <div class="card-content">
            Lorem Ipsum &middot; Lorem Psoeu
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="card media">
        <div class="pull-left"><img class="card-picture thumbnail" src="http://lorempixel.com/100/100/people/" alt="" /></div>
        <div class="media-body card-body">
          <div class="card-title"><a href="">My card</a></div>
          <div class="card-content">
            Lorem Ipsum &middot; Lorem Psoeu
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("card-simple") %></code></pre></div>    

<h3 id="horizontal-card-member">Horizontal member card</h3>
<p>Less file : jalios-member-card.less</p>
<p>JCMS provides two default Member card templates: an horizontal and a vertical layout. The first one displays a little informations only, and the second one takes a little more space, and displays more informations.</p>
<p>Those default cards have a front and a back face. The principle is to display the more important meta datas in Front, and let the back card display more specific meta datas if needed.</p>
<div class="bs-example">
  <% request.setAttribute("card-member", loggedMember); %>
  <jalios:include jsp="/front/card/member/memberCard.jsp" />
  <% request.removeAttribute("card-member"); %>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("horizontal-card-member") %></code></pre></div>


<h3 id="horizontal-cards-member">Multiple member cards</h3>
<p>As the templates are fluid, several Member cards should be wrapped in a Bootstrap GRID system.</p>
<div class="bs-example">
  <div class="row">
    <% 
    request.setAttribute("card-member", loggedMember);
    for (int i=0; i<6; i++) { %>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberCard.jsp" />
    </div>
    <% }
    request.removeAttribute("card-member"); %>
  </div>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("horizontal-cards-member") %></code></pre></div>


<h3 id="vertical-card-member">Vertical member card</h3>
<p>Less file : jalios-member-card.less</p>
<p>The vertical layout is a little bigger. The front face still displays member's organization, department, and job's title.</p>
<p>The back face displays member's phone, mobile, and postal address.</p>
<div class="bs-example">
  <div class="row">
    <% 
    request.setAttribute("card-member", loggedMember);
    for (int i=0; i<4; i++) { %>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberVerticalCard.jsp" />
    </div>
    <% }
    request.removeAttribute("card-member"); %>
  </div>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("vertical-card-member") %></code></pre></div>


<h3 id="card-member-content-hook">Member card with custom body</h3>
<p>Both JCMS 9 member card templates can be customized, without having to duplicate the whole card's DOM.</p>
<p>Principle: the card header (Member's photo and name) is always displayed. The front and back card content can be customized. One can either overwrite the card's content to display custom informations, or even completely hide it.</p>
<div class="bs-example">
  <div class="row">
    <jalios:buffer name="customContent">
      <dl class="dl-horizontal">
        <dt>Since 2011:</dt>
        <dd>Engineer &middot; Jalios</dd>
        <dt>From 2008 to 2011:</dt>
        <dd>Searcher &middot; CEA</dd>
      </dl>                
    </jalios:buffer>
    <% 
    request.setAttribute("card-member", loggedMember);
    request.setAttribute("card-member-content", customContent.toString());
    %>
    <div class="col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberCard.jsp" />
    </div>
    <div class="col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberVerticalCard.jsp" />
    </div>
    <% request.removeAttribute("card-member"); %>
    <% request.removeAttribute("card-member-content"); %>
  </div>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("card-member-content-hook") %></code></pre></div>


<h3 id="card-member-nobackcard-hook">Member card with no back face</h3>
<p>Even the back face is not available if no informations are filled, JCMS 9 member card allows to hide the back face if needed. Here, the bottom right card turner link is not available.</p>
<div class="bs-example">
  <div class="row">
    <% 
    request.setAttribute("card-member", loggedMember);
    request.setAttribute("card-member-no-back-card", Boolean.TRUE);
    %>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberCard.jsp" />
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberVerticalCard.jsp" />
    </div>
    <% request.removeAttribute("card-member"); %>
    <% request.removeAttribute("card-member-no-back-card"); %>
  </div>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("card-member-nobackcard-hook") %></code></pre></div>


<h3 id="card-member-custombackcard-hook">Member card with customized back face</h3>
<p>JSP fragments can be used to display principal informations. See JSPF fragments in folder: <strong>/front/card/member/</strong></p>
<p>Click below on the card turner link to see a customized back face card.</p>
<div class="bs-example">
  <div class="row">
    <% Member itMember = loggedMember; %>
    <jalios:buffer name="customContent">
      <span style='color: red;'>This is a customized back card content</span>
      <%@ include file='/front/card/member/doMemberOrganizationDepartment.jspf' %>
      <%@ include file='/front/card/member/doMemberJob.jspf' %>
      <%@ include file='/front/card/member/doMemberEmail.jspf' %>
    </jalios:buffer>
    <% 
    request.setAttribute("card-member", loggedMember);
    request.setAttribute("card-member-back", customContent.toString());
    %>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberCard.jsp" />
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <jalios:include jsp="/front/card/member/memberVerticalCard.jsp" />
    </div>
    <% request.removeAttribute("card-member"); %>
    <% request.removeAttribute("card-member-back"); %>
  </div>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("card-member-custombackcard-hook") %></code></pre></div>


<h3 id="card-member-customcss-hook">Member cards with no GRID system</h3>
<p>JCMS 8 member cards used to be displayed with a limited card's witdh. If needed, one can set custom CSS classes on the card's wrapper. Try with <strong>.card-small, .card-medium, and .card-large</strong></p>
<div class="bs-example">
  <% 
  request.setAttribute("card-member", loggedMember);
  request.setAttribute("card-member-css", "card-inline card-medium");
  for (int i=0; i<4; i++) { %>
  <jalios:include jsp="/front/card/member/memberVerticalCard.jsp" />
  <% } %>
  <% request.removeAttribute("card-member"); %>
  <% request.removeAttribute("card-member-css"); %>
</div>
<div class="highlight"><pre><code><%= exampleMap.get("card-member-customcss-hook") %></code></pre></div>
</div>