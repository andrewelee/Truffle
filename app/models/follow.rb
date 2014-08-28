class Follow < ActiveRecord::Base

  belongs_to(
    :followed_user,
    class_name: "User",
    foreign_key: :followed_user_id,
    primary_key: :id
  )

  belongs_to(
    :follower,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  def self.find_follow(user_id, follower_user_id)
    follow = Follow.where(user_id: user_id, followed_user_id: follower_user_id)

    return nil if follow[0].nil?
    return follow[0]
  end

end