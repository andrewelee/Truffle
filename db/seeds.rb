# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{ name: 'Home'}, {name: 'Gadgets'}, {name: 'Games & Toys'}])

Brand.create([{ name: 'Brand A'}, {name: 'Brand B'}])

User.create([
  {
  name: 'Andrew Lee',
  username: 'andrew',
  email: 'andrew@andrew.com',
  isEditor: true,
  password_digest: "$2a$10$ojQsYjyS8kKZ1a39ypf8puHt3zEstTw4Rd6V.vrIyi/fMX.k1Dhe6"
  },
  
  {
  name: 'Bob Saget',
  username: 'DannyTanner1987',
  email: 'bob@saget.com',
  isEditor: false,
  password_digest: "$2a$10$ERywLQJcZ41fa.TcK6GYeOkRMTneUdrdBD8bW29//3x7noxmu1wi6"
  }])
  
  Product.create(
    name:"Piggy Mug", 
    url: "http://www.amazon.com/Decole-Pig-Manmaru-Mug-Spoon/dp/B00397ARDQ",
    price: 20.00,
    brand_id: 1,
    category_id: 1,
    finder_user_id: 1,
    editor_user_id: 1
  )
  
  Product.create(
    name:"Piggy Mug2", 
    url: "http://www.amazon.com/Decole-Pig-Manmaru-Mug-Spoon/dp/B00397ARDQ",
    price: 25.00,
    brand_id: 2,
    category_id: 1,
    finder_user_id: 2,
    editor_user_id: 1
  )
  
  #pass: andrew, fullhouse