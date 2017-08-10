let AutoHideAlert = (function() {
  const FADE_OUT_DELAY         = 3000,
        FADE_IN_DELAY          = 100,
        DEFAULT_ALERT_SELECTOR = '.alert';

  let $alert, selector = DEFAULT_ALERT_SELECTOR;

  let init = function(params) {
    if (params) assignAttributes(params);

    assignElements();
    bindEvents();
  };

  let assignAttributes = function(params) {
    selector = params.selector || DEFAULT_ALERT_SELECTOR;
  };

  let assignElements = function() {
    $alert = $(selector);
  };

  let bindEvents = function() {
    hide($alert);

    $alert.on('mouseover', show);
    $alert.on('mouseout', hide);
  };

  let hide = function() {
    $alert.stop().fadeOut(FADE_OUT_DELAY);
  };

  let show = function() {
    $alert.stop().fadeIn(FADE_IN_DELAY);
  };

  return {
    init: init
  }
})();

$(function() {
  AutoHideAlert.init();
});
