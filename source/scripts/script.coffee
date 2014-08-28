$(document).ready ->
  $('#camera').click ->
    $('.photos').slideDown()
  $('.photos').click ->
    $('.photos').slideUp()

  $('.timeline-header').css('display', 'none')
