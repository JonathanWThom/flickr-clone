class UserMailer < ApplicationMailer
  default from: "notification@example.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site', from: "jonathan.thom1990@gmail.com")
  end
end
