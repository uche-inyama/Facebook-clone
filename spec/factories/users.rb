# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'MyString' }
    surname { 'MyString' }
    email { 'MyString@yaya.com' }
    date_of_birth { '2019-10-04' }
    gender { 'MyString' }
    password { 'password' }
  end
end
