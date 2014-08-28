class CollectionItem < ActiveRecord::Base

  belongs_to :collection, class_name: "Collection"
  belongs_to :product, class_name: "Product"
end
