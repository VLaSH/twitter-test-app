#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require best_in_place
#= require jquery.validate
#= require jquery.validate.additional-methods
#= require_tree .

$(document).ready(
  ->
    jQuery(".best_in_place").best_in_place()
    removeAlerts()
)
$(document).ready ->
  if $('.pagination').length > 0
    $(window).scroll ->
      next = $('.pagination a[rel=next]')
      if next.length > 0 && $(window).scrollTop() > $(document).height() - $(window).height() - 10
        $('.pagination').text('Loading...')
        $.getScript(next.attr('href'))
    $(window).scroll()

removeAlerts = ->
  $('.alert').on('click',
    ->
      $(this).remove()
  )
