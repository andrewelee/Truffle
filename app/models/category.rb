class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many(
    :products,
    class_name: "Product",
    foreign_key: :category_id,
    primary_key: :id
  )

end
