json.(@product, :id, :name, :url, :price, :brand_id, :category_id, :finder_user_id,
:editor_user_id, :created_at, :updated_at)

json.set!(:image, @product.image.url)
json.likers @product.likers, :users
