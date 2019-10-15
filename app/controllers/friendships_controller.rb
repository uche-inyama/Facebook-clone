class FriendshipsController < ApplicationController

    def new
        @friendrequest = Friendship.new 
    end

    def create
        @friendrequest = current_user.friendships.create(friend_id: params[:user_id])
        redirect_to request.referrer
    end

    def update
      @friendship = 
      @friendship.update_attribute
    end
end
