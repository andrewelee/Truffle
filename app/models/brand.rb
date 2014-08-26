class Brand < ActiveRecord::Base
  validates :name, presence: true

  has_many(
    :products,
    class_name: "Product",
    foreign_key: :brand_id,
    primary_key: :id
  )

end
