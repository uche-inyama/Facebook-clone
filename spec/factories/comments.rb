# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyText' }
    user { nil }
  end
end
