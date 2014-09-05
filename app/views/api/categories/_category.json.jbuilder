json.(category, :id, :name)

json.products category.products.each do |product|
  json.(product, :id, :price, :name)
  json.imageSmall product.image.url(:small)
  json.imageLarge product.image.url(:large)
  json.url product.url

  json.userLikes product.user_likes.each do |user|
    json.id user.id
    json.image user.avatar.url(:thumb)
  end
end