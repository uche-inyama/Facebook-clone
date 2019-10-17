require 'rails_helper'

RSpec.describe Friendship, type: :model do
 

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
end
