# frozen_string_literal: true

class Post < ApplicationRecord
  validates_presence_of :body
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy
end
