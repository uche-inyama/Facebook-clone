# frozen_string_literal: true

class Post < ApplicationRecord
  validates_presence_of :body
  belongs_to :user
  has_many :comments 
  has_many :likes, as: :likable
end
