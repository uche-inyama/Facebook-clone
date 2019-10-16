class FriendRequestsController < ApplicationController
  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    friend = User.find(params[:user_id])
    @friend_request = current_user.friend_requests.build(friend: friend)
    if @friend_request.save
      flash[:success] = "Request sent"
    end
    redirect_to request.referrer
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.accept
    redirect_to request.referrer
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    redirect_to request.referrer
  end

end
