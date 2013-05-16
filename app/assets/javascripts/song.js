var Song = (function($, undefined) {
  var initPlayersTooltips = function() {
    $(".participants a").tooltip();
  };

  var initPlayButtons = function() {
    $('.songs select[name*="instruments"]').multiselect({
      buttonClass: 'btn',
      buttonText: playSelectText
    });

    // Add btn-success
    $('.participate option[selected]').
      closest('form').
      find('button').
      addClass('btn-success');

    // Forms
    storeFormValues($('.participate form'));

    $('.participate form ul.dropdown-menu input[type="checkbox"]').change(function() {
      evalFormStatus(this);
    });

    $('.participate form button.dropdown-toggle').on('click.dropdown.data-api', saveForms);
  };

  var playSelectText = function(options) {
    var msg;

    if (options.length === 0) {
      msg = 'Me apunto!';
    }
    else {
      msg = 'Apuntada';
    }

    return msg + '<b class="caret"></b>';
  };

  var saveForms = function() {
    $('.participate form[data-status="changed"]').each(function(i, form) {
      $('button', form).attr('data-loading-text', 'Guardando');
      $('button', form).button('loading');

      $(form).submit();
    });
  };

  var storeFormValues = function(el) {
    $(el).each(function() {
      $(this).data('instruments', getInputValues($(this)));
    });
  };

  var restoreFormValues = function(el) {
    var values = $(el).data('instruments');
    var select = $('select[name*="instruments"]', el);

    $('option', select).each(function() {
      $(this).attr('selected', $.inArray($(this).val(), values) >= 0);

    });

    select.multiselect('refresh');
  };

  // Dictate if some form has changed its status
  var evalFormStatus = function(el) {
    var form = $(el).closest('form');

    var orig = $(form).data('instruments');
    var neww = getInputValues(form);

    if ($(orig).not(neww).length === 0 && $(neww).not(orig).length === 0) {
      $(form).removeAttr('data-status');
    } else {
      $(form).attr('data-status', 'changed');
    }
  };

  // Extract values
  var getInputValues = function(form) {
    return $('ul.dropdown-menu input[type="checkbox"]', form).
      map(function() {
        if ($(this).is(':checked'))
          return $(this).val();
      });
  };

  var setInputValues = function(form) {
    return $('ul.dropdown-menu input[type="checkbox"]', form).
      map(function() {
      if ($(this).is(':checked'))
        return $(this).val();
    });
  };

  var initPlayFormsHtmlListener = function() {
    $('html').on('click.dropdown.data-api', saveForms);
  };

  var index = function() {
    initPlayersTooltips();
    initPlayButtons();
    initPlayFormsHtmlListener();
  };

  return {
    index: index
  };
})(jQuery);
