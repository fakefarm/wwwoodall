$(document).ready ->
  element = document.getElementById("js-fadeInElement")
  $(element).addClass "js-fade-element-hide"
  $(window).scroll ->
    elementTopToPageTop = $(element).offset().top
    windowTopToPageTop = $(window).scrollTop()
    windowInnerHeight = window.innerHeight
    elementTopToWindowTop = elementTopToPageTop - windowTopToPageTop
    elementTopToWindowBottom = windowInnerHeight - elementTopToWindowTop
    distanceFromBottomToAppear = 750
    if elementTopToWindowBottom > distanceFromBottomToAppear
     $(element).addClass "js-fade-element-show"
    else if elementTopToWindowBottom < 600
     $(element).removeClass "js-fade-element-show"
     $(element).addClass "js-fade-element-hide"


  $('#gifs').click ->
    $('#gifs').children().hide()
    $('p.date').text('(Click to show)')
  $('#gif-show').click ->
    $('#gifs').children().show()
    $('p.date').text('(Click to hide)')

  $('[data-name=filter]').click (e) ->
    e.preventDefault()

    self = $(this)
    tag = { new_tag: self.text() }
    filtered = $('[data-tag=' + tag.new_tag + ']' )

    if tag.old_post = null
      $('#posts').remove()
      tag.old_post = tag.new_tag
    else
      $('[data-tag=' + tag.old_post + ']' ).remove()

    $('#posts').append(filtered)

    title = $('#title').text(tag.new_tag)

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

