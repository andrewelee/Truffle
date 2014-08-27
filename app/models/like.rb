class Like < ActiveRecord::Base

  belongs_to :user, class_name: "User"
  belongs_to :product, class_name: "Product"

  def self.find_like(user_id, product_id)
    @like = Like.where(user_id: user_id, product_id: product_id)

    return nil if @like[0].nil?
    return @like[0]
  end

end
