class UserMailer < ApplicationMailer
  default from: 'saeros@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://awesomecatpics-development.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue sur AwesomeCatPics !')
  end

  def send_order
    @user = current_user
    @order = Order.last
    @order_items = OrderItem.where(order_id: @order.id)
    @total_price = 0
    @order_items.each do |order_item|
      @total_price += order_item.quantity * order_item.item.price
    end
    mail(to: @user.email, subject: 'Merci pour ta commande')
  end

  def order_recap_to_admin
    @user = User.where(admin: true).pluck(:email)
    @order = Order.last
    @order_items = OrderItem.where(order_id: @order.id)
    @total_price = 0
    @order_items.each do |order_item|
      @total_price += order_item.quantity * order_item.item.price
    end
    mail(to: @user.email, subject: 'Nouvelle commande')
  end
end
