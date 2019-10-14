require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'friends' do
    it 'returns all the users friends - confirmed friendships' do
      users = create_list(:user, 4)
      users[0].friendships.create(friend_id: users[1].id, confirmed: true)
      users[0].friendships.create(friend_id: users[2].id)
      users[0].friendships.create(friend_id: users[3].id)
      expect(users[0].friends.count).to eq(1)
    end
  end

  describe 'pending_friends' do
    it 'returns all unconfirmed friendships created by a user' do
      users = create_list(:user, 4)
      users[0].friendships.create(friend_id: users[1].id, confirmed: true)
      users[0].friendships.create(friend_id: users[2].id)
      users[0].friendships.create(friend_id: users[3].id)
      expect(users[0].pending_friends.count).to eq(2)
    end
  end

  describe 'confirm a friend' do
    it 'accepts a friendship request' do
      users = create_list(:user, 2)
      users[0].friendships.create(friend_id: users[1].id)
      users[1].confirm_friend(users[0])
      expect(users[0].friends).to include(users[1])
      expect(users[1].friends).to include(users[0])
    end
  end

  describe 'friendrequests' do
    it 'returns all unaccepted friendships' do
      users = create_list(:user, 4)
      users[1].friendships.create(friend_id: users[0].id)
      users[2].friendships.create(friend_id: users[0].id, confirmed: true)
      users[3].friendships.create(friend_id: users[0].id)
      expect(users[0].friend_requests.count).to eq(2)
    end
  end
end
