# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


if Rails.env.development?
  Admin.create(email: 'user_0@gmail.com',
               password: '123456',
               password_confirmation: '123456',
               name: Faker::Name.first_name , last_name: Faker::Name.middle_name  )
  5.times do
    Provider.create(name: Faker::Company.name,
                    phone: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.full_address,
                    contact: Faker::Name.name,
                    )
  end
  Provider.all.each do |provider|
    [2,3,5].sample.times do
      product =Product.create(name: Faker::Commerce.product_name, provider_id: provider.id, description: Faker::Lorem.paragraph)
      [1,3,5].sample.times {  Price.create(product_id: product.id, price: Faker::Commerce.price, quantity: [2,4,5].sample) }
    end
  end




end