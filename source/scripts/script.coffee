$(document).ready ->
  $('.snippet-title').click ->
    $(this).next(".snippet").slideToggle()
