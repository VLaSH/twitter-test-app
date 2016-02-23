$(document).ready(
  ->
    validations()
)

validations = ->
  $("#new_restore").validate({
    rules: {
      "user[email]": {required: true, email: true },
    }
  });
  $("#new_password").validate({
    rules: {
      "user[password]": {required: true },
      "user[password_confirmation]": {required: true, equalTo: '#user_password'}
    }
  });
