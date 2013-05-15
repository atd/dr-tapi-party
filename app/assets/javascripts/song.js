var Song = (function($, undefined) {
  var initPlayersTooltips = function() {
    $(".participants a").tooltip();
  };

  var initPlayButtons = function() {
    $('.songs select[name*="instruments"]').multiselect({
      buttonClass: 'btn',
      buttonText: function() { return 'Me apunto! <b class="caret"></b>'; }
    });
  };


  var index = function() {
    initPlayersTooltips();
    initPlayButtons();
  };

  return {
    index: index
  };
})(jQuery);
