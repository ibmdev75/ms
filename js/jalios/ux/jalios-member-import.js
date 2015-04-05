!function ($) {

  // Namespace
  if (!$.jalios)    { $.jalios    = {}; }
  if (!$.jalios.ux) { $.jalios.ux = {}; }

  $.jalios.ux.MemberImport = {
    formName: 'csvMemberImportForm',
    nextId: '#member-import-next',
    finishId: '#member-import-finish',
    chekingProgressId: '#checkingInProgress',
    importProgressId: '#importInProgress',
    formContentId: '#memberCsvImportFormContent',
    formStep: -1,
    
    init: function () {
      
      JcmsLogger.info('MemberImport', 'init');
      var t0 = new Date().getTime();
      $.jalios.ux.MemberImport.formStep = $("#" + $.jalios.ux.MemberImport.formName + " input[name=formStep]").val() || -1;
      
      $.jalios.ux.MemberImport.initButtons();
      
      var t1 = new Date().getTime();
      JcmsLogger.info('MemberImport', 'Init Member Csv Import', ' in '+(t1-t0)+'ms');
    },

    initButtons: function(event, $form) {
      
      if ($.jalios.ux.MemberImport.formStep === "0") {
        $($.jalios.ux.MemberImport.nextId).on('click', function (event) {
          $($.jalios.ux.MemberImport.formContentId).hide();
          $($.jalios.ux.MemberImport.chekingProgressId).show();
        });
      }
      
      var $finish = $($.jalios.ux.MemberImport.finishId);
      if ($finish) {
        $($finish).on('click', function (event) {
          $($.jalios.ux.MemberImport.formContentId).hide();
          $($.jalios.ux.MemberImport.importProgressId).show();
        });
      }
    }  // toggles Form and waiting div
  };

  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', $.jalios.ux.MemberImport.init);

}(window.jQuery);
