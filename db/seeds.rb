# User.create!(email: 'islane@rocketmail.com', password: 'a1234')


  35.times do
  
  	color1 = "%06x" % (rand * 0xffffff)
  	# generate second color for size indicator
  	# color2 = "%06x" % (rand * 0xffffff)
  	sizes = ["310x150", "150x150", "310x310", "150x310", "150x150"]
  
    Product.create(
      name:        Faker::Commerce.product_name,
      price:       Faker::Commerce.price,
      image_url:   "http://placehold.it/#{sizes.sample}/#{color1}/000000",
      votes: 			 rand(75),
    )
  end





