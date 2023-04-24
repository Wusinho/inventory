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
               name: 'user', last_name: 'last_user')
  provider = Provider.create(name: 'Proveedor A',
                  phone: '980687288'
                  )
  product = Product.create(name: 'Kit Limpiador PC', provider_id: provider.id)
  Price.create(product_id: product.id, price: 5.40, quantity: 5)

end