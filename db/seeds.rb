# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "truffle", username: "Truffle", email: 'truffle@gmail.com', 
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.', 
  isEditor: true, avatar: File.new("#{Rails.root}/seeds/images/truffle-editor.png"))
  
User.create(name: "Andrew Lee", username: "thebigL", email: 'bigLee@gmail.com', 
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.', 
  isEditor: true, avatar: File.new("#{Rails.root}/seeds/images/andrewAvatar.png"))
  
User.create(name: "Bob Saget", username: "dannytanner1987", email: 'fullhouse@gmail.com', 
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.', 
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/danny.png"))

User.create(name: "Nightrider", username: "nightrider", email: 'nightrider666@gmail.com', 
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.', 
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/nightrider.jpg"))

User.create(name: "Judy Funny", username: "judyfunny", email: 'nicktoons@gmail.com', 
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.', 
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/judy.png"))

Category.create([{ name: 'Backpacks'}, { name: 'Clocks'}, {name: 'Fitness'}, {name: 'Mugs'}])

Brand.create([{ name: 'Misc.'}, {name: 'Decole'}, {name: 'JanSport'}, {name: "Spri"}])

Product.create(name: "JanSport Classic SuperBreak Backpack", url: "http://www.amazon.com/dp/B006ML7JXC", 
  price: 30.96, brand_id: 3, category_id: 1, finder_user_id: 1, editor_user_id: 1, 
  image: File.new("#{Rails.root}/seeds/images/backpack1.jpg"))

Product.create(name: "JanSport Classic SuperBreak Backpack Floral", url: "http://www.amazon.com/dp/B00HS5YK06/", 
  price: 29.48, brand_id: 3, category_id: 1, finder_user_id: 2, editor_user_id: 1, 
  image: File.new("#{Rails.root}/seeds/images/backpack2.jpg"))


  Product.create(
    name:"Piggy Mug2",
    url: "http://www.amazon.com/Decole-Pig-Manmaru-Mug-Spoon/dp/B00397ARDQ",
    price: 25.00,
    brand_id: 2,
    category_id: 1,
    finder_user_id: 2,
    editor_user_id: 1,
    image: "http://ecx.images-amazon.com/images/I/319QJI4Y-zL.jpg"
  )

  #pass: andrew, fullhouse