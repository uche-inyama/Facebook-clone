class FriendRequestsController < ApplicationController
  def index

  end

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)
    @friend_request.save
  end

  def update
  end

  def destroy
  end
end
