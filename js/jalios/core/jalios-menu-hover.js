!function ( $ ) {
  
  $(document).ready(function() {
    $('.jalios-menu-hover .btn-group')
    .mouseenter(function() {
      $(this).addClass('open');
    })
    .mouseleave(function() {
      $(this).removeClass('open');
    });
  });
  
}( jQuery );