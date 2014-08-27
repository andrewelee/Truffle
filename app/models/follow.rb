class Follow < ActiveRecord::Base

  belongs_to(
    :followed_user,
    class_name: "User",
    foreign_key: :follower_user_id,
    primary_key: :id
  )

  belongs_to(
    :follower,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

end
