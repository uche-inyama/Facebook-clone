require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests'do
    let(:user) {build(:user)}
    it "ensures presence of first name" do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it "ensures presence of surname" do
      user.surname = nil
      expect(user.save).to eq(false)
    end

    it "ensures presence of email" do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it "ensures presence of date_of_birth" do
      user.date_of_birth = nil
      expect(user.save).to eq(false)
    end

    it "ensures presence of gender" do
      user.gender = nil
      expect(user.save).to eq(false)
    end
  end
end
