$(document).ready ->
  $('.search-field').keyup(
    ->
      if($('.following-users-preview').hasClass('active'))
        $.ajax({
          url: '/related_users',
          method: 'GET',
          data: { related_user: 'RelatedUser::Follower', name: $('.search-field').val() }
        })
      else
        $.ajax({
          url: '/users',
          method: 'GET',
          data: { name: $('.search-field').val() }
        })
  )
  validations()

validations = ->
  $("#new_tweet").validate({
    rules: {
      "tweet[body]": {required: true, minlength:8, maxlength: 100 }
    }
  });
