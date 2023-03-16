class UserMailer < ApplicationMailer
  default from: 'saeros@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://awesomecatpics-development.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue sur AwesomeCatPics !')
  end

  def send_order(order)
    puts 'methode send_order TESTTTTT'
    @order = order
    @user = order.user
    @order_items = order.order_items
    mail(to: @user.email, subject: 'Merci pour ta commande')
  end

  def order_recap_to_admin(order)
    @order = order
    @mail_admin = User.where(admin: true).pluck(:email)
    @user = order.user
    @order_items = order.order_items
    @mail_admin.each do |mail|
      mail(to: mail, subject: 'Nouvelle commande')
    end
  end
end
