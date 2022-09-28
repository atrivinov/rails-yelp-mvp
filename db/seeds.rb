Restaurant.destroy_all

20.times do
   restaurant = Restaurant.create(
     name: Faker::Restaurant.name,
     address: Faker::Address.street_address,
     phone_number: Faker::PhoneNumber.cell_phone,
     category: %w["chinese", "italian", "japanese", "french", "belgian"].sample
   )
   3.times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
    review.restaurant = restaurant
    review.save
   end
   puts "Creating restaurant id: #{restaurant.id}"
 end
