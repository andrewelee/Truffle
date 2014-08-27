class Product < ActiveRecord::Base
  validates :name, :url, presence: true
  #will need to validate image later

  belongs_to(
    :brand,
    class_name: "Brand",
    foreign_key: :brand_id,
    primary_key: :id
  )

  belongs_to(
    :category,
    class_name: "Category",
    foreign_key: :category_id,
    primary_key: :id
  )
  
  belongs_to(
    :finder,
    class_name: "User",
    foreign_key: :finder_user_id,
    primary_key: :id
  )
end
