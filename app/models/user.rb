class User < ApplicationRecord
    validates_presence_of :first_name, :surname, :email, :date_of_birth, :gender

    has_many :posts
end
