# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product_categories = [
  "ropa",
  "calzado",
  "tecnología",
  "hogar",
  "jardín",
  "belleza",
  "cuidado personal",
  "alimentos",
  "bebidas",
  "deportes",
  "fitness",
  "juguetes",
  "entretenimiento",
  "viajes",
  "turismo",
  "automóviles",
  "motocicletas",
  "mascotas",
  "salud",
  "oficina",
  "manualidades",
  "bebés",
  "niños",
  "libros",
  "revistas",
  "cuidado del hogar",
  "muebles",
  "decoración",
  "joyería",
  "relojes",
  "equipamiento deportivo",
  "instrumentos musicales",
  "oroductos exteriores",
  "camping",
  "herramientas",
  "mejoras hogar",
  "fiestas",
  "eventos",
  "limpieza",
  "equipamiento",
  "viajes",
  "vacaciones",
  "cocina",
  "papelería",
  "construcción",
  "barba",
  "cuidado facial",
  "cabello",
  "dental",
  "piel",
  "maquillaje",
  "suplementos",
  "aromaterapia"
]
product_categories.each { |cat_name| Category.find_or_create_by(name: cat_name) }

password = '123456'
SuperAdmin.find_or_create_by(email: 'admin@gmail.com') do |admin|
  admin.password = password
  admin.password_confirmation = password
end

2.times do |i|
  Admin.create(email: "user_#{i}@gmail.com",
               password: password,
               password_confirmation: password,
               name: 'nombre' , last_name: 'apellido'  )
end

if Rails.env.development?

  Balance.create(starting_total: 1000)

  5.times do
    Provider.create(name: Faker::Company.name,
                    phone: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.full_address,
                    contact: Faker::Name.name,
                    )
    Customer.create(name: Faker::Name.first_name ,
                    last_name: Faker::Name.last_name,
                    phone: Faker::PhoneNumber.cell_phone)
  end
  Provider.all.each do |provider|
    [1,2].sample.times do
      cat_ids = Category.all.sample([1,2,3].sample)

      product = Product.create(name: Faker::Commerce.product_name,
                              provider_id: provider.id,
                              description: Faker::Lorem.paragraph,
                              )

      cat_ids.each { |cat| ProductCategory.create(product_id: product.id, category_id: cat.id ) }

    end
  end

  # Product.all.each do |product|
  #   [4,6,8].sample.times {
  #     price = Faker::Commerce.price
  #     i = InventoryPurchase.create(product_id: product.id,
  #                                  purchase_price: price,
  #                                  stock_quantity: [4,5].sample,
  #                                  selling_price: price * 1.2)
  #   }
  # end

  end
