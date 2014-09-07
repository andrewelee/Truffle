json.(user, :id, :name, :username, :isEditor)

json.image user.avatar.url(:normal)
json.imageThumb user.avatar.url(:thumb)

json.likes user.likes.each do |like|
  json.id like.id
  json.user_id like.user_id
  json.product_id like.product_id
end

json.likedProducts user.liked_products.each do |product|

  json.(product, :id, :price, :name)
  json.imageSmall product.image.url(:small)
  json.imageLarge product.image.url(:large)

  json.likes product.user_likes.length
  json.finder product.finder, :id, :username

  json.userLikes product.user_likes.each do |user|
    json.id user.id
    json.image user.avatar.url(:thumb)
    json.name user.name
    json.username user.username
  end

end

json.followers user.followers.each do |user|
  json.id user.id
  json.name user.name
  json.username user.username
  json.image user.avatar.url(:normal)
  json.thumb user.avatar.url(:thumb)
end

json.followedUsers user.followed_users.each do |user|
  json.id user.id
  json.name user.name
  json.username user.username
  json.image user.avatar.url(:normal)
  json.thumb user.avatar.url(:thumb)
end

json.follows user.follows.each do |follow|
  json.id follow.id
  json.follower_id follow.follower_id
  json.followed_id follow.followed_id
end