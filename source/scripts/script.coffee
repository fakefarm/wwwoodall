$(document).ready ->
  $('#camera').click ->
    $('.photos').slideDown()
  $('.photos').click ->
    $('.photos').slideUp()

  $('#gifs').click ->
    $('#gifs').children().hide()
    $('p.date').text('(Click to show)')
  $('#gif-show').click ->
    $('#gifs').children().show()
    $('p.date').text('(Click to hide)')


  jQuery.mark = jump: (options) ->
    defaults = selector: "a.scroll-on-page-link"
    defaults.selector = options  if typeof options is "string"
    options = jQuery.extend(defaults, options)
    jQuery(options.selector).click (e) ->
      jumpobj = jQuery(this)
      target = jumpobj.attr("href")
      thespeed = 800
      offset = jQuery(target).offset().top
      jQuery("html,body").animate
        scrollTop: offset
      , thespeed, "swing"
      e.preventDefault()
      return

jQuery ->
  jQuery.mark.jump()
  return

