# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    it 'ensures presence of first name' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures presence of surname' do
      user.surname = nil
      expect(user.save).to eq(false)
    end

    it 'ensures presence of email' do
      user.email = nil
      expect(user.save).to eq(false)
    end

  end

  context 'Associations' do
    it 'has many posts' do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eql :has_many
    end

    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eql :has_many
    end

    it 'has_many friendships' do
      assc = described_class.reflect_on_association(:friendships)
      expect(assc.macro).to eql :has_many
    end
  end
end
