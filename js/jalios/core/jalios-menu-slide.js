!function ( $ ) {
  $(document).ready(function() {
    var $menu = $('.jalios-menu-slide .menu-slide');
    
    $menu.multilevelpushmenu({
      mode: 'cover',
      fullCollapse: true,
      collapsed: true,
      direction: 'rtl',
      backItemIcon: 'fa fa-angle-left iconSpacing_ltr',
      groupIcon: 'fa fa-angle-right',
      
      titleElement: 'div',
      titleItemClass: 'title',
      
      onMenuReady: function(settings) {
        $(settings.container).removeClass('invisible').addClass('hide');
      },
      onShowMenu: doShowMenu,
      onHideMenu: doHideMenu,
      onCollapseMenuEnd: function(settings) {
        if($(settings.container).hasClass('closed')) {
          $(settings.container).addClass('hide');
        }
      },
      onExpandMenuStart: function(settings) {
        $(settings.container).removeClass('hide');
      },
      onGroupItemClick: function() {
        var event = arguments[0],
            $menuLevelHolder = arguments[1],
            $item = arguments[2],
            options = arguments[3],
            title = $menuLevelHolder.find( 'h2:first' ).text(),
            itemName = $item.find( 'a:first' ).text();

        $.console.log( '<br />Group Item <i>' + itemName + '</i>' + ' on <i>' + title + '</i> menu level clicked!' );
      },
      onItemClick: function() {
        var event = arguments[0],
            $menuLevelHolder = arguments[1],
            $item = arguments[2],
            options = arguments[3],
            title = $menuLevelHolder.find( 'h2:first' ).text(),
            $itemLink = $item.find( 'a:first' );
        
        $.console.log( '<br />Item <i>' + $itemLink.text() + '</i>' + ' on <i>' + title + '</i> menu level clicked!' );
        window.location.href = $itemLink.prop('href');
      }
    });
    
    function doShowMenu(params) {
      var callbacks = params.callbacks;
      var $baseLevelHolder = params.baseLevelHolder;
      var settings = params.settings;
      var expandingObjects = params.expandingObjects;
      
      var height = $baseLevelHolder.css('height');
      $baseLevelHolder.css('min-height', 0).css('height', 0).css(settings.direction == 'rtl' ? 'margin-right' : 'margin-left', 0);

      $baseLevelHolder.removeClass( settings.menuInactiveClass );
      currWidth = $baseLevelHolder.width();
      params.utilMethods.sizeElementWidth( settings.container , currWidth );
      // $(settings.container).multilevelpushmenu('redraw');
      
      $baseLevelHolder.children( 'ul' ).first().show();

      $baseLevelHolder.stop().animate({
        height: height
      }, 200);
      
      /*
      $baseLevelHolder.stop().animate({
        height: height
      }, 200);
      $baseLevelHolder.children( 'ul' ).first().show(500 , function() {
        expandingObjects[ 'baseAnimEnded' ] = true;
        params.utilMethods.animatedEventCallback( expandingObjects , callbacks );
      });
      */
    }
    
    function doHideMenu(params) {
      var $baseLevelHolder = params.baseLevelHolder;
      var $nextLevelHolders = params.nextLevelHolders;
      var collapseAll = params.collapseAll;
      var lwidth = params.width;
      var settings = params.settings;
      var expandingObjects = params.expandingObjects;
      
      var height = $baseLevelHolder.css('height');

      if( collapseAll ) {
        $baseLevelHolder.stop().animate({
          height: 0
        }, 200, function() {
          $baseLevelHolder.addClass( settings.menuInactiveClass );
          
          var currWidth = $baseLevelHolder.width() + parseInt( $baseLevelHolder.css( settings.direction == 'rtl' ? 'margin-right' : 'margin-left' ) , 10 );
          params.utilMethods.sizeElementWidth( settings.container , currWidth );
          
          var margin = ( collapseAll ) ?
              ( settings.fullCollapse ) ?
                ( -1 ) * $baseLevelHolder.width()
                :
                ( ( -1 ) * $baseLevelHolder.width() + ( ( settings.mode == 'overlap' ) ? $nextLevelHolders.length + 1 : 1 ) * settings.overlapWidth )
              :
              0;
          
          $baseLevelHolder.css('min-height', height).css('height', height)
                          .css(settings.direction == 'rtl' ? 'margin-right' : 'margin-left', margin)
                          // .css('min-width', "").css('width', "")
                          ;
        });
        
        /*
        $baseLevelHolder.stop().animate({
          height: 0,
          width: lwidth
        });

        $baseLevelHolder.children( 'ul' ).first().hide(500, function() {
          $baseLevelHolder.addClass( settings.menuInactiveClass );

          var currWidth = $baseLevelHolder.width() + parseInt( $baseLevelHolder.css( settings.direction == 'rtl' ? 'margin-right' : 'margin-left' ) , 10 );
          params.utilMethods.sizeElementWidth( settings.container , currWidth );
          
          var margin = ( collapseAll ) ?
              ( settings.fullCollapse ) ?
                ( -1 ) * $baseLevelHolder.width()
                :
                ( ( -1 ) * $baseLevelHolder.width() + ( ( settings.mode == 'overlap' ) ? $nextLevelHolders.length + 1 : 1 ) * settings.overlapWidth )
              :
              0;
          
          $baseLevelHolder.css('min-height', height).css('height', height)
                          .css(settings.direction == 'rtl' ? 'margin-right' : 'margin-left', margin)
                          .css('min-width', "").css('width', "")
                          ;
        });
        */
      }
    }
    
    $('.main-menu-item').on('click', function() {
      var $menu = $(this).next('.menu-slide');
      
      if($menu.multilevelpushmenu('activemenu').length == 0) {
        showMenu($menu);
      } else {
        hideMenu($menu);
      }
    });

    $(document).mouseup(function(e) {
      $('.jalios-menu-container').each(function() {
        if (!$(this).is(e.target) && $(this).find(e.target).length === 0) {
          var $menu = $(this).find('.menu-slide');
          if($menu.multilevelpushmenu('activemenu').length > 0) {
            hideMenu($menu);
          }
        }
      });
    });
    
    function showMenu($menu) {
      $menu.toggleClass("opened closed");
      $menu.multilevelpushmenu('expand');
    }
    
    function hideMenu($menu) {
      $menu.toggleClass("opened closed");
      $menu.multilevelpushmenu('collapse');
    }
  });
  
}( jQuery );