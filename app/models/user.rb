# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates_presence_of :first_name, :surname, :date_of_birth, :gender
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"

end
