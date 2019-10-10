class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likable

  validates_presence_of :body
end
