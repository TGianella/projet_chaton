class UserMailer < ApplicationMailer
  default from: 'saeros@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://awesomecatpics-development.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue sur AwesomeCatPics !')
  end

  def send_order
    @order = Order.last
    if @order.status == 'paid'
      @user = @order.user.email
      @order_items = order.order_items
      mail(to: @user.email, subject: 'Merci pour ta commande')
    end
  end

  def order_recap_to_admin
    @user = User.where(admin: true).pluck(:email)
    @order = Order.last
    if @order.status == 'paid'
      @user = @order.user.email
      @order_items = order.order_items
      mail(to: @user.email, subject: 'Nouvelle commande')
    end
  end
end
