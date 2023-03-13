User.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
Category.destroy_all

3.times do |_|
  User.create!(email: Faker::Internet.email,
               password: 'foobar')
end

3.times do |_|
  Order.create!(user: User.all.sample)
end

3.times do |_|
  Category.create(name: Faker::Hobby.activity)
end

3.times do |_|
  Item.create!(title: Faker::Games::Pokemon.name,
               category: Category.all.sample)
end

Order.all.each do |order|
  OrderItem.create!(order: order,
                    item: Item.all.sample)
end
