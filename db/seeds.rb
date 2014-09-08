# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: "truffle", username: "Truffle", email: 'truffle@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: true, avatar: File.new("#{Rails.root}/seeds/images/avatars/truffle-editor.png"))

user2 = User.create(name: "Andrew Lee", username: "thebigL", email: 'bigLee@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: true, avatar: File.new("#{Rails.root}/seeds/images/avatars/andrewAvatar.png"))

user3 = User.create(name: "Bob Saget", username: "dannytanner1987", email: 'fullhouse@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/danny.png"))

user4 = User.create(name: "Nightrider", username: "nightrider", email: 'nightrider666@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/nightrider.jpg"))

user5 = User.create(name: "Judy Funny", username: "judyfunny", email: 'nicktoons@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/judy.png"))

user6 = User.create(name: "Dante Basco", username: "Rufio", email: 'rufio@hotmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/rufio.png"))

user7 = User.create(name: "Helga Pataki", username: "helgapataki", email: 'helga@yahoo.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/helga.png"))

user8 = User.create(name: "Casey Jones", username: "tmnt", email: 'tmnt@gmail.com',
  password_digest: '$2a$10$.wTw2OiE92inhZYoIlb2yutwi.9FI65eaurlOc0pJQeg0RHc2JdA.',
  isEditor: false, avatar: File.new("#{Rails.root}/seeds/images/avatars/casey.png"))

Category.create([{ name: 'Backpacks'}, {name: 'Books'}, { name: 'Clocks'},
   {name: 'Furniture'}, {name: 'Games/Toys'}, {name: 'Mugs'}, {name: 'Office Supplies'}])

Brand.create([{ name: 'Misc.'}, {name: 'Decole'}, {name: 'Decomates'}, {name: 'JanSport'}, {name: 'Lego'}, {name: "MOMA"},
  {name: 'Nike'}, {name: "Prince"}, {name: 'Samsung'}, {name: 'Sony'}])

#Backpacks

p1 = Product.create(name: "JanSport Classic SuperBreak Backpack",
  url: "http://www.amazon.com/dp/B006ML7JXC",
  price: 30.96, brand_id: 4, category_id: 1, finder_user_id: 1, editor_user_id: 1,
  note: "Classic for a reason", image: File.new("#{Rails.root}/seeds/images/products/backpack1.jpg"))

p2 = Product.create(name: "JanSport Classic SuperBreak Backpack Floral",
  url: "http://www.amazon.com/dp/B00HS5YK06/",
  price: 29.48, brand_id: 4, category_id: 1, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack2.jpg"))

p3 =Product.create(name: "JanSport City Scout Backpack",
  url: "http://www.amazon.com/dp/B00HE88KOY",
  price: 29.48, brand_id: 4, category_id: 1, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack3.jpg"))

p4 = Product.create(name: "Stephen Joseph Lunch Pals Dog Lunch Box",
  url: "http://www.amazon.com/Stephen-Joseph-Lunch-Pals-Dog/dp/B0084EJSP2",
  price: 29.95, brand_id: 1, category_id: 1, finder_user_id: 3, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/backpack4.jpg"))

#Clocks

p5 = Product.create(name: "Onaroo Childrens Alarm Clock + Nightlight",
  url: "http://www.amazon.com/Onaroo-Childrens-Alarm-Clock-Nightlight/dp/B00EAHSBV4/",
  price: 10.43, brand_id: 1, category_id: 3, finder_user_id: 3, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/clock1.jpg"))

p6 = Product.create(name: "HITO™ 10-Inch Smile Face Rotating Eyes Wall Clock",
  url: "http://www.amazon.com/HITO-10-Inch-Smile-Rotating-Clock/dp/B00ITF4AUY/",
  price: 27.99, brand_id: 1, category_id: 3, finder_user_id: 5, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/clock2.jpg"))

p7 = Product.create(name: "DecoMates Non-Ticking Silent Wall Clock - Color Block (Orange Pumpkin)",
  url: "http://www.amazon.com/DecoMates-Non-Ticking-Silent-Wall-Clock/dp/B005JF56QY/",
  price: 29.37, brand_id: 3, category_id: 3, finder_user_id: 4, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/clock3.jpg"))

p8 = Product.create(name: "Equity by La Crosse 70904 Soft Purple Cube LCD Alarm Clock",
  url: "http://www.amazon.com/Equity-La-Crosse-70904-Purple/dp/B004SI6JXM/",
  price: 27.99, brand_id: 1, category_id: 3, finder_user_id: 2, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/clock4.jpg"))

p9 = Product.create(name: "DecoMates Non-Ticking Silent Wall Clock, Pink Zebra, Blue",
  url: "http://www.amazon.com/DecoMates-Non-Ticking-Silent-Wall-Clock/dp/B005JF56QY/",
  price: 24.41, brand_id: 3, category_id: 3, finder_user_id: 3, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/clock5.jpg"))

#Mugs

p10 = Product.create(name: "Panda Fancy Mug Cup Set with Spoon",
  url: "http://www.amazon.com/gp/product/B005BZ47O4/",
  price: 19.70, brand_id: 1, category_id: 6, finder_user_id: 1, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug1.jpg"))

p11 = Product.create(name: "Decole Cat Manmaru Mug w/ Spoon",
  url: "http://www.amazon.com/Decole-Cat-Manmaru-Mug-Spoon/dp/B006IINE1A/",
  price: 20.00, brand_id: 2, category_id: 6, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug2.png"))

p12 = Product.create(name: "Frog Mug with Spoon Set",
  url: "http://www.amazon.com/Frog-Mug-with-Spoon-Set/dp/B0039NDIWM/",
  price: 22.00, brand_id: 2, category_id: 6, finder_user_id: 2, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug3.jpg"))

p13 = Product.create(name: "Big Mouth Toys: The Ninja Mug",
  url: "http://www.amazon.com/Big-Mouth-Toys-The-Ninja/dp/B008A0NOP0/",
  price: 20.00, brand_id: 1, category_id: 6, finder_user_id: 4, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/mug4.jpg"))

p14 = Product.create(name: "Zojirushi Stainless Steel Mug",
  url: "http://www.amazon.com/Zojirushi-SM-SA48-NM-Stainless-16-Ounce-Cinnamon/dp/B00HYOGTU0/",
  price: 32.78, brand_id: 1, category_id: 6, finder_user_id: 4, editor_user_id: 2,
  note: "Zojirushi doesn't mess around"
  image: File.new("#{Rails.root}/seeds/images/products/mug5.jpg"))

p15 = Product.create(name:"Decole Piggy Mug", url: "http://www.amazon.com/Decole-Pig-Manmaru-Mug-Spoon/dp/B00397ARDQ",
  price: 25.00, brand_id: 2, category_id: 6,  finder_user_id: 2, editor_user_id: 1,
  note: "Another hit from Decole",
  image: File.new("#{Rails.root}/seeds/images/products/mug6.jpg"))

#Books

p16 = Product.create(name:"Amelia Bedelia: Amelia Bedelia Means Business", url: "http://www.amazon.com/Amelia-Bedelia-Chapter-Book-Business/dp/0062094963/",
  price: 2.97, brand_id: 1, category_id: 2,  finder_user_id: 3, note: "She's so sassy!", editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/book1.jpg"))

p17 = Product.create(name:"The Day the Crayons Quit", url: "http://www.amazon.com/Day-Crayons-Quit-Drew-Daywalt/dp/0399255370",
  price: 10.75, brand_id: 1, category_id: 2,  finder_user_id: 8, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/book2.jpg"))

p18 = Product.create(name:"The Phantom Tollbooth", url: "http://www.amazon.com/Phantom-Tollbooth-Norton-Juster/dp/0394820371",
  price: 5.17, brand_id: 1, category_id: 2,  finder_user_id: 8, note: "Best book ever written.", editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/book3.jpg"))

p19 = Product.create(name:"Humans of New York", url: "http://www.amazon.com/Humans-New-York-Brandon-Stanton/dp/1250038820",
  price: 16.90, brand_id: 1, category_id: 2,  finder_user_id: 8, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/book4.jpg"))

p20 = Product.create(name:"They Say I Say", url: "http://www.amazon.com/They-Say-Matter-Academic-Writing/dp/0393935841",
  price: 26.75, brand_id: 1, category_id: 2,  finder_user_id: 6, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/book5.jpg"))

#Games/Toys

p21 = Product.create(name:"Cards Against Humanity", url: "http://www.amazon.com/Cards-Against-Humanity-LLC-CAHUS/dp/B004S8F7QM",
  price: 25.00, brand_id: 1, category_id: 5,  finder_user_id: 3, editor_user_id: 1,
  image: File.new("#{Rails.root}/seeds/images/products/game1.jpg"))

p22 = Product.create(name:"Lego Creator Treehouse", url: "http://www.amazon.com/LEGO-Creator-Treehouse-Interlocking-Building/dp/B00C9X591Q",
  price: 23.21, brand_id: 5, category_id: 5,  finder_user_id: 8, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/legos1.jpg"))

p23 = Product.create(name:"Lego Death Star", url: "http://www.amazon.com/LEGO-Star-Wars-Death-10188/dp/B002EEP3NO",
  price: 549.97, brand_id: 5, category_id: 5,  finder_user_id: 7, editor_user_id: 2,
  note: "Only one left in the store!",
  image: File.new("#{Rails.root}/seeds/images/products/legos4.jpg"))

p24 = Product.create(name:"Lego Ewok Village", url: "http://www.amazon.com/LEGO-Star-Wars-10236-Village/dp/B00F15OA5A",
  price: 249.95, brand_id: 5, category_id: 5,  finder_user_id: 7, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/legos5.jpg"))

p25 = Product.create(name:"Stacking Chair Game", url: "http://www.amazon.com/Las-Sillas-Stacking-Chairs-Game/dp/B00BWV1LI6",
  price: 249.95, brand_id: 6, category_id: 5,  finder_user_id: 5, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/gamemoma.jpg"))


#Office Supplies

p26 = Product.create(name:"MOMA Snap-it-Up Organizer", url: "http://www.amazon.com/MoMA-46747-Snap-It-Up-Organizer/dp/B001VGBZJM",
  price: 17.99, brand_id: 6, category_id: 7,  finder_user_id: 4, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/office1.jpg"))

p27 = Product.create(name:"Silver Perpetual Calendar", url: "http://www.amazon.com/Gideon-SILVER-PERPETUAL-CALENDAR-MoMA/dp/B00D48Y4TI",
  price: 32.45, brand_id: 6, category_id: 7,  finder_user_id: 1, editor_user_id: 2,
  image: File.new("#{Rails.root}/seeds/images/products/office2.jpg"))

Like.create(user_id: user1.id, product_id: p1.id)
Like.create(user_id: user2.id, product_id: p2.id)
Like.create(user_id: user2.id, product_id: p3.id)
Like.create(user_id: user3.id, product_id: p4.id)
Like.create(user_id: user1.id, product_id: p4.id)
Like.create(user_id: user2.id, product_id: p4.id)
Like.create(user_id: user5.id, product_id: p5.id)
Like.create(user_id: user5.id, product_id: p7.id)
Like.create(user_id: user4.id, product_id: p2.id)
Like.create(user_id: user4.id, product_id: p3.id)
Like.create(user_id: user5.id, product_id: p1.id)
Like.create(user_id: user6.id, product_id: p2.id)
Like.create(user_id: user7.id, product_id: p3.id)
Like.create(user_id: user8.id, product_id: p4.id)
Like.create(user_id: user8.id, product_id: p5.id)
Like.create(user_id: user7.id, product_id: p10.id)
Like.create(user_id: user6.id, product_id: p11.id)
Like.create(user_id: user5.id, product_id: p13.id)
Like.create(user_id: user4.id, product_id: p15.id)
Like.create(user_id: user3.id, product_id: p18.id)

Comment.create(user_id: user3.id, product_id: p13.id, text: "You know, this company's name is pretty suggestive.")
Comment.create(user_id: user4.id, product_id: p13.id, text: "Everyone loves ninjas.")
Comment.create(user_id: user1.id, product_id: p13.id, text: "Good point @dannytanner1987")
Comment.create(user_id: user2.id, product_id: p5.id, text: "This light is the only reason I can sleep at night.")
Comment.create(user_id: user5.id, product_id: p10.id, text: "Hullo.")
Comment.create(user_id: user6.id, product_id: p1.id, text: "My backpack never looked this good in middle school.")
Comment.create(user_id: user7.id, product_id: p1.id, text: "I still use mine.")
Comment.create(user_id: user8.id, product_id: p24.id, text: "This is my favorite thing.")
Comment.create(user_id: user8.id, product_id: p17.id, text: "Terrified me for weeks.")

Follow.create(follower_id: user2.id, followed_id: user1.id)
Follow.create(follower_id: user3.id, followed_id: user1.id)
Follow.create(follower_id: user4.id, followed_id: user1.id)
Follow.create(follower_id: user5.id, followed_id: user1.id)
Follow.create(follower_id: user3.id, followed_id: user2.id)
Follow.create(follower_id: user4.id, followed_id: user2.id)
Follow.create(follower_id: user4.id, followed_id: user5.id)
Follow.create(follower_id: user5.id, followed_id: user2.id)
Follow.create(follower_id: user6.id, followed_id: user3.id)
Follow.create(follower_id: user7.id, followed_id: user3.id)
Follow.create(follower_id: user8.id, followed_id: user1.id)
Follow.create(follower_id: user5.id, followed_id: user8.id)
Follow.create(follower_id: user6.id, followed_id: user7.id)

  #pass: andrew, fullhouse