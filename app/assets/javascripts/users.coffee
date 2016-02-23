$(document).ready(
  ->
    $('#settings-button').on('click',
      ->
        $('.user-settings').slideToggle()
    )
    changeUserName()
    validations()
)

changeUserName = ->
  $('.user-first-name-success').bind("ajax:success",
    ->
      $('.current-user-first-name').text($(this).text())
  )
  $('.user-last-name-success').bind("ajax:success",
    ->
      $('.current-user-last-name').text($(this).text())
  )

validations = ->
  $("#new_user").validate({
    rules: {
      "user[first_name]": {required: true },
      "user[last_name]": {required: true, minlength: 6 },
      "user[email]": {required: true, email: true },
      "user[password]": {required: true, minlength: 8 },
    }
  });
  $("#user_settings").validate({
    rules: {
      "user[email]": {required: true, email: true },
      "user[password]": {required: true, minlength: 8 },
      "user[password_confirmation]": {required: true, minlength: 8, equalTo: '#user_password' }
    }
  });
