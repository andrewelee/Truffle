class Product < ActiveRecord::Base
  validates :name, :image, :url, presence: true

end
