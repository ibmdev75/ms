<%@ include file="/jcore/doInitPage.jspf" %>
<% String lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "; %>

<section id="lists">
	<div class="page-header">
	  <h1>Lists <small>Vertical Horizontal, ...</small></h1>
	</div>
	<div class="row">
	  <div class="col-md-6">
	    <h3>Usages</h3>
	    <p>JCMS provides common list layout to use in backoofice or plugins.</p>
	    <p>The framework provides the mixin <code>#JCMS > .style-type-none();</code></p>
	  </div>
	  <div class="col-md-6">
	    <h3>Item list</h3>
	    <p>Item List <code>&lt;ul.item-list&gt;</code> is a bigger list with <code>.icon</code> replacing list's bullets.</p>
	    <ul class="item-list">
	      <li><a href="#"><jalios:icon src="jalios"  alt="Jalios"/> item-list > icon AHref</a></li>
	      <li><a href="#"><jalios:icon src="jalios"  alt="Jalios"/> item-list > icon AHref</a></li>
	      <li><jalios:icon src="jalios"  alt="Jalios"/>             item-list > icon text</li>
	      <li><a href="#">item-list > AHref</a></li>
	    </ul>
	  </div>
	</div>
	<div class="row">
	  <div class="col-md-6">
	    <h3>Fold List</h3>
	    <p>Foldable list <code>&lt;ul.fold-list&gt;</code> are displayed on one line until mouse over the <code>li</code></p>
	    <ul class="fold-list">
	      <li><jalios:icon src="jalios"  alt="Jalios"/> <%= lorem %></li>
	      <li><jalios:icon src="jalios"  alt="Jalios"/> <%= lorem %></li>
	      <li><jalios:icon src="jalios"  alt="Jalios"/> <%= lorem %></li>
	      <li><jalios:icon src="jalios"  alt="Jalios"/> <%= lorem %></li>
	    </ul>
	  </div>
	  <div class="col-md-6">
	    <h3>Menu list</h3>
	    <p>Menu List <code>&lt;ul.menu-list&gt;</code> is a list inline with padding on each <code>LI</code>.</p>
	    <ul class="menu-list">
	      <li><a href="#"><jalios:icon src="jalios"  alt="Jalios"/> menu-list 1</a></li>
	      <li><a href="#"><jalios:icon src="jalios"  alt="Jalios"/> menu-list 2</a></li>
	      <li><jalios:icon src="jalios"  alt="Jalios"/>             menu-list 3</li>
	    </ul>
	    <p>It should have a <code>background-color</code> and a <code>LI:hover</code> color</p>
	    <ul class="menu-list" style="background-color: #EEEEEE; border: 1px solid #AAAAAA;">
	      <li><a href="#"><jalios:icon src="jalios"  alt="Jalios"/> menu-list 1</a></li>
	      <li style="background-color: #DDDDDD;"><a href="#"><jalios:icon src="jalios"  alt="Jalios"/> menu-list 2</a></li>
	      <li><jalios:icon src="jalios"  alt="Jalios"/>             menu-list 3</li>
	    </ul>
	  </div>
  </div>
</section>