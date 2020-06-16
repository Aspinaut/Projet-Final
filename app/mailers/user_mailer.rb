class UserMailer < ApplicationMailer
  default from: 'reconversionwebpro@yopmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://thp-final-project.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
