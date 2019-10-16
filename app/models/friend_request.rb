class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  validate :not_self

  def accept
    user.friends << friend
    destroy
  end

  private
    def not_self
      errors.add(:friend, "Can't befriend yourself") if user == friend
    end

    def not_yet_friends
      errors.add(:friend, 'Already friends') if user.friends.include?friend
    end

    def not_requested_yet
      errors.add(:friend, 'Friend request already sent') if friend.pending_friends.include?user
    end
end
