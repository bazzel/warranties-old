# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".datepicker").datepicker
    format: "dd-mm-yyyy"
    autoclose: true

$ ->
  new FancyBox()

class FancyBox
  constructor: ->
    $("a.fancybox").fancybox
      padding: 0
      openEffect: 'elastic'
      openSpeed: 150
      closeEffect: 'elastic'
      closeSpeed: 150
      closeClick: true
      helpers:
        overlay: null
