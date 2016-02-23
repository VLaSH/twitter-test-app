$('#tweets').prepend("<%= j render partial: 'tweets/user_tweet', locals: { user_tweet: @tweet, user_id: params[:user_id] } %>")
$('textarea#new-tweet').val('')

$('.comments a').off('click')
$('.comments a').on('click',
  ->
    tweet_id = $(this).closest('.tweet').attr('id')
    $("##{tweet_id} .sticks").toggle()
)
