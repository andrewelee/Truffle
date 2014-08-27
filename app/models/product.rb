class Product < ActiveRecord::Base
  validates :name, :url, presence: true

  #

  has_attached_file :image, :styles => {
    :large => "422x464>",
    :medium => "341x335>",
    :small => "229x206>"
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :attachment_presence => true


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

  has_many :likes, class_name: "Like"
  has_many :user_likes, through: :likes, source: :user
  has_many :comments, inverse_of: :product, dependent: :destroy

end
