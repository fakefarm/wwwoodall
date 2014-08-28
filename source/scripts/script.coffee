$(document).ready ->
  $('#camera').click ->
    $('.photos').slideDown()
  $('.photos').click ->
    $('.photos').slideUp()

  $('.timeline-header').css('display', 'none')
  # $('.overlay.overlay-scale').click (e)->
  #   $(this).fadeOut();
  #   $(this).removeClass('open');


