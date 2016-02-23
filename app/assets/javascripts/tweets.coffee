ready = ->
  $('.comments a').on('click',
    ->
      tweet_id = $(this).closest('.tweet').attr('id')
      $("##{tweet_id} .sticks").toggle()
  )
$(document).ready(ready);
