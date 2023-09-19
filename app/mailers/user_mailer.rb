class UserMailer < ApplicationMailer

  #these are methods

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
