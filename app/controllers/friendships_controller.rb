# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def destroy
    @friend = current_user.friends.find(params[:id])
    flash[:sucess] = 'Friend removed' if current_user.remove_friend(@friend)
    redirect_to request.referrer
  end
end
