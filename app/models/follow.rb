class Follow < ActiveRecord::Base

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  def self.find_follow(follower_id, followed_id)
    follow = Follow.where(follower_id: follower_id, followed_id: followed_id)

    return nil if follow[0].nil?
    return follow[0]
  end

end