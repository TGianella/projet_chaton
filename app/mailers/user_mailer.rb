class UserMailer < ApplicationMailer
  default from: 'saeros@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://awesomecatpics-development.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue sur AwesomeCatsPics !')
  end
end
