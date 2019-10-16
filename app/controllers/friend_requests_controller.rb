class FriendRequestsController < ApplicationController
  def index

  end

  def create
    debugger
    friend = User.find(params[:user_id])
    @friend_request = current_user.friend_requests.build(friend: friend)
    if @friend_request.save
      flash[:success] = "Request sent"
    end
    redirect_to request.referrer
  end

  def update
  end

  def destroy
  end

  def friend_request_params
    params.permit(:friend_id)
  end
end
