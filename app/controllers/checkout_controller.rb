class CheckoutController < ApplicationController
  before_action :create_order, only: [:create]
  def create
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    current_user.orders.last.validate_payment
    empty_cart
  end

  def cancel
    cancel_order
  end

  private

  def create_order
    @cart = current_user.cart
    @order = Order.new(user: current_user, status: "pending")
    @order.save
    @order.import_cart(@cart)
  end

  def cancel_order
    @order = current_user.orders.last
    @order.destroy
  end

  def empty_cart
    @cart = current_user.cart
    @cart.destroy
    @cart = Cart.new(user: current_user)
    @cart.save
  end

end
