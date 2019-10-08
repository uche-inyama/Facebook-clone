# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { 'MyText' }
    user { nil }
  end
end
