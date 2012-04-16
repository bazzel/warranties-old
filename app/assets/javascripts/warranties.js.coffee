# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".datepicker").datepicker
    format: "dd-mm-yyyy"
    autoclose: true

$ ->
  new FancyBox()

$ ->
  new PhotoCropper()

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

class PhotoCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#warranty_crop_x').val(coords.x)
    $('#warranty_crop_y').val(coords.y)
    $('#warranty_crop_w').val(coords.w)
    $('#warranty_crop_h').val(coords.h)
