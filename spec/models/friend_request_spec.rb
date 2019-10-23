# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe 'validation' do
    it 'ensures presence of a user' do
      @two_users = create_pair(:user)
      @request = FriendRequest.new(user: nil, friend: @two_users[1])
      expect(@request.save).to eq(false)
    end

    it 'ensures presence of friend' do
      @two_users = create_pair(:user)
      @request = FriendRequest.new(user: @two_users[0], friend: nil)
      expect(@request.save).to eq(false)
    end
  end

  describe 'uniqueness of friend' do
    context 'friend_request from same user' do
      it 'ensures uniqueness of friend for a particular user' do
        @two_users = create_pair(:user)
        @request1 = FriendRequest.create(user: @two_users[0], friend: @two_users[1])
        @request2 = FriendRequest.new(user: @two_users[0], friend: @two_users[1])
        expect(@request2.save).to eq(false)
      end
    end

    context 'friend_request from a different user' do
      it 'ensures uniqueness of friend for a particular user' do
        @users = create_list(:user, 3)
        @request1 = FriendRequest.create(user: @users[0], friend: @users[1])
        @request2 = FriendRequest.new(user: @users[2], friend: @users[1])
        expect(@request2.save).to eq(true)
      end
    end

    context 'friend_request from a user to himself' do
      it "ensures a friend can't send a friend request to himself " do
        @users = create_list(:user, 1)
        @request1 = FriendRequest.new(user: @users[0], friend: @users[0])
        expect do
          @request1.save!
        end.to raise_error(ActiveRecord::RecordInvalid,
                           'Validation failed: Friend invalid')
      end
    end
  end

  describe 'not_yet_friends' do
    it 'ensures a friendship does not recieve a friend_request' do
      @users = create_list(:user, 2)
      FriendRequest.create(user: @users[0], friend: @users[1])
      Friendship.create(user: @users[0], friend: @users[1])
      @request = FriendRequest.new(user: @users[0], friend: @users[1])
      expect do
        @request.save!
      end.to raise_error(ActiveRecord::RecordInvalid,
                         'Validation failed: Friend Already friends')
    end
  end

  it 'not_requested_yet' do
    @users = create_list(:user, 2)
    @request1 = FriendRequest.create(user: @users[0], friend: @users[1])
    @request2 = FriendRequest.new(user: @users[1], friend: @users[0])
    expect(@request2.save).to eq(false)
  end
end
