# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

addRow = (slideshow) ->
  desc = ''
  desc = " (#{slideshow.Description})" if slideshow.Description?
  $('#result').append(
    $('<li></li>').append(
      $('<a></a>').attr('href', slideshow.URL).append(slideshow.Title + desc)
    )
  )

init = ->
  $(document).ajaxStart ->
    $('#progress').html '通信中...'
  .ajaxComplete ->
    $('#progress').html ''

  $('#slide_search').on 'ajax:success', (e, data) ->
    $('#result').empty()

    slideshows = data.Slideshows
    switch parseInt(slideshows.Meta.NumResults)
      when 0 then return
      when 1 then addRow slideshows.Slideshow
      else $.each slideshows.Slideshow, -> addRow this

$(document).ready(init)
$(document).on('page:change', init)
