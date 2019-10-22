# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'validation' do
    it 'ensures presence of a user' do
      @two_users = create_pair(:user)
      @request = Friendship.new(user: nil, friend: @two_users[1])
      expect(@request.save).to eq(false)
    end

    it 'ensures presence of friend' do
      @two_users = create_pair(:user)
      @request = Friendship.new(user: @two_users[0], friend: nil)
      expect(@request.save).to eq(false)
    end

    it 'ensures there is a corresponding friend request' do
      @two_users = create_pair(:user)
      @friendship = Friendship.new(user: @two_users[0], friend: @two_users[1])
      expect(@friendship.save).to eq(false)
    end
  end

  describe 'uniqueness of friend' do
    context 'friendship from same user' do
      it 'ensures uniqueness of friend for a particular user' do
        @two_users = create_pair(:user)
        @request1 = FriendRequest.create(user: @two_users[0], friend: @two_users[1])
        @friendship1 = Friendship.create(user: @two_users[0], friend: @two_users[1])
        @friendship2 = Friendship.new(user: @two_users[0], friend: @two_users[1])
        expect(@friendship2.save).to eq(false)
      end
    end

    context 'friendship from a different user' do
      it 'ensures uniqueness of friend for a particular user' do
        @users = create_list(:user, 3)
        @request1 = FriendRequest.create(user: @users[0], friend: @users[1])
        @friendship1 = Friendship.create(user: @users[0], friend: @users[1])
        @request2 = FriendRequest.create(user: @users[2], friend: @users[1])
        @friendship2 = Friendship.new(user: @users[2], friend: @users[1])
        expect(@request2.save).to eq(true)
      end
    end
  end

  describe 'Associations' do
    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eql :belongs_to
    end

    it 'belongs to a friend' do
      assc = described_class.reflect_on_association(:friend)
      expect(assc.macro).to eql :belongs_to
    end
  end

  describe 'create_inverse_relationship' do
    it 'ensures two rows for each record of friendship created' do
      @two_users = create_pair(:user)
      FriendRequest.create(user: @two_users[0], friend: @two_users[1])
      expect do
        Friendship.create(user: @two_users[0], friend: @two_users[1])
      end.to change { Friendship.count }.by(2)
    end
  end

  describe 'destroy_inverse_relationship' do
    it 'ensures two rows for each record of friendship is destroyed' do
      @two_users = create_pair(:user)
      FriendRequest.create(user: @two_users[0], friend: @two_users[1])
      Friendship.create(user: @two_users[0], friend: @two_users[1])
      expect { Friendship.first.destroy }.to change { Friendship.count }.by(-2)
    end
  end

  describe 'destroy friend request after create' do
    it 'ensures that friend request is destroyed after friendship is created' do
      @users = create_pair(:user)
      FriendRequest.create(user: @users[0], friend: @users[1])
      expect { Friendship.create(user: @users[0], friend: @users[1]) }.to change { FriendRequest.count }.by(-1)
    end
  end
end
