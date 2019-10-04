require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validates posts'do
    let(:user) {create(:user)}
    let(:post) {build(:post, user:user)}
    it 'ensures presence of body' do
      post.body = nil
      expect(post.save).to eq(false)
    end
  end

  context 'associations' do
    it 'belongs to a User' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eql :belongs_to
    end
  end
end
