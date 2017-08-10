let DialogsShow = (function() {
  const DIALOG_CONTAINER_SELECTOR = '#dialog-container',
        DIALOG_ID_URL_KEY         = ':dialog_id',
        MESSAGES_NAV_SELECTOR     = '#messages-nav';

  let id, userId, unreadMessagesCount, messages, userNickname, isOnline, isBlocked, disableReason;

  let init = function(params) {
    assignAttributes(params);

    clearSelect();
    renderDialog();
    readMessages();
  };

  let assignAttributes = function(params) {
    id                  = params.id;
    userId              = params.user_id;
    messages            = params.messages;
    userNickname        = params.user_nickname;
    isOnline            = params.is_online;
    unreadMessagesCount = params.unread_messages_count;
    disableReason       = params.disable_reason;
  };

  let renderDialog = function() {
    selectUser(userId);

    let template = HandlebarsTemplates['dialogs/show']({
      id:              id,
      messages:        messages || [],
      user_nickname:   userNickname,
      user_id:         userId,
      is_online:       isOnline,
      auth_token:      CSRFResolver.getToken(),
      new_message_url: newMessageUrl(),
      disable_reason:  disableReason
    });

    $(DIALOG_CONTAINER_SELECTOR).replaceWith(template);

    scrollDialogBox();
  };

  let clearSelect = function() {
    selectUser(userId);

    DialogsIndex.loadDialogs();
  };

  let newMessageUrl = function() {
    return $(DialogsIndex.DIALOG_BLOCK_SELECTOR).data('message-url').replace(DIALOG_ID_URL_KEY, id);
  };

  let scrollDialogBox = function() {
    let $dialogContainer = $('.panel-body', $(DIALOG_CONTAINER_SELECTOR));

    $dialogContainer.scrollTop($dialogContainer[0].scrollHeight);
  };

  let readMessages = function() {
    let $unreadMessages  = $('.panel-body .message-bubble.received.unread', $(DIALOG_CONTAINER_SELECTOR)),
        $messagesNavLink = $('a', MESSAGES_NAV_SELECTOR);

    $unreadMessages.removeClass('unread');

    $messagesNavLink.text($messagesNavLink.text().replace(/\(.*\)/, '(' + unreadMessagesCount + ')'));
  };

  function selectUser(userId) {
    $(DialogsIndex.USER_BLOCK_SELECTOR).removeClass('current');

    $(DialogsIndex.USER_BLOCK_SELECTOR + '[data-id=' + userId + ']').addClass('current');
  }

  return {
    DIALOG_CONTAINER_SELECTOR: DIALOG_CONTAINER_SELECTOR,
    init:                      init,
    scrollDialogBox:           scrollDialogBox,
    selectUser:                selectUser
  }
})();
