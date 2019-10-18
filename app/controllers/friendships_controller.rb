class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def destroy
    @friend = current_user.friends.find(params[:id])
    if current_user.remove_friend(@friend)
      flash[:sucess] = "Friend removed"
    end
    redirect_to request.referrer
  end
end
