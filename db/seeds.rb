ActionMailer::Base.perform_deliveries = false
User.destroy_all
Item.destroy_all
Order.destroy_all
Cart.destroy_all
OrderItem.destroy_all
Category.destroy_all

# Create admin
User.create!(email: 'my_admin_mailer@yopmail', password: 'foobar', admin: true)

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

img_url = ['https://i.imgur.com/pqrE0rb.png', 'https://i.imgur.com/IfSX8GV.png', 'https://i.imgur.com/seqQtRV.png']
20.times do |_|
  Item.create!(title: Faker::Games::Pokemon.name,
               category: Category.all.sample,
               image_url: img_url[rand(0..2)],
               rarity: rand(0..4))
end

facteur = [rand(1.00..24.00), rand(25.00..50.00), rand(51.00..99.00), rand(100.00..455.00), rand(456.00..999.00)]

Item.all.each do |item|
  item.update!(price: ('%.02f' % facteur[item.rarity]))
end

# Order.all.each do |order|
#   Item.all.sample(rand(5)).each do |item|
#     OrderItem.create!(order: order,
#                       item: item,
#                       quantity: rand(10))
#   end
# end
