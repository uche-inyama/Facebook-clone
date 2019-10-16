# frozen_string_literal: true

module ApplicationHelper
  def incoming_requests
    FriendRequest.where(friend: current_user)
  end
end
