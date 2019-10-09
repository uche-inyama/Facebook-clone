# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validates comment' do
    it 'does not save a blank comment' do
      two_users = create_pair(:user)
      post = create :post, user: two_users[0]
      comment = build :comment, user: two_users[1], post: post
      comment.body = nil
      expect(comment.save).to eq(false)
    end
  end

  context 'associations' do
    it 'belongs to a User' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eql :belongs_to
    end

    it 'belongs to a Post' do
      assc = described_class.reflect_on_association(:post)
      expect(assc.macro).to eql :belongs_to
    end
  end
end