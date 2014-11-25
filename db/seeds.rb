  # me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
  # test = Customer.create(name: 'John Doe', email: 'test@example.com')
  # Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')
  #
  # muffin = Product.create(name: 'Muffin', price: 2.99)
  # smoothie = Product.create(name: 'Smoothie', price: 3.75)
  # coffee = Product.create(name: 'Coffee', price: 3.99)
  #
  # order = Order.create(customer: me, placed_at: '2013-09-27')
  # LineItem.create(order: order, quantity: 1, product: muffin)
  # LineItem.create(order: order, quantity: 1, product: smoothie)
  #
  # order = Order.create(customer: me, placed_at: Time.current)
  # LineItem.create(order: order, quantity: 1, product: smoothie)
  #
  # order = Order.create(customer: test, placed_at: Time.current)
  # LineItem.create(order: order, quantity: 1, product: muffin)
  # LineItem.create(order: order, quantity: 1, product: coffee)
  #
  #
  # User.create!(email: 'islane@rocketmail.com', password: 'a1234')

if Rails.env.development?

  40.times do
    Product.create(
      name:        Faker::Commerce.product_name,
      price:       Faker::Commerce.price,
      image_url:   Faker::Avatar.image(nil, "150x150"),
      description: Faker::Lorem.paragraph,
    )
  end

end
