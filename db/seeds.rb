ActionMailer::Base.perform_deliveries = false
User.destroy_all
Item.destroy_all
Order.destroy_all
Cart.destroy_all
OrderItem.destroy_all
Category.destroy_all

# Create admin
User.create!(email: 'my_admin_mailer@yopmail.com', password: 'foobar', admin: true)

10.times do |_|
  User.create!(email: Faker::Internet.email,
               password: 'foobar',
               admin: false)
end

# 20.times do |_|
#   Order.create!(user: User.all.sample,
#                 status: 'paid')
# end

5.times do |_|
  Category.create(name: Faker::Hobby.activity)
end

IMG_URLS = ['https://i.imgur.com/pqrE0rb.png', 'https://i.imgur.com/IfSX8GV.png', 'https://i.imgur.com/seqQtRV.png']
RARITY_PRICE_FACTOR = [1, 2, 5, 10, 100]
20.times do |_|
  item = Item.new(title: Faker::Games::Pokemon.name,
                  category: Category.all.sample,
                  description: Faker::Lorem.paragraph,
                  image_url: IMG_URLS[rand(0..2)],
                  rarity: rand(0..4))

  item.price = (format('%.02f', (RARITY_PRICE_FACTOR[item.rarity] * rand(1.0..50.0))))
  item.save!
end

# Order.all.each do |order|
#   Item.all.sample(rand(5)).each do |item|
#     OrderItem.create!(order: order,
#                       item: item,
#                       quantity: rand(10))
#   end
# end
