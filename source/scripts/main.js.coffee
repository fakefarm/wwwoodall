#= require 'lib/jquery'

$ ->
  $('.click-me').click ->
    $('#laird').slideDown().addClass('BounceInDown')
    $('.jetski-img').addClass('bounceInRight')

  $('#laird').click ->
    $("#laird").slideUp()
