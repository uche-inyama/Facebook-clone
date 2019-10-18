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
  end

  describe 'uniqueness of friend' do
    context 'friendship from same user' do
      it 'ensures uniqueness of friend for a particular user' do
        @two_users = create_pair(:user)
        @request1 = Friendship.create(user: @two_users[0], friend: @two_users[1])
        @request2 = Friendship.new(user: @two_users[0], friend: @two_users[1])
        expect(@request2.save).to eq(false)
      end
    end

    context 'friendship from a different user' do
      it 'ensures uniqueness of friend for a particular user' do
        @users = create_list(:user, 3)
        @request1 = Friendship.create(user: @users[0], friend: @users[1])
        @request2 = Friendship.new(user: @users[2], friend: @users[1])
        expect(@request2.save).to eq(true)
      end
    end

    context 'friendship from a user to himself' do
      it "ensures a friend can't befriend himself " do
        @users = create_list(:user, 1)
        @request1 = Friendship.new(user: @users[0], friend: @users[0])
        expect { @request1.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Friend Can't befriend yourself")
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

  # create a two users,
  # create friendship between user1 and user2
  # expect friendship.count.to change_by(2)

  describe 'create_inverse_relationship' do
    it 'ensures two rows for each record of friendship created' do
      @two_users = create_pair(:user)
      expect do
        Friendship.create(user: @two_users[0], friend: @two_users[1])
      end.to change { Friendship.count }.by(2)
    end
  end

  describe 'destroy_inverse_relationship' do
    it 'ensures two rows for each record of friendship is destroyed' do
      @two_users = create_pair(:user)
      Friendship.create(user: @two_users[0], friend: @two_users[1])
      expect { Friendship.first.destroy }.to change { Friendship.count }.by(-2)
    end
  end
end
