$(document).ready(function(){
  verticalTabs();
  var $this = $('#click-abc');

  $this.on('click', function() {
    $('.abc-summary').show();
    $this.hide();
  });
});

