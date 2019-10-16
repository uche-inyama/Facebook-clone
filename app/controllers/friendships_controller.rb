class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def destroy
    @friend = current_user.friends.find(params[:id])
    current_user.remove_friend(@friend)
    redirect_to request.referrer
  end
end
