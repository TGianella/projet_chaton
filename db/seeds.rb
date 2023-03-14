ActionMailer::Base.perform_deliveries = false
User.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
Category.destroy_all

10.times do |_|
  User.create!(email: Faker::Internet.email,
               password: 'foobar')
end

20.times do |_|
  Order.create!(user: User.all.sample)
end

5.times do |_|
  Category.create(name: Faker::Hobby.activity)
end

img_url = ["https://i.imgur.com/pqrE0rb.png","https://i.imgur.com/IfSX8GV.png","https://i.imgur.com/seqQtRV.png"]

20.times do |_|
  Item.create!(title: Faker::Games::Pokemon.name,
               category: Category.all.sample,
               price: 199.00,
               image_url: img_url[rand(0..2)] 
              )
end

Order.all.each do |order|
  Item.all.sample(rand(5)).each do |item|
    OrderItem.create!(order: order,
                      item: item,
                      quantity: rand(10))
  end
end
