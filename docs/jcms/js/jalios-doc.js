!function ($) {
  
 /* 
  * Should generate following DOM : 
  *   - A : for H1
  *   - UL LI : for each H2 following the H1
    <li>
      <a href="#nav">Navs</a>
      <ul class="nav">
        <li><a href="#nav-tabs">Tabs</a></li>
        <li><a href="#nav-pills">Pills</a></li>
      </ul>
    </li>    
  */  
  var generateMenu = function() {
    var $sidenav = $(".bs-docs-sidenav");
    var baseurl = $(".linksurl").eq(0).val();
    
    $(".bs-docs-section H1").each(function(){
      
      //Build the side menu link item for each H1 anchor
      var link = $('<a>',{
          text: $(this).contents().get(0).nodeValue,
          href: window.location.href.split('#')[0] + "#" + this.id
      });   
      var $li = $("<LI>");
      $sidenav.append($li.append(link));
      
      //Remove the id from the H1 and add a link for anchor purpose before the H1
      var anchorLink = $('<a>',{
        id: this.id
      });      
      
      $(this).before(anchorLink);
      $(this).removeAttr("id");
      
      //Display the menu
      $(".bs-docs-sidebar").addClass("in");
    });
  }
  
  var register = function() {
    generateMenu();
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);