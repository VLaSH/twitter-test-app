$(document).ready(
  ->
    validations()
)

validations = ->
  $("#new_session").validate({
    rules: {
      "session[email]": {required: true, email: true },
      "session[password]": {required: true, minlength: 8 }
    }
  });
