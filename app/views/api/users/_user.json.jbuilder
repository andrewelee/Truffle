json.(user, :id, :name, :username)

json.image user.image.url(:normal)
json.imageThumb user.image.url(:thumb)

