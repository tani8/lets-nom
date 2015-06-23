require 'faker'

  Nom.create!({
    food_name: "Mint Mojitos",
    amount_type: "cups",
    # cups, slices, tray
    amount: "15",
    date_made: Faker::Date.between(3.days.ago, Date.today),
    allergens: "Dairy",
    address: "748 Van Ness Ave, San Francisco, CA",
    image_url: "https://sparklesforall.files.wordpress.com/2014/09/photo-16.jpg",
    user_id: 1,
  })
  Nom.create!({
    food_name: "Variety of Cupcakes",
    amount_type: "trays",
    # cups, slices, tray
    amount: "2",
    date_made: Faker::Date.between(3.days.ago, Date.today),
    allergens: "Soy",
    address: " 101 4th St, San Francisco, CA 94103, USA",
    image_url: "http://www.cako.com/media/catalog/product/cache/1/thumbnail/deb196e509f692fa410384bf6ca96ab7/h/a/halfandhalf-0720_1000x1000.jpg",
    user_id: 3,
  })
  User.create!({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  })
  UserNom.create!({
    giver_id: 2,
    consumer_id: 4,
  })


# 5.times do |i|
#   Nom.create!({
#     food_name: Faker::Lorem.word,
#     amount_type: "cups",
#     # cups, slices, tray
#     amount: Faker::Number.number(2),
#     date_made: Faker::Date.between(3.days.ago, Date.today),
#     allergens: Faker::Lorem.words,
#     address: "748 Van Ness Ave, San Francisco, CA",
#     image_url: "http://www.seriouseats.com/images/2012/10/20121010-vegetarian-lasagna-spinach-mushroom-whole.jpg",
#     user_id: 1,
#   })
#   User.create!({
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#   })
#   UserNom.create!({
#     giver_id: "1",
#     consumer_id: "3",
#   })
# end
