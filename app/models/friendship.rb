# frozen_string_literal: true

class Friendship < ApplicationRecord
  after_create :create_inverse_relationship, :destroy_friend_request
  after_destroy :destroy_inverse_relationship

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :not_self
  validate :friend_request_exists, unless: :inverse_relationship?

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def create_inverse_relationship
    friend.friendships.create(friend: user) unless friend.friends.include?(user)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship&.destroy
  end

  def not_self
    errors.add(:friend, "Can't befriend yourself") if user == friend
  end

  def friend_request_exists
    errors.add(:error, 'No friend request') unless FriendRequest.exists?(user: user, friend: friend)
  end

  def inverse_relationship?
    Friendship.exists?(user: friend, friend: user)
  end

  def destroy_friend_request
    request = user.friend_requests.where(friend: friend).first
    request&.destroy
  end
end
