//= require jquery

(function ($) {
  $(document).ready(function(){
    toggle_hidden_content();
  });
})($);

function toggle_hidden_content() {
  $('.content.button').on('click', function() {
    var $this = (this);
    var reveal = $this.dataset.click;
    var query = '[data-content="' + reveal + '"]';
    $(query).toggleClass('active');
  });
}
