class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart
  validates :name, format: { with: /[\w -']*/, message: 'Seules les lettres et les espaces sont autorisées' }
  # length: { in: 6..30, message: 'Le nom doit faire entre 6 et 30 caractères' }

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
