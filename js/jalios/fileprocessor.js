Event.observe(window, "load", function() {
  $$('#fpAdmin .confirm').each(function(item){
    Event.observe(item, "click", function(event) {
      if (!top.confirm(I18N['fileprocessor.confirm'])) {
        Event.stop(event);
      }
    });
  });
});