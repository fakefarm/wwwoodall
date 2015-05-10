$(document).ready ->
  element = document.getElementById("js-fadeInElement")
  $(element).addClass "js-fade-element-hide"
  if location.pathname == '/feed'
    $(window).scroll ->
      elementTopToPageTop = $(element).offset().top
      windowTopToPageTop = $(window).scrollTop()
      windowInnerHeight = window.innerHeight
      elementTopToWindowTop = elementTopToPageTop - windowTopToPageTop
      elementTopToWindowBottom = windowInnerHeight - elementTopToWindowTop
      distanceFromBottomToAppear = 10
      if elementTopToWindowBottom > distanceFromBottomToAppear
       $(element).addClass "js-fade-element-show"
      else if elementTopToWindowBottom < 570
       $(element).removeClass "js-fade-element-show"
       $(element).addClass "js-fade-element-hide"


  $('#gifs').click ->
    $('#gifs').children().hide()
    $('p.date').text('(Click to show)')
  $('#gif-show').click ->
    $('#gifs').children().show()
    $('p.date').text('(Click to hide)')


  class FilterPosts

    constructor: (@posts,@tags) ->
      @currentTag = ''
      _.each @tags, (tag) =>
        tag.el.on "click", _.bind(@onClick,@)

    onClick: (e) ->
      $tag = $(e.currentTarget)
      @currentTag = tag = $tag.text()
      $('#tag-title').text($tag.text())
      @filterPosts(tag)

    filterPosts: (tag) ->
      filtered = _.filter @posts, (post) ->
        post.tag == tag
      for post in @allPosts()
        $(post).hide()
      for post in filtered
        $(post.el).show()
    allPosts: ->
      _.map(@posts, (post) -> post.el)

    addPost: (post) ->
      @posts.push(post)

  posts = _.map $("article"), (post) ->
    { el: $(post), tag: $(post).data("tag") }
  tags = _.map $(".blog-tags ul > li"), (tag) ->
    { el: $(tag), tag: $(tag).text() }


  filterPosts = new FilterPosts(posts,tags)


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

  $('#copy-more').click (e)->
    e.preventDefault()
    e.stopPropagation()
    $('.more-info').slideToggle()

  $('.copy-more').click (e)->
    $('.more-info').slideToggle()


jQuery ->
  jQuery.mark.jump()
  return


