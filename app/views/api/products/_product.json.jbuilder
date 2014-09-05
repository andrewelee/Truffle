json.(product, :id, :name, :url, :price, :brand_id, :category_id, :finder_user_id,
:editor_user_id, :note, :created_at, :updated_at)

json.imageSmall product.image.url(:small)
json.imageLarge product.image.url(:large)
json.brand product.brand, :id, :name
json.category product.category, :id

json.finder product.finder, :id, :username

json.finder do |json|
  json.(product.finder, :id, :username)
  json.image product.finder.avatar.url(:thumb)
end

# json.likes product.likes, :id, :user_id

json.likes product.user_likes.length

json.userLikes product.user_likes.each do |user|
  json.id user.id
  json.image user.avatar.url(:thumb)
  json.name user.name
  json.username user.username
end

json.comments product.comments do |comment|
  json.id comment.user_id
  json.username comment.user.username
  json.text comment.text
  json.image comment.user.avatar.url(:thumb)
  json.timestamp comment.created_at
end
