//= require 'plugins/csrf_resolver'
//= require './show'
//= require './new'
//= require 'messages/create'

let DialogsIndex = (function() {
  const DIALOGS_SEARCH_SELECTOR = '#dialogs-search',
        DIALOGS_LIST_SELECTOR   = '#dialogs-list',
        DIALOG_BLOCK_SELECTOR   = '.m-list',
        USER_BLOCK_SELECTOR     = '.list-group-item';

  let dialogShowUrl, dialogsSearchUrl, $searchBox;

  let init = function() {
    assignAttributes();
    bindAutoComplete();
    bindEvents();

    loadDialogs();
  };

  let assignAttributes = function() {
    $searchBox    = $(DIALOGS_SEARCH_SELECTOR);

    dialogsSearchUrl = $searchBox.data('url');
    dialogShowUrl    = $(DIALOG_BLOCK_SELECTOR).data('url');
  };

  let bindAutoComplete = function() {
    $searchBox.select2({
      theme:       'bootstrap',
      placeholder: $searchBox.attr('placeholder'),
      ajax: {
        url:         dialogsSearchUrl,
        dataType:    'JSON',
        quietMillis: 100,
        data: function(query) {
          return {
            query: query
          };
        },
        results: function(data) {
          renderDialogsCallback(data);

          let userId = $(DialogsShow.DIALOG_CONTAINER_SELECTOR).data('user-id');

          DialogsShow.selectUser(userId);

          return {
            results: data
          }
        }
      },
      formatResult: function(user) {
        return "<div class='select2-dialog-result'>" + user.nickname + ' | ' + user.email + "</div>";
      },
      formatSelection: function(user) {
        return user.nickname;
      }
    });
  };

  let bindEvents = function() {
    $searchBox.on('change', function() {
      let data = $(this).select2('data');

      renderDialog(data.id);
    });

    $(DIALOGS_LIST_SELECTOR).parent().on('click', USER_BLOCK_SELECTOR, function() {
      let userId = $(this).data('id');

      renderDialog(userId);
    })
  };

  let loadDialogs = function() {
    $.ajax({
      url:      dialogsSearchUrl,
      dataType: 'JSON',
      async:    false,
      success: function(data) {
        renderDialogsCallback(data);
      }
    });
  };

  let renderDialogsCallback = function(data) {
    let template = HandlebarsTemplates['dialogs/index']({
      users: data || []
    });

    $(DIALOGS_LIST_SELECTOR).replaceWith(template);

    bindTooltips();
  };

  let renderDialog = function(oppositeUserId) {
    $(DialogsShow.DIALOG_CONTAINER_SELECTOR).hide();

    $.get(fullDialogShowUrl(oppositeUserId), function(data) {
      DialogsShow.init(data);
    })
  };

  let bindTooltips = function() {
    $('[data-toggle="tooltip"]', $(DIALOGS_LIST_SELECTOR)).tooltip();
  };

  let fullDialogShowUrl = function(oppositeUserId) {
    return dialogShowUrl + '/' + oppositeUserId;
  };

  return {
    DIALOGS_SEARCH_SELECTOR: DIALOGS_SEARCH_SELECTOR,
    USER_BLOCK_SELECTOR:     USER_BLOCK_SELECTOR,
    DIALOG_BLOCK_SELECTOR:   DIALOG_BLOCK_SELECTOR,
    DIALOGS_LIST_SELECTOR:   DIALOGS_LIST_SELECTOR,
    init:                    init,
    loadDialogs:             loadDialogs
  }
})();

$(function () {
  DialogsIndex.init();
});
