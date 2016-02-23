class UserMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    mail(to: user.email, subject: 'Confirm email')
  end

  def restore_password(user)
    @user = user
    mail(to: user.email, subject: 'Password recovering')
  end
end
