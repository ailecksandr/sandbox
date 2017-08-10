let CSRFResolver = (function() {
  let getToken = function() {
    return document.querySelector('meta[name="csrf-token"]').content;
  };

  return {
    getToken: getToken
  }
})();
