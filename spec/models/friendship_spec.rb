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
end
