class User < ApplicationRecord
    has_many :foods
    has_many :drinks
    has_many :likes
    has_many :comments

    validates_presence_of :name, :city, :password, :username 
    validates_uniqueness_of :username
end
