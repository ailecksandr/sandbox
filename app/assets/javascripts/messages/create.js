let MessagesCreate = (function() {
  const NEW_MESSAGE_FORM_SELECTOR = '#new-message-form';

  let message, $panelBody;

  let init = function(params) {
    assignAttributes(params);

    renderMessage();

    scrollToEndOfDialog();
    clearMessageForm();
    moveCurrentUserToTop();
  };

  let assignAttributes = function(params) {
    $panelBody = $('.panel-body', $(DialogsShow.DIALOG_CONTAINER_SELECTOR));

    message = params;
  };

  let renderMessage = function() {
    let template = HandlebarsTemplates['messages/create']({
      message: message
    });

    $panelBody.find('.flat-container').remove();
    $panelBody.append(template);
  };

  let clearMessageForm = function() {
    $(NEW_MESSAGE_FORM_SELECTOR).trigger('reset');
  };

  let scrollToEndOfDialog = function() {
    DialogsShow.scrollDialogBox();
  };

  let moveCurrentUserToTop = function() {
    let $userBlock = $(DialogsIndex.USER_BLOCK_SELECTOR + '.current');

    $(DialogsIndex.DIALOGS_LIST_SELECTOR).prepend($userBlock);
  };

  return {
    init: init
  }
})();
