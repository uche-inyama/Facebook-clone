class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"


  def friends
    friends_array = friendships.map{|friendship| 
    friendship.friend if friendship.confirmed}

    friends_array + inverse_friendships.map{|friendship|
    friendship.user if friendship.confirmed}

    friends_array.compact
  end

  def pending_friends
    friendships.map{|friendship| friendship.friend if
     !friendship.confirmed}.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{|friendship| friendshp.user == user}
    friendship.confirmed = true
    friendship.save
  end

  def friend_requests
    inverse_friendships.map{|friendship| friendship.user
     if !friendship.confirmed}.compact
  end

  def friend?(user)
    friends.include?(user)
  end
end

