# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "truffle", username: "Truffle", email: 'truffle@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: true, avatar: File.new("#{Rails.root}/seeds/images/avatars/truffle-editor.png"))

User.create(name: "Andrew Lee", username: "thebigL", email: 'bigLee@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: true, avatar: File.new("#{Rails.root}/seeds/images/avatars/andrewAvatar.png"))

User.create(name: "Bob Saget", username: "dannytanner1987", email: 'fullhouse@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/danny.png"))

User.create(name: "Nightrider", username: "nightrider", email: 'nightrider666@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/nightrider.jpg"))

User.create(name: "Judy Funny", username: "judyfunny", email: 'nicktoons@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/judy.png"))

Category.create([{ name: 'Backpacks'}, { name: 'Clocks'}, {name: 'Fitness'}, {name: 'Mugs'}])

Brand.create([{ name: 'Misc.'}, {name: 'Decole'}, {name: 'Decomates'}, {name: 'JanSport'}, {name: "Spri"}])

#Backpacks

Product.create(name: "JanSport Classic SuperBreak Backpack",
  url: "http://www.amazon.com/dp/B006ML7JXC",
  price: 30.96, brand_id: 4, category_id: 1, finder_user_id: 1, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack1.jpg"))

Product.create(name: "JanSport Classic SuperBreak Backpack Floral",
  url: "http://www.amazon.com/dp/B00HS5YK06/",
  price: 29.48, brand_id: 4, category_id: 1, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack2.jpg"))

Product.create(name: "JanSport City Scout Backpack",
  url: "http://www.amazon.com/dp/B00HE88KOY",
  price: 29.48, brand_id: 4, category_id: 1, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack3.jpg"))

Product.create(name: "Stephen Joseph Lunch Pals Dog Lunch Box",
  url: "http://www.amazon.com/Stephen-Joseph-Lunch-Pals-Dog/dp/B0084EJSP2",
  price: 29.95, brand_id: 1, category_id: 1, finder_user_id: 3, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack4.jpg"))

#Clocks

Product.create(name: "Onaroo Childrens Alarm Clock + Nightlight",
  url: "http://www.amazon.com/Onaroo-Childrens-Alarm-Clock-Nightlight/dp/B00EAHSBV4/",
  price: 10.43, brand_id: 1, category_id: 2, finder_user_id: 3, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/clock1.jpg"))

Product.create(name: "HITO™ 10-Inch Smile Face Rotating Eyes Wall Clock",
  url: "http://www.amazon.com/HITO-10-Inch-Smile-Rotating-Clock/dp/B00ITF4AUY/",
  price: 27.99, brand_id: 1, category_id: 2, finder_user_id: 5, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/clock2.jpg"))

Product.create(name: "DecoMates Non-Ticking Silent Wall Clock - Color Block (Orange Pumpkin)",
  url: "http://www.amazon.com/DecoMates-Non-Ticking-Silent-Wall-Clock/dp/B005JF56QY/",
  price: 29.37, brand_id: 3, category_id: 2, finder_user_id: 4, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/clock3.jpg"))

Product.create(name: "Equity by La Crosse 70904 Soft Purple Cube LCD Alarm Clock",
  url: "http://www.amazon.com/Equity-La-Crosse-70904-Purple/dp/B004SI6JXM/",
  price: 27.99, brand_id: 1, category_id: 2, finder_user_id: 2, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/clock4.jpg"))

Product.create(name: "DecoMates Non-Ticking Silent Wall Clock, Pink Zebra, Blue",
  url: "http://www.amazon.com/DecoMates-Non-Ticking-Silent-Wall-Clock/dp/B005JF56QY/",
  price: 24.41, brand_id: 3, category_id: 2, finder_user_id: 3, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/clock5.jpg"))

#Mugs

Product.create(name: "Panda Fancy Mug Cup Set with Spoon",
  url: "http://www.amazon.com/gp/product/B005BZ47O4/",
  price: 19.70, brand_id: 1, category_id: 4, finder_user_id: 1, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug1.jpg"))

Product.create(name: "Decole Cat Manmaru Mug w/ Spoon",
  url: "http://www.amazon.com/Decole-Cat-Manmaru-Mug-Spoon/dp/B006IINE1A/",
  price: 20.00, brand_id: 2, category_id: 4, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug2.png"))

Product.create(name: "Frog Mug with Spoon Set",
  url: "http://www.amazon.com/Frog-Mug-with-Spoon-Set/dp/B0039NDIWM/",
  price: 22.00, brand_id: 2, category_id: 4, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug3.jpg"))

Product.create(name: "Big Mouth Toys: The Ninja Mug",
  url: "http://www.amazon.com/Big-Mouth-Toys-The-Ninja/dp/B008A0NOP0/",
  price: 20.00, brand_id: 1, category_id: 4, finder_user_id: 4, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug4.jpg"))

Product.create(name: "Zojirushi Stainless Steel Mug",
  url: "http://www.amazon.com/Zojirushi-SM-SA48-NM-Stainless-16-Ounce-Cinnamon/dp/B00HYOGTU0/",
  price: 32.78, brand_id: 1, category_id: 4, finder_user_id: 4, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/mug5.jpg"))

Product.create(name:"Decole Piggy Mug", url: "http://www.amazon.com/Decole-Pig-Manmaru-Mug-Spoon/dp/B00397ARDQ",
  price: 25.00, brand_id: 2, category_id: 4,  finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug6.jpg"))

Like.create(user_id: 1, product_id: 1)
Like.create(user_id: 2, product_id: 2)
Like.create(user_id: 2, product_id: 3)
Like.create(user_id: 3, product_id: 4)
Like.create(user_id: 1, product_id: 4)
Like.create(user_id: 2, product_id: 4)
Like.create(user_id: 5, product_id: 5)
Like.create(user_id: 5, product_id: 7)
Like.create(user_id: 4, product_id: 2)
Like.create(user_id: 4, product_id: 3)

Comment.create(user_id: 3, product_id: 13, text: "You know, this company's name is pretty suggestive.")
Comment.create(user_id: 4, product_id: 13, text: "FU ninjas rule.")
Comment.create(user_id: 1, product_id: 13, text: "Hmm.. we'll have to decide whether to take this down.")
Comment.create(user_id: 2, product_id: 5, text: "This light is the only reason I can sleep at night.")
Comment.create(user_id: 5, product_id: 10, text: "Hullo.")

Follow.create(follower_id: 2, followed_id: 1)
Follow.create(follower_id: 3, followed_id: 1)
Follow.create(follower_id: 4, followed_id: 1)
Follow.create(follower_id: 5, followed_id: 1)
Follow.create(follower_id: 3, followed_id: 2)
Follow.create(follower_id: 4, followed_id: 2)
Follow.create(follower_id: 4, followed_id: 5)
Follow.create(follower_id: 5, followed_id: 2)
Follow.create(follower_id: 5, followed_id: 3)
Follow.create(follower_id: 5, followed_id: 4)

  #pass: andrew, fullhouse