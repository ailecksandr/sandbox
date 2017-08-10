let DialogsNew = (function() {
  const NEW_DIALOG_MODAL_SELECTOR  = '#new-dialog',
        NEW_DIALOG_SELECT_SELECTOR = '#select-new-dialog';

  let currentUserId, usersUrl, formUrl, $modal;

  let init = function(params) {
    assignAttributes(params);

    renderModal();
    bindAutocomplete();
  };

  let assignAttributes = function(params) {
    $modal = $(NEW_DIALOG_MODAL_SELECTOR);

    usersUrl      = $modal.data('users-url');
    formUrl       = $modal.data('url');
    currentUserId = params.currentUserId;
  };

  let renderModal = function() {
    let template = HandlebarsTemplates['dialogs/new']({
      current_user_id: currentUserId,
      url:             formUrl,
      auth_token:      CSRFResolver.getToken()
    });

    $('.modal-content', $modal).html(template);

    $modal.modal();
  };

  let bindAutocomplete = function() {
    let $selectBox = $(NEW_DIALOG_SELECT_SELECTOR);

    $selectBox.select2({
      theme:       'bootstrap',
      placeholder: $selectBox.attr('placeholder'),
      ajax: {
        url:         usersUrl,
        dataType:    'JSON',
        quietMillis: 100,
        data: function(query) {
          return {
            query: query
          };
        },
        results: function(data) {
          return {
            results: data
          }
        }
      },
      formatResult: function(user) {
        return "<div class='select2-dialog-result'>" + user.nickname + ' | ' + user.email  + "</div>";
      },
      formatSelection: function(user) {
        return user.nickname;
      }
    });
  };

  return {
    init: init
  }
})();
